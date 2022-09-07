	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
.frame1
	db $00 ; bitmask
	db $19, $1a, $1b, $1c, $1d, $1e, $1f, $20, $21, $22, $23
.frame2
	db $00 ; bitmask
	db $19, $1a, $1b, $24, $25, $1e, $26, $27, $21, $28, $29
.frame3
	db $01 ; bitmask
	db $24, $25, $1e, $26, $2a, $2b, $28, $2c, $2d
.frame4
	db $02 ; bitmask
	db $2e, $2f, $24, $25, $1e, $30, $26, $2a, $2b, $31, $28, $2c, $2d
