;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (MINGW64)
;--------------------------------------------------------
	.module brick
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _DrawLevelBricks
	.globl _UpdateBrick
	.globl _CheckTopOrBottomBrick
	.globl _get_bkg_tile_xy
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
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\brick.c:7: uint8_t CheckTopOrBottomBrick(uint8_t x, uint8_t  y){
;	---------------------------------
; Function CheckTopOrBottomBrick
; ---------------------------------
_CheckTopOrBottomBrick::
	add	sp, #-10
	ldhl	sp,	#9
	ld	(hl-), a
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\brick.c:9: if(x<=8) return WALL;
	ld	a, e
	ld	(hl+), a
	ld	a, #0x08
	sub	a, (hl)
	jr	C, 00102$
	ld	a, #0x03
	jp	00115$
00102$:
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\brick.c:12: if(x>=120) return WALL;
	ldhl	sp,	#9
	ld	a, (hl)
	sub	a, #0x78
	jr	C, 00104$
	ld	a, #0x03
	jp	00115$
00104$:
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\brick.c:15: uint8_t brick =get_bkg_tile_xy(x/8,y/8);
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#6
	ld	(hl+), a
	ld	(hl), #0x00
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	ld	a, (hl-)
	ld	(hl), a
	ldhl	sp,	#9
	ld	a, (hl)
	ldhl	sp,	#6
	ld	(hl+), a
	ld	(hl), #0x00
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	ld	a, (hl-)
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_get_bkg_tile_xy
	pop	hl
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\brick.c:19: if(brick==0) return 0;
	ldhl	sp,#2
	ld	(hl), e
	ld	a, (hl)
	or	a,a
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\brick.c:22: uint8_t mid = (y/8)*8+4;
	jp	Z,00115$
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\brick.c:24: uint8_t bottomMissing = brick==4||brick==8||brick==0x0C;
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x04
	jr	Z, 00121$
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x08
	jr	Z, 00121$
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x0c
	jr	Z, 00121$
	ldhl	sp,	#7
	ld	(hl), #0x00
	jr	00122$
00121$:
	ldhl	sp,	#7
	ld	(hl), #0x01
00122$:
	ldhl	sp,	#7
	ld	a, (hl)
	ldhl	sp,	#3
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\brick.c:25: uint8_t topMissing = (brick-1)>=12&&(brick-1)<15; 
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0001
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#7
	ld	(hl-), a
	ld	(hl), e
	ld	a, (hl+)
	sub	a, #0x0c
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00227$
	bit	7, d
	jr	NZ, 00228$
	cp	a, a
	jr	00228$
00227$:
	bit	7, d
	jr	Z, 00228$
	scf
00228$:
	jr	C, 00126$
	ldhl	sp,	#6
	ld	a, (hl+)
	sub	a, #0x0f
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00229$
	bit	7, d
	jr	NZ, 00230$
	cp	a, a
	jr	00230$
00229$:
	bit	7, d
	jr	Z, 00230$
	scf
00230$:
	jr	C, 00127$
00126$:
	xor	a, a
	jr	00128$
00127$:
	ld	a, #0x01
00128$:
	ldhl	sp,	#7
	ld	(hl), a
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\brick.c:28: if((y/4)%2!=0 && !bottomMissing)return BOTTOM;
	pop	de
	push	de
	sra	d
	rr	e
	sra	d
	rr	e
	ld	bc, #0x0002
	call	__modsint
	ld	a, b
	or	a, c
	jr	Z, 00108$
	ldhl	sp,	#3
	ld	a, (hl)
	or	a, a
	jr	NZ, 00108$
	ld	a, #0x01
	jr	00115$
00108$:
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\brick.c:29: if((y/4)%2==0  && !topMissing)return TOP;
	pop	de
	push	de
	sra	d
	rr	e
	sra	d
	rr	e
	ld	bc, #0x0002
	call	__modsint
	ld	a, b
	or	a, c
	jr	NZ, 00111$
	ldhl	sp,	#7
	ld	a, (hl)
	or	a, a
	jr	NZ, 00111$
	ld	a, #0x02
	jr	00115$
00111$:
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\brick.c:31: if(brick>=0x10)return WALL;
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x10
	jr	C, 00114$
	ld	a, #0x03
	jr	00115$
00114$:
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\brick.c:34: return 0;
	xor	a, a
00115$:
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\brick.c:36: }
	add	sp, #10
	ret
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\brick.c:39: void UpdateBrick(uint8_t side, uint8_t x, uint8_t  y){
;	---------------------------------
; Function UpdateBrick
; ---------------------------------
_UpdateBrick::
	add	sp, #-10
	ldhl	sp,	#9
	ld	(hl-), a
	ld	(hl), e
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\brick.c:41: uint8_t column=x/8;
	ld	a, (hl-)
	dec	hl
	ld	(hl+), a
	ld	(hl), #0x00
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\brick.c:42: uint8_t row=y/8;
	ldhl	sp,	#12
	ld	a, (hl)
	ldhl	sp,	#6
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl-)
	dec	hl
	ld	(hl+), a
	ld	(hl), #0x00
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	ld	a, (hl)
	ldhl	sp,	#1
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\brick.c:45: uint8_t brick =get_bkg_tile_xy(column,row);
	ld	(hl-), a
	ld	d, a
	ld	e, (hl)
	push	de
	call	_get_bkg_tile_xy
	pop	hl
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\brick.c:48: if(brick==0) return;
	ldhl	sp,#2
	ld	(hl), e
	ld	a, (hl)
	or	a, a
	jp	Z,00142$
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\brick.c:49: if(brick>=USERINTERFACE_TILES_START)return;
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x11
	jp	NC,00142$
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\brick.c:53: side = (y/4)%2==0?TOP:BOTTOM;
	ldhl	sp,	#6
	ld	e, (hl)
	ld	d, #0x00
	sra	d
	rr	e
	sra	d
	rr	e
	ld	bc, #0x0002
	call	__modsint
	ldhl	sp,	#6
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	ldhl	sp,	#7
	ld	a, (hl-)
	or	a, (hl)
	jr	NZ, 00146$
	inc	hl
	ld	(hl), #0x02
	jr	00147$
