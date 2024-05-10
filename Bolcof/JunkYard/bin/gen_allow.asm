;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (MINGW64)
;--------------------------------------------------------
	.module allow
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _allow_metasprites
	.globl _allow_metasprite0
	.globl _allow_tiles
	.globl _allow_palettes
	.globl b___func_allow
	.globl ___func_allow
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
;E:\make_202008\GameBoy\WifiGameBoy\Bolcof\JunkYard\source\gen\graphics\allow.c:7: BANKREF(allow)
;	---------------------------------
; Function __func_allow
; ---------------------------------
	b___func_allow	= 0
___func_allow::
	.local b___func_allow 
	___bank_allow = b___func_allow 
	.globl ___bank_allow 
	.area _CODE
_allow_palettes:
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
_allow_tiles:
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_allow_metasprite0:
	.db #0xfc	; -4
	.db #0xfc	; -4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
_allow_metasprites:
	.dw _allow_metasprite0
	.area _INITIALIZER
	.area _CABS (ABS)
