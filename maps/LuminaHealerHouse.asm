LuminaHealerHouse_MapScriptHeader:
	db 2 ; scene scripts
	scene_script LuminaHealerHouseTrigger0
	scene_script LuminaHealerHouseTrigger1

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, LuminaHealerHouseCallback

	db 2 ; warp events
	warp_def  9,  5, 1, LUMINA_TOWN
	warp_def  9,  4, 1, LUMINA_TOWN

	db 0 ; coord events

	db 16 ; bg events
	signpost  3,  2, SIGNPOST_JUMPTEXT, LuminaHealerHouseFireplaceText
	signpost  3,  3, SIGNPOST_JUMPTEXT, LuminaHealerHouseFireplaceText
	signpost  3,  0, SIGNPOST_JUMPTEXT, LuminaHealerHouseWoodText
	signpost  3,  1, SIGNPOST_JUMPTEXT, LuminaHealerHouseWoodText
	signpost  3,  6, SIGNPOST_JUMPTEXT, LuminaHealerHouseBarrelsText
	signpost  3,  4, SIGNPOST_JUMPTEXT, LuminaHealerHousePlatesText
	signpost  3,  5, SIGNPOST_JUMPTEXT, LuminaHealerHousePlatesText
	signpost  6,  0, SIGNPOST_JUMPTEXT, LuminaHealerHouseBarrelsText
	signpost  7,  0, SIGNPOST_JUMPTEXT, LuminaHealerHouseBarrelsText
	signpost  8,  2, SIGNPOST_JUMPTEXT, LuminaHealerHouseBarrelsText
	signpost  8,  8, SIGNPOST_JUMPTEXT, LuminaHealerHouseBarrelsText
	signpost  8,  9, SIGNPOST_JUMPTEXT, LuminaHealerHouseBarrelsText
	signpost  9,  2, SIGNPOST_JUMPTEXT, LuminaHealerHouseBarrelsText
	signpost  9,  8, SIGNPOST_JUMPTEXT, LuminaHealerHouseBarrelsText
	signpost  9,  9, SIGNPOST_JUMPTEXT, LuminaHealerHouseBarrelsText
	signpost -1, -1, SIGNPOST_JUMPTEXT, LuminaHealerHouseBarrelsText

	db 9 ; object events
	person_event SPRITE_COOL_DUDE,  5,  5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, LuminaHealerHouseHealer, -1
	person_event SPRITE_DAISY,  6,  2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, LuminaHealerHouseClerk, -1
	person_event SPRITE_RUSS,  3,  7, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LuminaHealerHouseRuss, EVENT_RUSS_GONE
	person_event SPRITE_POKEFAN_M,  7,  9, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LuminaHealerHouseNPC1, -1
	person_event SPRITE_SAILOR,  4,  9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LuminaHealerHouseBartender, -1
	person_event SPRITE_DARCY,  7,  7, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LuminaGymDarcy, EVENT_SALOON_DARCY_GONE
	person_event SPRITE_ELDER,  5,  7, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, LuminaGymElder, EVENT_SALOON_ELDER_GONE
	person_event SPRITE_COOL_DUDE,  5,  5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, LuminaHealerHouseHealer, EVENT_ALWAYS_SET
	person_event SPRITE_DAISY,  6,  2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, LuminaHealerHouseClerk, EVENT_ALWAYS_SET
	
	
LuminaHealerHouseTrigger0:
	end
	
LuminaHealerHouseTrigger1:
	priorityjump LuminaHealerHouseScene
	end
	
LuminaHealerHouseCallback:
	checkscene
	if_not_equal $1, .skip
	moveperson 1, -5, -5
	moveperson 2, -5, -5
	appear 8
	appear 9
.skip
	blackoutmod LUMINA_TOWN
	return
	
LuminaHealerHouseFireplaceText:
	text "Ah…<WAIT_S>"
	line "Toasty…"
	done
	
LuminaHealerHouseWoodText:
	text "A pile of neatly"
	line "stacked firewood."
	done
	
LuminaHealerHousePlatesText:
	text "Plates, forks,"
	line "knives…"
	
	para "The whole"
	line "shebang."
	done
	
