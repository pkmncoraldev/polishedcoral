ShimmerUnderBoardwalk_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, ShimmerUnderBoardwalkCallback

	db 38 ; warp events
	warp_event -1, -1, SHIMMER_CITY, 4
	warp_event 12, 16, SHIMMER_CITY, 4
	warp_event 12, 17, SHIMMER_CITY, 3
	warp_event 12, 18, SHIMMER_CITY, 3
	warp_event -1, -1, SHIMMER_CITY, 3
	warp_event -1, -1, SHIMMER_CITY, 6
	warp_event 12, 10, SHIMMER_CITY, 6
	warp_event 12, 11, SHIMMER_CITY, 5
	warp_event 12, 12, SHIMMER_CITY, 5
	warp_event  3,  1, SHIMMER_CITY, 14
	warp_event -1, -1, SHIMMER_CITY, 9
	warp_event 12,  4, SHIMMER_CITY, 9
	warp_event 12,  5, SHIMMER_CITY, 8
	warp_event 12,  6, SHIMMER_CITY, 7
	warp_event -1, -1, SHIMMER_CITY, 7
	warp_event  4,  1, SHIMMER_CITY, 13
	warp_event  5,  1, SHIMMER_CITY, 13
	warp_event  6,  1, SHIMMER_CITY, 12
	warp_event  7,  1, SHIMMER_CITY, 27
	warp_event  8,  1, SHIMMER_CITY, 11
	warp_event  9,  1, SHIMMER_CITY, 11
	warp_event -1, -1, SHIMMER_CITY, 20
	warp_event  1, 16, SHIMMER_CITY, 20
	warp_event  1, 17, SHIMMER_CITY, 21
	warp_event  1, 18, SHIMMER_CITY, 21
	warp_event -1, -1, SHIMMER_CITY, 21
	warp_event -1, -1, SHIMMER_CITY, 18
	warp_event  1, 10, SHIMMER_CITY, 18
	warp_event  1, 11, SHIMMER_CITY, 19
	warp_event  1, 12, SHIMMER_CITY, 19
	warp_event  2,  1, SHIMMER_CITY, 14
	warp_event -1, -1, SHIMMER_CITY, 15
	warp_event  1,  4, SHIMMER_CITY, 15
	warp_event  1,  5, SHIMMER_CITY, 16
	warp_event  1,  6, SHIMMER_CITY, 17
	warp_event -1, -1, SHIMMER_CITY, 17
	warp_event 10,  1, SHIMMER_CITY, 10
	warp_event 11,  1, SHIMMER_CITY, 10

	db 12 ; coord events
	coord_event 11, 16, 1, ShimmerUnderBoardwalkLilyCutsceneR1
	coord_event 11, 17, 1, ShimmerUnderBoardwalkLilyCutsceneR2
	coord_event 11, 18, 1, ShimmerUnderBoardwalkLilyCutsceneR3
	coord_event  2, 16, 1, ShimmerUnderBoardwalkLilyCutsceneL1
	coord_event  2, 17, 1, ShimmerUnderBoardwalkLilyCutsceneL2
	coord_event  2, 18, 1, ShimmerUnderBoardwalkLilyCutsceneL3
	coord_event  4, 14, 1, ShimmerUnderBoardwalkLilyCutsceneU
	coord_event  5, 14, 1, ShimmerUnderBoardwalkLilyCutsceneU
	coord_event  6, 14, 1, ShimmerUnderBoardwalkLilyCutsceneU
	coord_event  7, 14, 1, ShimmerUnderBoardwalkLilyCutsceneU
	coord_event  8, 14, 1, ShimmerUnderBoardwalkLilyCutsceneU
	coord_event  9, 14, 1, ShimmerUnderBoardwalkLilyCutsceneU

	db 0 ; bg events

	db 8 ; object events
	object_event  7, 17, SPRITE_PIGTAILS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, ShimmerUnderBoardwalkLily, EVENT_SAVED_LILY
	object_event  6, 17, SPRITE_DELINQUENT_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ShimmerUnderBoardwalkPunk1, EVENT_UNDER_BOARDWALK_BATTLE_2
	object_event  8, 17, SPRITE_DELINQUENT_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ShimmerUnderBoardwalkPunk2, EVENT_UNDER_BOARDWALK_BATTLE_2
	object_event  7, 19, SPRITE_DELINQUENT_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ShimmerUnderBoardwalkPunk3, EVENT_UNDER_BOARDWALK_BATTLE_2
	object_event  8, 17, SPRITE_MON_ICON, SPRITEMOVEDATA_TILE_DOWN_PRIORITY, 0, CLEFAIRY, -1, -1, PAL_NPC_PINK, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ALWAYS_SET
	object_event  5, 21, SPRITE_DELINQUENT_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ShimmerUnderBoardwalkPunk1, EVENT_LOST_GIRLS_QUEST_ACTIVE
	object_event  6, 21, SPRITE_DELINQUENT_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ShimmerUnderBoardwalkPunk2, EVENT_LOST_GIRLS_QUEST_ACTIVE
	object_event  7, 21, SPRITE_DELINQUENT_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ShimmerUnderBoardwalkPunk3, EVENT_LOST_GIRLS_QUEST_ACTIVE
	
	
	const_def 1 ; object constants
	const SHIMMER_UNDER_BOARDWALK_LILY
	const SHIMMER_UNDER_BOARDWALK_PUNK_1
	const SHIMMER_UNDER_BOARDWALK_PUNK_2
	const SHIMMER_UNDER_BOARDWALK_PUNK_3
	const SHIMMER_UNDER_BOARDWALK_DOLL
	
