.global 	_titre_spr
.global		_titre_pal

.segment	"TITLE_RODATA"
_titre_spr:
.incbin 	"data\titre.spr"

_titre_pal:
.byte $0F,$0A,$0B,$0C,$0C,$06,$08,$04,$07,$0B,$09,$00,$03,$05,$04,$04
.byte $FF,$1F,$4F,$7F,$AE,$59,$7A,$29,$1C,$AC,$9A,$00,$24,$56,$35,$36
