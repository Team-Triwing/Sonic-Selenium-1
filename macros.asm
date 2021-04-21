

align		macro pos
		dcb.b ((\pos)-(offset(*)%(\pos)))%(\pos),$FF
	endm
		
; ---------------------------------------------------------------------------
; self-explanatory
; ---------------------------------------------------------------------------

disable_ints:	macro
		move	#$2700,sr
		endm

enable_ints:	macro
		move	#$2300,sr
		endm
; ---------------------------------------------------------------------------

; enum object, width 64 bytes
id		equ 0
render		equ 1
tile		equ 2
map		equ 4
xpos		equ 8
xpix		equ $A
ypos		equ $C
ypix		equ $E
xvel		equ $10
yvel		equ $12
yrad		equ $16
xrad		equ $17
xdisp		equ $18
prio		equ $19
frame		equ $1A
anipos		equ $1B
ani		equ $1C
anilast		equ $1D
anidelay	equ $1E
col		equ $20
colprop		equ $21
status		equ $22
respawn		equ $23
act		equ $24
subact		equ $25
angle		equ $26
arg		equ $28
size		equ $40

; ---------------------------------------------------------------------------

; enum player, width 64 bytes
inertia		equ $14
air		equ $20
invulnerable	equ $30
invincible	equ $32
speedshoes	equ $34
sensorfront	equ $36
sensorback	equ $37
convex		equ $38
jumping		equ $3C
platform	equ $3D
lock		equ $3E

SetGfxMode macro mode
    move.w  #VDPREG_MODE4|(mode), (VdpCtrl)
    endm
	
VDPREG_MODE1:     equ $8000  ; Mode register #1
VDPREG_MODE2:     equ $8100  ; Mode register #2
VDPREG_MODE3:     equ $8B00  ; Mode register #3
VDPREG_MODE4:     equ $8C00  ; Mode register #4

VDPREG_PLANEA:    equ $8200  ; Plane A table address
VDPREG_PLANEB:    equ $8400  ; Plane B table address
VDPREG_SPRITE:    equ $8500  ; Sprite table address
VDPREG_WINDOW:    equ $8300  ; Window table address
VDPREG_HSCROLL:   equ $8D00  ; HScroll table address

VDPREG_SIZE:      equ $9000  ; Plane A and B size
VDPREG_WINX:      equ $9100  ; Window X split position
VDPREG_WINY:      equ $9200  ; Window Y split position
VDPREG_INCR:      equ $8F00  ; Autoincrement
VDPREG_BGCOL:     equ $8700  ; Background color
VDPREG_HRATE:     equ $8A00  ; HBlank interrupt rate

VDPREG_DMALEN_L:  equ $9300  ; DMA length (low)
VDPREG_DMALEN_H:  equ $9400  ; DMA length (high)
VDPREG_DMASRC_L:  equ $9500  ; DMA source (low)
VDPREG_DMASRC_M:  equ $9600  ; DMA source (mid)
VDPREG_DMASRC_H:  equ $9700  ; DMA source (high)

VdpCtrl:    equ $C00004  ; VDP control port
VdpData:    equ $C00000  ; VDP data port
HvCounter:  equ $C00008  ; H/V counter

GFXMODE_256x224:      equ %00000000
GFXMODE_320x224:      equ %10000001
GFXMODE_256x448:      equ %00000110
GFXMODE_320x448:      equ %10000111
GFXMODE_256x224_SH:   equ %00001000
GFXMODE_320x224_SH:   equ %10001001
GFXMODE_256x448_SH:   equ %00001110
GFXMODE_320x448_SH:   equ %10001111