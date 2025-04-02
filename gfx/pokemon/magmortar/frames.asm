	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
	dw .frame5
.frame1
	db $00 ; bitmask
	db $31, $32, $33, $34, $35, $36, $37, $38, $39, $3a, $3b, $3c, $3d, $3e, $3f, $40, $41
.frame2
	db $01 ; bitmask
	db $42, $43, $44, $45, $46, $47, $48, $49, $4a, $4b, $4c, $3e, $3f, $40, $41
.frame3
	db $02 ; bitmask
	db $42, $43, $44, $45, $4d, $4e, $46, $47, $48, $49, $4f, $50, $4a, $4b, $4c, $3e, $3f, $40, $41, $51, $52
.frame4
	db $03 ; bitmask
	db $3e, $3f, $40, $41
.frame5
	db $04 ; bitmask
	db $53, $54, $55
