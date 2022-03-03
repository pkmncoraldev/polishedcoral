OnwaIntlAirport_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, OnwaIntlAirportCallback

	db 4 ; warp events
	warp_def 25, 44, 3, ROUTE_12_GATE
	warp_def 25, 45, 4, ROUTE_12_GATE
	warp_def 18, 24, 1, AIRPORT
	warp_def 18, 25, 2, AIRPORT

	db 22 ; coord events
	xy_trigger 0, 24, 26, 0, OnwaIntlAirportMapSignThing, 0, 0
	xy_trigger 0, 24, 27, 0, OnwaIntlAirportMapSignThing, 0, 0
	xy_trigger 0, 24, 28, 0, OnwaIntlAirportMapSignThing, 0, 0
	xy_trigger 1, 26, 26, 0, Route12MapSignThing, 0, 0
	xy_trigger 1, 26, 27, 0, Route12MapSignThing, 0, 0
	xy_trigger 1, 26, 28, 0, Route12MapSignThing, 0, 0
	xy_trigger 1, 14, 11, 0, OnwaIntlAirportBehindFence, 0, 0
	xy_trigger 1, 15, 11, 0, OnwaIntlAirportBehindFence, 0, 0
	xy_trigger 1, 18, 24, 0, OnwaIntlAirportWendyL, 0, 0
	xy_trigger 1, 18, 25, 0, OnwaIntlAirportWendyR, 0, 0
	xy_trigger 2, 16, 11, 0, OnwaIntlAirportInFrontFence, 0, 0
	xy_trigger 2, 17, 11, 0, OnwaIntlAirportInFrontFence, 0, 0
	xy_trigger 3, 24, 26, 0, OnwaIntlAirportMapSignThing, 0, 0
	xy_trigger 3, 24, 27, 0, OnwaIntlAirportMapSignThing, 0, 0
	xy_trigger 3, 24, 28, 0, OnwaIntlAirportMapSignThing, 0, 0
	xy_trigger 4, 26, 26, 0, Route12MapSignThing, 0, 0
	xy_trigger 4, 26, 27, 0, Route12MapSignThing, 0, 0
	xy_trigger 4, 26, 28, 0, Route12MapSignThing, 0, 0
	xy_trigger 4, 14, 11, 0, OnwaIntlAirportBehindFence, 0, 0
	xy_trigger 4, 15, 11, 0, OnwaIntlAirportBehindFence, 0, 0
	xy_trigger 5, 16, 11, 0, OnwaIntlAirportInFrontFence, 0, 0
	xy_trigger 5, 17, 11, 0, OnwaIntlAirportInFrontFence, 0, 0

	db 3 ; bg events
	signpost 18, 21, SIGNPOST_READ, OnwaIntlAirportSign
	bg_event 16,  7, SIGNPOST_ITEM + NUGGET, EVENT_AIRPORT_HIDDEN_ITEM_1
	bg_event 26,  8, SIGNPOST_ITEM + ELIXIR, EVENT_AIRPORT_HIDDEN_ITEM_2

	db 17 ; object events
	person_event SPRITE_PSYCHIC, 16, 31, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, OnwaIntlAirportNPC1, -1
	person_event SPRITE_WENDY, -1, -1, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, -1, EVENT_GLINT_RIVAL_WILL_BUMP
	person_event SPRITE_PLAYER_CUTSCENE, 33,  2, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, EVENT_PLAYER_CUTSCENE_SILVER

	cuttree_event 11, 16, EVENT_ONWA_INTL_AIRPORT_CUT_TREE
	itemball_event 31, 15, SUPER_REPEL, 1, EVENT_AIRPORT_POKE_BALL_1
	itemball_event 10,  4, FULL_RESTORE, 1, EVENT_AIRPORT_POKE_BALL_2
	itemball_event 24,  9, EVIOLITE, 1, EVENT_AIRPORT_POKE_BALL_3
	person_event SPRITE_CORY_MISC,  8, 24, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_CORY_MISC,  8, 25, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_CORY_MISC,  8, 26, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_CORY_MISC,  7, 16, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_OFFICER,  9, 28, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, OnwaIntlAirportGuard, -1
	person_event SPRITE_OFFICER,  5, 26, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, OnwaIntlAirportGuard, -1
	person_event SPRITE_OFFICER,  6, 15, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, OnwaIntlAirportGuard, -1
	person_event SPRITE_OFFICER, 10, 16, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, OnwaIntlAirportGuard, -1
	person_event SPRITE_OFFICER,  9,  7, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, OnwaIntlAirportGuard, -1
	person_event SPRITE_OFFICER,  8,  4, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, OnwaIntlAirportGuard, -1
	
	const_def 1 ; object constants
	const ONWA_INTL_AIRPORT_NPC1
	const ONWA_INTL_AIRPORT_WENDY
	const ONWA_INTL_AIRPORT_PLAYER_CUTSCENE
	
