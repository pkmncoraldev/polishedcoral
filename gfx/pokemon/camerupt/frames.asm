	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
.frame1
	db $00 ; bitmask
	db $31, $32, $33, $34, $35, $36, $37, $38, $39, $3a, $3b, $3c, $3d, $3e, $3f, $40, $41, $42, $43, $44, $45
.frame2
	db $01 ; bitmask
	db $33, $34, $35, $38, $39, $3a, $46, $47, $3e, $3f, $40, $41, $42, $43, $44, $45
.frame3
	db $02 ; bitmask
	db $33, $34, $35, $38, $39, $3a, $46, $47, $3e, $3f, $40, $41, $48, $49, $43, $44, $4a, $4b, $4c
.frame4
	db $03 ; bitmask
	db $4d, $4e, $4f, $50, $51
