#include <gb/gb.h>
#include <stdlib.h>
#include "common.h"
#include "graphics/ball.h"
#include "graphics/paddle.h"
#include <string.h>
#include "graphics/Font.h"
#include "graphics/Bricks.h"
#include "graphics/UserInterface.h"


void DrawNumber2(uint8_t x,uint8_t y, uint16_t number,uint8_t digits){
    
    unsigned char buffer[]="00000000";

    // Convert the number to a decimal string (stored in the buffer char array)
    uitoa(number, buffer, 10);

    // Get the length of the number so we can add leading zeroes
    uint8_t len =strlen(buffer);

    // Add some leading zeroes
    // uitoa will not do this for us
    // Increase the VRAM address each iteration to move to the next tile
    for(uint8_t i=0;i<digits-len;i++){
        VBK_REG=1;set_bkg_tile_xy(x,y,0);
        VBK_REG=0;set_bkg_tile_xy(x++,y,USERINTERFACE_TILES_START+42);
    }
        
    // Draw our number
    // Increase the VRAM address each iteration to move to the next tile
    for(uint8_t i=0;i<len;i++){
        
        VBK_REG=1;set_bkg_tile_xy(x,y,0);
        VBK_REG=0;set_bkg_tile_xy(x++,y,(buffer[i]-'0')+USERINTERFACE_TILES_START+42);
    }
}

void ResetBall(){
        
    ballX=BALLSTART_X;
    ballY=BALLSTART_Y;
    ballVelocityX=0;
    ballVelocityY=0;
}

uint8_t UpdateBall(uint8_t lastSprite){

    // Move according to our velocity
    ballX+=ballVelocityX>>4;
    ballY+=ballVelocityY>>4;
    //DrawNumber2(17,14,ballVelocityX,2);

    // if the ball is at the bottom of the screen
    if((ballY>>4)>144){

        // Reset the gameplay
        return 0;
    }

    lastSprite = move_metasprite(ball_metasprites[0],paddle_TILE_COUNT,lastSprite,(ballX>>4)+7,(ballY>>4)+15);

    return 1;
}