#include <gb/gb.h>
#include <stdint.h>
#include <stdio.h>

const char *ip_address = "IP:192.168.1.2";
const char *ssids[] = {
    "AAAAAA", "BBBBBB", "CCCCCC", "DDDDDD", "EEEEEE", "FFFFFF", "GGGGGG", "HHHHHH", "IIIIII", "JJJJJJ", "KKKKKK", "LLLLLL", "MMMMMM", "NNNNNN", "OOOOOO"
};
const uint8_t num_ssids = sizeof(ssids) / sizeof(ssids[0]);
uint8_t currentSelection = 0;
uint8_t currentPage = 0;
const uint8_t ssidsPerPage = 11;

unsigned char arrow_tiles[] = {
    0x24, 0x24, 0x18, 0x18, 0x7E, 0x7E, 0x18, 0x18,
    0x18, 0x18, 0x3C, 0x3C, 0x7E, 0x7E, 0xFF, 0xFF
};

void setupArrowSprite() {
    set_sprite_data(0, 1, arrow_tiles);
    set_sprite_tile(0, 0);
    move_sprite(0, 8, 48);
}

void updateArrowPosition() {
    move_sprite(0, 8, 48 + 8 * (currentSelection % ssidsPerPage));
}

void hideAllSprites() {
    for (uint8_t i = 0; i < 40; i++) {  // Game Boyは最大で40個のスプライトを扱えます
        move_sprite(i, 0, 0);  // スプライトを画面外に移動
        hide_sprite(i);  // スプライトを非表示にする
    }
}

void updateSelection(uint8_t joypadState) {
    uint8_t oldSelection = currentSelection;
    if (joypadState & J_UP && currentSelection > 0) currentSelection--;
    if (joypadState & J_DOWN && currentSelection < num_ssids - 1) currentSelection++;
    if (joypadState & J_RIGHT && currentPage < (num_ssids - 1) / ssidsPerPage) {
        currentPage++;
        drawMainMenu();
    }
    if (joypadState & J_LEFT && currentPage > 0) {
        currentPage--;
        drawMainMenu();
    }
    if (oldSelection != currentSelection) {
        updateArrowPosition();
    }
}

// 画面をクリアする関数
void clearScreen() {
    display_off();  // 画面更新のちらつきを防ぐために表示をオフにする
    for (int y = 0; y < 18; y++) {
        for (int x = 0; x < 20; x++) {
            // gotoxy(x, y);
            putchar(' ');  // 空白で画面をクリア
        }
    }
    DISPLAY_ON;  // 画面表示を再開する
}

// メインメニューを描画する関数
void drawMainMenu() {
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

// オプションメニューを描画する関数
void drawSelectedSSID() {
    clearScreen();
    // SSIDの所在ページを計算して現在のページを更新
    printf("\nSSID: %s\n", ssids[currentSelection]);
}


// 現在の画面状態を管理する変数
enum ScreenState {
    MAIN_MENU,
    SELECTEDSSID
} currentScreen = MAIN_MENU;

// 画面を切り替える関数
void switchScreen(enum ScreenState newScreen) {
    hideAllSprites();
    currentScreen = newScreen;
    switch (currentScreen) {
        case MAIN_MENU:
            drawMainMenu();
            break;
        case SELECTEDSSID:
            drawSelectedSSID();
            break;
    }
}

void main(void) {
    DISPLAY_ON;
    setupArrowSprite();
    drawMainMenu();
    updateArrowPosition();

    while (1) {
        uint8_t joypadState = joypad();
        if (joypadState & (J_UP | J_DOWN | J_LEFT | J_RIGHT)) {
            updateSelection(joypadState);
        }
        if (joypadState & J_A) {
            switchScreen(SELECTEDSSID);
        }
        delay(100);
    }
}
