OnwaIntlAirport_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, OnwaIntlAirportCallback

	db 4 ; warp events
	warp_def 25, 44, 3, ROUTE_12_GATE
	warp_def 25, 45, 4, ROUTE_12_GATE
	warp_def 18, 24, 1, AIRPORT
	warp_def 18, 25, 2, AIRPORT

	db 21 ; coord events
	xy_trigger 0, 24, 26, 0, OnwaIntlAirportMapSignThing, 0, 0
	xy_trigger 0, 24, 27, 0, OnwaIntlAirportMapSignThing, 0, 0
	xy_trigger 0, 24, 28, 0, OnwaIntlAirportMapSignThing, 0, 0
	xy_trigger 1, 26, 26, 0, Route12MapSignThing, 0, 0
	xy_trigger 1, 26, 27, 0, Route12MapSignThing, 0, 0
	xy_trigger 1, 26, 28, 0, Route12MapSignThing, 0, 0
	xy_trigger 1, 14, 11, 0, OnwaIntlAirportBehindFence, 0, 0
	xy_trigger 1, 15, 11, 0, OnwaIntlAirportBehindFence, 0, 0
	xy_trigger 1, 18, 25, 0, OnwaIntlAirportWendy, 0, 0
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
	bg_event 19, 18, SIGNPOST_ITEM + NUGGET, EVENT_AIRPORT_HIDDEN_ITEM_1
	bg_event 26,  8, SIGNPOST_ITEM + ELIXIR, EVENT_AIRPORT_HIDDEN_ITEM_2

	db 17 ; object events
	person_event SPRITE_PSYCHIC, 16, 31, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, OnwaIntlAirportNPC1, -1
	person_event SPRITE_FAT_GUY, 19, 24, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, OnwaIntlAirportNPC2, -1
	person_event SPRITE_BEAUTY, 20, 24, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, OnwaIntlAirportNPC3, -1
	person_event SPRITE_SKATER, 21, 21, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, OnwaIntlAirportNPC4, -1
	person_event SPRITE_POKEFAN_F, 18, 15, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, OnwaIntlAirportNPC5, -1
	person_event SPRITE_POKEFAN_M, 32, 32, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, OnwaIntlAirportNPC6, -1
	person_event SPRITE_WENDY, -1, -1, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_PLAYER_CUTSCENE, 33,  2, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, EVENT_PLAYER_CUTSCENE_SILVER

	cuttree_event 11, 16, EVENT_ONWA_INTL_AIRPORT_CUT_TREE
	itemball_event 31, 15, SUPER_REPEL, 1, EVENT_AIRPORT_POKE_BALL_1
	itemball_event 10,  4, FULL_RESTORE, 1, EVENT_AIRPORT_POKE_BALL_2
	itemball_event 25,  9, EVIOLITE, 1, EVENT_AIRPORT_POKE_BALL_3
	person_event SPRITE_CORY_MISC,  8, 25, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_CORY_MISC,  8, 26, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_OFFICER,  9, 29, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, OnwaIntlAirportGuard, -1
	person_event SPRITE_OFFICER,  5, 26, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, OnwaIntlAirportGuard, -1
	person_event SPRITE_OFFICER,  7, 15, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, OnwaIntlAirportGuard, -1
	person_event SPRITE_OFFICER, 10, 16, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, OnwaIntlAirportGuard, -1
	person_event SPRITE_OFFICER,  9,  7, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, OnwaIntlAirportGuard, -1
	person_event SPRITE_OFFICER,  4,  4, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, OnwaIntlAirportGuard, -1
	
	const_def 1 ; object constants
	const ONWA_INTL_AIRPORT_NPC1
	const ONWA_INTL_AIRPORT_NPC2
	const ONWA_INTL_AIRPORT_NPC3
	const ONWA_INTL_AIRPORT_NPC4
	const ONWA_INTL_AIRPORT_NPC5
	const ONWA_INTL_AIRPORT_NPC6
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
	
OnwaIntlAirportNPC2:
	faceplayer
	opentext
	writetext OnwaIntlAirportNPC2Text
	waitbutton
	closetext
	spriteface ONWA_INTL_AIRPORT_NPC2, UP
	end
	
OnwaIntlAirportNPC3:
	faceplayer
	opentext
	writetext OnwaIntlAirportNPC3Text
	waitbutton
	closetext
	spriteface ONWA_INTL_AIRPORT_NPC3, UP
	end
	
OnwaIntlAirportNPC4:
	jumptextfaceplayer OnwaIntlAirportNPC4Text
	
OnwaIntlAirportNPC5:
	faceplayer
	opentext
	writetext OnwaIntlAirportNPC5Text
	waitbutton
	closetext
	spriteface ONWA_INTL_AIRPORT_NPC5, DOWN
	end
	
OnwaIntlAirportNPC6:
	jumptextfaceplayer OnwaIntlAirportNPC6Text
	
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
	