ShimmerUnderBoardwalkCallback:
	checkevent EVENT_LOST_GIRLS_QUEST_ACTIVE
	iftrue .end
	moveperson SHIMMER_UNDER_BOARDWALK_LILY,  7, 15
	moveperson SHIMMER_UNDER_BOARDWALK_PUNK_1, -5, -5
	moveperson SHIMMER_UNDER_BOARDWALK_PUNK_2, -5, -5
	moveperson SHIMMER_UNDER_BOARDWALK_PUNK_3, -5, -5
.end
	return
	
ShimmerUnderBoardwalkLilyCutsceneU:
	scall ShimmerUnderBoardwalkLilyCutsceneStart
	applyonemovement PLAYER, step_down
	jump ShimmerUnderBoardwalkLilyCutscene
	
ShimmerUnderBoardwalkLilyCutsceneR1:
	scall ShimmerUnderBoardwalkLilyCutsceneStart
	applymovement PLAYER, Movement_ShimmerUnderBoardwalkWalkLeft1
	spriteface PLAYER, LEFT
	jump ShimmerUnderBoardwalkLilyCutscene
	
ShimmerUnderBoardwalkLilyCutsceneR2:
	scall ShimmerUnderBoardwalkLilyCutsceneStart
	applymovement PLAYER, Movement_ShimmerUnderBoardwalkWalkLeft2
	jump ShimmerUnderBoardwalkLilyCutscene
	
ShimmerUnderBoardwalkLilyCutsceneR3:
	scall ShimmerUnderBoardwalkLilyCutsceneStart
	applymovement PLAYER, Movement_ShimmerUnderBoardwalkWalkLeft3
	spriteface PLAYER, LEFT
	jump ShimmerUnderBoardwalkLilyCutscene
	
ShimmerUnderBoardwalkLilyCutsceneL1:
	scall ShimmerUnderBoardwalkLilyCutsceneStart
	applymovement PLAYER, Movement_ShimmerUnderBoardwalkWalkRight1
	spriteface PLAYER, RIGHT
	jump ShimmerUnderBoardwalkLilyCutscene
	
ShimmerUnderBoardwalkLilyCutsceneL2:
	scall ShimmerUnderBoardwalkLilyCutsceneStart
	applymovement PLAYER, Movement_ShimmerUnderBoardwalkWalkRight2
	jump ShimmerUnderBoardwalkLilyCutscene
	
