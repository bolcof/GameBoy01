;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (MINGW64)
;--------------------------------------------------------
	.module main
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _ResetToReady
	.globl _ResetUserInterface
	.globl _DrawLevelBricks
	.globl _ResetPaddle
	.globl _UpdatePaddle
	.globl _ResetBall
	.globl _UpdateBall
	.globl _CollideBricksAgainstBall
	.globl _CollidePaddleAgainstBall
	.globl _RandomNumber
	.globl _set_sprite_palette
	.globl _set_bkg_palette
	.globl _set_sprite_data
	.globl _set_bkg_data
	.globl _wait_vbl_done
	.globl _joypad
	.globl _level
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\main.c:37: void ResetToReady(){
;	---------------------------------
; Function ResetToReady
; ---------------------------------
_ResetToReady::
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\main.c:38: ballState = BALLSTATE_READY;
	ld	hl, #_ballState
	ld	(hl), #0x00
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\main.c:39: score=0;
	xor	a, a
	ld	hl, #_score
	ld	(hl+), a
	ld	(hl), a
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\main.c:41: ResetUserInterface();
	call	_ResetUserInterface
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\main.c:43: DrawLevelBricks(level);
	ld	de, #_level
	call	_DrawLevelBricks
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\main.c:44: ResetPaddle();
	call	_ResetPaddle
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\main.c:45: ResetBall();
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\main.c:46: }
	jp	_ResetBall
