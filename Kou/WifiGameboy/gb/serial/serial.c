#include <gb/gb.h>
#include <stdint.h>
#include <stdio.h>

const char *ip_address = "IP:192.168.1.2";
const char *ssids[] = { "AAAAAA", "BBBBBB", "CCCCCC", "DDDDDD" };
const uint8_t num_ssids = sizeof(ssids) / sizeof(ssids[0]);
uint8_t currentSelection = 0;

unsigned char arrow_tiles[] = {
    0x24, 0x24, 0x18, 0x18, 0x7E, 0x7E, 0x18, 0x18,
    0x18, 0x18, 0x3C, 0x3C, 0x7E, 0x7E, 0xFF, 0xFF
};

void setupArrowSprite() {
    set_sprite_data(0, 1, arrow_tiles); // Load sprite data
    set_sprite_tile(0, 0);              // Set sprite 0 to tile 0
    move_sprite(0, 8, 24);              // Set initial position for the arrow sprite
}

void drawScreen() {
    printf("\c%s\n", ip_address); // Display the IP address
    for (uint8_t i = 0; i < num_ssids; i++) {
        printf("  %s\n", ssids[i]); // Display SSIDs
    }
    SHOW_SPRITES;
}

void updateArrowPosition() {
    move_sprite(0, 8, 24 + 16 * currentSelection); // Adjust vertical position of the arrow
}

void updateSelection(uint8_t joypadState) {
    uint8_t oldSelection = currentSelection;
    if (joypadState & J_UP) {
        if (currentSelection > 0) currentSelection--;
    } else if (joypadState & J_DOWN) {
        if (currentSelection < num_ssids - 1) currentSelection++;
    }

    if (oldSelection != currentSelection) {
        updateArrowPosition(); // Update arrow position if selection changed
    }
}

void selectSSID() {
    printf("\nSelected SSID: %s\n", ssids[currentSelection]);
    // Future implementation: transition to password input screen
}

void main(void) {
    DISPLAY_ON; // Turn on the display
    setupArrowSprite();
    drawScreen();
    updateArrowPosition();

    while(1) {
        uint8_t joypadState = joypad();
        if (joypadState & (J_UP | J_DOWN)) {
            updateSelection(joypadState);
        }
        if (joypadState & J_A) { // Check if the A button is pressed
            selectSSID();        // Handle the selection
        }
        delay(100); // Delay to manage debouncing
    }
}
