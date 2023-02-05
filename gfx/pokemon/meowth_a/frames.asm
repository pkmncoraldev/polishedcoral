	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
.frame1
	db $00 ; bitmask
	db $19, $1a, $1b
.frame2
	db $01 ; bitmask
	db $1c, $1d, $1e, $1f, $20, $21, $22
.frame3
	db $01 ; bitmask
	db $23, $24, $1e, $25, $26, $21, $27
.frame4
	db $02 ; bitmask
	db $1e, $28, $29, $2a
