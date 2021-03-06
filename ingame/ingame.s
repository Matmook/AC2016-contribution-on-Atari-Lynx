;
; File generated by cc65 v 2.13.9
;
	.fopt		compiler,"cc65 v 2.13.9"
	.setcpu		"65C02"
	.smart		on
	.autoimport	on
	.case		on
	.debuginfo	off
	.importzp	sp, sreg, regsave, regbank
	.importzp	tmp1, tmp2, tmp3, tmp4, ptr1, ptr2, ptr3, ptr4
	.macpack	longbranch
	.import		_rand
	.import		_srand
	.import		_tgi_clear
	.import		_tgi_setpalette
	.import		_tgi_ioctl
	.export		_ingame_init
	.import		_current_game_part
	.import		_joy
	.import		_clear_screen
	.import		_frames
	.import		_frames2
	.import		_i
	.import		_j
	.import		_r
	.import		_t
	.import		_root_sprptr
	.import		_refresh_screen
	.import		_joy_masks
	.import		_joy_read
	.import		_ingame_pal
	.import		_SCBbackg
	.import		_SCBscore0
	.import		_n0
	.import		_n1
	.import		_n2
	.import		_n3
	.import		_n4
	.import		_n5
	.import		_n6
	.import		_n7
	.import		_n8
	.import		_n9
	.export		_score
	.export		_update_score

.segment	"INGAME_BSS"

_score:
	.res	2,$00

; ---------------------------------------------------------------
; void __near__ ingame_init (void)
; ---------------------------------------------------------------

.segment	"INGAME_CODE"

.proc	_ingame_init: near

.segment	"INGAME_BSS"

L006F:
	.res	1,$00
L0072:
	.res	142,$00
L0073:
	.res	2,$00
L0074:
	.res	2,$00
L0075:
	.res	1,$00
L0077:
	.res	2,$00
L0079:
	.res	2,$00
L007B:
	.res	2,$00
L007D:
	.res	2,$00
L007F:
	.res	2,$00
L0081:
	.res	1,$00
L0083:
	.res	1,$00
L0085:
	.res	1,$00

.segment	"INGAME_CODE"

	ldx     #$00
	lda     #$03
	sta     L006F
	ldx     #$00
	lda     #$03
	sta     L0075
	ldx     #$00
	lda     #$05
	sta     L0077
	stx     L0077+1
	ldx     #$00
	lda     #$01
	sta     L0079
	stx     L0079+1
	ldx     #$00
	lda     #$07
	sta     L007B
	stx     L007B+1
	ldx     #$00
	lda     #$00
	sta     L007D
	stx     L007D+1
	ldx     #$00
	lda     #$00
	sta     L007F
	stx     L007F+1
	ldx     #$00
	lda     #$00
	sta     L0081
	ldx     #$00
	lda     #$00
	sta     L0083
	ldx     #$00
	lda     #$00
	sta     L0085
	lda     #<(_SCBbackg)
	ldx     #>(_SCBbackg)
	sta     L0073
	stx     L0073+1
	lda     L0073
	ldx     L0073+1
	ldy     #$04
	jsr     ldaxidx
	sta     L0073
	stx     L0073+1
	ldx     #$00
	lda     #$00
	sta     _i
	stx     _i+1
L008B:	lda     _i
	ldx     _i+1
	cmp     #$47
	txa
	sbc     #$00
	bvc     L0092
	eor     #$80
L0092:	asl     a
	lda     #$00
	ldx     #$00
	rol     a
	jne     L008E
	jmp     L008C
L008E:	lda     L0073
	ldx     L0073+1
	jsr     pushax
	ldx     #$00
	lda     #$0F
	ldy     #$0F
	jsr     staspidx
	lda     _i
	ldx     _i+1
	jsr     aslax1
	clc
	adc     #<(L0072)
	tay
	txa
	adc     #>(L0072)
	tax
	tya
	jsr     pushax
	ldx     #$00
	lda     #$03
	ldy     #$00
	jsr     staxspidx
	lda     L0073
	ldx     L0073+1
	ldy     #$04
	jsr     ldaxidx
	sta     L0073
	stx     L0073+1
	lda     _i
	ldx     _i+1
	sta     regsave
	stx     regsave+1
	ina
	bne     L0094
	inx
L0094:	sta     _i
	stx     _i+1
	lda     regsave
	ldx     regsave+1
	jmp     L008B
