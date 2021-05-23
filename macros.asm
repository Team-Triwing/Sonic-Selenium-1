

align		macro pos,num
	if narg=1
		dcb.b ((\pos)-(offset(*)%(\pos)))%(\pos),$FF
	else
		dcb.b ((\pos)-(offset(*)%(\pos)))%(\pos),num
	endif
	endm
	
; Macro for playing a command
command		macro id
	move.b #id,mQueue.w
    endm

; Macro for playing music
music		macro id
	move.b #id,mQueue+1.w
    endm

; Macro for playing sound effect
sfx		macro id
	move.b #id,mQueue+2.w
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
		
vsync:			macro
		enable_ints
@wait\@:	tst.b	(VintRoutine).w
		bne.s	@wait\@
		endm
; ---------------------------------------------------------------------------

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

; ---------------------------------------------------------------------------
; long conditional jumps
; ---------------------------------------------------------------------------

jhi:		macro loc
		bls.s	.nojump\@
		jmp	loc
	.nojump\@:
		endm

jcc:		macro loc
		bcs.s	.nojump\@
		jmp	loc
	.nojump\@:
		endm

jhs:		macro loc
		jcc	loc
		endm

jls:		macro loc
		bhi.s	.nojump\@
		jmp	loc
	.nojump\@:
		endm

jcs:		macro loc
		bcc.s	.nojump\@
		jmp	loc
	.nojump\@:
		endm

jlo:		macro loc
		jcs	loc
		endm

jeq:		macro loc
		bne.s	.nojump\@
		jmp	loc
	.nojump\@:
		endm

jne:		macro loc
		beq.s	.nojump\@
		jmp	loc
	.nojump\@:
		endm

jgt:		macro loc
		ble.s	.nojump\@
		jmp	loc
	.nojump\@:
		endm

jge:		macro loc
		blt.s	.nojump\@
		jmp	loc
	.nojump\@:
		endm

jle:		macro loc
		bgt.s	.nojump\@
		jmp	loc
	.nojump\@:
		endm

jlt:		macro loc
		bge.s	.nojump\@
		jmp	loc
	.nojump\@:
		endm

jpl:		macro loc
		bmi.s	.nojump\@
		jmp	loc
	.nojump\@:
		endm

jmi:		macro loc
		bpl.s	.nojump\@
		jmp	loc
	.nojump\@:
		endm

; -------------------------------------------------------------------------
; Clear a section of memory
; -------------------------------------------------------------------------
; PARAMETERS:
;	saddr	- Address to start clearing memory at
;	eaddr	- Address to finish clearing memory at
;		  (not required if [saddr]_end exists)
; -------------------------------------------------------------------------
	
clrRAM macro &
	saddr, eaddr
	
	local	endaddr
	if narg<2
endaddr		EQUS	"\saddr\_end"		; Use [saddr]_end
	else
endaddr		EQUS	"\eaddr"		; Use eaddr
	endif
clrsize		=	(\endaddr-\saddr)&$FFFFFF

	moveq	#0,d0

	if (((\saddr)&$8000)&((\saddr)<0))=0	; Optimize setting saddr to a1
		lea	\saddr,a1
	else
		lea	(\saddr).w,a1
	endif

	move.w	#clrsize>>2-1,d1

.Clear\@:
	move.l	d0,(a1)+			; Clear data
	dbf	d1,.Clear\@			; Loop until data is cleared

	if clrsize&2
		move.w	d0,(a1)+		; Clear remaining word of data
	elseif clrsize&1
		move.b	d0,(a1)+		; Clear remaining byte of data
	endif

	endm
	
; -------------------------------------------------------------------------
; Wait for DMA to finish
; -------------------------------------------------------------------------
; PARAMETERS:
;	ctrl	- VDP control port as an address register
;		  (If left blank, this just uses VDP_CTRL instead)
; -------------------------------------------------------------------------

waitDMA macro &
	ctrl

.Wait\@:
	if narg>0
		move.w	(\ctrl),-(sp)	; Get VDP status
	else
		move.w	VDP_CTRL,-(sp)	; Get VDP status
	endif
	andi.w	#2,(sp)+		; Is DMA active?
	bne.s	.Wait\@			; If so, wait

	endm

; -------------------------------------------------------------------------
; VDP command instruction
; -------------------------------------------------------------------------
; PARAMETERS:
;	addr	- Address in VDP memory
;	type	- Type of VDP memory
;	rwd	- VDP command
; -------------------------------------------------------------------------

VVRAM		EQU	%100001			; VRAM
VCRAM		EQU	%101011			; CRAM
VVSRAM		EQU	%100101			; VSRAM
VREAD		EQU	%001100			; VDP read
VWRITE		EQU	%000111			; VDP write
VDMA		EQU	%100111			; VDP DMA

; -------------------------------------------------------------------------

