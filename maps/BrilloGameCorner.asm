BrilloGameCorner_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  8,  9, BRILLO_MART, 3
	warp_event  9,  9, BRILLO_MART, 3

	db 0 ; coord events

	db 8 ; bg events
	signpost  4,  6, SIGNPOST_READ, BrilloGameCornerNpc5_2
	signpost  5,  7, SIGNPOST_READ, BrilloGameCornerTableWrong
	signpost  5,  6, SIGNPOST_READ, BrilloGameCornerTableWrong
	signpost  6,  6, SIGNPOST_READ, BrilloGameCornerMoogooMankey
	signpost  6,  7, SIGNPOST_READ, BrilloGameCornerMoogooMankey
	signpost  2,  2, SIGNPOST_LEFT, BrilloGameCornerCardFlip
	signpost  6,  1, SIGNPOST_READ, BrilloGameCornerSlotsBlue
	signpost  7,  1, SIGNPOST_READ, BrilloGameCornerSlots

	db 13 ; object events
	object_event 12,  5, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, PERSONTYPE_COMMAND, jumpstd, gamecornercoinvendor, -1
	person_event SPRITE_GENTLEMAN,  2,  1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, BrilloGameCornerNpc1, -1
	person_event SPRITE_FAT_GUY,  8,  2, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, BrilloGameCornerNpc2, -1
	person_event SPRITE_POKEMANIAC,  6,  5, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, BrilloGameCornerNpc3, -1
	person_event SPRITE_REDS_MOM,  6,  8, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, BrilloGameCornerNpc4, -1
	person_event SPRITE_COOL_DUDE,  4,  7, SPRITEMOVEDATA_DEALER_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, BrilloGameCornerNpc5_1, -1
	person_event SPRITE_BEAUTY,  8, 12, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, BrilloGameCornerNpc6, -1
	person_event SPRITE_CASINO,  5,  6, SPRITEMOVEDATA_CARD_TABLE_1, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_CASINO,  5,  7, SPRITEMOVEDATA_CARD_TABLE_2, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_CASINO,  6,  6, SPRITEMOVEDATA_CARD_TABLE_3, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_CASINO,  6,  7, SPRITEMOVEDATA_CARD_TABLE_4, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_CASINO,  3,  8, SPRITEMOVEDATA_TILE_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_CASINO,  1,  2, SPRITEMOVEDATA_TILE_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1

	const_def 1 ; object constants
	const BRILLO_GAME_CORNER_CLERK
	const BRILLO_GAME_CORNER_NPC_1
	const BRILLO_GAME_CORNER_NPC_2
	const BRILLO_GAME_CORNER_NPC_3
	const BRILLO_GAME_CORNER_NPC_4
	const BRILLO_GAME_CORNER_NPC_5
	const BRILLO_GAME_CORNER_NPC_6
	

BrilloGameCornerNpc1:
	faceplayer
	opentext
	writetext BrilloGameCornerNpc1Text
	waitbutton
	closetext
	spriteface BRILLO_GAME_CORNER_NPC_1, RIGHT
	end
	
BrilloGameCornerNpc2:
	jumptext BrilloGameCornerNpc2Text
	
BrilloGameCornerNpc3:
	faceplayer
	opentext
	writetext BrilloGameCornerNpc3Text
	waitbutton
	closetext
	spriteface BRILLO_GAME_CORNER_NPC_3, RIGHT
	end
	
BrilloGameCornerNpc4:
	faceplayer
	opentext
	writetext BrilloGameCornerNpc4Text
	waitbutton
	closetext
	spriteface BRILLO_GAME_CORNER_NPC_4, LEFT
	end
	
BrilloGameCornerNpc5_1:
	applymovement BRILLO_GAME_CORNER_NPC_5, Movement_BrilloGameCornerNpc5Right
	jump BrilloGameCornerNpc5
BrilloGameCornerNpc5_2:
	applymovement BRILLO_GAME_CORNER_NPC_5, Movement_BrilloGameCornerNpc5Left
BrilloGameCornerNpc5:
	opentext
	writetext BrilloGameCornerNpc5Text1
	waitbutton
	closetext
	applymovement BRILLO_GAME_CORNER_NPC_5, Movement_BrilloGameCornerNpc5Down
	end
	
BrilloGameCornerMoogooMankey:
	opentext
	writetext BrilloGameCornerMoogooMankeyText
	special Special_DisplayCoinCaseBalance
.menu
	loadmenudata MenuDataHeader_Games
	verticalmenu
	closewindow
	if_equal $1, .yes
	if_equal $3, .rules
	endtext
.yes
	checkcoins 49
	ifequal $0, .havecoins
	writetext BrilloGameCornerMoogooMankeyTextNoCoins
	waitbutton
	endtext
.havecoins
	takecoins 50
	special Special_DisplayCoinCaseBalance
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	pause 10
	closetext
	special Special_MoogooMankey
	if_equal $1, .win
	if_equal $2, .tie
.lose
	opentext
	writetext BrilloGameCornerMoogooMankeyTextLose
	waitbutton
	endtext
.win
	opentext
	writetext BrilloGameCornerMoogooMankeyTextWin
	special Special_DisplayCoinCaseBalance
	loadmenudata MenuDataHeader_Games
	closewindow
	waitbutton
	givecoins 125
	special Special_DisplayCoinCaseBalance
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	pause 10
	endtext
