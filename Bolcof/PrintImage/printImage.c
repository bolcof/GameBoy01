#include <gb/gb.h>
#include "block.c"

void main(void)
{
    // 背景を有効化
    SHOW_BKG;
    // BGタイルを登録
    set_bkg_data(0, sizeof(block_tile)/16, block_tile);
    // Barを表示（16x8）
    set_bkg_tiles(9, 14, 2, 1, bar_long);

    // ボタン押下情報
    char button;
    char pre_button;
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
        pre_button = button;
    }
}