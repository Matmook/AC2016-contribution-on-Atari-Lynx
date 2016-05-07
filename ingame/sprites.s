.global _ingame_pal
.global _backg
.global _p1
.global _p2
.global _p3
.global _p4
.global _p5
.global _p6
.global _pz
.global _rabbit
.global _n0
.global _n1
.global _n2
.global _n3
.global _n4
.global _n5
.global _n6
.global _n7
.global _n8
.global _n9
.global _cocotte
.global _bip
.global _life

.segment	"INGAME_RODATA"
_backg:
.incbin 	"data\backg.spr"
_p1:
.incbin 	"data\p1.spr"
_p2:
.incbin 	"data\p2.spr"
_p3:
.incbin 	"data\p3.spr"
_p4:
.incbin 	"data\p4.spr"
_p5:
.incbin 	"data\p5.spr"
_p6:
.incbin 	"data\p6.spr"
_rabbit:
.incbin 	"data\rabbit.spr"
_pz:
.incbin 	"data\pz.spr"
_gamea:
.incbin 	"data\gamea.spr"
_gameb:
.incbin 	"data\gameb.spr"

_n0:
.incbin 	"data\n0.spr"
_n1:
.incbin 	"data\n1.spr"
_n2:
.incbin 	"data\n2.spr"
_n3:
.incbin 	"data\n3.spr"
_n4:
.incbin 	"data\n4.spr"
_n5:
.incbin 	"data\n5.spr"
_n6:
.incbin 	"data\n6.spr"
_n7:
.incbin 	"data\n7.spr"
_n8:
.incbin 	"data\n8.spr"
_n9:
.incbin 	"data\n9.spr"
_cocotte:
.incbin 	"data\cocotte.spr"

_bip:
.incbin 	"data\bip.spr"

_life:
.incbin 	"data\life.spr"

_ingame_pal:
;.byte $0C,$09,$0A,$0B,$09,$07,$0D,$06,$06,$07,$07,$06,$0B,$0A,$00,$00
;.byte $C7,$86,$86,$76,$66,$76,$59,$5A,$58,$5B,$5D,$59,$76,$96,$00,$00
.byte $0E,$09,$0A,$0B,$09,$07,$0D,$06,$06,$07,$07,$06,$0A,$0C,$00,$00
.byte $DB,$86,$86,$76,$66,$76,$59,$5A,$58,$5B,$5D,$59,$96,$C7,$00,$00
  
.segment	"INGAME_DATA"
.global _SCBbackg
.global _SCBrabbit0
.global _SCBgamea
.global _SCBgameb
.global _SCBscore0
.global _SCBcocotte
.global _SCBbip
.global _SCBlife0

_SCBbackg:
.byte $c0,$10,$20
.word _SCBe11,_backg
.word 0,0,$100,$100
.byte $01,$23,$45,$67,$89,$ab,$cd,$ef

; 1 
_SCBe11:
.byte $04,$10,$20
.word _SCBe21,_p1
.word 12,17,$100,$100
.byte $0F

_SCBe21:
.byte $04,$10,$20
.word _SCBe31,_p1
.word 35,17,$100,$100
.byte $0F

_SCBe31:
.byte $04,$10,$20
.word _SCBe41,_p1
.word 51,17,$100,$100
.byte $0F

_SCBe41:
.byte $04,$10,$20
.word _SCBe51,_p1
.word 79,17,$100,$100
.byte $0F

_SCBe51:
.byte $04,$10,$20
.word _SCBe61,_p1
.word 107,17,$100,$100
.byte $0F

_SCBe61:
.byte $04,$10,$20
.word _SCBe71,_p1
.word 123,17,$100,$100
.byte $0F

_SCBe71:
.byte $04,$10,$20
.word _SCBe12,_p1
.word 146,17,$100,$100
.byte $0F

; 2
_SCBe12:
.byte $04,$10,$20
.word _SCBe22,_p2
.word 14,10,$100,$100
.byte $0F

_SCBe22:
.byte $04,$10,$20
.word _SCBe32,_p2
.word 36,10,$100,$100
.byte $0F

_SCBe32:
.byte $04,$10,$20
.word _SCBe42,_p2
.word 52,10,$100,$100
.byte $0F

_SCBe42:
.byte $04,$10,$20
.word _SCBe52,_p2
.word 79,10,$100,$100
.byte $0F