00146$:
	ldhl	sp,	#7
	ld	(hl), #0x01
00147$:
	ldhl	sp,	#7
	ld	a, (hl+)
	inc	hl
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\brick.c:57: if((brick==4||brick==8||brick==12)&&side==TOP)set_bkg_tile_xy(column,row,0);
	ld	(hl), a
	sub	a, #0x02
	ld	a, #0x01
	jr	Z, 00310$
	xor	a, a
00310$:
	ld	c, a
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x04
	jr	Z, 00141$
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x08
	jr	Z, 00141$
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x0c
	jr	NZ, 00137$
00141$:
	ld	a, c
	or	a, a
	jr	Z, 00137$
	xor	a, a
	push	af
	inc	sp
	ldhl	sp,	#2
	ld	a, (hl-)
	ld	d, a
	ld	a, (hl)
	ld	e, a
	push	de
	call	_set_bkg_tile_xy
	add	sp, #3
	jp	00142$
00137$:
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\brick.c:58: else if(brick>=13&&side==BOTTOM)set_bkg_tile_xy(column,row,0);
	ldhl	sp,	#9
	ld	a, (hl)
	dec	a
	ld	a, #0x01
	jr	Z, 00316$
	xor	a, a
00316$:
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl)
	sub	a, #0x0d
	jr	C, 00133$
	inc	hl
	ld	a, (hl)
	or	a, a
	jr	Z, 00133$
	dec	hl
	dec	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, (hl-)
	ld	d, a
	ld	a, (hl)
	ld	e, a
	push	de
	call	_set_bkg_tile_xy
	add	sp, #3
	jp	00142$
