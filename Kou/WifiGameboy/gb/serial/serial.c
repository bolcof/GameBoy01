#include <gb/gb.h>
#include <stdint.h>
#include <stdio.h>

const char *ip_address = "IP:192.168.1.2";
const char *ssids[] = { "AAA", "BBB", "CCC", "DDD" };
const uint8_t num_ssids = sizeof(ssids) / sizeof(ssids[0]);
uint8_t currentSelection = 0;

void drawScreen() {
    printf("\c"); // 画面をクリア（GBDKでは '\c' を使用）
    printf("%s\n", ip_address); // IPアドレスを表示

    for (uint8_t i = 0; i < num_ssids; i++) {
        if (i == currentSelection) {
            printf("> %s\n", ssids[i]); // 現在の選択をハイライト
        } else {
            printf("  %s\n", ssids[i]); // 通常の表示
        }
    }
}

void updateSelection(uint8_t joypadState) {
    uint8_t oldSelection = currentSelection;
    if (joypadState & J_UP) {
        if (currentSelection > 0) currentSelection--;
    } else if (joypadState & J_DOWN) {
        if (currentSelection < num_ssids - 1) currentSelection++;
    }

    if (oldSelection != currentSelection) {
        drawScreen(); // 選択が更新されたら画面を再描画
    }
}

void main(void) {
    DISPLAY_ON; // ゲームボーイのディスプレイをオンにする
    drawScreen(); // 初期スクリーン描画

    while(1) {
        uint8_t joypadState = joypad();
        if (joypadState & (J_UP | J_DOWN)) {
            updateSelection(joypadState);
        }
        delay(100); // デバウンスのための小さな遅延
    }
}