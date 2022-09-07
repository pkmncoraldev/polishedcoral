	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
	dw .frame5
	dw .frame6
.frame1
	db $00 ; bitmask
	db $31, $32, $33, $34
.frame2
	db $01 ; bitmask
	db $35, $36, $37, $38, $39, $3a, $3b, $3c
.frame3
	db $02 ; bitmask
	db $3d, $3e, $3f, $40, $35, $36, $41, $42, $43, $38, $39, $44, $45, $00, $3b, $3c, $46, $47, $48, $49, $4a, $4b, $4c
.frame4
	db $03 ; bitmask
	db $35, $36, $41, $42, $43, $38, $39, $44, $45, $00, $3b, $3c, $46, $4d
.frame5
	db $04 ; bitmask
	db $4e, $4f, $50, $51, $00, $52, $53, $54, $55, $56, $35, $36, $41, $42, $43, $57, $38, $39, $44, $45, $00, $58, $3b, $3c, $46, $59, $5a, $5b, $4d, $5c, $5d, $5e, $5f
.frame6
	db $05 ; bitmask
	db $60, $61