_SCBe52:
.byte $04,$10,$20
.word _SCBe62,_p2
.word 106,10,$100,$100
.byte $0F

_SCBe62:
.byte $04,$10,$20
.word _SCBe72,_p2
.word 122,10,$100,$100
.byte $0F

_SCBe72:
.byte $04,$10,$20
.word _SCBe13,_p2
.word 144,10,$100,$100
.byte $0F

; 3
_SCBe13:
.byte $04,$10,$20
.word _SCBe23,_p3
.word 17,4,$100,$100
.byte $0F

_SCBe23:
.byte $04,$10,$20
.word _SCBe33,_p3
.word 39,4,$100,$100
.byte $0F

_SCBe33:
.byte $04,$10,$20
.word _SCBe43,_p3
.word 55,4,$100,$100
.byte $0F

_SCBe43:
.byte $04,$10,$20
.word _SCBe53,_p3
.word 78,4,$100,$100
.byte $0F

_SCBe53:
.byte $04,$10,$20
.word _SCBe63,_p3
.word 101,4,$100,$100
.byte $0F

_SCBe63:
.byte $04,$10,$20
.word _SCBe73,_p3
.word 117,4,$100,$100
.byte $0F

_SCBe73:
.byte $04,$10,$20
.word _SCBe14,_p3
.word 139,4,$100,$100
.byte $0F

; 4
_SCBe14:
.byte $04,$10,$20
.word _SCBe24,_p4
.word 21,12,$100,$100
.byte $0F

_SCBe24:
.byte $04,$10,$20
.word _SCBe34,_p4
.word 40,12,$100,$100
.byte $0F

_SCBe34:
.byte $04,$10,$20
.word _SCBe44,_p4
.word 56,12,$100,$100
.byte $0F

_SCBe44:
.byte $04,$10,$20
.word _SCBe54,_p4
.word 77,12,$100,$100
.byte $0F

_SCBe54:
.byte $04,$10,$20
.word _SCBe64,_p4
.word 98,12,$100,$100
.byte $0F

_SCBe64:
.byte $04,$10,$20
.word _SCBe74,_p4
.word 114,12,$100,$100
.byte $0F

_SCBe74:
.byte $04,$10,$20
.word _SCBe15,_p4
.word 133,12,$100,$100
.byte $0F

; 5
_SCBe15:
.byte $05,$10,$20
.word _SCBe25,_p5
.word 22,23,$100,$100
.byte $0F

_SCBe25:
.byte $05,$10,$20
.word _SCBe35,_p5
.word 41,23,$100,$100
.byte $0F

_SCBe35:
.byte $05,$10,$20
.word _SCBe45,_p5
.word 57,23,$100,$100
.byte $0F

_SCBe45:
.byte $05,$10,$20
.word _SCBe55,_p5
.word 76,23,$100,$100
.byte $0F

_SCBe55:
.byte $05,$10,$20
.word _SCBe65,_p5
.word 95,23,$100,$100
.byte $0F

_SCBe65:
.byte $05,$10,$20
.word _SCBe75,_p5
.word 111,23,$100,$100
.byte $0F

_SCBe75:
.byte $05,$10,$20
.word _SCBe16,_p5
.word 130,23,$100,$100
.byte $0F

; 6
_SCBe16:
.byte $05,$10,$20
.word _SCBe26,_p6
.word 25,38,$100,$100
.byte $0F

_SCBe26:
.byte $05,$10,$20
.word _SCBe36,_p6
.word 42,38,$100,$100
.byte $0F

_SCBe36:
.byte $05,$10,$20
.word _SCBe46,_p6
.word 58,38,$100,$100
.byte $0F

_SCBe46:
.byte $05,$10,$20
.word _SCBe56,_p6
.word 76,38,$100,$100
.byte $0F

_SCBe56:
.byte $05,$10,$20
.word _SCBe66,_p6
.word 94,38,$100,$100
.byte $0F

_SCBe66:
.byte $05,$10,$20
.word _SCBe76,_p6
.word 110,38,$100,$100
.byte $0F

_SCBe76:
.byte $05,$10,$20
.word _SCBe17,_p6
.word 127,38,$100,$100
.byte $0F

; 7
_SCBe17:
.byte $05,$10,$20
.word _SCBe27,_p6
.word 27,53,$100,$100
.byte $0F

_SCBe27:
.byte $05,$10,$20
.word _SCBe37,_p6
.word 43,53,$100,$100
.byte $0F

