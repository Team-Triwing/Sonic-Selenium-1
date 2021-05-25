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

VRAM_ADDR_CMD:  equ $40000000
CRAM_ADDR_CMD:  equ $C0000000
VSRAM_ADDR_CMD: equ $40000010

VRAM_DMA_CMD:   equ $40000080
CRAM_DMA_CMD:   equ $C0000080
VSRAM_DMA_CMD:  equ $40000090

; VRAM data
vram_fg:	equ $C000	; foreground namespace
vram_bg:	equ $E000	; background namespace
vram_sonic:	equ $F000	; Sonic graphics
vram_sprites:	equ $F800	; sprite table
vram_hscroll:	equ $FC00	; horizontal scroll table

; Colors
cBlack:		equ $000		; black
cWhite:		equ $EEE		; white
cBlue:		equ $E00		; blue
cGreen:		equ $0E0		; green
cRed:		equ $00E		; red
cYellow:	equ cGreen+cRed		; yellow
cAqua:		equ cGreen+cBlue	; aqua
cMagenta:	equ cBlue+cRed		; magenta

; -------------------------------------------------------------------------
; I/O
; -------------------------------------------------------------------------

HW_VERSION	EQU	$A10001			; Hardware version
IO_A_DATA	EQU	$A10003			; I/O port A data port
IO_B_DATA	EQU	$A10005			; I/O port B data port
IO_C_DATA	EQU	$A10007			; I/O port C data port
IO_A_CTRL	EQU	$A10009			; I/O port A control port
IO_B_CTRL	EQU	$A1000B			; I/O port B control port
IO_C_CTRL	EQU	$A1000D			; I/O port C control port
CART_MODE	EQU	$A11000			; Cart mode (D-RAM/ROM)
SRAM_ENABLE	EQU	$A130F1			; SRAM enable port
TMSS_SEGA	EQU	$A14000			; TMSS "SEGA" register
TMSS_MODE	EQU	$A14100			; TMSS bus mode

; -------------------------------------------------------------------------
; VDP
; -------------------------------------------------------------------------

VDP_DATA	EQU	VdpData		; VDP data port
VDP_CTRL	EQU	VdpCtrl			; VDP control port
VDP_HV		EQU	HvCounter		; VDP H/V counter
VDP_DEBUG	EQU	$C0001C			; VDP debug

; -------------------------------------------------------------------------
; RAM
; -------------------------------------------------------------------------

RAM_START	EQU	$FF0000			; RAM start
RAM_END		EQU	$1000000		; RAM end

; -------------------------------------------------------------------------
; Controller I/O
; -------------------------------------------------------------------------

	rsreset
JbU		rs.b	1			; Bit up
JbD		rs.b	1			; Bit down
JbL		rs.b	1			; Bit left
JbR		rs.b	1			; Bit right
JbB		rs.b	1			; Bit B
JbC		rs.b	1			; Bit C
JbA		rs.b	1			; Bit A
JbS		rs.b	1			; Bit start
JbZ		rs.b	1			; Bit Z
JbY		rs.b	1			; Bit Y
JbX		rs.b	1			; Bit X
JbM		rs.b	1			; Bit mode

J_U		EQU	(1<<JbU)		; Up
J_D		EQU	(1<<JbD)		; Down
J_L		EQU	(1<<JbL)		; Left
J_R		EQU	(1<<JbR)		; Right
J_B		EQU	(1<<JbB)		; B
J_C		EQU	(1<<JbC)		; C
J_A		EQU	(1<<JbA)		; A
J_S		EQU	(1<<JbS)		; Start
J_Z		EQU	(1<<JbZ)		; Z
J_Y		EQU	(1<<JbY)		; Y
J_X		EQU	(1<<JbX)		; X
J_M		EQU	(1<<JbM)		; Mode

IObTH		EQU	6			; TH pin bit
IObTR		EQU	5			; TR pin bit
IObTL		EQU	4			; TL pin bit
IO_TH		EQU	1<<IObTH		; TH pin
IO_TR		EQU	1<<IObTR		; TR pin
IO_TL		EQU	1<<IObTL		; TL pin

; enum object, width 64 bytes
	rsreset
