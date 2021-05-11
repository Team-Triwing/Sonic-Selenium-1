; ===========================================================================
; Segment type: Regular
; segment "RAM"
RAM		section bss, org($FFFF0000), size($10000)
	opt ae+
Chunks:		ds.b $80	; level chunks
byte_FF0080:	ds.b $880
byte_FF0900:	ds.b $720
byte_FF1020:	ds.b $70E
byte_FF172E:	ds.b $1C52
byte_FF3380:	ds.b $C80
byte_FF4000:	ds.b 8
byte_FF4008:	ds.l 1
byte_FF400C:	ds.b $22
byte_FF402E:	ds.b $3D2
byte_FF4400:	ds.b $3C00
byte_FF8000:	ds.b $2400
Layout:		ds.b $400	; level layout
ScrollBuffer:	ds.b $200
NemBuffer:	ds.b $100	; used for the Nemesis decompressor
byte_FFAB00:	ds.b $100
DisplayLists:	ds.b $400
Blocks:		ds.b $1800	; level blocks
SonicArtBuf:	ds.b $300
SonicPosTable:	ds.b $100
ScrollTable:	ds.b $400
ObjectsList:	ds.b $40	; object RAM
byte_FFD040:	ds.b $40
byte_FFD080:	ds.b $40
byte_FFD0C0:	ds.b $40
byte_FFD100:	ds.b $40
byte_FFD140:	ds.b $40
byte_FFD180:	ds.b $40
byte_FFD1C0:	ds.b $40
byte_FFD200:	ds.b $40
byte_FFD240:	ds.b $40
byte_FFD280:	ds.b $40
byte_FFD2C0:	ds.b $40
		ds.b $40
		ds.b $40
		ds.b $40
		ds.b $40
byte_FFD400:	ds.b $40
		ds.b $40
		ds.b $40
		ds.b $40
byte_FFD500:	ds.b $40
		ds.b $40
		ds.b $40
		ds.b $40
byte_FFD600:	ds.b $40
		ds.b $40
		ds.b $40
		ds.b $40
		ds.b $40
		ds.b $40
		ds.b $40
		ds.b $40
LevelObjectsList:ds.b $1800
SoundMemory:	ds.b $600	; used for the sound driver
GameMode:	ds.b 1		; used for the screen modes
		ds.b 1
padHeldPlayer:	ds.b 1
padPressPlayer:	ds.b 1
padHeld1:	ds.b 1
padPress1:	ds.b 1
padPress2:	ds.b 1
padHeld2:	ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
ModeReg2:	ds.w 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
GlobalTimer:	ds.w 1
dword_FFF616:	ds.l 1
dword_FFF61A:	ds.l 1
word_FFF61E:	ds.w 1
word_FFF620:	ds.w 1
word_FFF622:	ds.w 1
word_FFF624:	ds.w 1
word_FFF626:	ds.w 1
VintECounter:	ds.b 1		; only used if the Vint is $0E (not used)
byte_FFF629:	ds.b 1
VintRoutine:	ds.b 1
		ds.b 1
byte_FFF62C:	ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
PalCycOffset:	ds.w 1
PalCycWait:	ds.w 1
RandomSeed:	ds.l 1
PauseFlag:	ds.w 1		; self explanatory
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
word_FFF644:	ds.w 1
		ds.b 1
		ds.b 1
HintFlag:	ds.w 1		; used when the palette should be transferred to the next horizontal interrupt
		ds.b 1
		ds.b 1
word_FFF64C:	ds.w 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
word_FFF660:	ds.w 1		; unused, but cleared at the SEGA screen
word_FFF662:	ds.w 1
		ds.b 1
		ds.b 1
word_FFF666:	ds.w 1
LevSelOption:	ds.w 1
LevSelSound:	ds.w 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
plcList:	ds.b $60
unk_FFF6E0:	ds.l 1
unk_FFF6E4:	ds.l 1
unk_FFF6E8:	ds.l 1
unk_FFF6EC:	ds.l 1
unk_FFF6F0:	ds.l 1
unk_FFF6F4:	ds.l 1
unk_FFF6F8:	ds.w 1
unk_FFF6FA:	ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
CameraX:	ds.l 1
CameraY:	ds.l 1
unk_FFF708:	ds.l 1
unk_FFF70C:	ds.l 1
unk_FFF710:	ds.l 1
unk_FFF714:	ds.l 1
unk_FFF718:	ds.l 1
unk_FFF71C:	ds.l 1
unk_FFF720:	ds.l 1
unk_FFF724:	ds.w 1
unk_FFF726:	ds.w 1
unk_FFF728:	ds.w 1
unk_FFF72A:	ds.w 1
unk_FFF72C:	ds.w 1
unk_FFF72E:	ds.w 1
unk_FFF730:	ds.w 1
unk_FFF732:	ds.w 1
CameraXCoarse:	ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
unk_FFF73A:	ds.w 1
unk_FFF73C:	ds.w 1
unk_FFF73E:	ds.w 1
unk_FFF740:	ds.b 1
unk_FFF741:	ds.b 1
EventsRoutine:	ds.b 1
		ds.b 1