ShimmerUnderBoardwalkLilyCutsceneL3:
	scall ShimmerUnderBoardwalkLilyCutsceneStart
	applymovement PLAYER, Movement_ShimmerUnderBoardwalkWalkRight3
	spriteface PLAYER, RIGHT
ShimmerUnderBoardwalkLilyCutscene:
	dotrigger $0
	scall ShimmerUnderBoardwalkBulliesThrowing
	opentext
	writetext ShimmerUnderBoardwalkBulliesText
	waitbutton
	closetext
	wait 7
	scall ShimmerUnderBoardwalkBulliesThrowing
	spriteface SHIMMER_UNDER_BOARDWALK_LILY, RIGHT
	wait 7
	spriteface SHIMMER_UNDER_BOARDWALK_LILY, DOWN
	jumptext ShimmerUnderBoardwalkLilyText4
	end
	
ShimmerUnderBoardwalkLilyCutsceneStart:
	spriteface SHIMMER_UNDER_BOARDWALK_LILY, RIGHT
	opentext
	writetext ShimmerUnderBoardwalkLilyText3
	waitbutton
	closetext
	end
	
ShimmerUnderBoardwalkLily:
	checkevent EVENT_UNDER_BOARDWALK_BATTLE_2
	iftrue .saved
	checkevent EVENT_UNDER_BOARDWALK_BATTLE_1
	iftrue .helping
	checkevent EVENT_LOST_GIRLS_QUEST_ACTIVE
	iftrue .being_bullied
	jumptextfaceplayer ShimmerUnderBoardwalkLilyText1
.being_bullied
	scall ShimmerUnderBoardwalkBulliesThrowing
.helping
	jumptextfaceplayer ShimmerUnderBoardwalkLilyText2
.saved
	faceplayer
	opentext
	writetext ShimmerUnderBoardwalkLilyText5
	waitbutton
	closetext
	checkcode VAR_FACING
	ifnotequal LEFT, .YouAreNotFacingLeft
	applyonemovement SHIMMER_UNDER_BOARDWALK_LILY, step_down
.YouAreNotFacingLeft
	applymovement SHIMMER_UNDER_BOARDWALK_LILY, Movement_ShimmerUnderBoardwalkLily
.end
	playsound SFX_EXIT_BUILDING
	disappear SHIMMER_UNDER_BOARDWALK_LILY
	setevent EVENT_SAVED_LILY
	callasm LilySetNameAsm
	special Special_SaveLostGirl
	end	
	
LilySetNameAsm:
	ld hl, .lilystring
	ld bc, PKMN_NAME_LENGTH
	ld de, wStringBuffer1
	rst CopyBytes
	ret
	
.lilystring:
	db "LILY@@@@@@@"
	
ShimmerUnderBoardwalkBulliesThrowing:
	spriteface SHIMMER_UNDER_BOARDWALK_LILY, RIGHT
	applyonemovement SHIMMER_UNDER_BOARDWALK_PUNK_2, turn_step_left
	appear SHIMMER_UNDER_BOARDWALK_DOLL
	playsound SFX_JUMP_OVER_LEDGE
	applymovement SHIMMER_UNDER_BOARDWALK_DOLL, Movement_ShimmerUnderBoardwalkThrowLeft
	applyonemovement SHIMMER_UNDER_BOARDWALK_LILY, turn_step_left
	disappear SHIMMER_UNDER_BOARDWALK_DOLL
	moveperson SHIMMER_UNDER_BOARDWALK_DOLL,  6, 17
	spriteface SHIMMER_UNDER_BOARDWALK_LILY, LEFT
	wait 7
	applyonemovement SHIMMER_UNDER_BOARDWALK_PUNK_1, turn_step_right
	appear SHIMMER_UNDER_BOARDWALK_DOLL
	playsound SFX_JUMP_OVER_LEDGE
	applymovement SHIMMER_UNDER_BOARDWALK_DOLL, Movement_ShimmerUnderBoardwalkThrowRight
	applyonemovement SHIMMER_UNDER_BOARDWALK_LILY, turn_step_right
	disappear SHIMMER_UNDER_BOARDWALK_DOLL
	moveperson SHIMMER_UNDER_BOARDWALK_DOLL,  8, 17
	setevent EVENT_ALWAYS_SET
	end
	