id			rs.b 1
render		rs.b 1
tile		rs.w 1
map			rs.l 1
xpos		rs.w 1
xpix		rs.w 1
ypos		rs.w 1
ypix		rs.w 1
xvel		rs.w 1
yvel		rs.w 1
inertia		rs.w 1		; sonic specific (!)
yrad		rs.b 1
xrad		rs.b 1
prio		rs.w 1
frame		rs.b 1
anipos		rs.b 1
ani			rs.b 1
anilast		rs.b 1
anidelay	rs.b 1
			rs.b 1
col			rs.b 1
air			equ col		; sonic specific (!)
colprop		rs.b 1
status		rs.b 1
respawn		rs.b 1
act			rs.b 1
subact		rs.b 1
angle		rs.w 1
arg			rs.b 1
			rs.b 1
			rs.b 6
invulnerable	rs.w 1	; sonic specific (!)
invincible	rs.w 1		; sonic specific (!)
speedshoes	rs.w 1		; sonic specific (!)
sensorfront	rs.b 1		; sonic specific (!)
sensorback	rs.b 1		; sonic specific (!)
convex		rs.b 1		; sonic specific (!)
spindashflag	rs.b 1	; sonic specific (!)
spindashtimer	rs.w 1	; sonic specific (!)
jumping		rs.b 1		; sonic specific (!)
platform	rs.b 1		; sonic specific (!)
lock		rs.b 1		; sonic specific (!)
			rs.b 1
size		rs.b 1

; ---------------------------------------------------------------------------

; sonic 2 naming convention
x_pos	equ	xpos
y_pos	equ	ypos
x_sub	equ	xpix
y_sub	equ	ypix
x_vel	equ	xvel
y_vel	equ	yvel
x_radius	equ	xrad
y_radius	equ	yrad
routine	equ	act
routine_secondary	equ	subact
priority	equ	prio
move_lock	equ	lock
stick_to_convex	equ	convex
subtype	equ	arg
anim_frame_duration	equ	anilast
collision_flags	equ	col
collision_property	equ	colprop
anim_frame	equ	anipos
anim	equ	ani
art_tile	equ	tile
render_flags	equ	render
mappings	equ	map
mapping_frame	equ	frame
invulnerable_time	equ	invulnerable
invincibility_time	equ	invincible
speedshoes_time	equ	speedshoes
next_tilt	equ	sensorfront
tilt	equ	sensorback
spindash_flag	equ	spindashflag
spindash_counter	equ	spindashtimer
interact	equ	platform

; ===========================================================================
; Segment type: Regular
; segment "RAM"
    rsset $FFFF0000
	opt ae+
Chunks:		rs.b $80	; level chunks
byte_FF0080:	rs.b $880
byte_FF0900:	rs.b $720
byte_FF1020:	rs.b $70E
byte_FF172E:	rs.b $1C52
byte_FF3380:	rs.b $C80
byte_FF4000:	rs.b 8
byte_FF4008:	rs.l 1
byte_FF400C:	rs.b $22
byte_FF402E:	rs.b $3D2
byte_FF4400:	rs.b $3C00
byte_FF8000:	rs.b $2400
Chunks_End:	rs.b 0
Layout:		rs.b $400	; level layout
Layout_End:	rs.b 0
ScrollBuffer:	rs.b $200
NemBuffer:	rs.b $100	; used for the Nemesis decompressor
byte_FFAB00:	rs.b $100
NemBuffer_End:	rs.b 0
DisplayLists:	rs.b $400
Blocks:		rs.b $1800	; level blocks
Blocks_End:	rs.b 0
SonicArtBuf:	rs.b $300
SonicPosTable:	rs.b $100
ScrollTable:	rs.b $400
ScrollTable_End:rs.b 0
ObjectsList:	rs.b $40	; object RAM
byte_FFD040:	rs.b $40
byte_FFD080:	rs.b $40
byte_FFD0C0:	rs.b $40
byte_FFD100:	rs.b $40
byte_FFD140:	rs.b $40
byte_FFD180:	rs.b $40
byte_FFD1C0:	rs.b $40
byte_FFD200:	rs.b $40
byte_FFD240:	rs.b $40
byte_FFD280:	rs.b $40
byte_FFD2C0:	rs.b $40
		rs.b $40
		rs.b $40
		rs.b $40
		rs.b $40
