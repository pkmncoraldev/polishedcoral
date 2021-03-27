	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
	dw .frame5
	dw .frame6
	dw .frame7
.frame1
	db $00 ; bitmask
	db $31, $32, $33, $34, $35, $36, $37, $38, $39, $3a, $3b, $3c, $3d
.frame2
	db $01 ; bitmask
	db $3e, $3f, $31, $32, $33, $34, $35, $36, $37, $38, $39, $3a, $3b, $3c, $3d
.frame3
	db $02 ; bitmask
	db $40, $41, $42, $43, $34, $35, $36, $37, $38, $39, $3a, $3b, $3c, $3d
.frame4
	db $03 ; bitmask
	db $40, $44, $45, $46, $47, $43, $48, $49, $4a, $4b, $4c, $4d, $4e, $4f, $39, $3a, $50, $51, $52
.frame5
	db $04 ; bitmask
	db $31
.frame6
	db $05 ; bitmask
	db $53, $54, $55, $31, $56
.frame7
	db $06 ; bitmask
	db $3e, $3f
