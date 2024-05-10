;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (MINGW64)
;--------------------------------------------------------
	.module userinterface
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _IncreaseScore
	.globl _ResetUserInterface
	.globl _UpdateScore
	.globl _DrawNumber
	.globl _strlen
	.globl _uitoa
	.globl _set_bkg_tile_xy
	.globl _set_bkg_tiles
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
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\userinterface.c:9: void DrawNumber(uint8_t x,uint8_t y, uint16_t number,uint8_t digits){
;	---------------------------------
; Function DrawNumber
; ---------------------------------
_DrawNumber::
	add	sp, #-17
	ld	b, a
	ld	c, e
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\userinterface.c:11: unsigned char buffer[]="00000000";
	ldhl	sp,	#0
	ld	a,#0x30
	ld	(hl+),a
	ld	(hl+), a
	ld	a,#0x30
	ld	(hl+),a
	ld	(hl+), a
	ld	a,#0x30
	ld	(hl+),a
	ld	(hl+), a
	ld	a,#0x30
	ld	(hl+),a
	ld	(hl+), a
	ld	(hl), #0x00
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\userinterface.c:14: uitoa(number, buffer, 10);
	ldhl	sp,	#19
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	bc
	ld	a, #0x0a
	push	af
	inc	sp
	ld	hl, #3
	add	hl, sp
	push	hl
	push	de
	call	_uitoa
	add	sp, #5
	pop	bc
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\userinterface.c:17: uint8_t len =strlen(buffer);
	ld	hl, #0
	add	hl, sp
	push	hl
	call	_strlen
	pop	hl
	ldhl	sp,	#9
	ld	(hl), e
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\userinterface.c:22: for(uint8_t i=0;i<digits-len;i++){
	ldhl	sp,	#16
	ld	(hl), b
	ld	b, #0x00
00104$:
	ldhl	sp,	#21
	ld	a, (hl)
	ldhl	sp,	#10
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	ldhl	sp,	#12
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#15
	ld	(hl-), a
	ld	a, e
	ld	(hl-), a
	dec	hl
	ld	a, b
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,	#12
	ld	e, l
	ld	d, h
	ldhl	sp,	#14
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00141$
	bit	7, d
	jr	NZ, 00142$
	cp	a, a
	jr	00142$
00141$:
	bit	7, d
	jr	Z, 00142$
	scf
00142$:
	jr	NC, 00101$
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\userinterface.c:23: VBK_REG=1; set_bkg_tile_xy(x,y,0);
	ld	a, #0x01
	ldh	(_VBK_REG + 0), a
	xor	a, a
	push	af
	inc	sp
	ld	a, c
	push	af
	inc	sp
	ldhl	sp,	#18
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\userinterface.c:24: VBK_REG=0;set_bkg_tile_xy(x++,y,USERINTERFACE_TILES_START+42);
	xor	a, a
	ldh	(_VBK_REG + 0), a
	ldhl	sp,	#16
	ld	a, (hl)
	inc	(hl)
	ld	h, #0x3b
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, c
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\userinterface.c:22: for(uint8_t i=0;i<digits-len;i++){
	inc	b
	jr	00104$
00101$:
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\userinterface.c:29: for(uint8_t i=0;i<len;i++){
	ldhl	sp,	#16
	ld	b, (hl)
	ld	e, #0x00
00107$:
	ld	a, e
	ldhl	sp,	#9
	sub	a, (hl)
	jr	NC, 00109$
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\userinterface.c:31: VBK_REG=1;set_bkg_tile_xy(x,y,0);
	ld	a, #0x01
	ldh	(_VBK_REG + 0), a
	push	de
	xor	a, a
	push	af
	inc	sp
	ld	a, c
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	pop	de
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\userinterface.c:32: VBK_REG=0;set_bkg_tile_xy(x++,y,(buffer[i]-'0')+USERINTERFACE_TILES_START+42);
	xor	a, a
	ldh	(_VBK_REG + 0), a
	push	de
	ld	d, #0x00
	ld	hl, #2
	add	hl, sp
	add	hl, de
	pop	de
	ld	a, (hl)
	add	a, #0x0b
	ld	d, b
	inc	b
	push	de
	push	af
	inc	sp
	ld	a, c
	push	af
	inc	sp
	push	de
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	pop	de
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\userinterface.c:29: for(uint8_t i=0;i<len;i++){
	inc	e
	jr	00107$
00109$:
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\userinterface.c:34: }
	add	sp, #17
	pop	hl
	add	sp, #3
	jp	(hl)
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\userinterface.c:37: void UpdateScore(){
;	---------------------------------
; Function UpdateScore
; ---------------------------------
_UpdateScore::
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\userinterface.c:39: DrawNumber(16,2,topScore,4);
	ld	a, #0x04
	push	af
	inc	sp
	ld	hl, #_topScore
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ld	e, #0x02
	ld	a, #0x10
	call	_DrawNumber
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\userinterface.c:40: DrawNumber(16,5,score,4);
	ld	a, #0x04
	push	af
	inc	sp
	ld	hl, #_score
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ld	e, #0x05
	ld	a, #0x10
	call	_DrawNumber
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\userinterface.c:41: DrawNumber(17,10,stage+1,2);
	ld	hl, #_stage
	ld	c, (hl)
	ld	b, #0x00
	inc	bc
	ld	a, #0x02
	push	af
	inc	sp
	push	bc
	ld	e, #0x0a
	ld	a, #0x11
	call	_DrawNumber
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\userinterface.c:42: }
	ret
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\userinterface.c:44: void ResetUserInterface(){
;	---------------------------------
; Function ResetUserInterface
; ---------------------------------
_ResetUserInterface::
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\userinterface.c:47: set_bkg_based_tiles(0,0,20,18,UserInterface_map,USERINTERFACE_TILES_START);
;e:\make_202008\gameboy\gbdk-win64\gbdk\include\gb\gb.h:1099: _map_tile_offset = base_tile;
	ld	hl, #__map_tile_offset
	ld	(hl), #0x11
;e:\make_202008\gameboy\gbdk-win64\gbdk\include\gb\gb.h:1100: set_bkg_tiles(x, y, w, h, tiles);
	ld	de, #_UserInterface_map
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	xor	a, a
	call	_set_bkg_tiles
	add	sp, #6
;e:\make_202008\gameboy\gbdk-win64\gbdk\include\gb\gb.h:1101: _map_tile_offset = 0;
	ld	hl, #__map_tile_offset
	ld	(hl), #0x00
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\userinterface.c:49: UpdateScore();
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\userinterface.c:50: }
	jp	_UpdateScore
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\userinterface.c:52: void IncreaseScore(uint16_t amount){
;	---------------------------------
; Function IncreaseScore
; ---------------------------------
_IncreaseScore::
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\userinterface.c:53: score+=amount;
	ld	hl, #_score
	ld	a, (hl)
	add	a, e
	ld	(hl+), a
	ld	a, (hl)
	adc	a, d
	ld	(hl), a
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\userinterface.c:54: topScore =MAX(topScore,score);
	ld	de, #_score
	ld	hl, #_topScore
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	NC, 00103$
	ld	hl, #_topScore
	ld	a, (hl+)
	ld	c, (hl)
	jr	00104$
00103$:
	ld	hl, #_score
	ld	a, (hl+)
	ld	c, (hl)
00104$:
	ld	hl, #_topScore
	ld	(hl+), a
	ld	(hl), c
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\userinterface.c:55: UpdateScore();
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\userinterface.c:56: }
	jp	_UpdateScore
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