byte_FFD400:	rs.b $40
		rs.b $40
		rs.b $40
		rs.b $40
byte_FFD500:	rs.b $40
		rs.b $40
		rs.b $40
		rs.b $40
byte_FFD600:	rs.b $40
		rs.b $40
		rs.b $40
		rs.b $40
		rs.b $40
		rs.b $40
		rs.b $40
		rs.b $40
LevelObjectsList:rs.b $1800
ObjectsList_End:	rs.b 0
SoundMemory:	rs.b $600	; used for the sound driver
GameMode:	rs.b 1		; used for the screen modes
		rs.b 1
padHeldPlayer:	rs.b 1
padPressPlayer:	rs.b 1
padHeld1:	rs.b 1
padPress1:	rs.b 1
padPress2:	rs.b 1
padHeld2:	rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
ModeReg2:	rs.w 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
GlobalTimer:	rs.w 1
dword_FFF616:	rs.l 1
dword_FFF61A:	rs.l 1
word_FFF61E:	rs.w 1
word_FFF620:	rs.w 1
word_FFF622:	rs.w 1
word_FFF624:	rs.w 1
word_FFF626:	rs.w 1
VintECounter:	rs.b 1		; only used if the Vint is $0E (not used)
byte_FFF629:	rs.b 1
VintRoutine:	rs.b 1
		rs.b 1
byte_FFF62C:	rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
PalCycOffset:	rs.w 1
PalCycWait:	rs.w 1
RandomSeed:	rs.l 1
PauseFlag:	rs.w 1		; self explanatory
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
word_FFF644:	rs.w 1
		rs.b 1
		rs.b 1
HintFlag:	rs.b 1		; used when the palette should be transferred to the next horizontal interrupt
		rs.b 1
		rs.b 1
word_FFF64C:	rs.w 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
word_FFF660:	rs.w 1		; unused, but cleared at the SEGA screen
word_FFF662:	rs.w 1
		rs.b 1
		rs.b 1
word_FFF666:	rs.w 1
LevSelOption:	rs.w 1
LevSelSound:	rs.w 1
SavedSong:		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
plcList:	rs.b $60
unk_FFF6E0:	rs.l 1
unk_FFF6E4:	rs.l 1
unk_FFF6E8:	rs.l 1
unk_FFF6EC:	rs.l 1
unk_FFF6F0:	rs.l 1
unk_FFF6F4:	rs.l 1
unk_FFF6F8:	rs.w 1
unk_FFF6FA:	rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
plcList_End:
CameraRAM:
CameraX:	rs.l 1
CameraY:	rs.l 1
unk_FFF708:	rs.l 1
unk_FFF70C:	rs.l 1
unk_FFF710:	rs.l 1
unk_FFF714:	rs.l 1
unk_FFF718:	rs.l 1
unk_FFF71C:	rs.l 1
unk_FFF720:	rs.l 1
unk_FFF724:	rs.w 1
unk_FFF726:	rs.w 1
unk_FFF728:	rs.w 1
unk_FFF72A:	rs.w 1
unk_FFF72C:	rs.w 1
unk_FFF72E:	rs.w 1
unk_FFF730:	rs.w 1
unk_FFF732:	rs.w 1
CameraXCoarse:	rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
unk_FFF73A:	rs.w 1
unk_FFF73C:	rs.w 1
unk_FFF73E:	rs.w 1
unk_FFF740:	rs.b 1
unk_FFF741:	rs.b 1
CameraRAM_End:	rs.b 0
EventsRoutine:	rs.b 1
		rs.b 1
unk_FFF744:	rs.b 1
		rs.b 1
unk_FFF746:	rs.b 1
		rs.b 1
unk_FFF748:	rs.b 1
		rs.b 1
unk_FFF74A:	rs.b 1
unk_FFF74B:	rs.b 1
unk_FFF74C:	rs.b 1
unk_FFF74D:	rs.b 1
unk_FFF74E:	rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
unk_FFF754:	rs.w 1
unk_FFF756:	rs.w 1
unk_FFF758:	rs.w 1
		rs.b 1
		rs.b 1
unk_FFF75C:	rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
PlayerTopSpeed:	rs.w 1		; these and the next 2 are self-explanatory
PlayerAccel:	rs.w 1
PlayerDecel:	rs.w 1
SonicLastDPLCID:rs.b 1		; previous DPLC frame for Sonic
		rs.b 1
