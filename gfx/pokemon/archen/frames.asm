	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
.frame1
	db $00 ; bitmask
	db $24, $25, $26, $27, $28, $29, $2a, $2b
.frame2
	db $01 ; bitmask
	db $04, $2c, $2d, $2e, $2f, $30, $31, $32, $24, $25, $33, $34, $35, $36, $37, $04, $38, $39, $3a, $04, $3b, $3c
.frame3
	db $02 ; bitmask
	db $24, $25, $36
.frame4
	db $03 ; bitmask
	db $04, $3d, $3e, $2e, $04, $3f, $40, $24, $25, $36, $37, $04, $38, $39, $3a, $04, $3b, $3c
