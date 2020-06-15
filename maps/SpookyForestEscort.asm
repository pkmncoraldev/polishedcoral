SpookyForestEscort_MapScriptHeader:
	db 2 ; scene scripts
	scene_script SpookyForestEscortTrigger0
	scene_script SpookyForestEscortTrigger1

	db 0 ; callbacks

	db 0 ; warp events

	db 24 ; coord events
	coord_event  0, 22, 0, SpookyForestReset
	coord_event  0, 23, 0, SpookyForestReset
	coord_event 13, 22, 0, SpookyForestReset
	coord_event 13, 23, 0, SpookyForestReset
	coord_event  0,  6, 0, SpookyForestReset
	coord_event  0,  7, 0, SpookyForestReset
	coord_event  6,  0, 0, SpookyForestReset
	coord_event  7,  0, 0, SpookyForestReset
	coord_event 22,  0, 0, SpookyForestReset
	coord_event 23,  0, 0, SpookyForestReset
	coord_event 29,  6, 0, SpookyForestReset
	coord_event 29,  7, 0, SpookyForestReset
	coord_event 16, 22, 0, SpookyForestReset
	coord_event 16, 23, 0, SpookyForestReset
	coord_event 22, 29, 0, SpookyForestReset
	coord_event 23, 29, 0, SpookyForestReset
	coord_event 38, 29, 0, SpookyForestReset
	coord_event 39, 29, 0, SpookyForestReset
	coord_event 45, 23, 0, SpookyForestReset
	coord_event 45, 22, 0, SpookyForestReset
	coord_event 38, 16, 0, SpookyForestKidStopsYou
	coord_event 39, 16, 0, SpookyForestKidStopsYou
	coord_event  6, 31, 0, SpookyForestSavedKidLeft
	coord_event  7, 31, 0, SpookyForestSavedKidRight


	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_CHILD, 18, 36, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SpookyForestEscortLostKid, -1
	
	const_def 1 ; object constants
	const SPOOKY_FOREST_ESCORT_LOST_KID
	
SpookyForestEscortTrigger0:
	end

SpookyForestEscortTrigger1:
	setflag ENGINE_HAVE_FOLLOWER
	follow PLAYER, SPOOKY_FOREST_ESCORT_LOST_KID
	opentext
	writetext SpookyForestEscortLostKidText1
	playsound SFX_CAUGHT_MON
	waitsfx
	writetext SpookyForestEscortLostKidText2	
	waitbutton
	closetext
	dotrigger $0
	spriteface PLAYER, DOWN
	end
	
SpookyForestKidStopsYou:
	playsound SFX_PAY_DAY
	faceplayer
	showemote EMOTE_SHOCK, SPOOKY_FOREST_ESCORT_LOST_KID, 15
	opentext
	writetext SpookyForestEscortLostKidText4
	waitbutton
	closetext
	follow PLAYER, SPOOKY_FOREST_ESCORT_LOST_KID
	applyonemovement PLAYER, step_down
	end

SpookyForestSavedKidLeft:
	setevent EVENT_SAVED_BIKESHOP_OWNERS_SON
	clearevent EVENT_HAVENT_SAVED_BIKESHOP_OWNERS_SON
	clearflag ENGINE_HAVE_FOLLOWER
	stopfollow
	playsound SFX_PAY_DAY
	faceplayer
	showemote EMOTE_SHOCK, SPOOKY_FOREST_ESCORT_LOST_KID, 15
	spriteface PLAYER, UP
	opentext
	writetext SpookyForestEscortLostKidText5
	waitbutton
	closetext
	applymovement SPOOKY_FOREST_ESCORT_LOST_KID, Movement_SpookyForestSavedKidLeft
	disappear SPOOKY_FOREST_ESCORT_LOST_KID
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	warp2 UP, SPOOKY_FOREST_1, $6, $f
	end
	
SpookyForestSavedKidRight:
	setevent EVENT_SAVED_BIKESHOP_OWNERS_SON
	clearevent EVENT_HAVENT_SAVED_BIKESHOP_OWNERS_SON
	clearflag ENGINE_HAVE_FOLLOWER
	stopfollow
	playsound SFX_PAY_DAY
	faceplayer
	showemote EMOTE_SHOCK, SPOOKY_FOREST_ESCORT_LOST_KID, 15
	spriteface PLAYER, UP
	opentext
	writetext SpookyForestEscortLostKidText5
	waitbutton
	closetext
	applymovement SPOOKY_FOREST_ESCORT_LOST_KID, Movement_SpookyForestSavedKidRight
	disappear SPOOKY_FOREST_ESCORT_LOST_KID
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	warp2 UP, SPOOKY_FOREST_1, $7, $f
	end

SpookyForestEscortLostKid:
	jumptextfaceplayer SpookyForestEscortLostKidText3

SpookyForestEscortLostKidText1:
	text "The KID joined"
	line "<PLAYER>!"
	done

SpookyForestEscortLostKidText2:
	text "Thanks big kid!"
	done

SpookyForestEscortLostKidText3:
	text "Thank you for"
	line "helping me!"
	done

SpookyForestEscortLostKidText4:
	text "Wait!"

	para "I know I didn't"
	line "come from that"
	cont "way…"

	para "Please help me"
	line "find the way out!"
	done
	
SpookyForestEscortLostKidText5:
	text "Wait a second!"
	
	para "I know where I am"
	line "now!"
	
	para "I can make it home"
	line "from here."
	
	para "Thank you for"
	line "helping me!"
	
	para "My MOM runs the"
	line "BIKE SHOP in"
	cont "EVENTIDE VILLAGE."
	
	para "Make sure to stop"
	line "by if you're in"
	cont "town."
	done

Movement_SpookyForestSavedKidLeft:
	step_right
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

Movement_SpookyForestSavedKidRight:
	step_left
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end