L008C:	ldx     #$00
	lda     #$00
	sta     _score
	stx     _score+1
	jsr     _update_score
	lda     #<(_SCBbackg)
	ldx     #>(_SCBbackg)
	sta     _root_sprptr
	stx     _root_sprptr+1
	ldx     #$00
	lda     #$00
	sta     _clear_screen
	jmp     L00A6
L00A6:	lda     #$04
	jsr     pusha
	ldx     #$00
	lda     #$00
	jsr     _tgi_ioctl
	stx     tmp1
	ora     tmp1
	jne     L00A6
	jsr     _tgi_clear
	lda     #<(_ingame_pal)
	ldx     #>(_ingame_pal)
	jsr     _tgi_setpalette
	jmp     L00AF
L00AD:	lda     #$00
	jsr     _joy_read
	sta     _joy
	ldx     #$00
	lda     L0081
	cmp     #$00
	jsr     booleq
	jeq     L00B4
	lda     _frames2
	ldx     _frames2+1
	jsr     _srand
	lda     #<(_SCBbackg)
	ldx     #>(_SCBbackg)
	sta     L0073
	stx     L0073+1
	lda     L0073
	ldx     L0073+1
	ldy     #$04
	jsr     ldaxidx
	sta     L0073
	stx     L0073+1
	ldx     #$00
	lda     #$00
	sta     _i
	stx     _i+1
L00BC:	lda     _i
	ldx     _i+1
	cmp     #$47
	txa
	sbc     #$00
	bvc     L00C3
	eor     #$80
L00C3:	asl     a
	lda     #$00
	ldx     #$00
	rol     a
	jne     L00BF
	jmp     L00BD
L00BF:	lda     L0073
	ldx     L0073+1
	jsr     pushax
	ldx     #$00
	lda     #$0F
	ldy     #$0F
	jsr     staspidx
	lda     _i
	ldx     _i+1
	jsr     aslax1
	clc
	adc     #<(L0072)
	tay
	txa
	adc     #>(L0072)
	tax
	tya
	jsr     pushax
	ldx     #$00
	lda     #$03
	ldy     #$00
	jsr     staxspidx
	lda     L0073
	ldx     L0073+1
	ldy     #$04
	jsr     ldaxidx
	sta     L0073
	stx     L0073+1
	lda     _i
	ldx     _i+1
	sta     regsave
	stx     regsave+1
	ina
	bne     L00C5
	inx
L00C5:	sta     _i
	stx     _i+1
	lda     regsave
	ldx     regsave+1
	jmp     L00BC
L00BD:	ldx     #$00
	lda     _joy
	jsr     pushax
	ldx     #$00
	lda     _joy_masks+4
	jsr     tosandax
	stx     tmp1
	ora     tmp1
	jeq     L00CE
	ldx     #$00
	lda     #$01
	sta     L0081
	ldx     #$00
	lda     #$03
	sta     L0072+128
	stx     L0072+128+1
	ldx     #$00
	lda     #$02
	sta     L0072+130
	stx     L0072+130+1
	ldx     #$00
	lda     #$07
	sta     L007D
	stx     L007D+1
L00CE:	ldx     #$00
	lda     _joy
	jsr     pushax
	ldx     #$00
	lda     _joy_masks+5
	jsr     tosandax
	stx     tmp1
	ora     tmp1
	jeq     L00DD
	ldx     #$00
	lda     #$02
	sta     L0081
	ldx     #$00
	lda     #$02
	sta     L0072+128
	stx     L0072+128+1
	ldx     #$00
	lda     #$03
	sta     L0072+130
	stx     L0072+130+1
	ldx     #$00
	lda     #$05
	sta     L007D
	stx     L007D+1
L00DD:	ldx     #$00
	lda     $FCB0
	ldx     #$00
	and     #$04
	stx     tmp1
	ora     tmp1
	jeq     L00F1
	ldx     #$00
	lda     $FCB1
	ldx     #$00
	and     #$01
	stx     tmp1
	ora     tmp1
	jne     L00EE
L00F1:	ldx     #$00
	lda     #$00
	jeq     L00F4
L00EE:	ldx     #$00
	lda     #$01
L00F4:	jeq     L00FB
	lda     #$01
	jsr     pusha
	ldx     #$00
	lda     #$00
	jsr     _tgi_ioctl
	ldx     #$00
	lda     #$00
	sta     _frames
	stx     _frames+1
	jmp     L00FC
