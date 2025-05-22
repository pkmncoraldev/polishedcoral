	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
	dw .frame5
.frame1
	db $00 ; bitmask
	db $19, $1a, $1b, $1c, $1d, $1e, $1f, $20, $21, $22, $23, $24, $00, $25, $26, $27
.frame2
	db $01 ; bitmask
	db $19, $1a, $28, $1c, $29, $1d, $2a, $1f, $2b, $2c, $21, $22, $2d, $2e, $2f, $00, $25, $26, $27
.frame3
	db $02 ; bitmask
	db $19, $30, $31, $1a, $28, $1c, $29, $1d, $2a, $1f, $2b, $2c, $21, $22, $2d, $2e, $2f, $00, $25, $26, $27
.frame4
	db $03 ; bitmask
	db $32, $33, $34, $35, $36
.frame5
	db $04 ; bitmask
	db $19, $1a, $37
