#include <gb/gb.h>         // GBDKライブラリの基本的な機能を含むヘッダをインクルード
#include <stdint.h>        // 標準整数型の定義を提供するヘッダをインクルード
#include <stdio.h>         // 標準入出力関数を提供するヘッダをインクルード

const char *ip_address = "IP:192.168.1.2";  // IPアドレスを文字列として定義
// SSIDリストを定義
const char *ssids[] = {
    "AAAAAA", "BBBBBB", "CCCCCC", "DDDDDD", "EEEEEE", "FFFFFF", "GGGGGG", "HHHHHH", "IIIIII", "JJJJJJ", "KKKKKK", "LLLLLL", "MMMMMM", "NNNNNN"
};
const uint8_t num_ssids = sizeof(ssids) / sizeof(ssids[0]);  // SSIDの数を計算
uint8_t currentSelection = 0;  // 現在選択されているSSIDのインデックス
uint8_t currentPage = 0;  // 現在のページ番号
const uint8_t ssidsPerPage = 11;  // 1ページあたりのSSID数

// 矢印スプライトのタイルデータ
unsigned char arrow_tiles[] = {
    0x24, 0x24, 0x18, 0x18, 0x7E, 0x7E, 0x18, 0x18,
    0x18, 0x18, 0x3C, 0x3C, 0x7E, 0x7E, 0xFF, 0xFF
};

// 矢印スプライトをセットアップする関数
void setupArrowSprite() {
    set_sprite_data(0, 1, arrow_tiles);  // スプライトデータをメモリにロード
    set_sprite_tile(0, 0);               // スプライトタイルを設定
    move_sprite(0, 8, 48);               // スプライトの初期位置を設定
}

void hideAllSprites() {
    for (uint8_t i = 0; i < 40; i++) {  // Game Boyは最大で40個のスプライトを扱えます
        move_sprite(i, 0, 0);  // スプライトを画面外に移動
        hide_sprite(i);  // スプライトを非表示にする
    }
}

// 画面を描画する関数
void drawMainMenu() {
    printf("\n");
    printf("%s\n\n", ip_address);  // IPアドレスを表示
    printf("SSID\n");
    for (uint8_t i = 0; i < ssidsPerPage; i++) {
        uint8_t index = i + currentPage * ssidsPerPage;  // 現在のページに応じたSSIDのインデックスを計算
        if (index < num_ssids) {
            printf("  %s\n", ssids[index]);  // SSIDを表示
        }
    }
    uint8_t pageStrLen = 5 + (currentPage + 1 >= 10 ? 2 : 1);  // ページ番号表示の文字列長を計算
    uint8_t spaces = (20 - pageStrLen) / 2; // 中央揃えのためのスペース数を計算
    printf("\n");
    for (uint8_t i = 0; i < spaces; i++) {
        printf(" ");
    }
    printf("< %d >\n", currentPage + 1);  // ページ番号を表示
    SHOW_SPRITES;  // スプライトを表示
}

// 矢印の位置を更新する関数
void updateArrowPosition() {
    move_sprite(0, 8, 48 + 8 * (currentSelection % ssidsPerPage));  // 矢印スプライトの位置を更新
}

// 選択を更新する関数
void updateSelection(uint8_t joypadState) {
    uint8_t oldSelection = currentSelection;  // 現在の選択を保存

    // 現在のページの最初と最後のインデックスを計算
    uint8_t firstIndexOfPage = currentPage * ssidsPerPage;
    uint8_t lastIndexOfPage = firstIndexOfPage + ssidsPerPage - 1;
    if (currentPage == (num_ssids / ssidsPerPage)) {  // 最後のページの場合
        lastIndexOfPage = num_ssids - 1;
    }

    if (joypadState & J_UP) {
        if (currentSelection > firstIndexOfPage) {
            currentSelection--;  // 上ボタンが押されたら選択を一つ上に移動
        }
    }
    if (joypadState & J_DOWN) {
        if (currentSelection < lastIndexOfPage) {
            currentSelection++;  // 下ボタンが押されたら選択を一つ下に移動
        }
    }
    if (oldSelection != currentSelection) {
        updateArrowPosition();  // 矢印の位置を更新
    }
}


// ページ切り替え
void updatePage(uint8_t joypadState) {
    uint8_t oldPage = currentPage;
    if (joypadState & J_LEFT) {
        if (currentPage > 0) {
            currentPage--;  // 左ボタンが押されたら前のページに移動
        }
    }
    if (joypadState & J_RIGHT) {
        if (currentPage < (num_ssids / ssidsPerPage)) {
            currentPage++;  // 右ボタンが押されたら次のページに移動
        }
    }
    if (oldPage != currentPage) {
        cls();
        drawMainMenu();  // 画面を再描画
        currentSelection = currentPage * ssidsPerPage;  // 新しいページの最初のSSIDを選択
        updateArrowPosition();  // 矢印の位置を更新
    }
}

// 選択したSSIDを表示する関数
void drawSelectedSSID() {
    cls();
    // SSIDの所在ページを計算して現在のページを更新
    printf("\nSSID: %s\n", ssids[currentSelection]);
    printf("\nPASSWORD:");
    uint8_t joypadState = joypad();
    unsigned char buffer[256];
    gets(buffer);
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

// メイン関数
void main(void) {
    DISPLAY_ON;  // ディスプレイをオンにする
    setupArrowSprite();  // 矢印スプライトをセットアップ
    drawMainMenu();  // 初期画面を描画
    updateArrowPosition();  // 矢印の位置を更新

    while (1) {
        uint8_t joypadState = joypad();  // ジョイパッドの状態を取得
        if (joypadState & (J_UP | J_DOWN)) {
            updateSelection(joypadState);  // 選択を更新
        }
        if (joypadState & (J_LEFT | J_RIGHT)) {
            updatePage(joypadState);  // ページを更新
        }
        if (joypadState & J_A) {
            switchScreen(SELECTEDSSID);
        }
        delay(100);  // 100ミリ秒待つ
    }

}
