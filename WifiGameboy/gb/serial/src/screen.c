#include <gb/gb.h>
#include <stdint.h>
#include <stdio.h>
#include "screen.h"

void drawMainMenu(const char *ip_address, const char *ssids[], uint8_t num_ssids, uint8_t ssidsPerPage, uint8_t currentPage, uint8_t currentSelection) {
    printf("\n");
    printf("%s\n\n", ip_address);
    printf("SSID\n");
    for (uint8_t i = 0; i < ssidsPerPage; i++) {
        uint8_t index = i + currentPage * ssidsPerPage;
        if (index < num_ssids) {
            printf("  %s\n", ssids[index]);
        }
    }
    uint8_t pageStrLen = 5 + (currentPage + 1 >= 10 ? 2 : 1);
    uint8_t spaces = (20 - pageStrLen) / 2;
    printf("\n");
    for (uint8_t i = 0; i < spaces; i++) {
        printf(" ");
    }
    printf("< %d >\n", currentPage + 1);
    SHOW_SPRITES;
}

void drawSelectedSSID(const char *ssid) {
    cls();
    printf("\nSSID: %s\n", ssid);
    printf("\nPASSWORD:");
    unsigned char buffer[256];
    gets(buffer);
}

void hideAllSprites() {
    for (uint8_t i = 0; i < 40; i++) {
        move_sprite(i, 0, 0);
        hide_sprite(i);
    }
}
