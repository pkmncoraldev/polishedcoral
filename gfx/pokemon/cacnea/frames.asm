	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
	dw .frame5
	dw .frame6
.frame1
	db $00 ; bitmask
	db $24, $25, $26, $27
.frame2
	db $01 ; bitmask
	db $00, $28, $29, $00, $2a, $2b, $24, $25, $26, $27
.frame3
	db $02 ; bitmask
	db $00, $2c, $2d, $2e, $00, $2f, $30, $31, $32, $33, $34, $35, $36, $37
.frame4
	db $03 ; bitmask
	db $00, $2c, $2d, $2e, $00, $2f, $30, $31, $38, $39, $3a, $32, $33, $34, $35, $36, $37
.frame5
	db $04 ; bitmask
	db $00, $28, $29, $00, $2a, $2b
.frame6
	db $05 ; bitmask
	db $3b, $3c, $3d, $00, $3e
