	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
	dw .frame5
	dw .frame6
.frame1
	db $00 ; bitmask
	db $31, $32, $33, $34
.frame2
	db $01 ; bitmask
	db $35, $31, $32, $33, $36, $37, $34, $38, $39
.frame3
	db $02 ; bitmask
	db $3a, $3b, $3c, $3d, $3e, $3f, $40, $41, $42, $43, $06, $44, $45, $46
.frame4
	db $03 ; bitmask
	db $47, $48, $49, $4a, $4b, $4c, $4d, $4e, $4f, $50, $51, $52, $53, $54, $55, $56, $57, $58
.frame5
	db $04 ; bitmask
	db $35, $36, $37, $38, $39
.frame6
	db $05 ; bitmask
	db $59, $5a, $5b, $5c
