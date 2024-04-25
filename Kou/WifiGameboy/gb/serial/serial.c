#include <gb/gb.h>
#include <stdint.h>
#include <stdio.h>

const char *ip_address = "IP:192.168.1.2";
const char *ssids[] = { "AAAAAA", "BBBBBB", "CCCCCC", "DDDDDD" };
const uint8_t num_ssids = sizeof(ssids) / sizeof(ssids[0]);
uint8_t currentSelection = 0;

// スプライトデータ（矢印）：実際には適切なバイナリデータに置き換える必要があります。
unsigned char arrow_tiles[] = {
    0x24, 0x24, 0x18, 0x18, 0x7E, 0x7E, 0x18, 0x18,
    0x18, 0x18, 0x3C, 0x3C, 0x7E, 0x7E, 0xFF, 0xFF
};

void setupArrowSprite() {
    set_sprite_data(0, 1, arrow_tiles); // スプライトのデータをロード
    set_sprite_tile(0, 0);              // 最初のスプライトを使用
    move_sprite(0, 8, 40);              // スプライトの初期位置を設定
}

void drawScreen() {
    printf("\c%s\n", ip_address); // IPアドレスを表示
    for (uint8_t i = 0; i < num_ssids; i++) {
        printf("  %s\n", ssids[i]); // SSIDを表示
    }
    SHOW_SPRITES;
}

void updateArrowPosition() {
    move_sprite(0, 8, 40 + 16 * currentSelection); // スプライトのY座標を更新
}

void updateSelection(uint8_t joypadState) {
    uint8_t oldSelection = currentSelection;
    if (joypadState & J_UP) {
        if (currentSelection > 0) currentSelection--;
    } else if (joypadState & J_DOWN) {
        if (currentSelection < num_ssids - 1) currentSelection++;
    }

    if (oldSelection != currentSelection) {
        updateArrowPosition(); // 矢印の位置を更新
    }
}

void main(void) {
    DISPLAY_ON;
    setupArrowSprite();
    drawScreen();
    updateArrowPosition();

    while(1) {
        uint8_t joypadState = joypad();
        if (joypadState & (J_UP | J_DOWN)) {
            updateSelection(joypadState);
        }
        delay(100);
    }
}