.tie
	opentext
	writetext BrilloGameCornerMoogooMankeyTextTie
	special Special_DisplayCoinCaseBalance
	loadmenudata MenuDataHeader_Games
	closewindow
	waitbutton
	givecoins 50
	special Special_DisplayCoinCaseBalance
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	pause 10
	endtext
.rules
	writetext BrilloGameCornerMoogooMankeyTextRules
	jump .menu
	
MenuDataHeader_Games:
	db $40 ; tile backup
	db  5, 0 ; start coords
	db 12, 8 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2
	db $80 ; flags
	db 3
	db "YES@"
	db "NO@"
	db "RULES@"
	
BrilloGameCornerTableWrong:
	opentext
	writetext BrilloGameCornerNpc5Text2
	waitbutton
	closetext
	end
	
BrilloGameCornerNpc6:
	faceplayer
	opentext
	writetext BrilloGameCornerNpc6Text
	waitbutton
	closetext
	spriteface BRILLO_GAME_CORNER_NPC_6, UP
	end
	
BrilloGameCornerCardFlip:
	opentext
	writetext BrilloGameCornerCardFlipText
.menu
	loadmenudata MenuDataHeader_Games
	verticalmenu
	closewindow
	if_equal $1, .yes
	if_equal $3, .rules
	endtext
.yes
	special Special_CardFlip
	endtext
.rules
	writetext BrilloGameCornerCardFlipTextRules
	jump .menu
	
BrilloGameCornerSlotsBlue:
	callasm BrilloGameCornerSetBlueFlagAsm
BrilloGameCornerSlots:
	opentext
	writetext BrilloGameCornerSlotsText
.menu
	loadmenudata MenuDataHeader_Games
	verticalmenu
	closewindow
	if_equal $1, .yes
	if_equal $3, .rules
.no
	callasm BrilloGameCornerClearBlueFlagAsm
	endtext
.yes
	random $6
	ifequal $0, BrilloGameCornerSlotsRare
	refreshscreen
	writebyte $0
	special Special_SlotMachine
	jump .no
.rules
	writetext BrilloGameCornerSlotsTextRules
	jump .menu
	
BrilloGameCornerSlotsRare:
	refreshscreen
	writebyte $1
	special Special_SlotMachine
	callasm BrilloGameCornerClearBlueFlagAsm
	endtext
	
BrilloGameCornerSetBlueFlagAsm:
	ld a, 1
	ld [wPlaceBallsY], a
	ret	
	
BrilloGameCornerClearBlueFlagAsm:
	xor a
	ld [wPlaceBallsY], a
	ret	
	
BrilloGameCornerMoogooMankeyText:
	text "MOOGOO MANKEY."
	
	para "Play with 50"
	line "COINs?"
	done
	
BrilloGameCornerMoogooMankeyTextRules:
	text "RULES"
	done
	
BrilloGameCornerMoogooMankeyTextNoCoins:
	text "You don't have"
	line "enough COINs to"
	cont "play!"
	done
	
BrilloGameCornerMoogooMankeyTextWin:
	text "Congratulations!"
	
	para "You get 125 COINs!"
	done
	
BrilloGameCornerMoogooMankeyTextTie:
	text "Oh you tied!"
	
	para "You get your COINs"
	line "back!"
	
	para "Better luck next"
	line "time!"
	done
	
BrilloGameCornerMoogooMankeyTextLose:
	text "Better luck next"
	line "time!"
	done
	
BrilloGameCornerSlotsText:
	text "Play SLOTS?"
	done
	
BrilloGameCornerSlotsTextRules:
	text "RULES"
	done
	
BrilloGameCornerCardFlipText:
	text "Play CARD FLIP?"
	done
	
BrilloGameCornerCardFlipTextRules:
	text "RULES"
	done
	
BrilloGameCornerNpc1Text:
	text "Take a seat over"
	line "there if you want"
	cont "to play CARD FLIP."
	done
	
BrilloGameCornerNpc2Text:
	text "…"
	
	para "…"
	
	para "…"
	
	para "…"
	
	para "He's totally"
	line "engrossed…"
	done
	
BrilloGameCornerNpc3Text:
	text "The next game is"
	line "about to start!"
	
	para "Let's go already!"
	done
	
BrilloGameCornerNpc4Text:
	text "I'm on a hot"
	line "streak, baby!"
	
	para "Mama needs a new"
	line "pair of shoes!"
	done
	
BrilloGameCornerNpc5Text1:
	text "We need 1 more for"
	line "MOOGOO MANKEY."
	
	para "Please go to the"
	line "other side of the"
	cont "table if you want"
	cont "to play."
	done
	
BrilloGameCornerNpc5Text2:
	text "You can't play"
	line "from over here!"
	
	para "Head to the other"
	line "side of the table"
	cont "to play."
	done
	
BrilloGameCornerNpc6Text:
	text "Buy me a drink?"
	
	para "…"
	
	para "What?"
	
	para "I should buy my"
	line "own drink?"
	
	para "That's not how"
	line "this works…"
	done
	
Movement_BrilloGameCornerNpc5Left:
	step_dealer_left
	step_end
	
Movement_BrilloGameCornerNpc5Right:
	step_dealer_right
	step_end
	
Movement_BrilloGameCornerNpc5Down:
	step_dealer_down
	step_end
