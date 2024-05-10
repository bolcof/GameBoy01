;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (MINGW64)
;--------------------------------------------------------
	.module collisions
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _CollideBricksAgainstBall
	.globl _CollidePaddleAgainstBall
	.globl _DrawNumber3
	.globl _strlen
	.globl _IncreaseScore
	.globl _UpdateBrick
	.globl _CheckTopOrBottomBrick
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
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:12: void DrawNumber3(uint8_t x,uint8_t y, uint16_t number,uint8_t digits){
;	---------------------------------
; Function DrawNumber3
; ---------------------------------
_DrawNumber3::
	add	sp, #-17
	ld	b, a
	ld	c, e
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:14: unsigned char buffer[]="00000000";
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
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:17: uitoa(number, buffer, 10);
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
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:20: uint8_t len =strlen(buffer);
	ld	hl, #0
	add	hl, sp
	push	hl
	call	_strlen
	pop	hl
	ldhl	sp,	#9
	ld	(hl), e
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:25: for(uint8_t i=0;i<digits-len;i++){
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
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:26: VBK_REG=1; set_bkg_tile_xy(x,y,0);
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
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:27: VBK_REG=0;set_bkg_tile_xy(x++,y,USERINTERFACE_TILES_START+42);
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
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:25: for(uint8_t i=0;i<digits-len;i++){
	inc	b
	jr	00104$
00101$:
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:32: for(uint8_t i=0;i<len;i++){
	ldhl	sp,	#16
	ld	b, (hl)
	ld	e, #0x00
00107$:
	ld	a, e
	ldhl	sp,	#9
	sub	a, (hl)
	jr	NC, 00109$
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:34: VBK_REG=1;set_bkg_tile_xy(x,y,0);
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
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:35: VBK_REG=0;set_bkg_tile_xy(x++,y,(buffer[i]-'0')+USERINTERFACE_TILES_START+42);
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
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:32: for(uint8_t i=0;i<len;i++){
	inc	e
	jr	00107$
00109$:
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:37: }
	add	sp, #17
	pop	hl
	add	sp, #3
	jp	(hl)
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:39: void CollidePaddleAgainstBall(){
;	---------------------------------
; Function CollidePaddleAgainstBall
; ---------------------------------
_CollidePaddleAgainstBall::
	add	sp, #-8
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:40: int16_t xd = (int16_t)(ballX>>4)-(int16_t)(paddleX>>4);
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
	ld	hl, #_paddleX
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
	ld	a, c
	sub	a, e
	ld	c, a
	ld	a, b
	sbc	a, d
	ld	b, a
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:42: xd = ABS(xd);
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	bit	7, h
	jr	Z, 00112$
	xor	a, a
	sub	a, c
	ld	c, a
	sbc	a, a
	sub	a, b
	ld	b, a
00112$:
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:44: if(xd<=PADDLE_SIZE/2+BALL_RADIUS){
	ld	e, b
	ld	d, #0x00
	ld	a, #0x13
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	bit	7, e
	jr	Z, 00203$
	bit	7, d
	jr	NZ, 00204$
	cp	a, a
	jr	00204$
00203$:
	bit	7, d
	jr	Z, 00204$
	scf
00204$:
	jp	C, 00110$
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:46: int16_t yd =(int16_t)(ballY>>4)-(int16_t)(paddleY>>4);
	ld	hl, #_ballY
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
	ldhl	sp,	#2
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	ld	hl, #_paddleY
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
	ldhl	sp,	#4
	ld	a, e
	ld	(hl+), a
	ld	a, d
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
	ldhl	sp,	#7
	ld	(hl-), a
	ld	(hl), e
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:48: yd = ABS(yd);
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#7
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	bit	7, (hl)
	jr	Z, 00114$
	inc	hl
	ld	de, #0x0000
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	(hl), e
	jr	00115$
00114$:
	ldhl	sp,	#6
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#7
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
00115$:
	ldhl	sp,	#4
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:50: if(yd<=(PADDLE_HALF_THICKNESS+BALL_RADIUS)){
	ld	(hl-), a
	ld	a, #0x05
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00205$
	bit	7, d
	jr	NZ, 00206$
	cp	a, a
	jr	00206$
00205$:
	bit	7, d
	jr	Z, 00206$
	scf
00206$:
	jp	C, 00110$
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:53: ballVelocityY=-ballVelocityY;
	xor	a, a
	ld	hl, #_ballVelocityY
	sub	a, (hl)
	ld	(hl+), a
	sbc	a, a
	sub	a, (hl)
	ld	(hl), a
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:55: NR10_REG=0X2B;
	ld	a, #0x2b
	ldh	(_NR10_REG + 0), a
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:56: NR11_REG=0X81;
	ld	a, #0x81
	ldh	(_NR11_REG + 0), a
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:57: NR12_REG=0X41;
	ld	a, #0x41
	ldh	(_NR12_REG + 0), a
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:58: NR13_REG=0X5C;
	ld	a, #0x5c
	ldh	(_NR13_REG + 0), a
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:59: NR14_REG=0X86;
	ld	a, #0x86
	ldh	(_NR14_REG + 0), a
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:61: if(xd>PADDLE_SIZE/2-PADDLE_HALF_THICKNESS){
	ld	e, b
	ld	d, #0x00
	ld	a, #0x0e
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	bit	7, e
	jr	Z, 00207$
	bit	7, d
	jr	NZ, 00208$
	cp	a, a
	jr	00208$
00207$:
	bit	7, d
	jr	Z, 00208$
	scf
00208$:
	jp	NC, 00105$
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:64: ballVelocityX=ABS(ballVelocityX);
	ld	hl, #_ballVelocityX
	ld	a, (hl+)
	ld	b, (hl)
	ld	de, #0x0000
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#1
	ld	(hl-), a
	ld	(hl), e
	ld	a, (#_ballVelocityX)
	ldhl	sp,	#6
	ld	(hl), a
	ld	a, (#_ballVelocityX + 1)
	ldhl	sp,	#7
	ld	(hl), a
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:65: ballX=MAX(ballX,paddleX+1+PADDLE_SIZE/2+((PADDLE_HALF_THICKNESS-BALL_RADIUS)<<4));
	ld	a, (#_paddleX)
	ldhl	sp,	#2
	ld	(hl), a
	ld	a, (#_paddleX + 1)
	ldhl	sp,	#3
	ld	(hl), a
	ld	a, (#_ballX)
	ldhl	sp,	#4
	ld	(hl), a
	ld	a, (#_ballX + 1)
	ldhl	sp,	#5
	ld	(hl), a
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:64: ballVelocityX=ABS(ballVelocityX);
	ld	a, b
	rlca
	and	a,#0x01
	ld	c, a
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:62: if(paddleX<ballX){
	ld	de, #_paddleX
	ld	hl, #_ballX
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	NC, 00102$
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:64: ballVelocityX=ABS(ballVelocityX);
	ld	a, c
	or	a, a
	jr	Z, 00116$
	ldhl	sp,	#0
	ld	a, (hl)
	ldhl	sp,	#6
	ld	(hl), a
	ldhl	sp,	#1
	ld	a, (hl)
	ldhl	sp,	#7
	ld	(hl), a
00116$:
	ldhl	sp,	#6
	ld	a, (hl)
	ld	(#_ballVelocityX),a
	ldhl	sp,	#7
	ld	a, (hl)
	ld	(#_ballVelocityX + 1),a
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:65: ballX=MAX(ballX,paddleX+1+PADDLE_SIZE/2+((PADDLE_HALF_THICKNESS-BALL_RADIUS)<<4));
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl), a
	ldhl	sp,	#6
	ld	e, l
	ld	d, h
	ldhl	sp,	#4
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	NC, 00118$
	ldhl	sp,	#4
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl), a
00118$:
	ldhl	sp,	#6
	ld	a, (hl)
	ld	(#_ballX),a
	ldhl	sp,	#7
	ld	a, (hl)
	ld	(#_ballX + 1),a
	jr	00105$
00102$:
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:68: ballVelocityX=-ABS(ballVelocityX);
	ld	a, c
	or	a, a
	jr	Z, 00120$
	pop	bc
	push	bc
	jr	00121$
00120$:
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
00121$:
	xor	a, a
	sub	a, c
	ld	hl, #_ballVelocityX
	ld	(hl+), a
	sbc	a, a
	sub	a, b
	ld	(hl), a
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:69: ballX=MIN(ballX,paddleX-1-PADDLE_SIZE/2-((PADDLE_HALF_THICKNESS-BALL_RADIUS)<<4));
	ldhl	sp,#2
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl+)
	ld	b, a
	dec	bc
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	jr	NC, 00122$
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
00122$:
	ld	hl, #_ballX
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
00105$:
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:72: ballY=MIN(ballY,paddleY-((1+PADDLE_HALF_THICKNESS+BALL_RADIUS)<<4));
	ld	hl, #_paddleY
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #0xa0
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
	ld	hl, #_ballY
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, e
	sub	a, c
	ld	a, d
	sbc	a, b
	jr	NC, 00124$
	ld	c, e
	ld	b, d
00124$:
	ld	hl, #_ballY
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
00110$:
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:78: }
	add	sp, #8
	ret
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:80: void CollideBricksAgainstBall(){
;	---------------------------------
; Function CollideBricksAgainstBall
; ---------------------------------
_CollideBricksAgainstBall::
	add	sp, #-12
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:82: int16_t verticalSide=SIGN(ballVelocityY);
	ld	hl, #_ballVelocityY
	ld	a, (hl+)
	bit	7, (hl)
	jr	Z, 00113$
	ld	bc, #0xffff
	jr	00114$
00113$:
	ld	bc, #0x0001
00114$:
	ldhl	sp,	#10
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:83: int16_t horizontalSide=SIGN(ballVelocityX);
	ld	hl, #_ballVelocityX
	ld	a, (hl+)
	bit	7, (hl)
	jr	Z, 00115$
	ld	bc, #0xffff
	jr	00116$
00115$:
	ld	bc, #0x0001
00116$:
	ldhl	sp,	#2
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:85: int16_t checkHorizontal = (ballX>>4)+horizontalSide*BALL_RADIUS;
	ld	a, (#_ballX)
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, (#_ballX + 1)
	ldhl	sp,	#1
	ld	(hl), a
	srl	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	srl	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	srl	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	srl	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	inc	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl), a
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:86: int16_t checkVertical = (ballY>>4)+verticalSide*BALL_RADIUS;
	ld	hl, #_ballY
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
	ldhl	sp,	#10
	ld	a, (hl)
	ldhl	sp,	#6
	ld	(hl), a
	ldhl	sp,	#11
	ld	a, (hl)
	ldhl	sp,	#7
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, (hl)
	ld	l, a
	ld	h, e
	add	hl, bc
	ld	a, l
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:88: uint8_t topBottomOrWall = CheckTopOrBottomBrick(ballX>>4,checkVertical);
	ldhl	sp,	#6
	ld	(hl), a
	ldhl	sp,	#0
	ld	c, (hl)
	ldhl	sp,	#6
	ld	e, (hl)
	ld	a, c
	call	_CheckTopOrBottomBrick
	ldhl	sp,	#7
	ld	(hl), a
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:90: DrawNumber3(17,14,horizontalSide*BALL_RADIUS,2);
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, #0x02
	push	af
	inc	sp
	push	bc
	ld	e, #0x0e
	ld	a, #0x11
	call	_DrawNumber3
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:93: if(topBottomOrWall!=0){
	ldhl	sp,	#7
	ld	a, (hl)
	or	a, a
	jp	Z, 00105$
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:96: ballVelocityY+=SIGN(ballVelocityY)*BALL_SPEEDUP;
	ld	hl, #_ballVelocityY
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	bit	7, b
	jr	Z, 00117$
	ld	hl, #0xffff
	jr	00118$
00117$:
	ld	hl, #0x0001
00118$:
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, de
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #_ballVelocityY
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:99: if(topBottomOrWall!=WALL){
	ldhl	sp,	#7
	ld	a, (hl)
	sub	a, #0x03
	jp	Z,00102$
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:102: ballVelocityY=-verticalSide*ABS(ballVelocityY);
	ld	de, #0x0000
	ldhl	sp,	#10
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#9
	ld	(hl-), a
	ld	(hl), e
	ld	hl, #_ballVelocityY
	ld	a, (hl+)
	bit	7, (hl)
	jr	Z, 00119$
	ld	de, #0x0000
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#11
	ld	(hl-), a
	ld	(hl), e
	jr	00120$
00119$:
	ld	a, (#_ballVelocityY)
	ldhl	sp,	#10
	ld	(hl), a
	ld	a, (#_ballVelocityY + 1)
	ldhl	sp,	#11
	ld	(hl), a
00120$:
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	__mulint
	ld	hl, #_ballVelocityY
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:103: blocksLeft--;
	ld	hl, #_blocksLeft
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	dec	de
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:106: NR10_REG=0X00;
	xor	a, a
	ldh	(_NR10_REG + 0), a
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:107: NR11_REG=0X81;
	ld	a, #0x81
	ldh	(_NR11_REG + 0), a
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:108: NR12_REG=0X43;
	ld	a, #0x43
	ldh	(_NR12_REG + 0), a
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:109: NR13_REG=0X73;
	ld	a, #0x73
	ldh	(_NR13_REG + 0), a
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:110: NR14_REG=0X86;
	ld	a, #0x86
	ldh	(_NR14_REG + 0), a
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:112: IncreaseScore(5);
	ld	de, #0x0005
	call	_IncreaseScore
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:114: UpdateBrick(topBottomOrWall,ballX>>4,checkVertical);
	ld	hl, #_ballX
	ld	a, (hl+)
	ld	e, a
	ld	c, (hl)
	srl	c
	rr	e
	srl	c
	rr	e
	srl	c
	rr	e
	srl	c
	rr	e
	ldhl	sp,	#6
	ld	a, (hl+)
	push	af
	inc	sp
	ld	a, (hl)
	call	_UpdateBrick
	jr	00105$
00102$:
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:118: NR10_REG=0X4A;
	ld	a, #0x4a
	ldh	(_NR10_REG + 0), a
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:119: NR11_REG=0X81;
	ld	a, #0x81
	ldh	(_NR11_REG + 0), a
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:120: NR12_REG=0X43;
	ld	a, #0x43
	ldh	(_NR12_REG + 0), a
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:121: NR13_REG=0X56;
	ld	a, #0x56
	ldh	(_NR13_REG + 0), a
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:122: NR14_REG=0X86;
	ld	a, #0x86
	ldh	(_NR14_REG + 0), a
00105$:
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:128: topBottomOrWall = CheckTopOrBottomBrick(checkHorizontal,ballY>>4);
	ld	hl, #_ballY
	ld	a, (hl+)
	ld	e, a
	ld	c, (hl)
	srl	c
	rr	e
	srl	c
	rr	e
	srl	c
	rr	e
	srl	c
	rr	e
	ldhl	sp,	#10
	ld	(hl), #0x00
	xor	a, a
	call	_CheckTopOrBottomBrick
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:129: topBottomOrWall = CheckTopOrBottomBrick(ballX>>4,ballY>>4);
	ld	hl, #_ballY
	ld	a, (hl+)
	ld	e, a
	ld	c, (hl)
	srl	c
	rr	e
	srl	c
	rr	e
	srl	c
	rr	e
	srl	c
	rr	e
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
	call	_CheckTopOrBottomBrick
	ldhl	sp,	#11
	ld	(hl), a
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:130: DrawNumber3(17,15,verticalSide*BALL_RADIUS,2);
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, #0x02
	push	af
	inc	sp
	push	bc
	ld	e, #0x0f
	ld	a, #0x11
	call	_DrawNumber3
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:133: if(topBottomOrWall!=0){
	ldhl	sp,	#11
	ld	a, (hl)
	or	a, a
	jp	Z, 00111$
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:136: ballVelocityX=-horizontalSide*ABS(ballVelocityX);
	ld	de, #0x0000
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#9
	ld	(hl-), a
	ld	(hl), e
	ld	hl, #_ballVelocityX
	ld	a, (hl+)
	bit	7, (hl)
	jr	Z, 00121$
	dec	hl
	xor	a, a
	sub	a, (hl)
	inc	hl
	ld	c, a
	sbc	a, a
	sub	a, (hl)
	ld	b, a
	jr	00122$
00121$:
	ld	hl, #_ballVelocityX
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
00122$:
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	__mulint
	ld	hl, #_ballVelocityX
	ld	a, c
	ld	(hl+), a
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:139: ballVelocityX+=SIGN(ballVelocityX)*BALL_SPEEDUP;
	ld	a, b
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#4
	ld	(hl), a
	ld	a, (#_ballVelocityX + 1)
	ldhl	sp,	#5
	ld	(hl), a
	bit	7, (hl)
	jr	Z, 00123$
	ldhl	sp,	#8
	ld	a, #0xff
	ld	(hl+), a
	ld	(hl), #0xff
	jr	00124$
00123$:
	ldhl	sp,	#8
	ld	a, #0x01
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
00124$:
	ldhl	sp,#8
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl-), a
	ld	a, (hl)
	ld	(#_ballVelocityX),a
	ldhl	sp,	#9
	ld	a, (hl)
	ld	(#_ballVelocityX + 1),a
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:142: if(topBottomOrWall!=WALL){
	ldhl	sp,	#11
	ld	a, (hl)
	sub	a, #0x03
	jr	Z, 00107$
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:145: blocksLeft--;
	ld	hl, #_blocksLeft
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	dec	de
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:149: NR10_REG=0X00;
	xor	a, a
	ldh	(_NR10_REG + 0), a
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:150: NR11_REG=0X81;
	ld	a, #0x81
	ldh	(_NR11_REG + 0), a
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:151: NR12_REG=0X43;
	ld	a, #0x43
	ldh	(_NR12_REG + 0), a
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:152: NR13_REG=0X73;
	ld	a, #0x73
	ldh	(_NR13_REG + 0), a
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:153: NR14_REG=0X86;
	ld	a, #0x86
	ldh	(_NR14_REG + 0), a
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:156: IncreaseScore(5);
	ld	de, #0x0005
	call	_IncreaseScore
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:159: UpdateBrick(topBottomOrWall,checkHorizontal,ballY>>4);
	ld	a, (#_ballY)
	ldhl	sp,	#8
	ld	(hl), a
	ld	a, (#_ballY + 1)
	ldhl	sp,	#9
	ld	(hl), a
	srl	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	srl	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	srl	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	srl	(hl)
	dec	hl
	rr	(hl)
	ld	a, (hl+)
	ld	(hl), a
	ld	a, (hl+)
	inc	hl
	push	af
	inc	sp
	ld	e, #0x00
	ld	a, (hl)
	call	_UpdateBrick
	jr	00111$
00107$:
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:164: NR10_REG=0X4A;
	ld	a, #0x4a
	ldh	(_NR10_REG + 0), a
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:165: NR11_REG=0X81;
	ld	a, #0x81
	ldh	(_NR11_REG + 0), a
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:166: NR12_REG=0X43;
	ld	a, #0x43
	ldh	(_NR12_REG + 0), a
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:167: NR13_REG=0X56;
	ld	a, #0x56
	ldh	(_NR13_REG + 0), a
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:168: NR14_REG=0X86;
	ld	a, #0x86
	ldh	(_NR14_REG + 0), a
00111$:
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\default\collisions.c:171: }
	add	sp, #12
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