unk_FFF744:	ds.b 1
		ds.b 1
unk_FFF746:	ds.b 1
		ds.b 1
unk_FFF748:	ds.b 1
		ds.b 1
unk_FFF74A:	ds.b 1
unk_FFF74B:	ds.b 1
unk_FFF74C:	ds.b 1
unk_FFF74D:	ds.b 1
unk_FFF74E:	ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
unk_FFF754:	ds.w 1
unk_FFF756:	ds.w 1
unk_FFF758:	ds.w 1
		ds.b 1
		ds.b 1
unk_FFF75C:	ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
PlayerTopSpeed:	ds.w 1		; these and the next 2 are self-explanatory
PlayerAccel:	ds.w 1
PlayerDecel:	ds.w 1
SonicLastDPLCID:ds.b 1		; previous DPLC frame for Sonic
SonicVRAMReset:	ds.b 1		; for when Sonic's art needs to be updated in VRAM
unk_FFF768:	ds.w 1
unk_FFF76A:	ds.w 1
unk_FFF76C:	ds.w 1
unk_FFF76E:	ds.w 1
unk_FFF770:	ds.l 1
unk_FFF774:	ds.l 1
unk_FFF778:	ds.l 1
unk_FFF77C:	ds.l 1
SpecAngle:	ds.w 1
SpecSpeed:	ds.w 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
unk_FFF790:	ds.w 1
unk_FFF792:	ds.b 1
		ds.b 1
unk_FFF794:	ds.w 1
Collision:	ds.l 1
unk_FFF79A:	ds.w 1
unk_FFF79C:	ds.w 1
unk_FFF79E:	ds.w 1
unk_FFF7A0:	ds.w 1
		ds.b 1
		ds.b 1
unk_FFF7A4:	ds.w 1
		ds.b 1
unk_FFF7A7:	ds.b 1
unk_FFF7A8:	ds.b 1
unk_FFF7A9:	ds.b 1
unk_FFF7AA:	ds.b 1
		ds.b 1
unk_FFF7AC:	ds.b 1
unk_FFF7AD:	ds.b 1
unk_FFF7AE:	ds.b 1
unk_FFF7AF:	ds.b 1
unk_FFF7B0:	ds.b 1
unk_FFF7B1:	ds.b 1
unk_FFF7B2:	ds.b 1
unk_FFF7B3:	ds.b 1
unk_FFF7B4:	ds.b 1
unk_FFF7B5:	ds.b 1
unk_FFF7B6:	ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
unk_FFF7E0:	ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
unk_FFF7EF:	ds.b 1
unk_FFF7F0:	ds.l 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
		ds.b 1
SprTableBuff:	ds.b $280
		ds.b $80					; unused??
Palette:	ds.b $80
PaletteTarget:	ds.b $80
byte_FFFC00:	ds.b $100
		ds.b $100					; stack data!
StackPointer:	ds.w 1
LevelRestart:	ds.w 1
LevelFrames:	ds.w 1
byte_FFFE06:	ds.b 1
		ds.b 1
DebugRoutine:	ds.w 1
DebugTimer:	ds.b 1
DebugSpeed:	ds.b 1
VintCounter:	ds.b 1
SavedSong:		ds.b 1
		ds.b 1
byte_FFFE0F:	ds.b 1
curzone:	ds.b 1
curact:		ds.b 1
Lives:		ds.b 1
byte_FFFE1B:	ds.b 1
byte_FFFE1C:	ds.b 1
ExtraLifeFlags:	ds.b 1
byte_FFFE1E:	ds.b 1
byte_FFFE1F:	ds.b 1
Rings:		ds.w 1
dword_FFFE22:	ds.l 1
dword_FFFE26:	ds.l 1
byte_FFFE2C:	ds.b 1
byte_FFFE2D:	ds.b 1
byte_FFFE2E:	ds.b 1
byte_FFFE2F:	ds.b 1
EmeraldArray:		ds.l 2
unk_FFFE50:	ds.l 1
word_FFFE54:	ds.w 1
word_FFFE56:	ds.w 1
byte_FFFE58:	ds.w 1
oscValues:	ds.b $42
GHZSpikeTimer:	ds.b 1
GHZSpikeFrame:	ds.b 1
RingTimer:	ds.b 1
RingFrame:	ds.b 1
UnkTimer:	ds.b 1		; not sure what this would've been for,
UnkFrame:	ds.b 1		; this is also in the final game and Sonic 2 where it's also unused
RingLossTimer:	ds.b 1
RingLossFrame:	ds.b 1
RingLossAccumulator:ds.w 1
EmeraldAmount:		ds.b 1
Chunk0Colls:	ds.b 1
word_FFFFE0:	ds.w 1
word_FFFFE8:	ds.w 1
DemoMode:	ds.w 1
DemoNum:	ds.w 1
ConsoleRegion:	ds.b 1
EditModeFlag:	ds.w 1
ChecksumStr:	ds.l 1
; end of 'RAM'
			even