LuminaEldersHouse_MapScriptHeader:
	db 3 ; scene scripts
	scene_script LuminaEldersHouseTrigger0
	scene_script LuminaEldersHouseTrigger1
	scene_script LuminaEldersHouseTrigger2

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 7, 3, 4, LUMINA_TOWN
	warp_def 7, 2, 4, LUMINA_TOWN

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	person_event SPRITE_ELDER,  4,  5, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, LuminaEldersHouseElder, EVENT_LUMINA_ELDERS_HOUSE_ELDER_GONE
	person_event SPRITE_DARCY,  4,  6, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LuminaEldersHouseDarcy, EVENT_LUMINA_ELDERS_HOUSE_DARCY_GONE
	
LuminaEldersHouseTrigger0:
	priorityjump LuminaEldersHouseScene
	end

LuminaEldersHouseTrigger1:
LuminaEldersHouseTrigger2:
	end
	
LuminaEldersHouseScene:
	priority 2, HIGH_PRIORITY
	applyonemovement 2, turn_step_left
	opentext TEXTBOX_DARCY
	writetext LuminaEldersHouseSceneDarcyText1
	waitbutton
	closetext
	pause 15
	playsound SFX_PAY_DAY
	spriteface 2, DOWN
	showemote EMOTE_SHOCK, 2, 15
	opentext TEXTBOX_DARCY
	writetext LuminaEldersHouseSceneDarcyText2
	waitbutton
	closetext
	applymovement PLAYER, Movement_LuminaEldersHouse1
	applyonemovement 2, turn_step_left
	opentext TEXTBOX_DARCY
	checkevent EVENT_PLAYER_IS_CORA
	iftrue .girl
	checkevent EVENT_PLAYER_IS_PIPPI
	iftrue .girl
	checkevent EVENT_PLAYER_IS_LEAF
	iftrue .girl
	checkevent EVENT_PLAYER_IS_KRIS
	iftrue .girl
	writetext LuminaEldersHouseSceneDarcyText3
	jump .cont
.girl
	writetext LuminaEldersHouseSceneDarcyText3_girl
.cont
	waitbutton
	closetext
	pause 5
	spriteface 1, DOWN
	opentext TEXTBOX_UNKNOWN
	writetext LuminaEldersHouseSceneElderText1
	waitbutton
	closetext
	pause 5
	applyonemovement 2, turn_step_left
	opentext TEXTBOX_DARCY
	writetext LuminaEldersHouseSceneDarcyText4
	waitbutton
	closetext
	spriteface 1, RIGHT
	opentext TEXTBOX_UNKNOWN
	checkevent EVENT_PLAYER_IS_CORA
	iftrue .girl2
	checkevent EVENT_PLAYER_IS_PIPPI
	iftrue .girl2
	checkevent EVENT_PLAYER_IS_LEAF
	iftrue .girl2
	checkevent EVENT_PLAYER_IS_KRIS
	iftrue .girl2
	writetext LuminaEldersHouseSceneElderText2
	jump .cont2
.girl2
	writetext LuminaEldersHouseSceneElderText2_girl
.cont2
	waitbutton
	closetext
	pause 25
	opentext TEXTBOX_DARCY
	writetext LuminaEldersHouseSceneDarcyText5
	waitbutton
	closetext
	pause 15
	spriteface 1, DOWN
	opentext TEXTBOX_ELDER
	writetext LuminaEldersHouseSceneElderText3
	waitbutton
	closetext
	pause 15
	spriteface 1, RIGHT
	opentext TEXTBOX_ELDER
	writetext LuminaEldersHouseSceneElderText4
	waitbutton
	closetext
	pause 15
	spriteface 1, DOWN
	opentext TEXTBOX_ELDER
	checkevent EVENT_PLAYER_IS_CORA
	iftrue .girl3
	checkevent EVENT_PLAYER_IS_PIPPI
	iftrue .girl3
	checkevent EVENT_PLAYER_IS_LEAF
	iftrue .girl3
	checkevent EVENT_PLAYER_IS_KRIS
	iftrue .girl3
	writetext LuminaEldersHouseSceneElderText5
	jump .cont3
.girl3
	writetext LuminaEldersHouseSceneElderText5_girl
