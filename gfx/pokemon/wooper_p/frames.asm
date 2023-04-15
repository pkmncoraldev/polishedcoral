	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
.frame1
	db $00 ; bitmask
	db $19, $1a, $1b, $1c, $1d
.frame2
	db $01 ; bitmask
	db $1e, $1f, $20, $21, $1b, $1c, $00, $22, $1d, $23, $24, $25
.frame3
	db $02 ; bitmask
	db $1e, $1f, $26, $00, $22, $23, $24, $25
.frame4
	db $03 ; bitmask
	db $27, $28