_level:
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\main.c:49: void main(void){
;	---------------------------------
; Function main
; ---------------------------------
_main::
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\main.c:51: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\main.c:52: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\main.c:53: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\main.c:54: SPRITES_8x8;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfb
	ldh	(_LCDC_REG + 0), a
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\main.c:57: NR52_REG = 0x80;
	ld	a, #0x80
	ldh	(_NR52_REG + 0), a
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\main.c:58: NR51_REG = 0xFF;
	ld	a, #0xff
	ldh	(_NR51_REG + 0), a
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\main.c:59: NR50_REG = 0x77;
	ld	a, #0x77
	ldh	(_NR50_REG + 0), a
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\main.c:61: set_sprite_palette(0,1,BlackAndWhitePalette);
	ld	de, #_BlackAndWhitePalette
	push	de
	xor	a, a
	inc	a
	push	af
	call	_set_sprite_palette
	add	sp, #4
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\main.c:62: set_bkg_palette(0,1,BlackAndWhitePalette);
	ld	de, #_BlackAndWhitePalette
	push	de
	xor	a, a
	inc	a
	push	af
	call	_set_bkg_palette
	add	sp, #4
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\main.c:64: set_bkg_data(0,Bricks_TILE_COUNT,Bricks_tiles);
	ld	de, #_Bricks_tiles
	push	de
	ld	hl, #0x1100
	push	hl
	call	_set_bkg_data
	add	sp, #4
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\main.c:65: set_bkg_data(USERINTERFACE_TILES_START,UserInterface_TILE_COUNT,UserInterface_tiles);
	ld	de, #_UserInterface_tiles
	push	de
	ld	hl, #0x1011
	push	hl
	call	_set_bkg_data
	add	sp, #4
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\main.c:66: set_bkg_data(FONT_TILES_START,Font_TILE_COUNT,Font_tiles);
	ld	de, #_Font_tiles
	push	de
	ld	hl, #0x2a21
	push	hl
	call	_set_bkg_data
	add	sp, #4
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\main.c:68: set_sprite_data(0,paddle_TILE_COUNT,paddle_tiles);
	ld	de, #_paddle_tiles
	push	de
	ld	hl, #0x300
	push	hl
	call	_set_sprite_data
	add	sp, #4
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\main.c:69: set_sprite_data(paddle_TILE_COUNT,ball_TILE_COUNT,ball_tiles);
	ld	de, #_ball_tiles
	push	de
	ld	hl, #0x103
	push	hl
	call	_set_sprite_data
	add	sp, #4
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\main.c:72: topScore=0;
	xor	a, a
	ld	hl, #_topScore
	ld	(hl+), a
	ld	(hl), a
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\main.c:73: stage=0;
	ld	hl, #_stage
	ld	(hl), #0x00
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\main.c:76: ResetToReady();
	call	_ResetToReady
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\main.c:78: while(1){
00113$:
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\main.c:80: joypadPrevious=joypadCurrent;
	ld	a, (#_joypadCurrent)
	ld	(#_joypadPrevious),a
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\main.c:81: joypadCurrent=joypad();
	call	_joypad
	ld	(#_joypadCurrent),a
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\main.c:84: uint8_t lastSprite = UpdatePaddle();
	call	_UpdatePaddle
	ld	c, a
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\main.c:87: if(ballState==BALLSTATE_READY){
	ld	a, (#_ballState)
	or	a, a
	jr	NZ, 00110$
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\main.c:90: ballX=BALLSTART_X;
	ld	hl, #_ballX
	xor	a, a
	ld	(hl+), a
	ld	(hl), #0x04
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\main.c:91: ballY=BALLSTART_Y;
	ld	hl, #_ballY
	ld	a, #0x80
	ld	(hl+), a
	ld	(hl), #0x06
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\main.c:93: lastSprite = move_metasprite(ball_metasprites[0],paddle_TILE_COUNT,lastSprite,(ballX>>4)+7,(ballY>>4)+15);
	ld	hl, #_ball_metasprites
	ld	a, (hl+)
	ld	b, a
	ld	a, (hl)
;e:\make_202008\gameboy\gbdk-win64\gbdk\include\gb\metasprites.h:160: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl), b
	inc	hl
	ld	(hl), a
;e:\make_202008\gameboy\gbdk-win64\gbdk\include\gb\metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x03
;e:\make_202008\gameboy\gbdk-win64\gbdk\include\gb\metasprites.h:162: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;e:\make_202008\gameboy\gbdk-win64\gbdk\include\gb\metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	ld	de, #0x7747
	ld	a, c
	call	___move_metasprite
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\main.c:96: if((joypadCurrent & J_A) && !(joypadPrevious & J_A)){
	ld	a, (#_joypadCurrent)
	bit	4, a
	jr	Z, 00111$
	ld	a, (#_joypadPrevious)
	bit	4, a
	jr	NZ, 00111$
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\main.c:99: ballState=BALLSTATE_ACTIVE;
	ld	hl, #_ballState
	ld	(hl), #0x01
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\main.c:102: if(RandomNumber(0,100)<50)ballVelocityX=200;
	ld	e, #0x64
	xor	a, a
	call	_RandomNumber
	sub	a, #0x32
	jr	NC, 00102$
	ld	hl, #_ballVelocityX
	ld	a, #0xc8
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
	jr	00103$
00102$:
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\main.c:103: else ballVelocityX=-200;
	ld	hl, #_ballVelocityX
	ld	a, #0x38
	ld	(hl+), a
	ld	(hl), #0xff
00103$:
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\main.c:105: ballVelocityY=-RandomNumber(180,220);
	ld	e, #0xdc
	ld	a, #0xb4
	call	_RandomNumber
	ld	c, a
	xor	a, a
	ld	b, a
	sub	a, c
	ld	c, a
	sbc	a, a
	sub	a, b
	ld	b, a
	ld	hl, #_ballVelocityY
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	jr	00111$
00110$:
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\main.c:111: ballState=UpdateBall(lastSprite);
	ld	a, c
	call	_UpdateBall
	ld	(#_ballState),a
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\main.c:113: CollideBricksAgainstBall();
	call	_CollideBricksAgainstBall
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\main.c:114: CollidePaddleAgainstBall();
	call	_CollidePaddleAgainstBall
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\main.c:116: if(blocksLeft==0){
	ld	hl, #_blocksLeft + 1
	ld	a, (hl-)
	or	a, (hl)
	jr	NZ, 00111$
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\main.c:118: stage++;
	ld	hl, #_stage
	inc	(hl)
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\main.c:120: ResetToReady();
	call	_ResetToReady
00111$:
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\main.c:127: wait_vbl_done();
	call	_wait_vbl_done
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\main.c:129: }
	jp	00113$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
