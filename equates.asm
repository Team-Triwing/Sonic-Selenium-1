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
Layout:		rs.b $400	; level layout
ScrollBuffer:	rs.b $200
NemBuffer:	rs.b $100	; used for the Nemesis decompressor
NemBuffer_End:
byte_FFAB00:	rs.b $100
DisplayLists:	rs.b $400
Blocks:		rs.b $1800	; level blocks
SonicArtBuf:	rs.b $300
SonicPosTable:	rs.b $100
ScrollTable:	rs.b $400
ScrollTable_End:
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
ObjectsList_End:
LevelObjectsList:rs.b $1800
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
HintFlag:	rs.w 1		; used when the palette should be transferred to the next horizontal interrupt
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
CameraRAM_End:
unk_FFF740:	rs.b 1
unk_FFF741:	rs.b 1
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
SonicVRAMReset:	rs.b 1		; for when Sonic's art neers to be updated in VRAM
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
SprTableBuff:	rs.b $280
		rs.b $80					; unused??
SprTableBuff_End:
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
Saversong:		rs.b 1
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
oscValues_End:
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
; end of 'RAM'
			even