Movement_ShimmerUnderBoardwalkLily:
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end
	
Movement_ShimmerUnderBoardwalkWalkLeft1:
	step_left
	step_left
	step_down
	step_end
	
Movement_ShimmerUnderBoardwalkWalkLeft2:
	step_left
	step_left
	step_end
	
Movement_ShimmerUnderBoardwalkWalkLeft3:
	step_left
	step_left
	step_up
	step_end
	
Movement_ShimmerUnderBoardwalkWalkRight1:
	step_right
	step_right
	step_right
	step_down
	step_end
	
Movement_ShimmerUnderBoardwalkWalkRight2:
	step_right
	step_right
	step_right
	step_end
	
Movement_ShimmerUnderBoardwalkWalkRight3:
	step_right
	step_right
	step_right
	step_up
	step_end
	
Movement_ShimmerUnderBoardwalkThrowLeft:
	fix_facing
	set_sliding
	jump_step_left
	remove_sliding
	remove_fixed_facing
	step_end
	
Movement_ShimmerUnderBoardwalkThrowRight:
	fix_facing
	set_sliding
	jump_step_right
	remove_sliding
	remove_fixed_facing
	step_end
	
ShimmerUnderBoardwalkLilyText1:
	text "Hehehe!"
	
	para "It's so much fun"
	line "to play under the"
	cont "boardwalk!"
	done
	
ShimmerUnderBoardwalkLilyText2:
	text "Snivel…"
	
	para "They won't give me"
	line "back my dolly…"
	done
	
ShimmerUnderBoardwalkLilyText3:
	text "Give it back!"
	
	para "Please!"
	
	para "Give me back my"
	line "dolly!"
	done
	
ShimmerUnderBoardwalkLilyText4:
	text "Snivel…"
	done
	
ShimmerUnderBoardwalkLilyText5:
	text "LILY: Sniff…"
	
	para "Thank you for"
	line "helping me…"
	
	para "I left home to"
	line "come play on the"
	cont "beach with my"
	cont "dolly."
	
	para "Then those mean"
	line "big kids started"
	cont "picking on me!"
	
	para "I think I want"
	line "to go home, now…"
	done
	
ShimmerUnderBoardwalkPunk1:
	checkevent EVENT_LOST_GIRLS_QUEST_ACTIVE
	iftrue .bullying
	jumptextfaceplayer ShimmerUnderBoardwalkPunk1Text1
.bullying
	setlasttalked SHIMMER_UNDER_BOARDWALK_PUNK_1
	checkevent EVENT_UNDER_BOARDWALK_BATTLE_1
	iftrue .checkbattle2
	jump ShimmerUnderBoardwalkBattle1
.checkbattle2
	checkevent EVENT_UNDER_BOARDWALK_BATTLED_R
	iftrue ShimmerUnderBoardwalkBattle2
	jumptextfaceplayer ShimmerUnderBoardwalkPunk1Text3
	
	
ShimmerUnderBoardwalkPunk2:
	checkevent EVENT_LOST_GIRLS_QUEST_ACTIVE
	iftrue .bullying
	jumptextfaceplayer ShimmerUnderBoardwalkPunk2Text1
.bullying
	setlasttalked SHIMMER_UNDER_BOARDWALK_PUNK_2
	checkevent EVENT_UNDER_BOARDWALK_BATTLE_1
	iftrue .checkbattle2
	scall ShimmerUnderBoardwalkBattle1
	setevent EVENT_UNDER_BOARDWALK_BATTLED_R
	end
.checkbattle2
	checkevent EVENT_UNDER_BOARDWALK_BATTLED_R
	iffalse ShimmerUnderBoardwalkBattle2
	jumptextfaceplayer ShimmerUnderBoardwalkPunk1Text3
	