OnwaIntlAirportCallback:
	checkevent EVENT_AIRPORT_WENDY
	iftrue .wendy_done
	return
.wendy_done
	changeblock $18, $12, $d0
	return
	
Route12MapSignThing::
	clearevent EVENT_AT_AIRPORT
	loadvar wEnteredMapFromContinue, 0
	callasm ReturnFromMapSetupScript
	checkevent EVENT_AIRPORT_WENDY
	iftrue .wendy_done
	dotrigger $0
	end
.wendy_done
	dotrigger $3
    end

OnwaIntlAirportMapSignThing::
	setevent EVENT_AT_AIRPORT
	loadvar wEnteredMapFromContinue, 0
	callasm ReturnFromMapSetupScript
	checkevent EVENT_AIRPORT_WENDY
	iftrue .wendy_done
	dotrigger $1
	end
.wendy_done
	dotrigger $4
    end
	
OnwaIntlAirportNPC1:
	faceplayer
	opentext
	writetext OnwaIntlAirportNPC1Text
	waitbutton
	closetext
	spriteface ONWA_INTL_AIRPORT_NPC1, UP
	end
	
OnwaIntlAirportSign:
	jumptext OnwaIntlAirportSignText
	
OnwaIntlAirportBehindFence:
	changeblock $a, $e, $c3
	changeblock $c, $e, $bd
	changeblock $e, $e, $bd
	changeblock $10, $e, $bd
	changeblock $12, $e, $bd
	changeblock $1e, $e, $86
	changeblock $a, $10, $ef
	changeblock $c, $10, $e5
	changeblock $e, $10, $f4
	changeblock $10, $10, $f5
	changeblock $12, $10, $e5
	changeblock $1e, $10, $e5
	callasm GenericFinishBridge
	checkevent EVENT_AIRPORT_WENDY
	iftrue .wendy_done
	dotrigger $2
	end
.wendy_done
	dotrigger $5
	end
	
OnwaIntlAirportInFrontFence:
	changeblock $a, $e, $ed
	changeblock $c, $e, $84
	changeblock $e, $e, $84
	changeblock $10, $e, $84
	changeblock $12, $e, $84
	changeblock $1e, $e, $8c
	changeblock $a, $10, $eb
	changeblock $c, $10, $05
	changeblock $e, $10, $4c
	changeblock $10, $10, $4e
	changeblock $12, $10, $05
	changeblock $1e, $10, $05
	callasm GenericFinishBridge
	checkevent EVENT_AIRPORT_WENDY
	iftrue .wendy_done
	dotrigger $1
	end
.wendy_done
	dotrigger $4
	end
	
OnwaIntlAirportWendyL:
	playmusic MUSIC_ENCOUNTER_GYM_LEADER
	special Special_StopRunning
	disappear ONWA_INTL_AIRPORT_WENDY
	moveperson ONWA_INTL_AIRPORT_WENDY, $18, $12
	moveperson ONWA_INTL_AIRPORT_PLAYER_CUTSCENE, $18, $14
	appear ONWA_INTL_AIRPORT_WENDY
	playsound SFX_EXIT_BUILDING
	applymovement PLAYER, Movement_OnwaIntlAirportWendyBump
	applyonemovement ONWA_INTL_AIRPORT_WENDY, step_down
	opentext
	writetext OnwaIntlAirportWendyText1
	waitbutton
	closetext
	clearevent EVENT_PLAYER_CUTSCENE_SILVER
	appear ONWA_INTL_AIRPORT_PLAYER_CUTSCENE
	spriteface ONWA_INTL_AIRPORT_WENDY, UP
	applyonemovement PLAYER, hide_person
	pause 10
	applymovement PLAYER, Movement_OnwaIntlAirportCutscene1
	jump OnwaIntlAirportWendyFinish
	
