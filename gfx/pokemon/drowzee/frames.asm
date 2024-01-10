	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
	dw .frame5
	dw .frame6
	dw .frame7
	dw .frame8
	dw .frame9
.frame1
	db $00 ; bitmask
	db $24
.frame2
	db $01 ; bitmask
	db $25, $26, $27, $28, $29, $2a
.frame3
	db $02 ; bitmask
	db $2b, $2c, $2d, $2e, $2f, $30, $25, $26, $27, $28, $29, $2a
.frame4
	db $03 ; bitmask
	db $2b, $2c, $2d, $2e, $2f, $30, $24, $31, $32, $33, $28, $34, $35
.frame5
	db $03 ; bitmask
	db $36, $37, $38, $39, $3a, $3b, $24, $3c, $3d, $3e, $3f, $40, $41
.frame6
	db $02 ; bitmask
	db $36, $37, $38, $39, $3a, $3b, $24, $42, $43, $44, $45, $46
.frame7
	db $02 ; bitmask
	db $00, $47, $48, $39, $49, $4a, $24, $42, $43, $44, $45, $46
.frame8
	db $04 ; bitmask
	db $00, $47, $48, $39, $49, $4a, $24
.frame9
	db $05 ; bitmask
	db $4b, $4c
