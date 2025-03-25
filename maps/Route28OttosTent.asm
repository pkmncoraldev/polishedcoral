Route28OttosTent_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 5, 2, 3, ROUTE_28
	warp_def 5, 1, 3, ROUTE_28

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	person_event SPRITE_ELDER,  3,  2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route28OttosTentOtto, -1
	object_event  1,  3, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, TOGEPI, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, Route28OttosTentTogepi, -1
	
Route28OttosTentOtto:
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
	closewindow
	writetext Route28OttosTentOttoText7
	waitbutton
	closetext
	jump .end
.rest
	closewindow
	farwritetext StdBlankText
	pause 6
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
.end
	setevent EVENT_TALKED_TO_OTTO
	clearevent EVENT_OTTO_TALKS_ABOUT_RIVAL
	end
	
.Route28OttosTentOttoMenuData
	db $40 ; flags
	db 00, 00 ; start coords
	db 07, 19 ; end coords
	dw .MenuData2Route28OttosTentOtto
	db 1 ; default option
; 0x48e04

.MenuData2Route28OttosTentOtto:
	db $80 ; flags
	db 3 ; items
	db "REST@"
	db "SHOP@"
	db "NO THANKS@"

Route28OttosTentOttoText1:
	text "NORMAL"
	done

Route28OttosTentOttoText2:
	text "DONE SHOP"
	done
	
Route28OttosTentOttoText3:
	text "REG. INTRO"
	done

Route28OttosTentOttoText4:
	text "WHAT DO YOU WANT?"
	done
	
Route28OttosTentOttoText5:
	text "RIVAL INTRO"
	done
	
Route28OttosTentOttoText6:
	text "SHOP"
	done
	
Route28OttosTentOttoText7:
	text "NO THANKS"
	done
	
Route28OttosTentOttoText8:
	text "REST"
	done
	
Route28OttosTentOttoText9:
	text "JUST SLEPT"
	done
	
Route28OttosTentOttoText10:
	text "JUST SHOPPED"
	done
	
Route28OttosTentOttoText11:
	text "SKIP INTRO"
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
	