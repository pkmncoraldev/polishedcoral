	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
	dw .frame5
	dw .frame6
.frame1
	db $00 ; bitmask
	db $24, $25, $26, $27, $28, $29, $2a, $2b, $2c, $2d, $2e, $2f, $30, $31, $32, $33, $00, $34, $35
.frame2
	db $01 ; bitmask
	db $36, $29, $2a, $2d, $2e, $33
.frame3
	db $02 ; bitmask
	db $37, $38, $36, $39, $29, $2a, $3a, $3b, $2d, $2e, $3c, $3d, $33
.frame4
	db $03 ; bitmask
	db $24, $25, $26, $27, $3e, $2a, $2b, $2c, $2d, $2e, $2f, $30, $31, $32, $33, $00, $34, $35
.frame5
	db $04 ; bitmask
	db $37, $38, $39, $2a, $3a, $3b, $2d, $2e, $3c, $3d, $33
.frame6
	db $05 ; bitmask
	db $37, $38, $39, $3a, $3b, $3c, $3d
