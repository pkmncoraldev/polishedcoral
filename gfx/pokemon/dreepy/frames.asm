	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
	dw .frame5
.frame1
	db $00 ; bitmask
	db $19, $1a, $1b, $1c, $1d, $1e
.frame2
	db $01 ; bitmask
	db $19, $1a, $1b, $1c, $1d, $1e, $1f, $20, $21, $22, $23, $24
.frame3
	db $02 ; bitmask
	db $19, $1a, $1b, $1c, $1d, $1e, $25, $26, $27, $28
.frame4
	db $03 ; bitmask
	db $29, $2a, $2b, $2c
.frame5
	db $04 ; bitmask
	db $2d, $2e, $2f, $30, $31
