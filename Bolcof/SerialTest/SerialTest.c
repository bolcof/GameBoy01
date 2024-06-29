#include <gb/gb.h>
#include <stdio.h>

// ボタンが押されたときに送信する文字列
const char *buttonA = "Button A pressed\n";
const char *buttonB = "Button B pressed\n";
const char *buttonUp = "Button Up pressed\n";
const char *buttonDown = "Button Down pressed\n";
const char *buttonLeft = "Button Left pressed\n";
const char *buttonRight = "Button Right pressed\n";
const char *buttonStart = "Button Start pressed\n";
const char *buttonSelect = "Button Select pressed\n";

void send_serial_byte(unsigned char b) {
    // シリアル送信開始
    SB_REG = b;
    SC_REG = 0x81; // シリアル転送開始ビットをセット

    // 送信完了を待つ
    while (SC_REG & 0x80);
}

void send_string(const char *str) {
    while (*str) {
        send_serial_byte(*str);
        wait_vbl_done();  // シリアル送信が完了するまで待つ
        str++;
    }
}

void main() {
    // 初期化メッセージ
    printf("Ready to send button presses...\n");

    while (1) {
        // ボタンの入力を検出
        UINT8 joypad_state = joypad();

        // 各ボタンが押された場合に文字列を送信
        if (joypad_state & J_A) {
            send_string(buttonA);
        }
        if (joypad_state & J_B) {
            send_string(buttonB);
        }
        if (joypad_state & J_UP) {
            send_string(buttonUp);
        }
        if (joypad_state & J_DOWN) {
            send_string(buttonDown);
        }
        if (joypad_state & J_LEFT) {
            send_string(buttonLeft);
        }
        if (joypad_state & J_RIGHT) {
            send_string(buttonRight);
        }
        if (joypad_state & J_START) {
            send_string(buttonStart);
        }
        if (joypad_state & J_SELECT) {
            send_string(buttonSelect);
        }

        // 次のフレームまで待つ
        wait_vbl_done();
    }
}