LuminaHealerHouseBarrelsText:
	text "A sweet aroma"
	line "wafts from the"
	cont "barrel."
	
	para "Smells tasty!"
	done
	
LuminaHealerHouseScene:
	waitsfx
	spriteface 6, DOWN
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, 6, 15
	spriteface 7, DOWN
	applymovement 6, Movement_LuminaGymCutscene2
	opentext TEXTBOX_DARCY
	writetext LuminaGymPostDragonShrineDarcyText1
	waitbutton
	closetext
	pause 5
	applymovement PLAYER, Movement_LuminaGymCutscene3
	spriteface 6, LEFT
	opentext
	writetext LuminaGymPostDragonShrineGiveText
	takeitem DRAGON_STONE
	playsound SFX_LEVEL_UP 
	waitsfx
	closetext
	pause 5
	applyonemovement 6, turn_step_down
	opentext TEXTBOX_DARCY
	writetext LuminaGymPostDragonShrineDarcyText2
	waitbutton
	closetext
	pause 10
	applymovement PLAYER, Movement_LuminaGymCutscene8
	pause 35
	opentext TEXTBOX_ELDER
	writetext LuminaGymPostDragonShrineElderText1
	waitbutton
	closetext
	pause 5
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, 6, 15
	applymovement 6, Movement_LuminaGymCutscene4
	pause 5
	opentext TEXTBOX_DARCY
	writetext LuminaGymPostDragonShrineDarcyText3
	waitbutton
	closetext
	pause 50
	opentext TEXTBOX_ELDER
	writetext LuminaGymPostDragonShrineElderText2
	waitbutton
	closetext
	pause 30
	spriteface 7, LEFT
	applyonemovement PLAYER, remove_fixed_facing
	pause 10
	opentext TEXTBOX_ELDER
	writetext LuminaGymPostDragonShrineElderText8
	waitbutton
	closetext
	applyonemovement 3, turn_step_right
	applyonemovement PLAYER, remove_fixed_facing
	pause 15
	applyonemovement 6, turn_step_down
	applyonemovement PLAYER, remove_fixed_facing
	pause 10
	opentext TEXTBOX_DARCY
	writetext LuminaGymPostDragonShrineDarcyText4
	waitbutton
	closetext
	pause 35
	spriteface 7, DOWN
	pause 15
	opentext TEXTBOX_ELDER
	writetext LuminaGymPostDragonShrineElderText3
	waitbutton
	closetext
	spriteface 6, UP
