	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
	dw .frame5
	dw .frame6
	dw .frame7
.frame1
	db $00 ; bitmask
	db $24, $25, $00, $26, $27, $28, $29, $2a, $2b, $2c, $2d, $2e, $2f
.frame2
	db $01 ; bitmask
	db $24, $25, $00, $26, $27, $28, $29, $2a, $00, $30, $31, $2c, $2d, $32, $33, $34, $2f, $35, $36, $37
.frame3
	db $01 ; bitmask
	db $24, $25, $00, $26, $27, $28, $29, $2a, $00, $30, $2b, $2c, $2d, $38, $39, $3a, $2f, $00, $3b, $3c
.frame4
	db $02 ; bitmask
	db $24, $25, $00, $26, $27, $28, $29, $2a, $00, $3d, $2b, $2c, $2d, $3e, $3f, $2e, $2f, $40, $41
.frame5
	db $03 ; bitmask
	db $00, $30, $32, $33, $42, $35, $36, $37
.frame6
	db $03 ; bitmask
	db $00, $30, $38, $39, $43, $00, $3b, $3c
.frame7
	db $04 ; bitmask
	db $00, $3d, $3e, $3f, $40, $41