L00FA:	ldy     #$00
	jsr     _refresh_screen
L00FC:	lda     _frames
	ldx     _frames+1
	cpx     #$00
	bne     L00FE
	cmp     #$32
L00FE:	jsr     boolult
	jne     L00FA
L00FB:	ldx     #$00
	lda     L0081
	cmp     #$00
	jsr     boolne
	jeq     L0127
	lda     _frames2
	ldx     _frames2+1
	jsr     _srand
	ldx     #$00
	lda     #$00
	sta     _score
	stx     _score+1
	jsr     _update_score
	ldx     #$00
	lda     #$03
	sta     L0075
	ldx     #$00
	lda     #$05
	sta     L0077
	stx     L0077+1
	ldx     #$00
	lda     #$01
	sta     L0079
	stx     L0079+1
	lda     L007D
	ldx     L007D+1
	sta     L007B
	stx     L007B+1
	ldx     #$00
	lda     #$00
	sta     L0083
	ldx     #$00
	lda     #$03
	sta     L0085
	ldx     #$00
	lda     #$01
	sta     _i
	stx     _i+1
L0113:	lda     _i
	ldx     _i+1
	cmp     #$39
	txa
	sbc     #$00
	bvc     L011A
	eor     #$80
L011A:	asl     a
	lda     #$00
	ldx     #$00
	rol     a
	jne     L0116
	jmp     L0114
L0116:	lda     _i
	ldx     _i+1
	jsr     aslax1
	clc
	adc     #<(L0072)
	tay
	txa
	adc     #>(L0072)
	tax
	tya
	jsr     pushax
	ldx     #$00
	lda     #$02
	ldy     #$00
	jsr     staxspidx
	lda     _i
	ldx     _i+1
	sta     regsave
	stx     regsave+1
	ina
	bne     L011C
	inx
L011C:	sta     _i
	stx     _i+1
	lda     regsave
	ldx     regsave+1
	jmp     L0113
L0114:	ldx     #$00
	lda     #$02
	sta     L0072+132
	stx     L0072+132+1
	ldx     #$00
	lda     #$02
	sta     L0072+134
	stx     L0072+134+1
	ldx     #$00
	lda     #$00
	sta     _i
	stx     _i+1
L0126:	lda     _i
	ldx     _i+1
	cmp     #$0F
	txa
	sbc     #$00
	bvc     L012D
	eor     #$80
L012D:	asl     a
	lda     #$00
	ldx     #$00
	rol     a
	jne     L0129
	jmp     L0127
L0129:	ldy     #$00
	jsr     _refresh_screen
	lda     _i
	ldx     _i+1
	sta     regsave
	stx     regsave+1
	ina
	bne     L012F
	inx
L012F:	sta     _i
	stx     _i+1
	lda     regsave
	ldx     regsave+1
	jmp     L0126
L0127:	ldy     #$00
	jsr     _refresh_screen
	jmp     L00AF
L00B4:	lda     L0075
	jeq     L0132
	ldx     #$00
	lda     L0075
	pha
	dea
	sta     L0075
	pla
	jmp     L0164
L0132:	ldx     #$00
	lda     _joy
	jsr     pushax
	ldx     #$00
	lda     _joy_masks+3
	jsr     tosandax
	stx     tmp1
	ora     tmp1
	jeq     L0136
	ldx     #$00
	lda     L006F
	cmp     #$06
	jsr     boolult
	jeq     L013B
	ldx     #$00
	lda     L006F
	pha
	ina
	sta     L006F
	pla
L013B:	ldx     #$00
	lda     #$03
	sta     L0075
L0136:	ldx     #$00
	lda     _joy
	jsr     pushax
	ldx     #$00
	lda     _joy_masks+2
	jsr     tosandax
	stx     tmp1
	ora     tmp1
	jeq     L0140
	ldx     #$00
	lda     L006F
	cmp     #$00
	jsr     boolne
	jeq     L0145
	ldx     #$00
	lda     L006F
	pha
	dea
	sta     L006F
	pla
L0145:	ldx     #$00
	lda     #$03
	sta     L0075
L0140:	ldx     #$00
	lda     _joy
	jsr     pushax
	ldx     #$00
	lda     _joy_masks+4
	jsr     tosandax
	stx     tmp1
	ora     tmp1
	jeq     L014F
	ldx     #$00
	lda     L0083
	jsr     bnega
	jne     L014B
