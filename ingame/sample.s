; sample.m65
; started : 97-09-24 (only 3mths till Xmas !!)
; 
; Warning : Just experimental. This code _WILL_ change !
;           Also parameters etc.

; functions: void SmpInit(char channel,char timer);
;            void SmpStart(char ; sample,char speed);
;            void SmpStop();
;            int  SmpActive();

.export _SmpInit
.export _SmpStart
.export _SmpStop
.export _SmpActive

; extern labels
;   xref popax,pushax
;		xref _InstallIRQ

.segment	"INGAME_BSS"

SmpCount:     .res	2,$00
SmpSema:      .res	1,$00
SmpTemp:      .res	1,$00
SmpChannel:   .res	1,$00
SmpChannel8:  .res	1,$00
SmpTimer: 		.res	1,$00
.segment	"APPZP"    
smp_ptr:  		.res	2,$00

.segment	"INGAME_DATA"
mask:
.byte $11,$22,$44,$88

.segment	"INGAME_CODE"
; void SmpInit(char channel,char timer)
; channel is the channel-number : 0..3
; timer is the timer-number     : 0..7 (where 0,2,4 makes no sense !)

_SmpInit:
		jsr popax	; get timer
		and #7
		asl A
		asl A
		pha
		sta SmpTimer
		
		jsr popax	; get channel
		and #3
		sta SmpChannel
		plx
    stz $fd01,x ; stop Timer
		
		tay
		asl A
		asl A
		asl A
		sta SmpChannel8
		pha

    lda mask,y
    tsb $fd44       ; voice A balance controled
    tsb $fd50       ; but curr. quite

    lda #$ff
    sta $fd40,y     ; and full volume left and right
    
		plx
    stz $fd25,x     ; stop channel counter
    stz $fd22,x     ; channel  quiet please
    rts

;****************
; play mono sample
;****************
SmpIRQ:
    lda (smp_ptr)
		ldx SmpChannel8
    sta $fd22,x
    inc smp_ptr
    bne SmpIRQ2
    inc smp_ptr+1
SmpIRQ2:
    inc SmpCount
    bne SmpExit
    inc SmpCount+1
    bne SmpExit
_SmpStop:
		ldy SmpChannel
		lda mask,y
    tsb $fd50
    ldx SmpTimer
    stz $fd01,x
SmpExit:
    rts
    
;****************
; play packed mono-samples
;*****************
SmpIRQp:
    dec SmpSema
    bmi no_read

    lda (smp_ptr)
		inc smp_ptr
    bne SmpIRQp0
    inc smp_ptr+1

SmpIRQp0:
    inc SmpCount
    bne SmpIRQp1
    inc SmpCount+1
    beq _SmpStop

SmpIRQp1:
    sta SmpIRQp2+1  ; self mod
                               
    lsr A
    lsr A
    lsr A
    lsr A
;*
; if there's enough space, could do it with a table
;*
    bra SmpIRQp3

no_read:        
    lda #1
    sta SmpSema

SmpIRQp2:
    lda #0
    and #$f

SmpIRQp3:
    tax
    clc
    lda tabelle,x
    adc SmpTemp
    sta SmpTemp
    ldx SmpChannel8
    bcc __1
    dec $fda0
;*
; Note : with stx $fd22+8 it sounds better but you'll use another channel
;*
__1
		asl
		bcc __2
		lda #255
__2
  sta $fd22,x
  rts

tabelle:
.byte 128,-64,-32,-16,-8,-4,-2,-1,0,1,2,4,8,16,32,64

        
; SmpStart(char ; sample,char speed)
;
; sample is a pointer to a structure :
; stereo        ds 1
; length        ds 2 ; big-endian (har,har)
; divider       ds 1 ; 1MHz/sample-freq.
; unpacked      ds 1 : == 0 sample packed
;
; divider may be overridden by speed (!= 0)
;
_SmpStart:
		ldx SmpTimer
    stz $fd01,x     ; stop current sample
    ldx SmpChannel8
    stz $fd22,x      ; silence

    stz SmpTemp
    lda #1
    sta SmpSema
    jsr popax
    pha             ; save speed for later use
    jsr popax       ; get data
    sta ptr1
    stx ptr1+1
    clc
    adc #5
    sta smp_ptr
    txa
    adc #0
    sta smp_ptr+1
                
; no stereo yet, so go to offset 1          
                
    ldy #1  
    lda (ptr1),y
    eor #$ff
    sta SmpCount+1
    iny
    lda (ptr1),y
    eor #$ff
    sta SmpCount
    iny
    lda (ptr1),y
    ldx SmpTimer
    sta $fd00,x
    iny
    lda (ptr1),y
    pha             ; save packed-flag

		txa
		ldx #0
		lsr A
		lsr A		; we want the number not offset
    jsr pushax     	; pushax destroys y and maybe ptr1 !!

    ldax #SmpIRQ
    ply             ; check packed-flag
    bne _SmpStart0
    ldax #SmpIRQp
_SmpStart0:
    jsr pushax
;>                ldy #2
    jsr _InstallIRQ
		
		ldx SmpTimer
    pla
    beq _SmpStart2
    sta $fd00,x
_SmpStart2:
    php
    sei
    lda #%10011000
    sta $fd01,x
    ldy SmpChannel
    lda mask,y
    trb $fd50
    plp
    rts
    
;****************
; int SmpActive()
;****************
_SmpActive:
    ldx SmpTimer
		lda $fd01,x
		ldx #0
		cmp #0
		rts
    