;	special Special_FadeOutMusic
	pause 25
	spriteface PLAYER, UP
	pause 35
	spriteface 7, RIGHT
	opentext TEXTBOX_ELDER
	writetext LuminaGymPostDragonShrineElderText4
	waitbutton
	closetext
	pause 25
	applyonemovement 6, turn_step_up
	applyonemovement PLAYER, remove_fixed_facing
	pause 5
	opentext TEXTBOX_DARCY
	writetext LuminaGymPostDragonShrineDarcyText5
	waitbutton
	closetext
	pause 5
	spriteface 7, DOWN
	pause 25
	opentext TEXTBOX_ELDER
	writetext LuminaGymPostDragonShrineElderText5
	waitbutton
	closetext
	pause 5
	applymovement 7, Movement_LuminaGymCutscene9
	spriteface 7, RIGHT
	spriteface PLAYER, DOWN
	opentext TEXTBOX_ELDER
	writetext LuminaGymPostDragonShrineElderText6
	waitbutton
	closetext
	pause 25
	applyonemovement 6, turn_step_left
	applyonemovement PLAYER, remove_fixed_facing
	pause 5
	opentext TEXTBOX_DARCY
	writetext LuminaGymPostDragonShrineDarcyText6
	waitbutton
	closetext
	pause 20
	spriteface 6, UP
	opentext TEXTBOX_DARCY
	writetext LuminaGymPostDragonShrineDarcyText7
	waitbutton
	changetextboxspeaker
	verbosegiveitem DRAGON_STONE
	closetext
	pause 5
	applyonemovement 7, turn_step_right
	opentext TEXTBOX_ELDER
	writetext LuminaGymPostDragonShrineElderText7
	waitbutton
	closetext
	spriteface 6, DOWN
	pause 5
	applymovement 7, Movement_LuminaGymCutscene5
	pause 5
	playsound SFX_EXIT_BUILDING
	disappear 7
	pause 35
	
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, 6, 15
	applymovement 6, Movement_LuminaGymCutscene4
	pause 5
	spriteface PLAYER, DOWN
	opentext TEXTBOX_DARCY
	writetext LuminaGymPostDragonShrineDarcyText8
	waitbutton
	closetext
	pause 5
	applymovement 6, Movement_LuminaGymCutscene6
	opentext TEXTBOX_DARCY
	writetext LuminaGymPostDragonShrineDarcyText9
	waitbutton
	closetext
	applyonemovement 6, step_up
	pause 10
	opentext TEXTBOX_DARCY
	writetext LuminaGymPostDragonShrineDarcyText10
	waitbutton
	closetext
	pause 5
	applymovement 6, Movement_LuminaGymCutscene7
	pause 5
	playsound SFX_EXIT_BUILDING
	disappear 6
	setevent EVENT_LUMINA_GYM_CUTSCENE
	setevent EVENT_NETT_BUILDING_DUNGEON
	setevent EVENT_NETT_ELEVATOR_BROKEN
	setevent EVENT_NETT_OFFICER_MOVED
	setevent EVENT_NETT_OFFICE_ELI_GONE
	setevent EVENT_ALWAYS_SET
	dotrigger $2
	end
	
LuminaHealerHouseBartender:
	faceplayer
	opentext
	writetext LuminaHealerHouseBartenderText1
	waitbutton
	callasm LuminaHealerHouseBartenderAsm
	writetext LuminaHealerHouseBartenderText2
	waitbutton
	closetext
	spriteface 2, LEFT
	end
	
LuminaHealerHouseBartenderText1:
	text "Howdy!<WAIT_S>"
	line "Welcome in!"
	
	para "What can I get ya?"
	done

LuminaHealerHouseBartenderText2:
	text "Come again,"
	line "stranger."
	done
	
	
LuminaHealerHouseRuss:
	checkevent EVENT_LEARNED_RUSS_NAME
	iftrue .learned_name
	setevent EVENT_LEARNED_RUSS_NAME
	opentext TEXTBOX_UNKNOWN
	writetext LuminaHealerHouseRussText1
	closetext
	pause 20
	applyonemovement 5, turn_step_left
	opentext TEXTBOX_BARTENDER
	writetext LuminaHealerHouseRussText2
	waitbutton
	closetext
	pause 5
	opentext TEXTBOX_RUSS
	checkevent EVENT_DRAGON_SHRINE_DONE
	iftrue .dragon_shrine_done
	writetext LuminaHealerHouseRussText1
	closetext
	pause 5
	end
.learned_name
	opentext TEXTBOX_RUSS
	checkevent EVENT_DRAGON_SHRINE_DONE
	iftrue .dragon_shrine_done
	writetext LuminaHealerHouseRussText1
	closetext
	end
.dragon_shrine_done
	setevent EVENT_RUSS_GONE
	writetext LuminaHealerHouseRussText3
	waitbutton
	closetext
	pause 5
	applyonemovement 3, turn_step_down
	applyonemovement PLAYER, remove_fixed_facing
	opentext TEXTBOX_RUSS
	writetext LuminaHealerHouseRussText5
	waitbutton
	closetext
	applymovement PLAYER, Movement_RussLeave1
	applymovement 3, Movement_RussLeave2
	pause 5
	playsound SFX_EXIT_BUILDING
	disappear 3
	pause 5
	applyonemovement 5, turn_step_left
	opentext TEXTBOX_BARTENDER
	writetext LuminaHealerHouseRussText4
	waitbutton
	closetext
	clearevent EVENT_RUSS_NOT_HOME
	end
	
Movement_RussLeave1:
	fix_facing
	slow_step_down
	remove_fixed_facing
	step_end
	
