	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
	dw .frame5
.frame1
	db $00 ; bitmask
	db $31, $32, $33, $34, $35, $36, $37, $38, $39, $3a, $3b, $3c, $3d, $3e
.frame2
	db $01 ; bitmask
	db $31, $32, $00, $3f, $33, $34, $35, $40, $41, $42, $37, $38, $39, $3a, $43, $3b, $3c, $44, $45, $46, $47, $48, $49, $4a, $4b
.frame3
	db $02 ; bitmask
	db $31, $32, $4c, $4d, $33, $34, $35, $36, $4e, $4f, $37, $38, $39, $3a, $3b, $3c, $50, $51, $52, $53, $54, $55
.frame4
	db $03 ; bitmask
	db $31, $56, $33, $34, $57, $58, $37, $38, $59, $5a, $3b, $3c
.frame5
	db $04 ; bitmask
	db $5b, $5c, $5d
