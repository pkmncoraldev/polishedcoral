BarBackAlley_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, BarBackAlleyCallback

	db 6 ; warp events
	warp_event  4,  5, DUSK_TURNPIKE, 16
	warp_event  4,  6, DUSK_TURNPIKE, 16
	warp_event  4,  7, DUSK_TURNPIKE, 16
	warp_event 13,  5, DUSK_TURNPIKE, 17
	warp_event 13,  6, DUSK_TURNPIKE, 17
	warp_event 13,  7, DUSK_TURNPIKE, 17

	db 0 ; coord events

	db 6 ; bg events
	signpost  7,  6, SIGNPOST_READ, BarBackAlleyTrashcan1
	signpost  7,  9, SIGNPOST_READ, BarBackAlleyTrashcan2
	signpost  7, 10, SIGNPOST_READ, BarBackAlleyTrashcan3
	signpost  7,  7, SIGNPOST_JUMPTEXT, BarBackAlleyJunkText
	signpost  7,  8, SIGNPOST_JUMPTEXT, BarBackAlleyJunkText
	signpost  7, 11, SIGNPOST_JUMPTEXT, BarBackAlleyJunkText

	db 3 ; object events
	person_event SPRITE_PIGTAILS,  6,  9, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, BarBackAlleyFelicia, EVENT_SAVED_FELICIA
	person_event SPRITE_SUNBATHER,  8,  9, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ALWAYS_SET
	person_event SPRITE_PIGTAILS,  6,  9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, BarBackAlleyFelicia, EVENT_ALWAYS_SET
	

	const_def 1 ; object constants
	const BAR_BACK_ALLEY_FELICIA
	const BAR_BACK_ALLEY_MEOWTH
	const BAR_BACK_ALLEY_FELICIA2

BarBackAlleyCallback:
	disappear BAR_BACK_ALLEY_MEOWTH
	checkevent EVENT_BACK_ALLEY_TRASHCAN_1
	iffalse .no1
	changeblock $06, $06, $ce
.no1
	checkevent EVENT_BACK_ALLEY_TRASHCAN_2
	iffalse .no2
	changeblock $08, $06, $d2
.no2
	checkevent EVENT_BACK_ALLEY_TRASHCAN_3
	iffalse .no3
	changeblock $0a, $06, $ce
.no3
	checkevent EVENT_ROUTE_22_TRASHCAN
	iffalse .end
	changeblock $02, $08, $e7
.end
	return
	
BarBackAlleyTrashcan1:
	checkevent EVENT_BACK_ALLEY_TRASHCAN_1
	iftrue BarBackAlleyTrashcanOnlyTrash
	changeblock $06, $06, $ce
	setevent EVENT_BACK_ALLEY_TRASHCAN_1
	jump BarBackAlleyTrashcanEnd
	
BarBackAlleyTrashcan2:
	checkevent EVENT_BACK_ALLEY_TRASHCAN_2
	iftrue BarBackAlleyTrashcanOnlyTrash
	changeblock $08, $06, $d2
	setevent EVENT_BACK_ALLEY_TRASHCAN_2
	jump BarBackAlleyTrashcanEnd
	
BarBackAlleyTrashcan3:
	checkevent EVENT_BACK_ALLEY_TRASHCAN_3
	iftrue BarBackAlleyTrashcanOnlyTrash
	changeblock $0a, $06, $ce
	setevent EVENT_BACK_ALLEY_TRASHCAN_3
	
BarBackAlleyTrashcanEnd:
	opentext
	writetext BarBackAlleyTrashcanText
	playsound SFX_SANDSTORM
	waitsfx
	buttonsound
	callasm BarBackAlleyTrashcanAsm
	closetext
	end
	
BarBackAlleyFelicia:
	checkevent EVENT_LOST_GIRLS_QUEST_ACTIVE
	iftrue .time_to_save
	faceplayer
	opentext
	writetext BarBackAlleyFeliciaText1
	waitbutton
	closetext
	setlasttalked BAR_BACK_ALLEY_MEOWTH
	spriteface BAR_BACK_ALLEY_FELICIA, DOWN
	pause 7
	opentext
	writetext BarBackAlleyFeliciaText3
	waitbutton
	closetext
	end