L014F:	ldx     #$00
	lda     #$00
	jeq     L0150
L014B:	ldx     #$00
	lda     #$01
L0150:	jeq     L0164
	ldx     #$00
	lda     #$01
	sta     L0083
	lda     L0072+132
	ldx     L0072+132+1
	cpx     #$00
	bne     L0156
	cmp     #$03
L0156:	jsr     booleq
	jeq     L0153
	lda     #$0A
	clc
	adc     _score
	sta     _score
	bcc     L0159
	inc     _score+1
L0159:	ldx     _score+1
	ldx     #$00
	lda     #$03
	sta     L0072+134
	stx     L0072+134+1
	jsr     _update_score
	ldx     #$00
	lda     #$02
	sta     L0072+132
	stx     L0072+132+1
	ldx     #$00
	lda     #$01
	sta     L007F
	stx     L007F+1
	jmp     L0164
L0153:	lda     L0072+132
	ldx     L0072+132+1
	cpx     #$00
	bne     L0167
	cmp     #$00
L0167:	jsr     booleq
	jeq     L0164
	lda     _score
	sec
	sbc     #$0A
	sta     _score
	bcs     L016A
	dec     _score+1
L016A:	ldx     _score+1
	lda     _score
	ldx     _score+1
	cpx     #$80
	lda     #$00
	ldx     #$00
	rol     a
	jeq     L016B
	ldx     #$00
	lda     #$00
	sta     _score
	stx     _score+1
L016B:	jsr     _update_score
L0164:	ldx     #$00
	lda     _joy
	jsr     pushax
	ldx     #$00
	lda     _joy_masks+4
	jsr     tosandax
	jsr     bnegax
	jeq     L0175
	lda     L0083
	jne     L0171
L0175:	ldx     #$00
	lda     #$00
	jeq     L0176
L0171:	ldx     #$00
	lda     #$01
L0176:	jeq     L0170
	ldx     #$00
	lda     #$00
	sta     L0083
L0170:	ldx     #$00
	lda     #$39
	sta     _i
	stx     _i+1
L0179:	lda     _i
	ldx     _i+1
	cmp     #$40
	txa
	sbc     #$00
	bvc     L0180
	eor     #$80
L0180:	asl     a
	lda     #$00
	ldx     #$00
	rol     a
	jne     L017C
	jmp     L017A
L017C:	ldx     #$00
	lda     L006F
	jsr     pushax
	lda     _i
	ldx     _i+1
	ldy     #$39
	jsr     decaxy
	jsr     toseqax
	jeq     L0183
	lda     _i
	ldx     _i+1
	jsr     aslax1
	clc
	adc     #<(L0072)
	tay
	txa
	adc     #>(L0072)
	tax
	tya
	jsr     pushax
	ldx     #$00
	lda     #$03
	ldy     #$00
	jsr     staxspidx
	jmp     L017B
L0183:	lda     _i
	ldx     _i+1
	jsr     aslax1
	clc
	adc     #<(L0072)
	tay
	txa
	adc     #>(L0072)
	tax
	tya
	ldy     #$01
	jsr     ldaxidx
	cpx     #$00
	bne     L018D
	cmp     #$03
L018D:	jsr     booleq
	jeq     L017B
	lda     _i
	ldx     _i+1
	jsr     aslax1
	clc
	adc     #<(L0072)
	tay
	txa
	adc     #>(L0072)
	tax
	tya
	jsr     pushax
	ldx     #$00
	lda     #$02
	ldy     #$00
	jsr     staxspidx
L017B:	lda     _i
	ldx     _i+1
	sta     regsave
	stx     regsave+1
	ina
	bne     L0182
	inx
L0182:	sta     _i
	stx     _i+1
	lda     regsave
	ldx     regsave+1
	jmp     L0179
L017A:	lda     L0072+132
	ldx     L0072+132+1
	cpx     #$00
	bne     L0194
	cmp     #$03
L0194:	jsr     booleq
	jeq     L0196
	lda     L007F
	ldx     L007F+1
	sta     regsave
	stx     regsave+1
	jsr     decax1
	sta     L007F
	stx     L007F+1
	lda     regsave
	ldx     regsave+1
	lda     L007F
	ldx     L007F+1
	jsr     bnegax
	jeq     L0196
	ldx     #$00
	lda     #$02
	sta     L0072+132
	stx     L0072+132+1