OnwaIntlAirportWendyR:
	playmusic MUSIC_ENCOUNTER_GYM_LEADER
	special Special_StopRunning
	disappear ONWA_INTL_AIRPORT_WENDY
	moveperson ONWA_INTL_AIRPORT_WENDY, $19, $12
	moveperson ONWA_INTL_AIRPORT_PLAYER_CUTSCENE, $19, $14
	appear ONWA_INTL_AIRPORT_WENDY
	playsound SFX_EXIT_BUILDING
	applymovement PLAYER, Movement_OnwaIntlAirportWendyBump
	applyonemovement ONWA_INTL_AIRPORT_WENDY, step_down
	opentext
	writetext OnwaIntlAirportWendyText1
	waitbutton
	closetext
	clearevent EVENT_PLAYER_CUTSCENE_SILVER
	appear ONWA_INTL_AIRPORT_PLAYER_CUTSCENE
	spriteface ONWA_INTL_AIRPORT_WENDY, UP
	applyonemovement PLAYER, hide_person
	pause 10
	applymovement PLAYER, Movement_OnwaIntlAirportCutscene0
	
OnwaIntlAirportWendyFinish:
	pause 25
	opentext
	writetext OnwaIntlAirportWendyText2
	waitbutton
	closetext
	pause 25
	special Special_FadeBlackQuickly
	disappear ONWA_INTL_AIRPORT_WENDY
	moveperson ONWA_INTL_AIRPORT_WENDY, $19, $13
	appear ONWA_INTL_AIRPORT_WENDY
	setevent EVENT_PLAYER_CUTSCENE_SILVER
	disappear ONWA_INTL_AIRPORT_PLAYER_CUTSCENE
	applymovement PLAYER, Movement_OnwaIntlAirportCutscene2
	special Special_FadeInQuickly
	pause 25
	opentext
	writetext OnwaIntlAirportWendyText3
	waitbutton
	closetext
	pause 25
	special Special_FadeBlackQuickly
	applymovement PLAYER, Movement_OnwaIntlAirportCutscene3
	applyonemovement PLAYER, show_person
	spriteface PLAYER, RIGHT
	spriteface ONWA_INTL_AIRPORT_WENDY, LEFT
	special Special_FadeInQuickly
	opentext
	writetext OnwaIntlAirportWendyText4
	waitbutton
	closetext
	
	applymovement ONWA_INTL_AIRPORT_WENDY, Movement_OnwaIntlAirportWendyLeave
	setevent EVENT_AIRPORT_WENDY
	changeblock $18, $12, $d0
	callasm GenericFinishBridge
	disappear ONWA_INTL_AIRPORT_WENDY
	special Special_FadeOutMusic
	pause 15
	playmusic MUSIC_ROUTE_4
	dotrigger $4
	end
	
OnwaIntlAirportGuard:
	generictrainer PLAYER_CORY, -1, -1, .SeenText, -1

.SeenText
	text "Hold it!"
	
	para "Are you crazy?"
	
	para "You can't be out"
	line "here!"
	done
	
OnwaIntlAirportNPC1Text:
	text "Look at that!"
	
	para "There's something"
	line "on the other side"
	cont "of the fence!"
	
	para "I tried to sneak"
	line "back there to get"
	cont "it, but security"
	cont "kicked me out!"
	done
	
OnwaIntlAirportWendyText1:
	text "TEXT 1"
	done
	
OnwaIntlAirportWendyText2:
	text "TEXT 2"
	done
	
OnwaIntlAirportWendyText3:
	text "TEXT 3"
	done
	
OnwaIntlAirportWendyText4:
	text "TEXT 4"
	done
	
OnwaIntlAirportSignText:
	text "ONWA INTERNATIONAL"
	line "AIRPORT"
	done
	
Movement_OnwaIntlAirportWendyBump:
	fix_facing
	jump_step_down
	remove_fixed_facing
	step_end
	
Movement_OnwaIntlAirportCutscene0:
	slow_step_left
	
Movement_OnwaIntlAirportCutscene1:
	slow_step_up
	slow_step_up
	slow_step_up
	slow_step_up
	slow_step_up
	slow_step_up
	step_end
	
Movement_OnwaIntlAirportCutscene2:
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	step_end
	
Movement_OnwaIntlAirportCutscene3:
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	step_end
	
Movement_OnwaIntlAirportWendyLeave:
	step_right
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end
	