OnwaIntlAirportWendy:
	special Special_StopRunning
	disappear ONWA_INTL_AIRPORT_WENDY
	moveperson ONWA_INTL_AIRPORT_WENDY, $19, $12
	moveperson ONWA_INTL_AIRPORT_PLAYER_CUTSCENE, $19, $14
	appear ONWA_INTL_AIRPORT_WENDY
	playsound SFX_EXIT_BUILDING
	applymovement PLAYER, Movement_OnwaIntlAirportWendyBump
	playmusic MUSIC_ENCOUNTER_GYM_LEADER
	applyonemovement ONWA_INTL_AIRPORT_WENDY, step_down
	opentext
	writetext OnwaIntlAirportWendyText1
	waitbutton
	closetext
	pause 10
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, ONWA_INTL_AIRPORT_WENDY, 15
	opentext
	writetext OnwaIntlAirportWendyText5
	waitbutton
	closetext
	clearevent EVENT_PLAYER_CUTSCENE_SILVER
	appear ONWA_INTL_AIRPORT_PLAYER_CUTSCENE
	spriteface ONWA_INTL_AIRPORT_WENDY, UP
	applyonemovement PLAYER, hide_person
	pause 10
	applymovement PLAYER, Movement_OnwaIntlAirportCutscene0
	pause 25
	opentext
	writetext OnwaIntlAirportWendyText2
	waitbutton
	closetext
	pause 25
	special FadeOutPalettesBlack
	disappear ONWA_INTL_AIRPORT_WENDY
	moveperson ONWA_INTL_AIRPORT_WENDY, $19, $13
	appear ONWA_INTL_AIRPORT_WENDY
	setevent EVENT_PLAYER_CUTSCENE_SILVER
	disappear ONWA_INTL_AIRPORT_PLAYER_CUTSCENE
	applymovement PLAYER, Movement_OnwaIntlAirportCutscene2
	callasm LoadMapPals
	special FadeInPalettes
	pause 25
	opentext
	writetext OnwaIntlAirportWendyText3
	waitbutton
	closetext
	pause 25
	special FadeOutPalettesBlack
	applymovement PLAYER, Movement_OnwaIntlAirportCutscene3
	applyonemovement PLAYER, show_person
	spriteface PLAYER, UP
	spriteface ONWA_INTL_AIRPORT_WENDY, DOWN
	callasm LoadMapPals
	special FadeInPalettes
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
	playmusic MUSIC_ROUTE_12
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
	
OnwaIntlAirportNPC2Text:
	text "What is the hold"
	line "up?"
	
	para "Let's go!"
	done
	
OnwaIntlAirportNPC3Text:
	text "I'm going to be"
	line "here all day…"
	done
	
OnwaIntlAirportNPC4Text:
	text "Fly in a plane?"
	
	para "No way!"
	
	para "An ollie is the"
	line "highest I want"
	cont "to fly!"
	done
	
OnwaIntlAirportNPC5Text:
	text "Sigh…"
	
	para "Travel is so"
	line "exhausting…"
	
	para "I can't imagine"
	line "having to do it on"
	cont "foot!"
	done
	
OnwaIntlAirportNPC6Text:
	text "ROUTE 12 is closed"
	line "for construction?"
	
	para "What am I"
	line "supposed to do,"
	cont "fly a plane to"
	cont "SHINE CITY?"
	done
	
OnwaIntlAirportWendyText1:
	text "Oh pardon me!"
	done
	
OnwaIntlAirportWendyText2:
	text "This place is so"
	line "huge, it's almost"
	cont "overwhelming!"
	
	para "Quite a far cry"
	line "from my little"
	cont "hangar back home,"
	cont "huh?"
	done
	
OnwaIntlAirportWendyText3:
	text "And the jets are"
	line "something else!"
	
	para "You can fit over a"
	line "hundred people on"
	cont "board!"
	
	para "Bit of an upgrade"
	line "from a two-seater"
	cont "biplane!"
	done
	
OnwaIntlAirportWendyText4:
	text "I hope you're not"
	line "trying to catch a"
	cont "flight."
	
	para "That line is so"
	line "long, you may as"
	cont "well just walk!"
	
	para "Well, that is if"
	line "ROUTE 12 weren't"
	cont "closed."
	
	para "The whole ROUTE is"
	line "under construction"
	cont "I think."
	
	para "Hmm…"
	
	para "Well, it seems"
	line "like you're not"
	cont "going much further"
	cont "this way…"
	
	para "Maybe you can find"
	line "another way"
	cont "forward."
	
	para "If you can't travel"
	line "by land or sky,"
	cont "maybe you could"
	cont "travel by sea?"
	
	para "Who knows?"
	
	para "Anyway, I have to"
	line "go."
	
	para "Here's my #GEAR"
	line "number."
	
	para "Give me a call"
	line "some time if you"
	cont "need a lift."
	
	para "It was great"
	line "seeing you!"
	done
	
OnwaIntlAirportWendyText5:
	text "<PLAYER>!"
	
	para "What are you doing"
	line "here?"
	
	para "It's me, WENDY!"
	
	para "GYM LEADER from"
	line "EVENTIDE VILLAGE!"
	
	para "This place is"
	line "amazing, isnt it?"
	
	para "I work here as a"
	line "pilot during my"
	cont "off time from my"
	cont "GYM LEADER duties."
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
	step_down
	step_down
	step_end
	