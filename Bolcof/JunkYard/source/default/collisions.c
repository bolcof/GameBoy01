#include <gb/gb.h>
#include <stdlib.h>
#include "common.h"
#include "ball.h"
#include "brick.h"
#include "paddle.h"
#include "userinterface.h"
#include <string.h>
#include "graphics/Font.h"
#include "graphics/Bricks.h"

void DrawNumber3(uint8_t x,uint8_t y, uint16_t number,uint8_t digits){
    
    unsigned char buffer[]="00000000";

    // Convert the number to a decimal string (stored in the buffer char array)
    uitoa(number, buffer, 10);

    // Get the length of the number so we can add leading zeroes
    uint8_t len =strlen(buffer);

    // Add some leading zeroes
    // uitoa will not do this for us
    // Increase the VRAM address each iteration to move to the next tile
    for(uint8_t i=0;i<digits-len;i++){
        VBK_REG=1; set_bkg_tile_xy(x,y,0);
        VBK_REG=0;set_bkg_tile_xy(x++,y,USERINTERFACE_TILES_START+42);
    }
        
    // Draw our number
    // Increase the VRAM address each iteration to move to the next tile
    for(uint8_t i=0;i<len;i++){
        
        VBK_REG=1;set_bkg_tile_xy(x,y,0);
        VBK_REG=0;set_bkg_tile_xy(x++,y,(buffer[i]-'0')+USERINTERFACE_TILES_START+42);
    }
}

void CollidePaddleAgainstBall(){
    int16_t xd = (int16_t)(ballX>>4)-(int16_t)(paddleX>>4);

    xd = ABS(xd);

    if(xd<=PADDLE_SIZE/2+BALL_RADIUS){

        int16_t yd =(int16_t)(ballY>>4)-(int16_t)(paddleY>>4);

        yd = ABS(yd);
        
        if(yd<=(PADDLE_HALF_THICKNESS+BALL_RADIUS)){

            // Flip the y velocity
            ballVelocityY=-ballVelocityY;
            
            NR10_REG=0X2B;
            NR11_REG=0X81;
            NR12_REG=0X41;
            NR13_REG=0X5C;
            NR14_REG=0X86;

            if(xd>PADDLE_SIZE/2-PADDLE_HALF_THICKNESS){
                if(paddleX<ballX){
                    // Use the negative absolute value so it goes right
                    ballVelocityX=ABS(ballVelocityX);
                    ballX=MAX(ballX,paddleX+1+PADDLE_SIZE/2+((PADDLE_HALF_THICKNESS-BALL_RADIUS)<<4));
                }else{
                    // Use the negative absolute value so it goes left
                    ballVelocityX=-ABS(ballVelocityX);
                    ballX=MIN(ballX,paddleX-1-PADDLE_SIZE/2-((PADDLE_HALF_THICKNESS-BALL_RADIUS)<<4));
                }
            }
            ballY=MIN(ballY,paddleY-((1+PADDLE_HALF_THICKNESS+BALL_RADIUS)<<4));

        }


    }
}

void CollideBricksAgainstBall(){

    int16_t verticalSide=SIGN(ballVelocityY);
    int16_t horizontalSide=SIGN(ballVelocityX);

    int16_t checkHorizontal = (ballX>>4)+horizontalSide*BALL_RADIUS;
    int16_t checkVertical = (ballY>>4)+verticalSide*BALL_RADIUS;

    uint8_t topBottomOrWall = CheckTopOrBottomBrick(ballX>>4,checkVertical);

    DrawNumber3(17,14,horizontalSide*BALL_RADIUS,2);

    // If the ball hit something
    if(topBottomOrWall!=0){

        // Increase Speed slightly with each bounce
        ballVelocityY+=SIGN(ballVelocityY)*BALL_SPEEDUP;

        // If we didn't hit a wall
        if(topBottomOrWall!=WALL){
            
            //Critical Change
            ballVelocityY=-verticalSide*ABS(ballVelocityY);
            blocksLeft--;

            // Play a sound
            NR10_REG=0X00;
            NR11_REG=0X81;
            NR12_REG=0X43;
            NR13_REG=0X73;
            NR14_REG=0X86;

            IncreaseScore(5);

            UpdateBrick(topBottomOrWall,ballX>>4,checkVertical);
        }else{

            // Play a sound
            NR10_REG=0X4A;
            NR11_REG=0X81;
            NR12_REG=0X43;
            NR13_REG=0X56;
            NR14_REG=0X86;
        }
    }
    

    //Critical Change
    //topBottomOrWall = CheckTopOrBottomBrick(checkHorizontal,ballY>>4);
    topBottomOrWall = CheckTopOrBottomBrick(ballX>>4,ballY>>4);
    DrawNumber3(17,15,verticalSide*BALL_RADIUS,2);

    // If the ball hit something
    if(topBottomOrWall!=0){

        // Reflect 
        ballVelocityX=-horizontalSide*ABS(ballVelocityX);

        // Increase Speed slightly with each bounce
        ballVelocityX+=SIGN(ballVelocityX)*BALL_SPEEDUP;

        // If we didn't hit a wall
        if(topBottomOrWall!=WALL){

            // Decrease how many bullets we have
            blocksLeft--;


            // Play a sound
            NR10_REG=0X00;
            NR11_REG=0X81;
            NR12_REG=0X43;
            NR13_REG=0X73;
            NR14_REG=0X86;


            IncreaseScore(5);

            // Update the brick at the location
            UpdateBrick(topBottomOrWall,checkHorizontal,ballY>>4);
        }else{
            

            // Play a sound
            NR10_REG=0X4A;
            NR11_REG=0X81;
            NR12_REG=0X43;
            NR13_REG=0X56;
            NR14_REG=0X86;
        }
    }
}
