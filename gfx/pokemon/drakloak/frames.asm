	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
	dw .frame5
	dw .frame6
.frame1
	db $00 ; bitmask
	db $24, $25, $26, $02, $27, $28, $29, $2a, $2b, $2c, $2d, $2e, $2f, $30, $31, $32, $33
.frame2
	db $01 ; bitmask
	db $34, $35, $36, $02, $37, $38, $2a, $2b, $2d, $2e, $2f, $30, $31, $32, $33
.frame3
	db $02 ; bitmask
	db $2a, $2b, $2d, $2e, $2f, $30, $31, $32, $33
.frame4
	db $03 ; bitmask
	db $39, $3a, $3b, $3c
.frame5
	db $04 ; bitmask
	db $3d, $3e
.frame6
	db $05 ; bitmask
	db $3f, $40, $41, $42, $43, $44