.time_to_save
	faceplayer
	opentext
	writetext BarBackAlleyFeliciaText2
	waitbutton
	closetext
	setlasttalked BAR_BACK_ALLEY_MEOWTH
	spriteface BAR_BACK_ALLEY_FELICIA, DOWN
	pause 7
	appear BAR_BACK_ALLEY_FELICIA2
	opentext
	writetext BarBackAlleyFeliciaText3
	waitbutton
	closetext
	pause 20
	special SaveMusic
	special Special_FadeOutMusic
	pause 20
	changeblock $08, $06, $d2
	playsound SFX_VICEGRIP
	callasm GenericFinishBridge
	waitsfx
	disappear BAR_BACK_ALLEY_FELICIA
	clearevent EVENT_SAVED_FELICIA
	pause 30
	cry MEOWTH
	pause 7
	opentext
	writetext BarBackAlleyFeliciaText4
	waitbutton
	closetext
	appear BAR_BACK_ALLEY_MEOWTH
	playsound SFX_CUT
	applymovement BAR_BACK_ALLEY_MEOWTH, Movement_BarBackAlleyMeowth
	playsound SFX_RAZOR_WIND
	checkcode VAR_FACING
	ifequal RIGHT, .YouAreFacingRight
	spriteface BAR_BACK_ALLEY_FELICIA2, RIGHT
	applymovement BAR_BACK_ALLEY_FELICIA2, Movement_BarBackAlleyFelicia1
	jump .end
.YouAreFacingRight
	spriteface BAR_BACK_ALLEY_FELICIA2, LEFT
	applymovement BAR_BACK_ALLEY_FELICIA2, Movement_BarBackAlleyFelicia2
.end
	checkcode VAR_FACING
	ifequal DOWN, .YouAreFacingDown2
	ifequal LEFT, .YouAreFacingLeft2
;.YouAreFacingRight2
	pause 5
	spriteface BAR_BACK_ALLEY_MEOWTH, LEFT
	pause 5
	jump .end2
.YouAreFacingLeft2
	pause 5
	spriteface BAR_BACK_ALLEY_MEOWTH, RIGHT
	pause 5
	jump .end2
.YouAreFacingDown2
	pause 10
.end2
	opentext
	writetext BarBackAlleyMeowthText1
	waitbutton
	closetext
	pause 15
	opentext
	writetext BarBackAlleyMeowthText2
	cry MEOWTH
	buttonsound
	farwritetext StdBlankText
	pause 6
	writetext BarBackAlleyMeowthText3
	waitbutton
	closetext
	waitsfx
	setevent EVENT_ALWAYS_SET
	loadwildmon MEOWTH, 35
	writecode VAR_BATTLETYPE, BATTLETYPE_TRAP
	startbattle
	disappear BAR_BACK_ALLEY_MEOWTH
	reloadmapafterbattle
	special RestoreMusic
	checkcode VAR_MONJUSTCAUGHT
	if_equal MEOWTH, .CaughtMeowth
	opentext
	writetext BarBackAlleyMeowthTextGone
	waitbutton
	closetext
.CaughtMeowth
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	checkcode VAR_FACING
	ifequal RIGHT, .YouAreFacingRight2
	applymovement BAR_BACK_ALLEY_FELICIA2, Movement_BarBackAlleyFelicia3
	faceplayer
	opentext
	writetext BarBackAlleyFeliciaText5
	waitbutton
	closetext
	applymovement BAR_BACK_ALLEY_FELICIA2, Movement_BarBackAlleyFelicia5
	jump .end3
.YouAreFacingRight2
	applymovement BAR_BACK_ALLEY_FELICIA2, Movement_BarBackAlleyFelicia4
	faceplayer
	opentext
	writetext BarBackAlleyFeliciaText5
	waitbutton
	closetext
	applymovement BAR_BACK_ALLEY_FELICIA2, Movement_BarBackAlleyFelicia6
