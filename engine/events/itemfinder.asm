ItemFinder: ; 12580
	ld hl, .scriptmenutest
	call QueueScript
	ld a, $1
	ld [wItemEffectSucceeded], a
	ret

.scriptmenutest
	refreshscreen $0
	loadmenudata .MenuDataHeader
	verticalmenu
	closewindow
	if_equal $1, .end
	if_equal $2, .end
	if_equal $3, .end
	if_equal $4, .end
	if_equal $5, .end
	if_equal $6, .end
	if_equal $7, .end
	endtext
	
.end
	opentext
	writetext ItemFinderFinishedText
	waitbutton
	closetext
	end
	
.MenuDataHeader: ; 0x48dfc
	db $40 ; flags
	db 00, 05 ; start coords
	db 16, 15 ; end coords
	dw .MenuData2
	db 1 ; default option
; 0x48e04

.MenuData2: ; 0x48e04
	db $80 ; flags
	db 7 ; items
	db "Red@"
	db "Blue@"
	db "Green@"
	db "Brown@"
	db "Purple@"
	db "Pink@"
	db "Yellow@"
	
ItemFinderFinishedText:
	text "done"
	done