.cont3
	waitbutton
	closetext
	follow 2, 1
	applymovement 2, Movement_LuminaEldersHouse2
	stopfollow
	pause 5
	playsound SFX_EXIT_BUILDING
	disappear 2
	pause 5
	applyonemovement 1, step_down
	stopfollow
	pause 5
	playsound SFX_EXIT_BUILDING
	disappear 1
	pause 10
	setevent EVENT_LUMINA_ELDERS_HOUSE_ELDER_GONE
	setevent EVENT_LUMINA_ELDERS_HOUSE_DARCY_GONE
	clearevent EVENT_LUMINA_GYM_ELDER_GONE
	clearevent EVENT_LUMINA_GYM_DARCY_GONE
	dotrigger $1
	end
	
LuminaEldersHouseSceneDarcyText1:
	text "This is a big"
	line "deal, GRANDPA!"
	
	para "Why aren't you"
	line "taking this more"
	cont "seriously?"
	done
	
LuminaEldersHouseSceneDarcyText2:
	text "<PLAYER>!<WAIT_S>"
	line "About time!"
	
	para "What the heck was"
	line "the holdup!?"
	done
	
LuminaEldersHouseSceneDarcyText3:
	text "GRANDPA, this is"
	line "the boy I told"
	cont "you about."
	
	para "The one who knows"
	line "that kid with"
	cont "TEAM SNARE."
	done
	
LuminaEldersHouseSceneDarcyText3_girl:
	text "GRANDPA, this is"
	line "the girl I told"
	cont "you about."
	
	para "The one who knows"
	line "that kid that's"
	cont "with TEAM SNARE."
	done
	
LuminaEldersHouseSceneDarcyText4:
	text "This is no time"
	line "for small talk,"
	cont "GRANDPA!"
	
	para "We have a disaster"
	line "on our hands!"
	
	para "We have to go to"
	line "the shrine!<WAIT_M> NOW!"
	done
	
LuminaEldersHouseSceneDarcyText5:
	text "Sigh…"
	
	para "Yes, GRANDPA…"
	done
	
LuminaEldersHouseSceneElderText1:
	text "Pleased to meet"
	line "you."
	
	para "I heard you bested"
	line "my grandson ROCKY"
	cont "and earned a GYM"
	cont "BADGE from him."
	
	para "Are you hoping"
	line "to compete in"
	cont "the #MON LEAGUE"
	cont "TOURNAMENT?"
	
	para "What an ambitious"
	line "goal for one as"
	cont "young as you!"
	
	para "You know, the last"
	line "champion grew up"
	cont "in this very town."
	done
	
LuminaEldersHouseSceneElderText2:
	text "In due time,"
	line "child."
	
	para "All things in due"
	line "time."
	
	para "Besides, you know"
	line "the rules:"
	
	para "He can't enter"
	line "the shrine without"
	cont "first earning the"
	cont "right."
	
	para "To do so would be"
	line "no better than the"
	cont "child that has"
	cont "forced his way in."
	done
	
LuminaEldersHouseSceneElderText2_girl:
	text "In due time,"
	line "child."
	
	para "All things in due"
	line "time."
	
	para "Besides, you know"
	line "the rules:"
	
	para "She can't enter"
	line "the shrine without"
	cont "first earning the"
	cont "right."
	
	para "To do so would be"
	line "no better than the"
	cont "child that has"
	cont "forced his way in."
	done
	
LuminaEldersHouseSceneElderText3:
	text "I am the ELDER of"
	line "LUMINA TOWN."
	
	para "I also serve as"
	line "it's GYM LEADER,"
	
	para "though none have"
	line "come seeking a"
	cont "BADGE in quite a"
	cont "while now."
	
	para "If you must enter"
	line "the DRAGON SHRINE,"
	
	para "our customs dict-"
	line "ate that you must"
	cont "earn my blessing."
	
	para "How fortuante it"
	line "is, then, that you"
	cont "needed my BADGE"
	cont "anyway."
	done
	
LuminaEldersHouseSceneElderText4:
	text "We'll convene at"
	line "the CLIFFSIDE"
	cont "BATTLEGROUND"
	cont "NORTH of town."
	
	para "I'll explain the"
	line "rest there."
	
	para "You come along"
	line "too, DARCY."
	done
	
LuminaEldersHouseSceneElderText5:
	text "The young one will"
	line "prove themself"
	cont "there."
	done

LuminaEldersHouseSceneElderText5_girl:
	text "The young one will"
	line "prove herself"
	cont "there."
	done
	
Movement_LuminaEldersHouse1:
	step_up
	step_right
	step_right
	step_up
	step_end
	
Movement_LuminaEldersHouse2:
	step_down
	step_down
	step_left
	step_left
	step_left
	step_down
	step_end
	
LuminaEldersHouseElder:
	end
	
LuminaEldersHouseDarcy:
	end
	