.end3
	disappear BAR_BACK_ALLEY_FELICIA
	disappear BAR_BACK_ALLEY_FELICIA2
	setevent EVENT_SAVED_FELICIA
	setevent EVENT_BACK_ALLEY_TRASHCAN_2
	callasm FeliciaSetNameAsm
	special Special_SaveLostGirl
	end
	
FeliciaSetNameAsm:
	ld hl, .feliciastring
	ld bc, PKMN_NAME_LENGTH
	ld de, wStringBuffer1
	rst CopyBytes
	ret
	
.feliciastring:
	db "FELICIA@@@@"
	
BarBackAlleyTrashcanEmpty:
	jumptext BarBackAlleyTrashcanTextEmpty
	
BarBackAlleyTrashcanOnlyTrash:
	jumptext BarBackAlleyTrashcanTextOnlyTrash
	
BarBackAlleyTrashcanAsm:
	farjp LusterTrashcanAsm
	
BarBackAlleyTrashcanText:
	text "<PLAYER> dug"
	line "through the trash…"
	
	para "Rustle… rustle…"
	done
	
BarBackAlleyTrashcanTextOnlyTrash:
	text "Nope, <WAIT_S>there's"
	line "only trash here."
	done
	
BarBackAlleyTrashcanTextEmpty:
	text "It's empty…"
	done
	
BarBackAlleyJunkText:
	text "A pile of trash."
	
	para "Gross!"
	done
	
BarBackAlleyFeliciaText1:
	text "Oh, hi."
	
	para "I know I'm not"
	line "supposed to be"
	cont "here."
	
	para "I saw a kitty-cat"
	line "back here earlier."
	
	para "It was so cute!"
	
	para "I wanna pet it!"
	done
	
BarBackAlleyFeliciaText2:
	text "FELICIA: Oh, hi."
	
	para "I know I'm not"
	line "supposed to be"
	cont "here."
	
	para "I saw a kitty-cat"
	line "back here earlier."
	
	para "It was so cute!"
	
	para "I wanna pet it!"
	done
	
BarBackAlleyFeliciaText3:
	text "Here kitty"
	line "kitty!"
	done
	
BarBackAlleyFeliciaText4:
	text "EEEEEKKKK!<WAIT_M>"
	line "Bad kitty!"
	done
	
BarBackAlleyFeliciaText5:
	text "Thank you."
	
	para "The kitty gave me"
	line "a scratch, <WAIT_S>but I'm"
	cont "ok."
	
	para "I guess it didn't"
	line "want to be my"
	cont "friend…"
	
	para "I'm gonna go home"
	line "now!"
	
	para "Bye bye!"
	done
	
BarBackAlleyMeowthText1:
	text "MEOWTH glares"
	line "angrily…"
	done
	
BarBackAlleyMeowthText2:
	text "MEOWTH: Mee!<WAIT_S>"
	line "Owth!"
	done
	
BarBackAlleyMeowthText3:
	text "MEOWTH attacks!"
	done
	
BarBackAlleyMeowthTextGone:
	text "MEOWTH scrambled"
	line "away quickly!"
	done
	
Movement_BarBackAlleyMeowth:
	fix_facing
	set_sliding
	jump_step_up
	remove_sliding
	remove_fixed_facing
	step_end
	
Movement_BarBackAlleyFelicia1:
	fix_facing
	jump_step_left
	remove_fixed_facing
	step_end
	
Movement_BarBackAlleyFelicia2:
	fix_facing
	jump_step_right
	remove_fixed_facing
	step_end
	
Movement_BarBackAlleyFelicia3:
	step_right
	step_right
	step_end
	
Movement_BarBackAlleyFelicia4:
	step_left
	step_left
	step_end
	
Movement_BarBackAlleyFelicia5:
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end
	
Movement_BarBackAlleyFelicia6:
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end
	