unk_FFF768:	rs.w 1
unk_FFF76A:	rs.w 1
unk_FFF76C:	rs.w 1
unk_FFF76E:	rs.w 1
unk_FFF770:	rs.l 1
unk_FFF774:	rs.l 1
unk_FFF778:	rs.l 1
unk_FFF77C:	rs.l 1
SpecAngle:	rs.w 1
SpecSpeed:	rs.w 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
unk_FFF790:	rs.w 1
unk_FFF792:	rs.b 1
		rs.b 1
unk_FFF794:	rs.w 1
Collision:	rs.l 1
unk_FFF79A:	rs.w 1
unk_FFF79C:	rs.w 1
unk_FFF79E:	rs.w 1
unk_FFF7A0:	rs.w 1
		rs.b 1
		rs.b 1
unk_FFF7A4:	rs.w 1
		rs.b 1
unk_FFF7A7:	rs.b 1
unk_FFF7A8:	rs.b 1
unk_FFF7A9:	rs.b 1
unk_FFF7AA:	rs.b 1
		rs.b 1
unk_FFF7AC:	rs.b 1
unk_FFF7AD:	rs.b 1
unk_FFF7AE:	rs.b 1
unk_FFF7AF:	rs.b 1
unk_FFF7B0:	rs.b 1
unk_FFF7B1:	rs.b 1
unk_FFF7B2:	rs.b 1
unk_FFF7B3:	rs.b 1
unk_FFF7B4:	rs.b 1
unk_FFF7B5:	rs.b 1
unk_FFF7B6:	rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
unk_FFF7E0:	rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
unk_FFF7EF:	rs.b 1
unk_FFF7F0:	rs.l 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
		rs.b 1
SprTableBuff:	rs.b $300
SprTableBuff_End:	rs.b 0
Palette:	rs.b $80
PaletteTarget:	rs.b $80
byte_FFFC00:	rs.b $100
		rs.b $100					; stack data!
StackPointer:	rs.w 1
LevelRestart:	rs.w 1
LevelFrames:	rs.w 1
byte_FFFE06:	rs.b 1
		rs.b 1
DebugRoutine:	rs.w 1
DebugTimer:	rs.b 1
DebugSpeed:	rs.b 1
VintCounter:	rs.b 1
		rs.b 1
		rs.b 1
byte_FFFE0F:	rs.b 1
curzone:	rs.b 1
curact:		rs.b 1
Lives:		rs.b 1
byte_FFFE1B:	rs.b 1
byte_FFFE1C:	rs.b 1
ExtraLifeFlags:	rs.b 1
byte_FFFE1E:	rs.b 1
byte_FFFE1F:	rs.b 1
Rings:		rs.w 1
dword_FFFE22:	rs.l 1
dword_FFFE26:	rs.l 1
byte_FFFE2C:	rs.b 1
byte_FFFE2D:	rs.b 1
byte_FFFE2E:	rs.b 1
byte_FFFE2F:	rs.b 1
EmeraldArray:		rs.l 2
unk_FFFE50:	rs.l 1
word_FFFE54:	rs.w 1
word_FFFE56:	rs.w 1
byte_FFFE58:	rs.w 1
oscValues:	rs.b $42
oscValues_End:	rs.b 0
GHZSpikeTimer:	rs.b 1
GHZSpikeFrame:	rs.b 1
RingTimer:	rs.b 1
RingFrame:	rs.b 1
UnkTimer:	rs.b 1		; not sure what this would've been for,
UnkFrame:	rs.b 1		; this is also in the final game and Sonic 2 where it's also unused
RingLossTimer:	rs.b 1
RingLossFrame:	rs.b 1
RingLossAccumulator:rs.w 1
EmeraldAmount:		rs.b 1
Chunk0Colls:	rs.b 1
word_FFFFE0:	rs.w 1
word_FFFFE8:	rs.w 1
DemoMode:	rs.w 1
DemoNum:	rs.w 1
ConsoleRegion:	rs.b 1
EditModeFlag:	rs.w 1
ChecksumStr:	rs.l 1
TwizHuffRet:	rs.b $48
; end of 'RAM'
			even