	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
	dw .frame5
.frame1
	db $00 ; bitmask
	db $03, $31, $32, $33, $34, $35, $36, $37, $38, $39, $3a, $03, $3b, $3c
.frame2
	db $00 ; bitmask
	db $03, $3d, $3e, $33, $3f, $40, $36, $37, $38, $41, $42, $03, $3b, $3c
.frame3
	db $01 ; bitmask
	db $03, $43, $44, $3e, $45, $46, $40, $47, $48, $49, $03, $4a, $4b, $03, $03, $4c, $4d
.frame4
	db $02 ; bitmask
	db $03, $4e, $4f, $3e, $50, $51, $40, $47, $52, $53, $54, $03, $55, $56, $57, $03, $03, $03
.frame5
	db $03 ; bitmask
	db $58
