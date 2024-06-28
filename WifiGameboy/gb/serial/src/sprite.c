#include <gb/gb.h>
#include <stdint.h>
#include "sprite.h"

unsigned char arrow_tiles[] = {
    0x24, 0x24, 0x18, 0x18, 0x7E, 0x7E, 0x18, 0x18,
    0x18, 0x18, 0x3C, 0x3C, 0x7E, 0x7E, 0xFF, 0xFF
};

void setupArrowSprite() {
    set_sprite_data(0, 1, arrow_tiles);
    set_sprite_tile(0, 0);
    move_sprite(0, 8, 48);
}

void updateArrowPosition(uint8_t currentSelection, uint8_t ssidsPerPage) {
    move_sprite(0, 8, 48 + 8 * (currentSelection % ssidsPerPage));
}