L0196:	lda     L0079
	ora     L0079+1
	jeq     L019B
	lda     L0079
	ldx     L0079+1
	sta     regsave
	stx     regsave+1
	jsr     decax1
	sta     L0079
	stx     L0079+1
	lda     regsave
	ldx     regsave+1
	jmp     L0200
L019B:	lda     L0072+134
	ldx     L0072+134+1
	cpx     #$00
	bne     L01A2
	cmp     #$03
L01A2:	jsr     booleq
	jeq     L019F
	ldx     #$00
	lda     #$02
	sta     L0072+134
	stx     L0072+134+1
L019F:	lda     L0077
	ldx     L0077+1
	sta     L0079
	stx     L0079+1
	ldx     #$00
	lda     #$00
	sta     _i
	stx     _i+1
L01A8:	lda     _i
	ldx     _i+1
	cmp     #$07
	txa
	sbc     #$00
	bvc     L01AF
	eor     #$80
L01AF:	asl     a
	lda     #$00
	ldx     #$00
	rol     a
	jne     L01AB
	jmp     L01A9
L01AB:	lda     _i
	ldx     _i+1
	ldy     #$32
	jsr     incaxy
	jsr     aslax1
	clc
	adc     #<(L0072)
	tay
	txa
	adc     #>(L0072)
	tax
	tya
	ldy     #$01
	jsr     ldaxidx
	cpx     #$00
	bne     L01B5
	cmp     #$03
L01B5:	jsr     booleq
	jeq     L01AA
	lda     _i
	ldx     _i+1
	jsr     pushax
	ldx     #$00
	lda     L006F
	jsr     toseqax
	jeq     L01B6
	lda     _score
	ldx     _score+1
	sta     regsave
	stx     regsave+1
	ina
	bne     L01B9
	inx
L01B9:	sta     _score
	stx     _score+1
	lda     regsave
	ldx     regsave+1
	ldx     #$00
	lda     #$03
	sta     L0072+134
	stx     L0072+134+1
	jsr     _update_score
	jmp     L01AA
L01B6:	ldx     #$00
	lda     L0085
	pha
	dea
	sta     L0085
	pla
	ldx     #$00
	lda     L0085
	jsr     bnega
	jeq     L01AA
	ldx     #$00
	lda     #$00
	sta     L0081
	ldy     #$00
	jsr     _refresh_screen
	jmp     L01AA
L01AA:	lda     _i
	ldx     _i+1
	sta     regsave
	stx     regsave+1
	ina
	bne     L01B1
	inx
L01B1:	sta     _i
	stx     _i+1
	lda     regsave
	ldx     regsave+1
	jmp     L01A8
L01A9:	ldx     #$00
	lda     #$31
	sta     _i
	stx     _i+1
L01C5:	lda     _i
	ldx     _i+1
	cmp     #$01
	txa
	sbc     #$00
	bvs     L01CD
	eor     #$80
L01CD:	asl     a
	lda     #$00
	ldx     #$00
	rol     a
	jne     L01C8
	jmp     L01C6
L01C8:	lda     _i
	ldx     _i+1
	jsr     aslax1
	clc
	adc     #<(L0072)
	tay
	txa
	adc     #>(L0072)
	tax
	tya
	ldy     #$01
	jsr     ldaxidx
	cpx     #$00
	bne     L01D2
	cmp     #$03
L01D2:	jsr     booleq
	jeq     L01CF
	lda     _i
	ldx     _i+1
	jsr     aslax1
	clc
	adc     #<(L0072)
	tay
	txa
	adc     #>(L0072)
	tax
	tya
	jsr     pushax
	ldx     #$00
	lda     #$02
	ldy     #$00
	jsr     staxspidx
	lda     _i
	ldx     _i+1
	jsr     incax7
	jsr     aslax1
	clc
	adc     #<(L0072)
	tay
	txa
	adc     #>(L0072)
	tax
	tya
	jsr     pushax
	ldx     #$00
	lda     #$03
	ldy     #$00
	jsr     staxspidx
	jmp     L01C7
L01CF:	lda     _i
	ldx     _i+1
	cmp     #$2B
	txa
	sbc     #$00
	bvs     L01DD
	eor     #$80
