#include <gb/gb.h>
#include <stdio.h>
#include <time.h>
#include "block.c"

/* バー位置 */
typedef struct {
    int x;
} Bar;
Bar bar;

typedef struct {
    int x;
    int y;
} Ball;
Ball ball;

typedef struct {
    int x;
    int y;
    int w;
    int h;
} BlockArea;
BlockArea blockArea;

/* ボタン押下情報 */
char button;
char pre_button;

/* プロトタイプ宣言 */
void disp_title();   // ゲームタイトル画面表示
void game_start();   // ゲーム開始処理
void init();         // ゲーム初期化処理
void update();       // ゲーム更新処理
void disp_gameover();// ゲームオーバー画面表示
void disp_clear();   // ゲームクリア画面表示
char* get_tile(int); // BGタイル番号配列取得処理

/*メイン処理*/
void main(void) {
    /*本番用
    // 初期処理（背景有効化、BGタイルの設定）
    SHOW_BKG;
    set_bkg_data(0, sizeof(tile)/16, tile);
    // タイトル画面の表示
    disp_title();
    // ゲームスタート
    game_start();
    */

    // 背景を有効化
    SHOW_BKG;
    // BGタイルを登録
    set_bkg_data(0, sizeof(block_tile)/16, block_tile);
    // Barを表示（16x8）
    set_bkg_tiles(9, 14, 2, 1, bar_long);
    bar.x = 9;

    game_start();
}

/* タイトル画面表示 */
/*void disp_title() {

  // タイトル画面の表示
  for (int y = 0; y < MAP_HEIGHT*2; y++) {
    for (int x = 0; x < MAP_WIDTH*2; x++) {
      if (title_map[y][x] == BLOCK_TILE_NO) {
        set_bkg_tiles(x, y, 1, 1, block_single_tile);
      } else {
        set_bkg_tiles(x, y, 1, 1, blank_single_tile);
      }
    }
  }

  // ボタンの入力検知
  button = joypad();
  pre_button = button;
  while (1) { 
    button = joypad();
    if (pre_button != button) {
      // スタートボタン押下で次処理へ
      if (button & J_START) {
        break;
      }
    }
    pre_button = button;
  }

  // 乱数初期化
  // ※ボタン押下までの時間を使用してランダム調整
  seed |= (UWORD)DIV_REG << 8;
  initrand(seed);

  // ゲームスタート
  game_start();
}
*/

/* ゲーム開始処理 */
void game_start() {
  init();
  update();
}

/* ゲーム初期化処理 */
void init() {
  // ブロック再生成
}


/* ゲーム更新処理 */
void update() {
  int is_clear = 0;  // クリアフラグ
  int is_gameover = 0;  // ゲームオーバーフラグ
  int is_retly = 0;  // リトライフラグ

  while(1) {
    // ボタンの入力検知
    button = joypad();
    if (pre_button != button) {
      // スタートボタン押下でリトライ
      if (button & J_START) {
        is_retly = 1;
        break;
      }

    // ブロック位置
    int block_pos[2] = {9, 14};
    while (1) {
        // 入力検知
        button = joypad();
        if (button != pre_button) {
            // 押下されたボタンに応じて移動処理を行う
            if (button & J_LEFT && block_pos[0] >= 1) {
              block_pos[0]-=1;
              set_bkg_tiles(block_pos[0]+2, block_pos[1], 1, 1, blank);
              // ブロックを移動させる
              set_bkg_tiles(block_pos[0], block_pos[1], 2, 1, bar_long);
            }
            if (button & J_RIGHT && block_pos[0] <= 17) {
              block_pos[0]+=1;
              set_bkg_tiles(block_pos[0]-1, block_pos[1], 1, 1, blank);
              // ブロックを移動させる
              set_bkg_tiles(block_pos[0], block_pos[1], 2, 1, bar_long);
            }
        }
        // 押下ボタンを保持
        pre_button = button;
    }

    if (is_clear == 1) {
        break;
      }
    }
    // 押下ボタンを保持
    pre_button = button;
  }

  // 以下、ループから抜けた後の処理
  // クリア処理
  if (is_clear == 1) {
    disp_clear();
    return;
  }
  // リトライ処理
  if (is_retly == 1) {
    game_start();
    return;
  }
}

void BallProgress(){

}