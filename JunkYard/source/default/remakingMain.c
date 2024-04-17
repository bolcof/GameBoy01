#include <gb/gb.h>
#include <gb/metasprites.h>
#include <gb/cgb.h>
#include <stdio.h>
#include "graphics/ball.h"
#include "graphics/bricks.h"
#include "graphics/paddle.h"
#include "graphics/font.h"
#include "graphics/UserInterface.h"
#include "common.h"
#include "collisions.h"
#include "ball.h"
#include "paddle.h"
#include "brick.h"
#include "userinterface.h"

void main(void){

    DISPLAY_ON;
    SHOW_SPRITES;
    SHOW_BKG;
    SPRITES_8x8;

    // Turn on sound
    NR52_REG = 0x80;
    NR51_REG = 0xFF;
    NR50_REG = 0x77;

    set_sprite_palette(0,1,BlackAndWhitePalette);
    set_bkg_palette(0,1,BlackAndWhitePalette);

    set_bkg_data(0,Bricks_TILE_COUNT,Bricks_tiles);
    set_bkg_data(USERINTERFACE_TILES_START,UserInterface_TILE_COUNT,UserInterface_tiles);
    set_bkg_data(FONT_TILES_START,Font_TILE_COUNT,Font_tiles);

    set_sprite_data(0,paddle_TILE_COUNT,paddle_tiles);
    set_sprite_data(paddle_TILE_COUNT,ball_TILE_COUNT,ball_tiles);
}