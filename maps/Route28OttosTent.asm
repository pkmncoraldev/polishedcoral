Route28OttosTent_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 5, 2, 3, ROUTE_28
	warp_def 5, 1, 3, ROUTE_28

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	person_event SPRITE_OTTO,  3,  2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Route28OttosTentOtto, -1
	object_event  1,  3, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, TOGEPI, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, Route28OttosTentTogepi, -1
	
Route28OttosTentOtto:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8
	iftrue .just_shopped
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_7
	iftrue .just_slept
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
	iftrue .skip_intro
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
	checkevent EVENT_TALKED_TO_OTTO
	iftrue .normal
	checkevent EVENT_OTTO_TALKS_ABOUT_RIVAL
	iftrue .talk_about_rival
	writetext Route28OttosTentOttoText3
	jump .cont
.just_shopped
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8
	writetext Route28OttosTentOttoText10
	jump .cont
.just_slept
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_7
	writetext Route28OttosTentOttoText9
	jump .cont
.normal
	writetext Route28OttosTentOttoText1
	jump .cont
.talk_about_rival
	writetext Route28OttosTentOttoText5
.cont
	buttonsound
	farwritetext StdBlankText
	pause 6
.skip_intro
	writetext Route28OttosTentOttoText4
	loadmenu .Route28OttosTentOttoMenuData
	verticalmenu
	if_equal $1, .rest
	if_equal $2, .shop
	if_equal $3, .advice
	closewindow
	writetext Route28OttosTentOttoText7
	waitbutton
	closetext
	jump .end
.rest
	closewindow
	writetext Route28OttosTentOttoText8
	waitbutton
	closetext
	special FadeOutPalettesBlack
	special HealParty
	special SaveMusic
	playmusic MUSIC_HEAL
	checkcode VAR_FACING
	ifequal UP, .YouAreFacingUp
	ifequal LEFT, .YouAreFacingLeft
	applymovement PLAYER, Movement_Route28OttosTent3
	jump .rest_cont
.YouAreFacingUp
	applymovement PLAYER, Movement_Route28OttosTent1
	jump .rest_cont
.YouAreFacingLeft
	applymovement PLAYER, Movement_Route28OttosTent2
.rest_cont
	applyonemovement PLAYER, remove_fixed_facing
	pause 55
	special RestoreMusic
	callasm LoadMapPals
	special FadeInPalettes
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_7
	jump .end
.shop
	closewindow
	writetext Route28OttosTentOttoText6
	waitbutton
	callasm OttoAsm
	writetext Route28OttosTentOttoText2
	waitbutton
	closetext
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8
	jump .end
.advice
	closewindow
	writetext Route28OttosTentOttoText11
	waitbutton
	closetext
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
.end
	setevent EVENT_TALKED_TO_OTTO
	clearevent EVENT_OTTO_TALKS_ABOUT_RIVAL
	end
	
.Route28OttosTentOttoMenuData
	db $40 ; flags
	db 00, 00 ; start coords
	db 09, 12 ; end coords
	dw .MenuData2Route28OttosTentOtto
	db 1 ; default option
; 0x48e04

.MenuData2Route28OttosTentOtto:
	db $80 ; flags
	db 4 ; items
	db "REST@"
	db "HOLISTICS@"
	db "ADVICE@"
	db "BYE@"

Route28OttosTentOttoText1:
	text "Hey, hey!"
	
	para "Good to see ya,"
	line "again!"
	done

Route28OttosTentOttoText2:
	text "You don't have"
	line "any allergies,"
	cont "right?"
	done
	
Route28OttosTentOttoText3:
	text "Hey, maaan!"
	line "The name's OTTO!"
	
	para "Come on in!"
	
	para "My travels bring"
	line "me all over the"
	cont "place, man."
	
	para "No matter where I"
	line "go, Mother Nature"
	cont "takes good care."
	
	para "You need a spot"
	line "to crash, or some"
	cont "holistics, just"
	cont "say so, my friend."
	
	para "I'm always open"
	line "to share the love"
	cont "with a fellow"
	cont "traveler."
	done

Route28OttosTentOttoText4:
	text "So, whatcha need,"
	line "man?"
	done
	
Route28OttosTentOttoText5:
	text "Woah, hey!"
	
	para "I don't want no"
	line "trouble, man!"
	
	para "…"
	
	para "You aren't with"
	line "those other dudes?"
	
	para "Oh, groovy, man."
	
	para "I offered to let"
	line "them crash for a"
	cont "while, but they"
	cont "were in a rush."
	
	para "Before they left,"
	line "they stole some"
	cont "of my herbs, too…"
	
	para "Not cool!"
	
	para "Anyway, the name's"
	line "OTTO."
	
	para "My travels bring"
	line "me all over the"
	cont "place, man."
	
	para "No matter where I"
	line "go, Mother Nature"
	cont "takes good care."
	
	para "You need a spot"
	line "to crash, or some"
	cont "holistics, just"
	cont "say so, my friend."
	
	para "I'm always open"
	line "to share the love"
	cont "with a fellow"
	cont "traveler."
	done
	
Route28OttosTentOttoText6:
	text "Lookin' for some"
	line "holistics, man?"
	done
	
Route28OttosTentOttoText7:
	text "Don't be a"
	line "stranger, man."
	done
	
Route28OttosTentOttoText8:
	text "No worries."
	
	para "Mi tent es"
	line "su tent!"
	done
	
Route28OttosTentOttoText9:
	text "Man, you were out"
	line "like light!"
	done
	
Route28OttosTentOttoText10:
	text "Need anything"
	line "else?"
	
	para "Can never have"
	line "too many herbs,"
	cont "you know?"
	done
	
Route28OttosTentOttoText11:
	text "You want my"
	line "advice, dude?"
	
	para "Stay away from"
	line "that crazy town"
	cont "up NORTH."
	
	para "BRIGHTBURG."
	
	para "Those people may"
	line "just seem rude,"
	cont "but it's more than"
	cont "that…"
	
	para "I'm telling you,"
	line "all isn't what it"
	cont "seems…"
	
	para "That place freaks"
	line "me out, man!"
	done

OttoAsm:
	ld a, MARTTYPE_BARTENDER
	ld c, a
	ld a, MART_OTTO
	ld e, a
	ld d, 0
	ld a, [wScriptBank]
	ld b, a
	farcall OpenMartDialog
	ret

Route28OttosTentTogepi:
	opentext
	writetext Route28OttosTentTogepiText
	cry TOGEPI
	waitbutton
	closetext
	end

Route28OttosTentTogepiText:
	text "TOGEPI: Prrrrri!"
	done
	
Movement_Route28OttosTent1:
	big_step_right
	big_step_up
Movement_Route28OttosTent2:
	big_step_up
	turn_step_down
	step_end
	
Movement_Route28OttosTent3:
	big_step_right
	turn_step_down
	step_end
	