vdpCmd macro &
	ins, addr, type, rwd, end, end2
	
	if narg=5
		\ins	#((((V\type&V\rwd)&3)<<30)|((\addr&$3FFF)<<16)|(((V\type&V\rwd)&$FC)<<2)|((\addr&$C000)>>14)), \end
	elseif narg>=6
		\ins	#((((V\type&V\rwd)&3)<<30)|((\addr&$3FFF)<<16)|(((V\type&V\rwd)&$FC)<<2)|((\addr&$C000)>>14))\end, \end2
	else
		\ins	((((V\type&V\rwd)&3)<<30)|((\addr&$3FFF)<<16)|(((V\type&V\rwd)&$FC)<<2)|((\addr&$C000)>>14))
	endif

	endm


; -------------------------------------------------------------------------
; VDP DMA from 68000 memory to VDP memory
; -------------------------------------------------------------------------
; PARAMETERS:
;	src	- Source address in 68000 memory
;	dest	- Destination address in VDP memory
;	len	- Length of data in bytes
;	type	- Type of VDP memory
;	ctrl	- VDP control port as an address register
;		  (If left blank, this just uses VDP_CTRL instead)
; -------------------------------------------------------------------------

dma68k macro &
	src, dest, len, type, ctrl

	if narg>4
		move.l	#$94009300|((((\len)/2)&$FF00)<<8)|(((\len)/2)&$FF),(\ctrl)
		move.l	#$96009500|((((\src)/2)&$FF00)<<8)|(((\src)/2)&$FF),(\ctrl)
		move.w	#$9700|(((\src)>>17)&$7F),(\ctrl)
		vdpCmd	move.w,\dest,\type,DMA,>>16,(\ctrl)
		vdpCmd	move.w,\dest,\type,DMA,&$FFFF,-(sp)
		move.w	(sp)+,(\ctrl)
	else
		move.l	#$94009300|((((\len)/2)&$FF00)<<8)|(((\len)/2)&$FF),VDP_CTRL
		move.l	#$96009500|((((\src)/2)&$FF00)<<8)|(((\src)/2)&$FF),VDP_CTRL
		move.w	#$9700|(((\src)>>17)&$7F),VDP_CTRL
		vdpCmd	move.w,\dest,\type,DMA,>>16,VDP_CTRL
		vdpCmd	move.w,\dest,\type,DMA,&$FFFF,-(sp)
		move.w	(sp)+,VDP_CTRL
	endif

	endm

; -------------------------------------------------------------------------
; Fill VRAM with byte
; Auto-increment should be set to 1 beforehand
; -------------------------------------------------------------------------
; PARAMETERS:
;	byte	- Byte to fill VRAM with
;	addr	- Address in VRAM
;	len	- Length of fill in bytes
;	ctrl	- VDP control port as an address register
;		  (If left blank, this just uses VDP_CTRL instead)
; -------------------------------------------------------------------------

dmaFill macro &
	byte, addr, len, ctrl

	if narg>3
		move.l	#$94009300|((((\len)-1)&$FF00)<<8)|(((\len)-1)&$FF),(\ctrl)
		move.w	#$9780,(\ctrl)
		move.l	#$40000080|(((\addr)&$3FFF)<<16)|(((\addr)&$C000)>>14),(\ctrl)
		move.w	#(\byte)<<8,-4(\ctrl)
		waitDMA	\ctrl
	else
		move.l	#$94009300|((((\len)-1)&$FF00)<<8)|(((\len)-1)&$FF),VDP_CTRL
		move.w	#$9780,VDP_CTRL
		move.l	#$40000080|(((\addr)&$3FFF)<<16)|(((\addr)&$C000)>>14),VDP_CTRL
		move.w	#(\byte)<<8,VDP_DATA
		waitDMA
	endif

	endm

; -------------------------------------------------------------------------
; Copy a region of VRAM to a location in VRAM
; Auto-increment should be set to 1 beforehand
; -------------------------------------------------------------------------
; PARAMETERS:
;	src	- Source address in VRAM
;	dest	- Destination address in VRAM
;	len	- Length of copy in bytes
;	ctrl	- VDP control port as an address register
;		  (If left blank, this just uses the address instead)
; -------------------------------------------------------------------------

dmaCopy macro &
	src, dest, len, ctrl
	
	if narg>3
		move.l	#$94009300|((((\len)-1)&$FF00)<<8)|(((\len)-1)&$FF),(\ctrl)
		move.l	#$96009500|(((\src)&$FF00)<<8)|((\src)&$FF),(\ctrl)
		move.w	#$97C0,(\ctrl)
		move.l	#$000000C0|(((\dest)&$3FFF)<<16)|(((\dest)&$C000)>>14),(\ctrl)
		waitDMA	\ctrl
	else
		move.l	#$94009300|((((\len)-1)&$FF00)<<8)|(((\len)-1)&$FF),VDP_CTRL
		move.l	#$96009500|(((\src)&$FF00)<<8)|((\src)&$FF),VDP_CTRL
		move.w	#$97C0,VDP_CTRL
		move.l	#$000000C0|(((\dest)&$3FFF)<<16)|(((\dest)&$C000)>>14),VDP_CTRL
		waitDMA
	endif

	endm

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

VRAM_ADDR_CMD:  equ $40000000
CRAM_ADDR_CMD:  equ $C0000000
VSRAM_ADDR_CMD: equ $40000010

VRAM_DMA_CMD:   equ $40000080
CRAM_DMA_CMD:   equ $C0000080
VSRAM_DMA_CMD:  equ $40000090