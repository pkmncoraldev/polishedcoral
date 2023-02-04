	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
	dw .frame5
.frame1
	db $00 ; bitmask
	db $24, $25, $26, $27
.frame2
	db $00 ; bitmask
	db $28, $29, $26, $2a
.frame3
	db $01 ; bitmask
	db $2b, $2c, $2d, $2e, $2f
.frame4
	db $02 ; bitmask
	db $30, $31, $32, $33, $34, $35, $36, $37, $38, $39, $3a, $3b, $3c, $3d
.frame5
	db $03 ; bitmask
	db $3e, $3f, $40
