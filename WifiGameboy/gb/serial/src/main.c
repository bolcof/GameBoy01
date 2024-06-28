#include <gb/gb.h>
#include <stdint.h>
#include <stdio.h>
#include "screen.h"
#include "input.h"
#include "sprite.h"

const char *ip_address = "IP:192.168.1.2";
const char *ssids[] = {
    "AAAAAA", "BBBBBB", "CCCCCC", "DDDDDD", "EEEEEE", "FFFFFF", "GGGGGG", "HHHHHH", "IIIIII", "JJJJJJ", "KKKKKK", "LLLLLL", "MMMMMM", "NNNNNN"
};
const uint8_t num_ssids = sizeof(ssids) / sizeof(ssids[0]);
uint8_t currentSelection = 0;
uint8_t currentPage = 0;
const uint8_t ssidsPerPage = 11;

enum ScreenState {
    MAIN_MENU,
    SELECTEDSSID
} currentScreen = MAIN_MENU;

void switchScreen(enum ScreenState newScreen);

void main(void) {
    DISPLAY_ON;
    setupArrowSprite();
    drawMainMenu(ip_address, ssids, num_ssids, ssidsPerPage, currentPage, currentSelection);
    updateArrowPosition(currentSelection, ssidsPerPage);

    while (1) {
        uint8_t joypadState = joypad();
        if (joypadState & (J_UP | J_DOWN)) {
            updateSelection(joypadState, &currentSelection, currentPage, ssidsPerPage, num_ssids);
            updateArrowPosition(currentSelection, ssidsPerPage);
        }
        if (joypadState & (J_LEFT | J_RIGHT)) {
            updatePage(joypadState, &currentPage, ssidsPerPage, num_ssids);
            cls();
            drawMainMenu(ip_address, ssids, num_ssids, ssidsPerPage, currentPage, currentSelection);
            currentSelection = currentPage * ssidsPerPage;
            updateArrowPosition(currentSelection, ssidsPerPage);
        }
        if (joypadState & J_A) {
            switchScreen(SELECTEDSSID);
        }
        delay(100);
    }
}

void switchScreen(enum ScreenState newScreen) {
    hideAllSprites();
    currentScreen = newScreen;
    switch (currentScreen) {
        case MAIN_MENU:
            drawMainMenu(ip_address, ssids, num_ssids, ssidsPerPage, currentPage, currentSelection);
            break;
        case SELECTEDSSID:
            drawSelectedSSID(ssids[currentSelection]);
            break;
    }
}
