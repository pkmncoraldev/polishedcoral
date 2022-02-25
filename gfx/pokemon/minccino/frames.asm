	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
.frame1
	db $00 ; bitmask
	db $19, $1a, $1b, $1c, $1d, $1e, $1f, $20, $21, $22, $23, $24, $25, $26, $27, $28, $00
.frame2
	db $01 ; bitmask
	db $19, $1a, $1b, $29, $1d, $1e, $1f, $20, $2a, $2b, $2c, $2d, $2e
.frame3
	db $02 ; bitmask
	db $19, $1a, $1b, $1c, $1d, $1e, $1f, $20, $2a, $2b
.frame4
	db $03 ; bitmask
	db $2f, $30, $31
