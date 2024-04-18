;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (MINGW64)
;--------------------------------------------------------
	.module ball
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _UpdateBall
	.globl _ResetBall
	.globl _DrawNumber2
	.globl _strlen
	.globl _uitoa
	.globl _set_bkg_tile_xy
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
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\ball.c:12: void DrawNumber2(uint8_t x,uint8_t y, uint16_t number,uint8_t digits){
;	---------------------------------
; Function DrawNumber2
; ---------------------------------
_DrawNumber2::
	add	sp, #-17
	ld	b, a
	ld	c, e
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\ball.c:14: unsigned char buffer[]="00000000";
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
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\ball.c:17: uitoa(number, buffer, 10);
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
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\ball.c:20: uint8_t len =strlen(buffer);
	ld	hl, #0
	add	hl, sp
	push	hl
	call	_strlen
	pop	hl
	ldhl	sp,	#9
	ld	(hl), e
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\ball.c:25: for(uint8_t i=0;i<digits-len;i++){
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
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\ball.c:26: VBK_REG=1; set_bkg_tile_xy(x,y,0);
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
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\ball.c:27: VBK_REG=0;set_bkg_tile_xy(x++,y,USERINTERFACE_TILES_START+42);
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
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\ball.c:25: for(uint8_t i=0;i<digits-len;i++){
	inc	b
	jr	00104$
00101$:
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\ball.c:32: for(uint8_t i=0;i<len;i++){
	ldhl	sp,	#16
	ld	b, (hl)
	ld	e, #0x00
00107$:
	ld	a, e
	ldhl	sp,	#9
	sub	a, (hl)
	jr	NC, 00109$
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\ball.c:34: VBK_REG=1;set_bkg_tile_xy(x,y,0);
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
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\ball.c:35: VBK_REG=0;set_bkg_tile_xy(x++,y,(buffer[i]-'0')+USERINTERFACE_TILES_START+42);
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
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\ball.c:32: for(uint8_t i=0;i<len;i++){
	inc	e
	jr	00107$
00109$:
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\ball.c:37: }
	add	sp, #17
	pop	hl
	add	sp, #3
	jp	(hl)
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\ball.c:39: void ResetBall(){
;	---------------------------------
; Function ResetBall
; ---------------------------------
_ResetBall::
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\ball.c:41: ballX=BALLSTART_X;
	ld	hl, #_ballX
	xor	a, a
	ld	(hl+), a
	ld	(hl), #0x04
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\ball.c:42: ballY=BALLSTART_Y;
	ld	hl, #_ballY
	ld	a, #0x80
	ld	(hl+), a
	ld	(hl), #0x06
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\ball.c:43: ballVelocityX=0;
	xor	a, a
	ld	hl, #_ballVelocityX
	ld	(hl+), a
	ld	(hl), a
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\ball.c:44: ballVelocityY=0;
	xor	a, a
	ld	hl, #_ballVelocityY
	ld	(hl+), a
	ld	(hl), a
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\ball.c:45: }
	ret
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\ball.c:47: uint8_t UpdateBall(uint8_t lastSprite){
;	---------------------------------
; Function UpdateBall
; ---------------------------------
_UpdateBall::
	dec	sp
	dec	sp
	ldhl	sp,	#1
	ld	(hl), a
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\ball.c:50: ballX+=ballVelocityX>>4;
	ld	hl, #_ballVelocityX
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ld	hl, #_ballX
	ld	a, (hl)
	add	a, c
	ld	(hl+), a
	ld	a, (hl)
	adc	a, b
	ld	(hl), a
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\ball.c:51: ballY+=ballVelocityY>>4;
	ld	hl, #_ballVelocityY
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ld	hl, #_ballY
	ld	a, (hl)
	add	a, c
	ld	(hl+), a
	ld	a, (hl)
	adc	a, b
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\ball.c:55: if((ballY>>4)>144){
	ld	(hl-), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	ld	e, c
	ld	d, b
	ld	a, #0x90
	cp	a, e
	ld	a, #0x00
	sbc	a, d
	jr	NC, 00102$
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\ball.c:58: return 0;
	xor	a, a
	jr	00104$
00102$:
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\ball.c:61: lastSprite = move_metasprite(ball_metasprites[0],paddle_TILE_COUNT,lastSprite,(ballX>>4)+7,(ballY>>4)+15);
	ld	a, c
	add	a, #0x0f
	ldhl	sp,	#0
	ld	(hl), a
	ld	hl, #_ballX
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	ld	a, c
	add	a, #0x07
	ld	c, a
	ld	hl, #_ball_metasprites
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
;e:\make_202008\gameboy\gbdk-win64\gbdk\include\gb\metasprites.h:160: __current_metasprite = metasprite;
	ld	e, a
	ld	d, h
	ld	hl, #___current_metasprite
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;e:\make_202008\gameboy\gbdk-win64\gbdk\include\gb\metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x03
;e:\make_202008\gameboy\gbdk-win64\gbdk\include\gb\metasprites.h:162: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;e:\make_202008\gameboy\gbdk-win64\gbdk\include\gb\metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	d, a
	xor	a, a
	or	a, c
	ld	e, a
	ld	a, (hl)
	call	___move_metasprite
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\ball.c:63: return 1;
	ld	a, #0x01
00104$:
;E:\make_202008\GameBoy\GameBoy01\JunkYard\source\default\ball.c:64: }
	inc	sp
	inc	sp
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
