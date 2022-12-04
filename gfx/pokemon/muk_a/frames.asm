	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
	dw .frame5
	dw .frame6
.frame1
	db $00 ; bitmask
	db $31, $32, $33, $34, $35, $36, $37, $38, $39, $3a, $3b, $3c, $3d, $3e, $3f, $40, $41, $42, $43, $44, $45, $46, $47, $48, $49
.frame2
	db $01 ; bitmask
	db $31, $32, $33, $34, $35, $4a, $4b, $38, $39, $3a, $3b, $4c, $4d, $4e, $3f, $40, $4f, $50, $43, $44, $45, $46, $51, $47, $48, $49, $52, $53
.frame3
	db $02 ; bitmask
	db $31, $54, $33, $34, $35, $55, $56, $38, $39, $3a, $57, $58, $59, $3e, $3f, $40, $5a, $5b, $43, $44, $45, $46, $5c, $47, $48, $49, $5d, $5e, $5f
.frame4
	db $03 ; bitmask
	db $31, $3a, $41
.frame5
	db $04 ; bitmask
	db $31, $3a, $4f, $51
.frame6
	db $05 ; bitmask
	db $31, $3a
