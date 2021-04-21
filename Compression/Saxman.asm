SaxmanDec:
                move.w  (a0)+,d6
                rol.w   #8,d6
SaxDec2:
                moveq   #0,d2
                lea     (a1),a4
                moveq   #0,d0
                lea     byte_1AD4(pc),a2
                move.w  #$F000,d3
                moveq   #$F,d7

loc_1A38:                               ; CODE XREF: ROM:00001A56↓j
                                        ; ROM:00001A7C↓j ...
                dbf     d2,loc_1A4A
                moveq   #7,d2
                subq.w  #1,d6
                bne.s   loc_1A44
                rts
; ---------------------------------------------------------------------------

loc_1A44:                               ; CODE XREF: ROM:00001A40↑j
                move.b  (a0)+,d0
                move.b  (a2,d0.w),d0

loc_1A4A:                               ; CODE XREF: ROM:loc_1A38↑j
                add.b   d0,d0
                bcc.s   loc_1AA4
                subq.w  #1,d6
                bne.s   loc_1A54
                rts
; ---------------------------------------------------------------------------

loc_1A54:                               ; CODE XREF: ROM:00001A50↑j
                move.b  (a0)+,(a1)+
                bra.s   loc_1A38
; ---------------------------------------------------------------------------

loc_1A58:
                move.b  (a5)+,(a1)+
                move.b  (a5)+,(a1)+
                move.b  (a5)+,(a1)+
                move.b  (a5)+,(a1)+
                move.b  (a5)+,(a1)+
                move.b  (a5)+,(a1)+
                move.b  (a5)+,(a1)+
                move.b  (a5)+,(a1)+
                move.b  (a5)+,(a1)+
                move.b  (a5)+,(a1)+
                move.b  (a5)+,(a1)+
                move.b  (a5)+,(a1)+
                move.b  (a5)+,(a1)+
                move.b  (a5)+,(a1)+
                move.b  (a5)+,(a1)+
                move.b  (a5)+,(a1)+
                move.b  (a5)+,(a1)+
                move.b  (a5)+,(a1)+
                bra.s   loc_1A38
; ---------------------------------------------------------------------------

loc_1A7E:
                move.b  d3,(a1)+
                move.b  d3,(a1)+
                move.b  d3,(a1)+
                move.b  d3,(a1)+
                move.b  d3,(a1)+
                move.b  d3,(a1)+
                move.b  d3,(a1)+
                move.b  d3,(a1)+
                move.b  d3,(a1)+
                move.b  d3,(a1)+
                move.b  d3,(a1)+
                move.b  d3,(a1)+
                move.b  d3,(a1)+
                move.b  d3,(a1)+
                move.b  d3,(a1)+
                move.b  d3,(a1)+
                move.b  d3,(a1)+
                move.b  d3,(a1)+
                bra.s   loc_1A38
; ---------------------------------------------------------------------------

loc_1AA4:                               ; CODE XREF: ROM:00001A4C↑j
                subq.w  #2,d6
                bhi.s   loc_1AAA
                rts
; ---------------------------------------------------------------------------

loc_1AAA:                               ; CODE XREF: ROM:00001AA6↑j
                move.b  (a0)+,d1
                move.b  (a0)+,d5
                move.b  d5,d4
                not.w   d4
                and.w   d7,d4
                add.w   d4,d4
                lsl.w   #4,d5
                move.b  d1,d5
                addi.w  #$12,d5
                sub.w   a1,d5
                add.w   a4,d5
                or.w    d3,d5
                lea     (a1,d5.w),a5
                cmpa.l  a4,a5
                bcs.s   loc_1AD0
                jmp     loc_1A58(pc,d4.w)
; ---------------------------------------------------------------------------

loc_1AD0:                               ; CODE XREF: ROM:00001ACA↑j
                jmp     loc_1A7E(pc,d4.w)