L01DD:	asl     a
	lda     #$00
	ldx     #$00
	rol     a
	jeq     L01C7
	lda     _i
	ldx     _i+1
	jsr     incax7
	jsr     aslax1
	clc
	adc     #<(L0072)
	tay
	txa
	adc     #>(L0072)
	tax
	tya
	jsr     pushax
	ldx     #$00
	lda     #$00
	ldy     #$00
	jsr     staxspidx
L01C7:	lda     _i
	ldx     _i+1
	sta     regsave
	stx     regsave+1
	jsr     decax1
	sta     _i
	stx     _i+1
	lda     regsave
	ldx     regsave+1
	jmp     L01C5
L01C6:	lda     L007B
	sec
	sbc     #$01
	sta     L007B
	bcs     L01E4
	dec     L007B+1
L01E4:	ldx     L007B+1
	jsr     bnegax
	jeq     L0200
	lda     L007D
	ldx     L007D+1
	sta     L007B
	stx     L007B+1
	jsr     _rand
	sta     L0074
	stx     L0074+1
	lda     L0074
	ldx     L0074+1
	ldx     #$00
	and     #$07
	sta     L0074
	stx     L0074+1
	ldx     #$00
	lda     #$00
	sta     _i
	stx     _i+1
L01EB:	lda     _i
	ldx     _i+1
	cmp     #$07
	txa
	sbc     #$00
	bvc     L01F2
	eor     #$80
L01F2:	asl     a
	lda     #$00
	ldx     #$00
	rol     a
	jne     L01EE
	jmp     L01EC
L01EE:	lda     _i
	ldx     _i+1
	jsr     pushax
	lda     L0074
	ldx     L0074+1
	jsr     toseqax
	jeq     L01F5
	lda     _i
	ldx     _i+1
	ina
	bne     L01F9
	inx
L01F9:	jsr     aslax1
	clc
	adc     #<(L0072)
	tay
	txa
	adc     #>(L0072)
	tax
	tya
	jsr     pushax
	ldx     #$00
	lda     #$03
	ldy     #$00
	jsr     staxspidx
	jmp     L01ED
L01F5:	lda     _i
	ldx     _i+1
	ina
	bne     L01FE
	inx
L01FE:	jsr     aslax1
	clc
	adc     #<(L0072)
	tay
	txa
	adc     #>(L0072)
	tax
	tya
	jsr     pushax
	ldx     #$00
	lda     #$00
	ldy     #$00
	jsr     staxspidx
L01ED:	lda     _i
	ldx     _i+1
	sta     regsave
	stx     regsave+1
	ina
	bne     L01F4
	inx
L01F4:	sta     _i
	stx     _i+1
	lda     regsave
	ldx     regsave+1
	jmp     L01EB
L01EC:	jsr     _rand
	ldx     #$00
	cmp     #$C1
	txa
	sbc     #$00
	bvs     L0203
	eor     #$80
L0203:	asl     a
	lda     #$00
	ldx     #$00
	rol     a
	jeq     L0204
	lda     L0072+132
	ldx     L0072+132+1
	cpx     #$00
	bne     L0207
	cmp     #$03
L0207:	jsr     boolne
	jne     L0201
L0204:	ldx     #$00
	lda     #$00
	jeq     L0208
L0201:	ldx     #$00
	lda     #$01
L0208:	jeq     L0200
	ldx     #$00
	lda     #$03
	sta     L0072+132
	stx     L0072+132+1
	ldx     #$00
	lda     #$28
	sta     L007F
	stx     L007F+1
L0200:	ldx     #$00
	lda     L0085
	cmp     #$03
	lda     #$00
	ldx     #$00
	rol     a
	jeq     L020E
	ldx     #$00
	lda     #$03
	sta     L0072+136
	stx     L0072+136+1
	jmp     L0213
L020E:	ldx     #$00
	lda     #$00
	sta     L0072+136
	stx     L0072+136+1
L0213:	ldx     #$00
	lda     L0085
	cmp     #$02
	lda     #$00
	ldx     #$00
	rol     a
	jeq     L0217
	ldx     #$00
	lda     #$03
	sta     L0072+138
	stx     L0072+138+1
	jmp     L021C
L0217:	ldx     #$00
	lda     #$00
	sta     L0072+138
	stx     L0072+138+1
