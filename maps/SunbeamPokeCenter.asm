SunbeamPokeCenter_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 7, 5, 2, SUNBEAM_ISLAND
	warp_def 7, 6, 2, SUNBEAM_ISLAND

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	pc_nurse_event  5, 1
	pc_chansey_event  6, 1
	person_event SPRITE_SUPER_NERD, 3, 8, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, SunbeamPokecenterNPC1, -1
	person_event SPRITE_COOLTRAINER_F, 5, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, SunbeamPokecenterNPC2, -1
	object_event 2, 4, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, MEOWTH, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SunbeamPokecenterNPC3, -1
	person_event SPRITE_SPRUCE, 3, 5, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SunbeamPokecenterSpruce, EVENT_MET_SPRUCE_AT_CENTER

	
	const_def 1 ; object constants
	const SUNBEAM_POKECENTER_NURSE
	const SUNBEAM_POKECENTER_CHANSEY
	const SUNBEAM_POKECENTER_NPC1
	const SUNBEAM_POKECENTER_NPC2
	const SUNBEAM_POKECENTER_NPC3
	const SUNBEAM_POKECENTER_SPRUCE
	
SunbeamPokecenterNPC1:
	jumptextfaceplayer SunbeamPokecenterNPC1Text
	
SunbeamPokecenterNPC2:
	jumptextfaceplayer SunbeamPokecenterNPC2Text
	
SunbeamPokecenterNPC3:
	opentext TEXTBOX_POKEMON, MEOWTH
	writetext SunbeamPokecenterNPC3Text
	cry MEOWTH
	waitsfx
	waitbutton
	closetext
	end
	
SunbeamPokecenterSpruce:
	setevent EVENT_MET_SPRUCE_AT_CENTER
	opentext TEXTBOX_UNKNOWN
	writetext SunbeamPokecenterSpruceText1
	waitbutton
	closetext
	pause 7
	faceplayer
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, SUNBEAM_POKECENTER_SPRUCE, 15
	pause 7
	opentext TEXTBOX_UNKNOWN
	writetext SunbeamPokecenterSpruceText2
	buttonsound
	changetextboxspeaker TEXTBOX_SPRUCE
	farwritetext StdBlankText
	pause 6
	writetext SunbeamPokecenterSpruceText3
	waitbutton
	closetext
	checkcode VAR_FACING
	if_not_equal UP, .cont
	applyonemovement SUNBEAM_POKECENTER_SPRUCE, step_right
.cont
	applymovement SUNBEAM_POKECENTER_SPRUCE, Movement_SunbeamPokecenterSpruce
	disappear SUNBEAM_POKECENTER_SPRUCE
	playsound SFX_EXIT_BUILDING
	pause 4
	end
	
SunbeamPokecenterNPC1Text:
	text "CORSOLA used to"
	line "gather near the"
	cont "beach on the WEST"
	cont "of the island."
	
	para "You don't see them"
	line "very much anymore."
	done
	
SunbeamPokecenterNPC2Text:
	text "Lately my MEOWTH"
	line "has been acting"
	cont "out a lot more."
	
	para "I wonder if he's"
	line "getting close to"
	cont "evolving."
	done
	
SunbeamPokecenterNPC3Text:
	text "OWTH!<WAIT_S> ME<WAIT_S>-OWTH!"
	done
	
SunbeamPokecenterSpruceText1:
	text "Of course."
	
	para "Same time next"
	line "week."
	
	para "Good day."
	done
	
SunbeamPokecenterSpruceText2:
	text "Oh, excuse me."
	
	para "…<WAIT_M>Hold on a moment…"
	
	para "You are <PLAYER>,"
	line "are you not?"
	
	para "…<WAIT_L>Ah <WAIT_S>ha!"
	
	para "I was sure of it!<WAIT_S>"
	line "I'm PROF. SPRUCE."
	done
	
SunbeamPokecenterSpruceText3:
	text "I'm so glad you"
	line "made it!"
	
	para "Please, come to my"
	line "LAB."
	
	para "We can continue"
	line "our conversation"
	cont "there."
	
	para "I look forward to"
	line "it!"
	done
	
Movement_SunbeamPokecenterSpruce:
	step_down
	step_down
	step_down
	step_down
	step_end