Movement_RussLeave2:
	slow_step_down
	step_left
	step_down
	step_down
	step_down
	step_left
	step_down
	step_down
	step_end
	
LuminaHealerHouseRussText1:
	text "…<WAIT_L><WAIT_S> …<WAIT_L><WAIT_S> …<WAIT_L><WAIT_S>"
	done
	
LuminaHealerHouseRussText2:
	text "Oh, don't mind him."
	
	para "He don't talk to"
	line "strangers."
	
	para "Hasn't said more"
	line "than his drink"
	cont "order in almost"
	cont "ten years."
	
	para "Ain't that right,"
	line "RUSS?"
	done
	
LuminaHealerHouseRussText3:
	text "…<WAIT_L><WAIT_S>That foolish"
	line "child…"
	
	para "He's just like his"
	line "miserable father…"
	done
	
LuminaHealerHouseRussText4:
	text "Woah!<WAIT_S> You got"
	line "ol' RUSS to talk!"
	
	para "Just who are you"
	line "anyway, stranger?"
	done
	
LuminaHealerHouseRussText5:
	text "Out of my way!"
	done
	
LuminaHealerHouseNPC1:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	iftrue .talked
	writetext LuminaHealerHouseNPC1Text1
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	jump .end
.talked
	writetext LuminaHealerHouseNPC1Text2
.end
	waitbutton
	closetext
	spriteface 4, UP
	end
	
LuminaHealerHouseNPC1Text1:
	text "The drink they"
	line "serve here…"
	
	para "SERPSPARILLA…"
	
	para "Why do they call"
	line "it that?"
	done
	
LuminaHealerHouseNPC1Text2:
	text "Oh!<WAIT_S>"
	line "SERPSPARILLA!"
	
	para "Like serpent and"
	line "sarsparilla!"
	
	para "That's…<WAIT_L> kinda"
	line "dumb…"
	done
	
LuminaHealerHouseHealer:
	faceplayer
	opentext
	writetext LuminaHealerHouseHealerText1
	yesorno
	iffalse .no_heal
	pause 5
	closetext	
	special FadeOutPalettesBlack
	special HealParty
	special SaveMusic
	playmusic MUSIC_HEAL
	pause 60
	special RestoreMusic
	callasm LoadMapPals
	special FadeInPalettes
	jumptext LuminaHealerHouseHealerText2
.no_heal
	writetext LuminaHealerHouseHealerText3
	waitbutton
	closetext
	end
	
LuminaHealerHouseClerk:
	faceplayer
	opentext
	writetext LuminaHealerHouseClerkText1
	waitbutton
	callasm LuminaHealerHouseClerkAsm
	writetext LuminaHealerHouseClerkText2
	waitbutton
	closetext
	end
	
LuminaHealerHouseClerkText1:
	text "I sell some of the"
	line "herbs and powders"
	cont "the HEALER uses."
	
	para "Take a look!"
	done
	
LuminaHealerHouseClerkText2:
	text "Bye bye!"
	done
	
LuminaHealerHouseClerkAsm:
	ld a, MARTTYPE_BARTENDER
	ld c, a
	ld a, MART_HEALER
	ld e, a
	ld d, 0
	ld a, [wScriptBank]
	ld b, a
	farcall OpenMartDialog
	ret
	
LuminaHealerHouseBartenderAsm:
	ld a, MARTTYPE_BARTENDER
	ld c, a
	ld a, MART_LUMINA_BAR
	ld e, a
	ld d, 0
	ld a, [wScriptBank]
	ld b, a
	farcall OpenMartDialog
	ret
	
LuminaHealerHouseHealerText1:
	text "I am a HEALER."
	
	para "I use herbs and"
	line "ancient magic"
	cont "to restore your"
	cont "#MON's power."
	
	para "Shall I?"
	done
	
LuminaHealerHouseHealerText2:
	text "You are well."
	
	para "Return if you are"
	line "in need of healing"
	cont "again."
	done
	
LuminaHealerHouseHealerText3:
	text "Very well."
	
	para "Return if you are"
	line "in need of help."
	done
