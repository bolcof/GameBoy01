;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (MINGW64)
;--------------------------------------------------------
	.module select
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _select_metasprites
	.globl _select_metasprite0
	.globl _select_tiles
	.globl _select_palettes
	.globl b___func_select
	.globl ___func_select
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
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\gen\graphics\select.c:7: BANKREF(select)
;	---------------------------------
; Function __func_select
; ---------------------------------
	b___func_select	= 0
___func_select::
	.local b___func_select 
	___bank_select = b___func_select 
	.globl ___bank_select 
	.area _CODE
_select_palettes:
	.dw #0x0000
	.dw #0x1884
	.dw #0x1ca8
	.dw #0x18ec
	.dw #0x1d51
	.dw #0x11db
	.dw #0x329b
	.dw #0x4f1d
	.dw #0x1bdf
	.dw #0x2b93
	.dw #0x1aed
	.dw #0x3646
	.dw #0x15a9
	.dw #0x112a
	.dw #0x1ce6
	.dw #0x38e7
	.dw #0x4186
	.dw #0x71ab
	.dw #0x7e6c
	.dw #0x732b
	.dw #0x7f79
	.dw #0x7fff
	.dw #0x5ab3
	.dw #0x41f0
	.dw #0x35ad
	.dw #0x294b
	.dw #0x450e
	.dw #0x18d5
	.dw #0x315b
	.dw #0x5dfa
	.dw #0x2651
	.dw #0x19b1
_select_tiles:
	.db #0xda	; 218
	.db #0x00	; 0
	.db #0x92	; 146
	.db #0x00	; 0
	.db #0xda	; 218
	.db #0x00	; 0
	.db #0x52	; 82	'R'
	.db #0x00	; 0
	.db #0xdb	; 219
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xc5	; 197
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x6d	; 109	'm'
	.db #0x00	; 0
	.db #0x48	; 72	'H'
	.db #0x00	; 0
	.db #0x68	; 104	'h'
	.db #0x00	; 0
	.db #0x48	; 72	'H'
	.db #0x00	; 0
	.db #0x6c	; 108	'l'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x41	; 65	'A'
	.db #0x85	; 133
	.db #0x0e	; 14
	.db #0x07	; 7
	.db #0xe4	; 228
	.db #0x00	; 0
	.db #0xb6	; 182
	.db #0x00	; 0
	.db #0x94	; 148
	.db #0x00	; 0
	.db #0xb6	; 182
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x82	; 130
	.db #0x73	; 115	's'
	.db #0x41	; 65	'A'
	.db #0x85	; 133
	.db #0x05	; 5
	.db #0x06	; 6
_select_metasprite0:
	.db #0xfe	; -2
	.db #0xf7	; -9
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
_select_metasprites:
	.dw _select_metasprite0
	.area _INITIALIZER
	.area _CABS (ABS)