ShimmerUnderBoardwalkBattle1:
	special SaveMusic
	playmusic MUSIC_POKEMANIAC_ENCOUNTER
	faceplayer
	opentext
	writetext ShimmerUnderBoardwalkPunk1Text2
	waitbutton
	closetext
	waitsfx
	winlosstext ShimmerUnderBoardwalkPunk1WinText, 0
	loadtrainer DELINQUENT_M, SPIKE
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
;	dontrestartmapmusic
	reloadmapafterbattle
	special RestoreMusic
	opentext
	writetext ShimmerUnderBoardwalkPunk1Text3
	waitbutton
	closetext
	setevent EVENT_UNDER_BOARDWALK_BATTLE_1
	end
	
ShimmerUnderBoardwalkBattle2:
	special SaveMusic
	playmusic MUSIC_POKEMANIAC_ENCOUNTER
	faceplayer
	opentext
	writetext ShimmerUnderBoardwalkPunk2Text2
	waitbutton
	closetext
	waitsfx
	winlosstext ShimmerUnderBoardwalkPunk2WinText, 0
	loadtrainer DELINQUENT_M, IGGY
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	opentext
	writetext ShimmerUnderBoardwalkPunk2Text3
	waitbutton
	closetext
	setevent EVENT_UNDER_BOARDWALK_BATTLE_2
	pause 5
	playsound SFX_EXIT_BUILDING
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear SHIMMER_UNDER_BOARDWALK_PUNK_1
	disappear SHIMMER_UNDER_BOARDWALK_PUNK_2
	disappear SHIMMER_UNDER_BOARDWALK_PUNK_3
	disappear SHIMMER_UNDER_BOARDWALK_DOLL
	special Special_FadeOutMusic
	waitsfx
	special Special_FadeInQuickly
	pause 15
	playmapmusic
	end
	
ShimmerUnderBoardwalkPunk3:
	checkevent EVENT_LOST_GIRLS_QUEST_ACTIVE
	iftrue .bullying
	jumptextfaceplayer ShimmerUnderBoardwalkPunk3Text1
.bullying
	checkevent EVENT_UNDER_BOARDWALK_BATTLE_1
	iftrue .saving
	jumptextfaceplayer ShimmerUnderBoardwalkPunk3Text2
.saving
	jumptextfaceplayer ShimmerUnderBoardwalkPunk3Text3

ShimmerUnderBoardwalkBulliesText:
	text "Haha!"
	
	para "Come on, don't ya"
	line "want it?"
	
	para "It's right here!"
	
	para "Just grab it!"
	done

ShimmerUnderBoardwalkPunk1Text1:
	text "Gah! That girl"
	line "is so annoying!"
	
	para "Someone should"
	line "shut her up!"
	done
	
ShimmerUnderBoardwalkPunk1Text2:
	text "What do you want?"
	
	para "You got a problem?"
	done
	
ShimmerUnderBoardwalkPunk1Text3:
	text "Whatever!"
	done
	
ShimmerUnderBoardwalkPunk1WinText:
	text "Guh!"
	done
	
ShimmerUnderBoardwalkPunk2Text1:
	text "Why does that girl"
	line "think she can play"
	cont "where we hang out?"
	done
	
ShimmerUnderBoardwalkPunk2Text2:
	text "Ah heck no!"
	
	para "We aren't goin'"
	line "down like that!"
	done

ShimmerUnderBoardwalkPunk2Text3:
	text "Whatever…"
	
	para "We don't need"
	line "this…"
	
	para "Let's get outta"
	line "here, you guys."
	done

ShimmerUnderBoardwalkPunk2WinText:
	text "What the heck!?"
	done

ShimmerUnderBoardwalkPunk3Text1:
	text "What are you"
	line "lookin' at?"
	done
	
ShimmerUnderBoardwalkPunk3Text2:
	text "Haha!"
	
	para "Look at her go!"
	done
	
ShimmerUnderBoardwalkPunk3Text3:
	text "Who do you think"
	line "you are?"
	done
	