L021C:	ldx     #$00
	lda     L0085
	cmp     #$00
	jsr     boolne
	jeq     L0220
	ldx     #$00
	lda     #$03
	sta     L0072+140
	stx     L0072+140+1
	jmp     L0225
L0220:	ldx     #$00
	lda     #$00
	sta     L0072+140
	stx     L0072+140+1
L0225:	lda     #<(_SCBbackg)
	ldx     #>(_SCBbackg)
	sta     L0073
	stx     L0073+1
	lda     L0073
	ldx     L0073+1
	ldy     #$04
	jsr     ldaxidx
	sta     L0073
	stx     L0073+1
	ldx     #$00
	lda     #$01
	sta     _i
	stx     _i+1
L022D:	lda     _i
	ldx     _i+1
	cmp     #$47
	txa
	sbc     #$00
	bvc     L0234
	eor     #$80
L0234:	asl     a
	lda     #$00
	ldx     #$00
	rol     a
	jne     L0230
	jmp     L022E
L0230:	lda     _i
	ldx     _i+1
	jsr     aslax1
	clc
	adc     #<(L0072)
	tay
	txa
	adc     #>(L0072)
	tax
	tya
	ldy     #$01
	jsr     ldaxidx
	cpx     #$00
	bne     L023A
	cmp     #$03
L023A:	jsr     booleq
	jeq     L0237
	lda     L0073
	ldx     L0073+1
	jsr     pushax
	ldx     #$00
	lda     #$0F
	ldy     #$0F
	jsr     staspidx
	jmp     L0248
L0237:	lda     _i
	ldx     _i+1
	jsr     aslax1
	clc
	adc     #<(L0072)
	tay
	txa
	adc     #>(L0072)
	tax
	tya
	ldy     #$01
	jsr     ldaxidx
	cpx     #$00
	bne     L0242
	cmp     #$00
L0242:	jsr     boolne
	jeq     L023F
	lda     _i
	ldx     _i+1
	jsr     aslax1
	clc
	adc     #<(L0072)
	tay
	txa
	adc     #>(L0072)
	tax
	tya
	jsr     pushax
	ldy     #$01
	jsr     ldaxidx
	sta     regsave
	stx     regsave+1
	jsr     decax1
	ldy     #$00
	jsr     staxspidx
	lda     regsave
	ldx     regsave+1
	lda     L0073
	ldx     L0073+1
	jsr     pushax
	ldx     #$00
	lda     #$09
	ldy     #$0F
	jsr     staspidx
	jmp     L0248
L023F:	lda     L0073
	ldx     L0073+1
	jsr     pushax
	ldx     #$00
	lda     #$00
	ldy     #$0F
	jsr     staspidx
L0248:	lda     L0073
	ldx     L0073+1
	ldy     #$04
	jsr     ldaxidx
	sta     L0073
	stx     L0073+1
	lda     _i
	ldx     _i+1
	sta     regsave
	stx     regsave+1
	ina
	bne     L0236
	inx
L0236:	sta     _i
	stx     _i+1
	lda     regsave
	ldx     regsave+1
	jmp     L022D
L022E:	ldy     #$00
	jsr     _refresh_screen
L00AF:	ldx     #$00
	lda     _current_game_part
	cmp     #$02
	jsr     booleq
	jne     L00AD
	rts

.endproc

; ---------------------------------------------------------------
; void __near__ update_score (void)
; ---------------------------------------------------------------

.segment	"INGAME_CODE"

.proc	_update_score: near

.segment	"INGAME_BSS"

L001D:
	.res	2,$00
L001F:
	.res	5,$00

.segment	"INGAME_CODE"

	lda     _score
	ldx     _score+1
	sta     _r
	stx     _r+1
	ldx     #$00
	lda     #$00
	sta     _j
	stx     _j+1
L0022:	lda     _j
	ldx     _j+1
	cmp     #$05
	txa
	sbc     #$00
	bvc     L0029
	eor     #$80
L0029:	asl     a
	lda     #$00
	ldx     #$00
	rol     a
	jne     L0025
	jmp     L0023
