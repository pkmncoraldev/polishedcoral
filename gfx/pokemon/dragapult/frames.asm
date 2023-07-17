	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
	dw .frame5
	dw .frame6
.frame1
	db $00 ; bitmask
	db $31, $32, $33, $34, $35, $36, $37, $38, $39, $3a, $3b, $3c, $3d, $3e, $3f, $40, $41, $42, $43
.frame2
	db $01 ; bitmask
	db $44, $45, $46, $47, $48, $3e
.frame3
	db $02 ; bitmask
	db $49, $4a, $4b, $4c, $4d, $4e, $4f, $46, $47, $48, $3e
.frame4
	db $03 ; bitmask
	db $50, $51, $52, $53, $54, $55, $56, $46, $47, $48, $3e
.frame5
	db $00 ; bitmask
	db $31, $32, $33, $34, $57, $36, $37, $38, $58, $59, $3b, $3c, $5a, $5b, $3f, $40, $41, $42, $43
.frame6
	db $00 ; bitmask
	db $31, $32, $33, $5c, $5d, $36, $37, $38, $5e, $59, $3b, $3c, $5f, $5b, $3f, $40, $41, $42, $43
