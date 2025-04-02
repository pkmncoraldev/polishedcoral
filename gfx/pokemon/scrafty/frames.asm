	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
	dw .frame5
.frame1
	db $00 ; bitmask
	db $31, $32, $33, $34, $35, $36, $37, $38, $39, $3a
.frame2
	db $01 ; bitmask
	db $31, $3b, $3c, $3d, $32, $33, $3e, $3f, $40, $41, $42
.frame3
	db $02 ; bitmask
	db $31, $32, $33
.frame4
	db $03 ; bitmask
	db $31, $3b, $3c, $3d, $32, $33, $3e, $3f, $40, $43, $44, $36, $37, $38, $39, $3a
.frame5
	db $04 ; bitmask
	db $45, $46, $47