; ---------------------------------------------------------------------------
byte_1AD4:      dc.b 0                  ; DATA XREF: ROM:00001A2E↑o
                dc.b $80
                dc.b $40 ; @
                dc.b $C0
                dc.b $20
                dc.b $A0
                dc.b $60 ; `
                dc.b $E0
                dc.b $10
                dc.b $90
                dc.b $50 ; P
                dc.b $D0
                dc.b $30 ; 0
                dc.b $B0
                dc.b $70 ; p
                dc.b $F0
                dc.b   8
                dc.b $88
                dc.b $48 ; H
                dc.b $C8
                dc.b $28 ; (
                dc.b $A8
                dc.b $68 ; h
                dc.b $E8
                dc.b $18
                dc.b $98
                dc.b $58 ; X
                dc.b $D8
                dc.b $38 ; 8
                dc.b $B8
                dc.b $78 ; x
                dc.b $F8
                dc.b   4
                dc.b $84
                dc.b $44 ; D
                dc.b $C4
                dc.b $24 ; $
                dc.b $A4
                dc.b $64 ; d
                dc.b $E4
                dc.b $14
                dc.b $94
                dc.b $54 ; T
                dc.b $D4
                dc.b $34 ; 4
                dc.b $B4
                dc.b $74 ; t
                dc.b $F4
                dc.b  $C
                dc.b $8C
                dc.b $4C ; L
                dc.b $CC
                dc.b $2C ; ,
                dc.b $AC
                dc.b $6C ; l
                dc.b $EC
                dc.b $1C
                dc.b $9C
                dc.b $5C ; \
                dc.b $DC
                dc.b $3C ; <
                dc.b $BC
                dc.b $7C ; |
                dc.b $FC
                dc.b   2
                dc.b $82
                dc.b $42 ; B
                dc.b $C2
                dc.b $22 ; "
                dc.b $A2
                dc.b $62 ; b
                dc.b $E2
                dc.b $12
                dc.b $92
                dc.b $52 ; R
                dc.b $D2
                dc.b $32 ; 2
                dc.b $B2
                dc.b $72 ; r
                dc.b $F2
                dc.b  $A
                dc.b $8A
                dc.b $4A ; J
                dc.b $CA
                dc.b $2A ; *
                dc.b $AA
                dc.b $6A ; j
                dc.b $EA
                dc.b $1A
                dc.b $9A
                dc.b $5A ; Z
                dc.b $DA
                dc.b $3A ; :
                dc.b $BA
                dc.b $7A ; z
                dc.b $FA
                dc.b   6
                dc.b $86
                dc.b $46 ; F
                dc.b $C6
                dc.b $26 ; &
                dc.b $A6
                dc.b $66 ; f
                dc.b $E6
                dc.b $16
                dc.b $96
                dc.b $56 ; V
                dc.b $D6
                dc.b $36 ; 6
                dc.b $B6
                dc.b $76 ; v
                dc.b $F6
                dc.b  $E
                dc.b $8E
                dc.b $4E ; N
                dc.b $CE
                dc.b $2E ; .
                dc.b $AE
                dc.b $6E ; n
                dc.b $EE
                dc.b $1E
                dc.b $9E
                dc.b $5E ; ^
                dc.b $DE
                dc.b $3E ; >
                dc.b $BE
                dc.b $7E ; ~
                dc.b $FE
                dc.b   1
                dc.b $81
                dc.b $41 ; A
                dc.b $C1
                dc.b $21 ; !
                dc.b $A1
                dc.b $61 ; a
                dc.b $E1
                dc.b $11
                dc.b $91
                dc.b $51 ; Q
                dc.b $D1
                dc.b $31 ; 1
                dc.b $B1
                dc.b $71 ; q
                dc.b $F1
                dc.b   9
                dc.b $89
                dc.b $49 ; I
                dc.b $C9
                dc.b $29 ; )
                dc.b $A9
                dc.b $69 ; i
                dc.b $E9
                dc.b $19
                dc.b $99
                dc.b $59 ; Y
                dc.b $D9
                dc.b $39 ; 9
                dc.b $B9
                dc.b $79 ; y
                dc.b $F9
                dc.b   5
                dc.b $85
                dc.b $45 ; E
                dc.b $C5
                dc.b $25 ; %
                dc.b $A5
                dc.b $65 ; e
                dc.b $E5
                dc.b $15
                dc.b $95
                dc.b $55 ; U
                dc.b $D5
                dc.b $35 ; 5
                dc.b $B5
                dc.b $75 ; u
                dc.b $F5
                dc.b  $D
                dc.b $8D
                dc.b $4D ; M
                dc.b $CD
                dc.b $2D ; -
                dc.b $AD
                dc.b $6D ; m
                dc.b $ED
                dc.b $1D
                dc.b $9D
                dc.b $5D ; ]
                dc.b $DD
                dc.b $3D ; =
                dc.b $BD
                dc.b $7D ; }
                dc.b $FD
                dc.b   3
                dc.b $83
                dc.b $43 ; C
                dc.b $C3
                dc.b $23 ; #
                dc.b $A3
                dc.b $63 ; c
                dc.b $E3
                dc.b $13
                dc.b $93
                dc.b $53 ; S
                dc.b $D3
                dc.b $33 ; 3
                dc.b $B3
                dc.b $73 ; s
                dc.b $F3
                dc.b  $B
                dc.b $8B
                dc.b $4B ; K
                dc.b $CB
                dc.b $2B ; +
                dc.b $AB
                dc.b $6B ; k
                dc.b $EB
                dc.b $1B
                dc.b $9B
                dc.b $5B ; [
                dc.b $DB
                dc.b $3B ; ;
                dc.b $BB
                dc.b $7B ; {
                dc.b $FB
                dc.b   7
                dc.b $87
                dc.b $47 ; G
                dc.b $C7
                dc.b $27 ; '
                dc.b $A7
                dc.b $67 ; g
                dc.b $E7
                dc.b $17
                dc.b $97
                dc.b $57 ; W
                dc.b $D7
                dc.b $37 ; 7
                dc.b $B7
                dc.b $77 ; w
                dc.b $F7
                dc.b  $F
                dc.b $8F
                dc.b $4F ; O
                dc.b $CF
                dc.b $2F ; /
                dc.b $AF
                dc.b $6F ; o
                dc.b $EF
                dc.b $1F
                dc.b $9F
                dc.b $5F ; _
                dc.b $DF
                dc.b $3F ; ?
                dc.b $BF
                dc.b $7F ; 
                dc.b $FF