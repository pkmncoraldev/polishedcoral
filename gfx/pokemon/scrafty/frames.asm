	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
	dw .frame5
.frame1
	db $00 ; bitmask
	db $31, $32, $33, $34, $35, $36, $37, $38, $39, $3a, $3b
.frame2
	db $01 ; bitmask
	db $31, $32, $3c, $3d, $3e, $33, $34, $3f, $40, $41, $42
.frame3
	db $02 ; bitmask
	db $31, $32, $33, $34
.frame4
	db $03 ; bitmask
	db $31, $32, $3c, $3d, $3e, $33, $34, $3f, $40, $41, $35, $43, $37, $38, $39, $3a, $3b
.frame5
	db $04 ; bitmask
	db $44, $45, $46, $47
