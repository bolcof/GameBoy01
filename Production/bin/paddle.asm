;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (MINGW64)
;--------------------------------------------------------
	.module paddle
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _UpdatePaddle
	.globl _ResetPaddle
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
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\paddle.c:5: void ResetPaddle(){
;	---------------------------------
; Function ResetPaddle
; ---------------------------------
_ResetPaddle::
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\paddle.c:8: paddleX=80<<4;
	ld	hl, #_paddleX
	xor	a, a
	ld	(hl+), a
	ld	(hl), #0x05
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\paddle.c:9: paddleY=130<<4;
	ld	hl, #_paddleY
	ld	a, #0x20
	ld	(hl+), a
	ld	(hl), #0x08
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\paddle.c:10: paddleXSpeed=0;
	xor	a, a
	ld	hl, #_paddleXSpeed
	ld	(hl+), a
	ld	(hl), a
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\paddle.c:12: }
	ret
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\paddle.c:13: uint8_t UpdatePaddle(){
;	---------------------------------
; Function UpdatePaddle
; ---------------------------------
_UpdatePaddle::
	add	sp, #-12
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\paddle.c:15: if(joypadCurrent & J_LEFT){
	ld	a, (#_joypadCurrent)
	bit	1, a
	jr	Z, 00111$
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\paddle.c:16: paddleXSpeed=-500;
	ld	hl, #_paddleXSpeed
	ld	a, #0x0c
	ld	(hl+), a
	ld	(hl), #0xfe
	jr	00112$
00111$:
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\paddle.c:18: }else if(joypadCurrent & J_RIGHT){
	rrca
	jr	NC, 00108$
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\paddle.c:19: paddleXSpeed=500;
	ld	hl, #_paddleXSpeed
	ld	a, #0xf4
	ld	(hl+), a
	ld	(hl), #0x01
	jr	00112$
00108$:
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\paddle.c:24: if(paddleXSpeed>50)paddleXSpeed-=50;
	ld	hl, #_paddleXSpeed
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	e, b
	ld	d, #0x00
	ld	a, #0x32
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	bit	7, e
	jr	Z, 00258$
	bit	7, d
	jr	NZ, 00259$
	cp	a, a
	jr	00259$
00258$:
	bit	7, d
	jr	Z, 00259$
	scf
00259$:
	jr	NC, 00105$
	ld	a, c
	add	a, #0xce
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	hl, #_paddleXSpeed
	ld	(hl), c
	inc	hl
	ld	(hl), a
	jr	00112$
00105$:
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\paddle.c:25: else if(paddleXSpeed<-50)paddleXSpeed+=50;
	ld	hl, #_paddleXSpeed
	ld	a, (hl+)
	sub	a, #0xce
	ld	a, (hl)
	sbc	a, #0xff
	ld	d, (hl)
	ld	a, #0xff
	bit	7,a
	jr	Z, 00260$
	bit	7, d
	jr	NZ, 00261$
	cp	a, a
	jr	00261$
00260$:
	bit	7, d
	jr	Z, 00261$
	scf
00261$:
	jr	NC, 00102$
	ld	hl, #0x0032
	add	hl, bc
	ld	c, l
	ld	a, h
	ld	hl, #_paddleXSpeed
	ld	(hl), c
	inc	hl
	ld	(hl), a
	jr	00112$
00102$:
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\paddle.c:26: else paddleXSpeed=0;
	xor	a, a
	ld	hl, #_paddleXSpeed
	ld	(hl+), a
	ld	(hl), a
00112$:
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\paddle.c:29: paddleX=CLAMP(paddleX+(paddleXSpeed>>4),LEFT_PADDLE_LIMIT,RIGHT_PADDLE_LIMIT);
	ld	hl, #_paddleXSpeed
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
	ld	a, c
	ld	hl, #_paddleX
	add	a, (hl)
	inc	hl
	ld	c, a
	ld	a, b
	adc	a, (hl)
	ld	b, a
	ld	a, #0x80
	cp	a, c
	ld	a, #0x01
	sbc	a, b
	ld	a, #0x00
	rla
	ld	e, a
	or	a, a
	jr	Z, 00123$
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	jr	00124$
00123$:
	ld	hl, #0x0180
00124$:
	ld	a, l
	sub	a, #0x80
	ld	a, h
	sbc	a, #0x06
	jr	NC, 00121$
	ld	a, e
	or	a, a
	jr	NZ, 00122$
	ld	bc, #0x0180
	jr	00122$
00121$:
	ld	bc, #0x0680
00122$:
	ld	hl, #_paddleX
	ld	a, c
	ld	(hl+), a
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\paddle.c:33: if(paddleX>=RIGHT_PADDLE_LIMIT){
	ld	a, b
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#10
	ld	(hl), a
	ld	a, (#_paddleX + 1)
	ldhl	sp,	#11
	ld	(hl), a
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\paddle.c:24: if(paddleXSpeed>50)paddleXSpeed-=50;
	ld	a, (#_paddleXSpeed)
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, (#_paddleXSpeed + 1)
	ldhl	sp,	#1
	ld	(hl), a
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\paddle.c:35: paddleXSpeed=-ABS((paddleXSpeed)/4)*2;
	pop	de
	push	de
	ld	hl, #0x0003
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl), a
	xor	a, a
	ld	hl, #_paddleXSpeed
	sub	a, (hl)
	inc	hl
	ld	c, a
	sbc	a, a
	sub	a, (hl)
	ld	b, a
	ldhl	sp,	#1
	ld	a, (hl)
	rlca
	and	a,#0x01
	ldhl	sp,	#4
	ld	(hl+), a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	ld	a, (hl+)
	rlca
	and	a,#0x01
	ld	(hl-), a
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0003
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\paddle.c:33: if(paddleX>=RIGHT_PADDLE_LIMIT){
	ld	(hl+), a
	ld	a, (hl+)
	sub	a, #0x80
	ld	a, (hl)
	sbc	a, #0x06
	jp	C, 00116$
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\paddle.c:34: paddleX=RIGHT_PADDLE_LIMIT;
	ld	hl, #_paddleX
	ld	a, #0x80
	ld	(hl+), a
	ld	(hl), #0x06
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\paddle.c:35: paddleXSpeed=-ABS((paddleXSpeed)/4)*2;
	ldhl	sp,	#0
	ld	a, (hl)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,	#1
	ld	a, (hl)
	ldhl	sp,	#11
	ld	(hl), a
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jr	Z, 00129$
	dec	hl
	dec	hl
	ld	a, (hl)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,	#3
	ld	a, (hl)
	ldhl	sp,	#11
	ld	(hl), a
00129$:
	ldhl	sp,#10
	ld	a, (hl+)
	ld	b, (hl)
	sra	b
	sra	b
	bit	7, b
	jr	Z, 00127$
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl)
	or	a, a
	jr	Z, 00130$
	inc	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
00130$:
	sra	d
	rr	e
	sra	d
	rr	e
	jr	00128$
00127$:
	ldhl	sp,	#0
	ld	a, (hl)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,	#1
	ld	a, (hl)
	ldhl	sp,	#11
	ld	(hl), a
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jr	Z, 00131$
	dec	hl
	dec	hl
	ld	a, (hl)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,	#3
	ld	a, (hl)
	ldhl	sp,	#11
	ld	(hl), a
00131$:
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	sra	d
	rr	e
	sra	d
	rr	e
00128$:
	xor	a, a
	sub	a, e
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	sbc	a, a
	sub	a, d
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	ld	a, l
	ld	c, h
	ld	hl, #_paddleXSpeed
	ld	(hl+), a
	ld	(hl), c
	jr	00117$
00116$:
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\paddle.c:38: else if(paddleX<=LEFT_PADDLE_LIMIT){
	ldhl	sp,	#10
	ld	a, #0x80
	sub	a, (hl)
	inc	hl
	ld	a, #0x01
	sbc	a, (hl)
	jr	C, 00117$
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\paddle.c:39: paddleX=LEFT_PADDLE_LIMIT;
	ld	hl, #_paddleX
	ld	a, #0x80
	ld	(hl+), a
	ld	(hl), #0x01
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\paddle.c:40: paddleXSpeed=ABS((paddleXSpeed)/4)*2;
	pop	bc
	push	bc
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jr	Z, 00134$
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	b, (hl)
00134$:
	sra	b
	sra	b
	bit	7, b
	jr	Z, 00132$
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl)
	or	a, a
	jr	Z, 00135$
	inc	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
00135$:
	sra	d
	rr	e
	sra	d
	rr	e
	jr	00133$
00132$:
	pop	de
	push	de
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jr	Z, 00136$
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
00136$:
	sra	d
	rr	e
	sra	d
	rr	e
00133$:
	ld	a, e
	add	a, a
	rl	d
	ld	hl, #_paddleXSpeed
	ld	(hl+), a
	ld	(hl), d
00117$:
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\paddle.c:42: return move_metasprite(paddle_metasprites[0],0,0,(paddleX>>4)+8,(paddleY>>4)+16);
	ld	hl, #_paddleY
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
	add	a, #0x10
	ld	b, a
	ld	hl, #_paddleX
	ld	a, (hl+)
	ld	c, a
	ld	e, (hl)
	srl	e
	rr	c
	srl	e
	rr	c
	srl	e
	rr	c
	srl	e
	rr	c
	ld	a, c
	add	a, #0x08
	ld	c, a
	ld	hl, #_paddle_metasprites
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
	ld	(hl), #0x00
;e:\make_202008\gameboy\gbdk-win64\gbdk\include\gb\metasprites.h:162: __current_base_prop = 0;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;e:\make_202008\gameboy\gbdk-win64\gbdk\include\gb\metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	ld	d, b
	xor	a, a
	or	a, c
	ld	e, a
	xor	a, a
	call	___move_metasprite
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\paddle.c:42: return move_metasprite(paddle_metasprites[0],0,0,(paddleX>>4)+8,(paddleY>>4)+16);
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\paddle.c:43: }
	add	sp, #12
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
