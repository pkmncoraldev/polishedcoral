	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
.frame1
	db $00 ; bitmask
	db $19, $1a, $1b, $1c, $00, $1d, $1e, $1f, $0a, $20, $21, $22, $23, $1d, $24, $25, $26
.frame2
	db $01 ; bitmask
	db $00, $1d, $1e, $1f, $0a, $20, $21, $22, $23, $1d, $24, $25, $26
.frame3
	db $01 ; bitmask
	db $00, $1d, $27, $1f, $28, $29, $2a, $2b, $23, $00, $2c, $2d, $2e
.frame4
	db $02 ; bitmask
	db $2f
