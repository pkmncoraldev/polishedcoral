	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
	dw .frame5
	dw .frame6
	dw .frame7
.frame1
	db $00 ; bitmask
	db $05, $31, $32, $33, $34, $35, $36, $37, $38, $39, $3a, $3b, $3c, $3d, $3e, $3f, $40, $41, $42, $43, $44
.frame2
	db $00 ; bitmask
	db $05, $31, $32, $33, $34, $45, $46, $47, $38, $39, $48, $49, $4a, $3d, $4b, $3f, $40, $41, $42, $43, $44
.frame3
	db $00 ; bitmask
	db $05, $31, $32, $33, $34, $45, $4c, $47, $38, $39, $4d, $4e, $4f, $50, $51, $3f, $40, $41, $42, $43, $44
.frame4
	db $01 ; bitmask
	db $52, $53, $54, $55, $56, $57, $58
.frame5
	db $02 ; bitmask
	db $52, $59, $5a, $55, $56, $57, $58, $5b, $5c, $5d, $5e
.frame6
	db $03 ; bitmask
	db $5f, $60
.frame7
	db $04 ; bitmask
	db $61, $5a, $5b, $5c, $5d, $5e