L0025:	lda     _r
	ldx     _r+1
	jsr     pushax
	ldx     #$00
	lda     #$0A
	jsr     tosdivax
	sta     _t
	stx     _t+1
	lda     #<(L001F)
	ldx     #>(L001F)
	clc
	adc     _j
	tay
	txa
	adc     _j+1
	tax
	tya
	jsr     pushax
	lda     _r
	ldx     _r+1
	jsr     pushax
	lda     _t
	ldx     _t+1
	jsr     mulax10
	jsr     tossubax
	ldy     #$00
	jsr     staspidx
	lda     _t
	ldx     _t+1
	sta     _r
	stx     _r+1
	lda     _j
	ldx     _j+1
	sta     regsave
	stx     regsave+1
	ina
	bne     L002B
	inx
L002B:	sta     _j
	stx     _j+1
	lda     regsave
	ldx     regsave+1
	jmp     L0022
L0023:	lda     #<(_SCBscore0)
	ldx     #>(_SCBscore0)
	sta     L001D
	stx     L001D+1
	ldx     #$00
	lda     #$05
	sta     _j
	stx     _j+1
L0037:	lda     _j
	ldx     _j+1
	cmp     #$01
	txa
	sbc     #$00
	bvs     L003E
	eor     #$80
L003E:	asl     a
	lda     #$00
	ldx     #$00
	rol     a
	jne     L003A
	jmp     L0038
L003A:	lda     _j
	ldx     _j+1
	jsr     decax1
	clc
	adc     #<(L001F)
	tay
	txa
	adc     #>(L001F)
	tax
	tya
	ldy     #$00
	jsr     ldauidx
	jmp     L0042
L0042:	cmp     #$00
	jeq     L0045
	cmp     #$01
	jeq     L0049
	cmp     #$02
	jeq     L004D
	cmp     #$03
	jeq     L0051
	cmp     #$04
	jeq     L0055
	cmp     #$05
	jeq     L0059
	cmp     #$06
	jeq     L005D
	cmp     #$07
	jeq     L0061
	cmp     #$08
	jeq     L0065
	cmp     #$09
	jeq     L0069
	jmp     L0043
L0045:	lda     L001D
	ldx     L001D+1
	jsr     pushax
	lda     #<(_n0)
	ldx     #>(_n0)
	ldy     #$05
	jsr     staxspidx
	jmp     L0043
L0049:	lda     L001D
	ldx     L001D+1
	jsr     pushax
	lda     #<(_n1)
	ldx     #>(_n1)
	ldy     #$05
	jsr     staxspidx
	jmp     L0043
L004D:	lda     L001D
	ldx     L001D+1
	jsr     pushax
	lda     #<(_n2)
	ldx     #>(_n2)
	ldy     #$05
	jsr     staxspidx
	jmp     L0043
L0051:	lda     L001D
	ldx     L001D+1
	jsr     pushax
	lda     #<(_n3)
	ldx     #>(_n3)
	ldy     #$05
	jsr     staxspidx
	jmp     L0043
L0055:	lda     L001D
	ldx     L001D+1
	jsr     pushax
	lda     #<(_n4)
	ldx     #>(_n4)
	ldy     #$05
	jsr     staxspidx
	jmp     L0043
L0059:	lda     L001D
	ldx     L001D+1
	jsr     pushax
	lda     #<(_n5)
	ldx     #>(_n5)
	ldy     #$05
	jsr     staxspidx
	jmp     L0043
L005D:	lda     L001D
	ldx     L001D+1
	jsr     pushax
	lda     #<(_n6)
	ldx     #>(_n6)
	ldy     #$05
	jsr     staxspidx
	jmp     L0043
L0061:	lda     L001D
	ldx     L001D+1
	jsr     pushax
	lda     #<(_n7)
	ldx     #>(_n7)
	ldy     #$05
	jsr     staxspidx
	jmp     L0043
L0065:	lda     L001D
	ldx     L001D+1
	jsr     pushax
	lda     #<(_n8)
	ldx     #>(_n8)
	ldy     #$05
	jsr     staxspidx
	jmp     L0043
L0069:	lda     L001D
	ldx     L001D+1
	jsr     pushax
	lda     #<(_n9)
	ldx     #>(_n9)
	ldy     #$05
	jsr     staxspidx
	jmp     L0043
L0043:	lda     L001D
	ldx     L001D+1
	ldy     #$04
	jsr     ldaxidx
	sta     L001D
	stx     L001D+1
	lda     _j
	ldx     _j+1
	sta     regsave
	stx     regsave+1
	jsr     decax1
	sta     _j
	stx     _j+1
	lda     regsave
	ldx     regsave+1
	jmp     L0037
L0038:	rts

.endproc