_SCBe37:
.byte $05,$10,$20
.word _SCBe47,_p6
.word 59,53,$100,$100
.byte $0F

_SCBe47:
.byte $05,$10,$20
.word _SCBe57,_p6
.word 76,53,$100,$100
.byte $0F

_SCBe57:
.byte $05,$10,$20
.word _SCBe67,_p6
.word 93,53,$100,$100
.byte $0F

_SCBe67:
.byte $05,$10,$20
.word _SCBe77,_p6
.word 109,53,$100,$100
.byte $0F

_SCBe77:
.byte $05,$10,$20
.word _SCBe18,_p6
.word 125,53,$100,$100
.byte $0F

; 8
_SCBe18:
.byte $05,$10,$20
.word _SCBe28,_p6
.word 28,70,$100,$100
.byte $0F

_SCBe28:
.byte $05,$10,$20
.word _SCBe38,_p6
.word 44,70,$100,$100
.byte $0F

_SCBe38:
.byte $05,$10,$20
.word _SCBe48,_p6
.word 60,70,$100,$100
.byte $0F

_SCBe48:
.byte $05,$10,$20
.word _SCBe58,_p6
.word 76,70,$100,$100
.byte $0F

_SCBe58:
.byte $05,$10,$20
.word _SCBe68,_p6
.word 92,70,$100,$100
.byte $0F

_SCBe68:
.byte $05,$10,$20
.word _SCBe78,_p6
.word 108,70,$100,$100
.byte $0F

_SCBe78:
.byte $05,$10,$20
.word _SCBrabbit0,_p6
.word 124,70,$100,$100
.byte $0F

; rabbit
_SCBrabbit0:
.byte $05,$10,$20
.word _SCBrabbit1,_rabbit
.word 26,83,$100,$100
.byte $0F

_SCBrabbit1:
.byte $05,$10,$20
.word _SCBrabbit2,_rabbit
.word 42,83,$100,$100
.byte $0F

_SCBrabbit2:
.byte $05,$10,$20
.word _SCBrabbit3,_rabbit
.word 58,83,$100,$100
.byte $0F

_SCBrabbit3:
.byte $05,$10,$20
.word _SCBrabbit4,_rabbit
.word 74,83,$100,$100
.byte $0F

_SCBrabbit4:
.byte $05,$10,$20
.word _SCBrabbit5,_rabbit
.word 90,83,$100,$100
.byte $0F

_SCBrabbit5:
.byte $05,$10,$20
.word _SCBrabbit6,_rabbit
.word 106,83,$100,$100
.byte $0F

_SCBrabbit6:
.byte $05,$10,$20
.word _SCBgamea,_rabbit
.word 122,83,$100,$100
.byte $0F

_SCBgamea:
.byte $05,$10,$20
.word _SCBgameb,_gamea
.word 0,91,$100,$100
.byte $0F

_SCBgameb:
.byte $05,$10,$20
.word _SCBcocotte,_gameb
.word 0,97,$100,$100
.byte $0F

; cocotte
_SCBcocotte:
.byte $05,$10,$20
.word _SCBbip,_cocotte
.word 139,74,$100,$100
.byte $0F

; bip
_SCBbip:
.byte $05,$10,$20
.word _SCBlife0,_bip
.word 138,58,$100,$100
.byte $0F

; lives
_SCBlife0:
.byte $05,$10,$20
.word _SCBlife1,_life
.word 152,1,$100,$100
.byte $0F

_SCBlife1:
.byte $05,$10,$20
.word _SCBlife2,_life
.word 152,9,$100,$100
.byte $0F

_SCBlife2:
.byte $05,$10,$20
.word _SCBscore0,_life
.word 152,17,$100,$100
.byte $0F

; score
_SCBscore0:
.byte $05,$10,$20
.word _SCBscore1,_n0
.word 5,64,$100,$100
.byte $0F

_SCBscore1:
.byte $05,$10,$20
.word _SCBscore2,_n0
.word 5,56,$100,$100
.byte $0F

_SCBscore2:
.byte $05,$10,$20
.word _SCBscore3,_n0
.word 5,48,$100,$100
.byte $0F

_SCBscore3:
.byte $05,$10,$20
.word _SCBscore4,_n0
.word 5,40,$100,$100
.byte $0F

_SCBscore4:
.byte $05,$10,$20
.word 0,_n0
.word 5,32,$100,$100
.byte $0F