00133$:
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\brick.c:61: uint8_t nextTile=brick;
	ldhl	sp,	#2
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\brick.c:63: if(brick>=1&&brick<=3)nextTile=4;
	ld	a,(hl)
	ld	e,a
	sub	a, #0x01
	ld	a, #0x00
	rla
	ld	b, a
	ld	a, #0x03
	sub	a, (hl)
	inc	hl
	inc	hl
	ld	a, #0x00
	rla
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\brick.c:64: else if(brick>=5&&brick<=7)nextTile=8;
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	sub	a, #0x05
	ld	a, #0x00
	rla
	ldhl	sp,	#5
	ld	(hl), a
	ld	a, #0x07
	ldhl	sp,	#2
	sub	a, (hl)
	ld	a, #0x00
	rla
	ldhl	sp,	#6
	ld	(hl), a
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\brick.c:65: else if(brick>=9&&brick<=11)nextTile=12;
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x09
	ld	a, #0x00
	rla
	ldhl	sp,	#7
	ld	(hl), a
	ld	a, #0x0b
	ldhl	sp,	#2
	sub	a, (hl)
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\brick.c:62: if(side==BOTTOM){
	inc	hl
	ld	a, #0x00
	rla
	ld	d, a
	ld	a, (hl)
	or	a, a
	jr	Z, 00130$
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\brick.c:63: if(brick>=1&&brick<=3)nextTile=4;
	bit	0, b
	jr	NZ, 00113$
	inc	hl
	bit	0, (hl)
	jr	NZ, 00113$
	ld	e, #0x04
	jr	00131$
00113$:
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\brick.c:64: else if(brick>=5&&brick<=7)nextTile=8;
	ldhl	sp,	#5
	bit	0, (hl)
	jr	NZ, 00109$
	inc	hl
	bit	0, (hl)
	jr	NZ, 00109$
	ld	e, #0x08
	jr	00131$
00109$:
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\brick.c:65: else if(brick>=9&&brick<=11)nextTile=12;
	ldhl	sp,	#7
	bit	0, (hl)
	jr	NZ, 00131$
	bit	0, d
	jr	NZ, 00131$
	ld	e, #0x0c
	jr	00131$
00130$:
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\brick.c:67: else if(side==TOP){
	ld	a, c
	or	a, a
	jr	Z, 00131$
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\brick.c:68: if(brick>=1&&brick<=3)nextTile=13;
	bit	0, b
	jr	NZ, 00124$
	ldhl	sp,	#4
	bit	0, (hl)
	jr	NZ, 00124$
	ld	e, #0x0d
	jr	00131$
00124$:
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\brick.c:69: else if(brick>=5&&brick<=7)nextTile=14;
	ldhl	sp,	#5
	bit	0, (hl)
	jr	NZ, 00120$
	inc	hl
	bit	0, (hl)
	jr	NZ, 00120$
	ld	e, #0x0e
	jr	00131$
00120$:
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\brick.c:70: else if(brick>=9&&brick<=11)nextTile=15;
	ldhl	sp,	#7
	bit	0, (hl)
	jr	NZ, 00131$
	bit	0, d
	jr	NZ, 00131$
	ld	e, #0x0f
00131$:
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\brick.c:73: set_bkg_tile_xy(column,row,nextTile);
	ld	a, e
	push	af
	inc	sp
	ldhl	sp,	#2
	ld	a, (hl-)
	ld	d, a
	ld	a, (hl)
	ld	e, a
	push	de
	call	_set_bkg_tile_xy
	add	sp, #3
00142$:
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\brick.c:77: }
	add	sp, #10
	pop	hl
	inc	sp
	jp	(hl)
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\brick.c:80: void DrawLevelBricks(uint8_t *level){
;	---------------------------------
; Function DrawLevelBricks
; ---------------------------------
_DrawLevelBricks::
	add	sp, #-10
	ldhl	sp,	#6
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\brick.c:84: blocksLeft=0;
	xor	a, a
	ld	hl, #_blocksLeft
	ld	(hl+), a
	ld	(hl), a
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\brick.c:86: for(uint8_t i=0;i<AREA_HEIGHT;i++){
	ldhl	sp,	#8
	ld	(hl), #0x00
00110$:
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, #0x11
	jp	NC, 00112$
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\brick.c:87: for(uint8_t j=0;j<AREA_WIDTH;j++){
	inc	hl
	ld	(hl), #0x00
00107$:
	ldhl	sp,	#9
	ld	a, (hl)
	sub	a, #0x0e
	jp	NC, 00111$
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\brick.c:89: uint8_t brick = level[i*AREA_WIDTH+j];
	dec	hl
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	inc	sp
	inc	sp
	push	hl
	ldhl	sp,	#9
	ld	a, (hl)
	ldhl	sp,	#4
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	pop	hl
	push	hl
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#6
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
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
	ld	e, a
	ld	a, (hl-)
	dec	hl
	ld	d, a
	ld	a, (de)
	ld	(hl), a
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\brick.c:92: set_bkg_tile_xy(j+1,i+1,0);
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	c, (hl)
	inc	a
	ldhl	sp,	#4
	ld	(hl+), a
	ld	a, c
	inc	a
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\brick.c:91: if(brick==NO____BRICK){
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	inc	a
	jr	NZ, 00102$
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\brick.c:92: set_bkg_tile_xy(j+1,i+1,0);
	xor	a, a
	push	af
	inc	sp
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	d, a
	ld	e, (hl)
	push	de
	call	_set_bkg_tile_xy
	add	sp, #3
	jr	00108$
00102$:
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\brick.c:96: set_bkg_tile_xy(j+1,i+1,brick);
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl+)
	ld	e, a
	push	de
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\brick.c:99: blocksLeft+= (brick==LGHT__BRICK||brick==MED___BRICK||brick==DRK___BRICK)? 2:1;
	ldhl	sp,	#3
	ld	a, (hl)
	dec	a
	jr	Z, 00117$
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0x06
	jr	Z, 00117$
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0x0b
	jr	NZ, 00114$
00117$:
	ldhl	sp,	#4
	ld	a, #0x02
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
	jr	00115$
00114$:
	ldhl	sp,	#4
	ld	a, #0x01
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
00115$:
	ld	a, (#_blocksLeft)
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, (#_blocksLeft + 1)
	ldhl	sp,	#1
	ld	(hl), a
	ldhl	sp,	#4
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#5
	ld	a, (hl-)
	dec	hl
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	pop	hl
	push	hl
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, (hl)
	ld	(#_blocksLeft),a
	ldhl	sp,	#5
	ld	a, (hl)
	ld	(#_blocksLeft + 1),a
00108$:
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\brick.c:87: for(uint8_t j=0;j<AREA_WIDTH;j++){
	ldhl	sp,	#9
	inc	(hl)
	jp	00107$
00111$:
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\brick.c:86: for(uint8_t i=0;i<AREA_HEIGHT;i++){
	ldhl	sp,	#8
	inc	(hl)
	jp	00110$
00112$:
;E:\make_202008\GameBoy\GameBoy01\Production\source\default\brick.c:104: }
	add	sp, #10
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
