	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
	dw .frame5
.frame1
	db $00 ; bitmask
	db $24, $25, $26, $27, $28, $29, $2a, $2b, $2c, $2d, $2e, $2f, $30, $31, $32, $33, $34, $35, $36, $37
.frame2
	db $01 ; bitmask
	db $38, $39, $3a, $3b
.frame3
	db $00 ; bitmask
	db $3c, $3d, $3e, $3f, $40, $41, $42, $43, $44, $45, $46, $47, $48, $49, $4a, $4b, $4c, $4d, $4e, $4f
.frame4
	db $00 ; bitmask
	db $3c, $3d, $3e, $3f, $40, $41, $42, $43, $50, $45, $46, $47, $51, $49, $4a, $4b, $4c, $4d, $4e, $4f
.frame5
	db $02 ; bitmask
	db $52, $53
