LusterSewersThroneRoom_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 1 ; warp events
	warp_def 10,  5, 4, LUSTER_SEWERS_B2F

	db 1 ; coord events
	xy_trigger 0,  7,  5, 0, LusterSewersThroneRoomFrankieCutscene, 0, 0

	db 0 ; bg events

	db 6 ; object events
	person_event SPRITE_FRANKIE,  2,  5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_CLEARED_LUSTER_SEWERS
	person_event SPRITE_KAGE,  4,  5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_CLEARED_LUSTER_SEWERS
	person_event SPRITE_DELINQUENT_M,  7,  4, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LusterSewerThroneRoomGrunt1, EVENT_CLEARED_LUSTER_SEWERS
	person_event SPRITE_DELINQUENT_M,  6,  4, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_CLEARED_LUSTER_SEWERS
	person_event SPRITE_DELINQUENT_M,  7,  6, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LusterSewerThroneRoomGrunt2, EVENT_CLEARED_LUSTER_SEWERS
	person_event SPRITE_PLAYER_CUTSCENE,  7,  5, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, EVENT_PLAYER_CUTSCENE_SILVER

	
	const_def 1 ; object constants
	const LUSTERSEWERSTHRONEROOM_FRANKIE
	const LUSTERSEWERSTHRONEROOM_FAKE_FRANKIE
	const LUSTERSEWERSTHRONEROOM_GRUNT1
	const LUSTERSEWERSTHRONEROOM_GRUNT2
	const LUSTERSEWERSTHRONEROOM_GRUNT3
	const LUSTERSEWERSTHRONEROOM_CUTSCENE

	
LusterSewerThroneRoomGrunt1:
	faceplayer
	opentext
	writetext LusterSewerThroneRoomGrunt1Text
	waitbutton
	closetext
	spriteface LUSTERSEWERSTHRONEROOM_GRUNT1, RIGHT
	end
	
LusterSewerThroneRoomGrunt2:
	faceplayer
	opentext
	writetext LusterSewerThroneRoomGrunt2Text
	waitbutton
	closetext
	spriteface LUSTERSEWERSTHRONEROOM_GRUNT3, LEFT
	end
	
LusterSewersThroneRoomFrankieCutscene:
	spriteface PLAYER, UP	
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, LUSTERSEWERSTHRONEROOM_GRUNT2, 15
	pause 7
	playmusic MUSIC_POKEMANIAC_ENCOUNTER
	applyonemovement LUSTERSEWERSTHRONEROOM_GRUNT2, fast_step_right
	spriteface LUSTERSEWERSTHRONEROOM_GRUNT2, DOWN
	opentext
	writetext LusterSewersThroneRoomFrankieCutsceneText1
	waitbutton
	closetext
	pause 32
	playmusic MUSIC_NONE
	opentext
	writetext LusterSewersThroneRoomFrankieCutsceneText2
	waitbutton
	closetext
	pause 20
	applyonemovement LUSTERSEWERSTHRONEROOM_FAKE_FRANKIE, step_down
	opentext
	writetext LusterSewersThroneRoomFrankieCutsceneText3
	waitbutton
	closetext
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, LUSTERSEWERSTHRONEROOM_GRUNT2, 15
	pause 7
	spriteface LUSTERSEWERSTHRONEROOM_GRUNT2, UP
	opentext
	writetext LusterSewersThroneRoomFrankieCutsceneText4
	waitbutton
	closetext
	spriteface LUSTERSEWERSTHRONEROOM_GRUNT2, RIGHT
	applymovement LUSTERSEWERSTHRONEROOM_GRUNT2, Movement_LusterSewerThroneRoomGruntStepAside
	pause 5
	applyonemovement LUSTERSEWERSTHRONEROOM_FAKE_FRANKIE, step_down
	pause 10
	opentext
	writetext LusterSewersThroneRoomFrankieCutsceneText5
	waitbutton
	closetext
	pause 10
	applyonemovement LUSTERSEWERSTHRONEROOM_FAKE_FRANKIE, slow_step_up
	pause 10
	opentext
	writetext LusterSewersThroneRoomFrankieCutsceneText6
	waitbutton
	closetext
	pause 16
	opentext
	writetext LusterSewersThroneRoomFrankieCutsceneText7
	waitbutton
	closetext
	pause 48
	playmusic MUSIC_HARDCORE_ENCOUNTER
	applyonemovement LUSTERSEWERSTHRONEROOM_FAKE_FRANKIE, fast_step_down
	opentext
	writetext LusterSewersThroneRoomFrankieCutsceneText8
	waitbutton
	closetext
	pause 32
	playmusic MUSIC_NONE
	opentext
	writetext LusterSewersThroneRoomFrankieCutsceneText2
	waitbutton
	closetext
	
	pause 10
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, LUSTERSEWERSTHRONEROOM_FAKE_FRANKIE, 15
	pause 7
	appear LUSTERSEWERSTHRONEROOM_CUTSCENE
	spriteface LUSTERSEWERSTHRONEROOM_FAKE_FRANKIE, UP
	applyonemovement PLAYER, hide_person
	
	pause 32
	applymovement PLAYER, Movement_LusterSewerThroneRoomPlayerCutscene
	pause 32
	opentext
	writetext LusterSewersThroneRoomFrankieCutsceneText9
	waitbutton
	closetext
	pause 10
	
	applyonemovement LUSTERSEWERSTHRONEROOM_FAKE_FRANKIE, turn_step_up

	opentext
	writetext LusterSewersThroneRoomFrankieCutsceneText10
	waitbutton
	closetext
	applymovement LUSTERSEWERSTHRONEROOM_FAKE_FRANKIE, Movement_LusterSewerThroneRoomFakeFrankie2
	spriteface LUSTERSEWERSTHRONEROOM_FAKE_FRANKIE, LEFT
	pause 5
	playsound SFX_JUMP_OVER_LEDGE
	applymovement LUSTERSEWERSTHRONEROOM_FRANKIE, Movement_LusterSewerThroneRoomFrankie1
	applymovement PLAYER, Movement_LusterSewerThroneRoomPlayerCutscene2
	spriteface PLAYER, UP
	applyonemovement PLAYER, show_person
	disappear LUSTERSEWERSTHRONEROOM_CUTSCENE
	pause 10
	spriteface LUSTERSEWERSTHRONEROOM_FRANKIE, UP
	opentext
	writetext LusterSewersThroneRoomFrankieCutsceneText11
	waitbutton
	closetext
	pause 10
	playmusic MUSIC_LASS_ENCOUNTER
	spriteface LUSTERSEWERSTHRONEROOM_FRANKIE, DOWN
	opentext
	writetext LusterSewersThroneRoomFrankieCutsceneText12
	waitbutton
	yesorno
	iftrue .saidyes
.return
	writetext LusterSewersThroneRoomFrankieCutsceneText13
	waitbutton
	yesorno
	iftrue .saidyes
	writetext LusterSewersThroneRoomFrankieCutsceneText14
	waitbutton
	yesorno
	iftrue .saidyes
	closetext
	playmusic MUSIC_NONE
	pause 24
	spriteface LUSTERSEWERSTHRONEROOM_FRANKIE, UP
	pause 64
	spriteface LUSTERSEWERSTHRONEROOM_FRANKIE, DOWN
	opentext
	playsound SFX_THUNDER
	earthquake 5
	writetext LusterSewersThroneRoomFrankieCutsceneText15
	waitsfx
	waitbutton
	playsound SFX_THUNDER
	earthquake 5
	writetext LusterSewersThroneRoomFrankieCutsceneText16
	waitsfx
	waitbutton
	playsound SFX_THUNDER
	earthquake 5
	writetext LusterSewersThroneRoomFrankieCutsceneText17
	waitsfx
	waitbutton
	closetext
	waitsfx
	winlosstext LusterSewersThroneRoomFrankieCutsceneText6, 0
	setlasttalked LUSTERSEWERSTHRONEROOM_FRANKIE
	loadtrainer FRANKIE, 1
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	reloadmapafterbattle
	playmusic MUSIC_LUSTER_SEWER
	opentext
	writetext LusterSewersThroneRoomFrankieCutsceneText18
	waitbutton
	closetext
	pause 5
	applyonemovement LUSTERSEWERSTHRONEROOM_FRANKIE, step_up
	spriteface LUSTERSEWERSTHRONEROOM_FRANKIE, DOWN
	pause 5
	opentext
	writetext LusterSewersThroneRoomFrankieCutsceneText19
	waitbutton
	closetext
	pause 5
	applymovement LUSTERSEWERSTHRONEROOM_FAKE_FRANKIE, Movement_LusterSewerThroneRoomFakeFrankie3
	spriteface LUSTERSEWERSTHRONEROOM_FAKE_FRANKIE, UP
	opentext
	writetext LusterSewersThroneRoomFrankieCutsceneText20
	waitbutton
	closetext
	pause 10
	spriteface LUSTERSEWERSTHRONEROOM_FRANKIE, UP
	pause 10
	opentext
	writetext LusterSewersThroneRoomFrankieCutsceneText21
	waitbutton
	closetext
	pause 10
	special FadeOutPalettesBlack
	pause 10
	playsound SFX_EXIT_BUILDING
	disappear LUSTERSEWERSTHRONEROOM_FAKE_FRANKIE
	disappear LUSTERSEWERSTHRONEROOM_GRUNT1
	disappear LUSTERSEWERSTHRONEROOM_GRUNT2
	disappear LUSTERSEWERSTHRONEROOM_GRUNT3
	pause 10
	special FadeInTextboxPalettes
	pause 10
	applyonemovement LUSTERSEWERSTHRONEROOM_FRANKIE, step_down
	pause 10
	opentext
	writetext LusterSewersThroneRoomFrankieCutsceneText22
	waitbutton
	closetext
	applymovement LUSTERSEWERSTHRONEROOM_FRANKIE, Movement_LusterSewerThroneRoomFrankie2
	playsound SFX_EXIT_BUILDING
	disappear LUSTERSEWERSTHRONEROOM_FRANKIE
	setevent EVENT_CLEARED_LUSTER_SEWERS
	dotrigger $1
	end
.saidyes
	writetext LusterSewersThroneRoomFrankieYesText
	waitbutton
	yesorno
	iftrue .saidyes
	jump .return
	end
	
LusterSewersThroneRoomFrankieCutsceneText1:
	text "Hold it right"
	line "there!"
	
	para "What's a little"
	line "twerp doin' down"
	cont "here?"
	
	para "This is “BUNEARY”"
	line "private property,"
	cont "and you're tres-"
	cont "passin'!"
	
	para "Huh?"
	
	para "You wanna see"
	line "FRANKIE?"
	
	para "Ha!"
	
	para "Hahahaha!"
	
	para "That's rich, kid!"
	
	para "If you think you're"
	line "gettin' to FRANKIE"
	cont "anytime soon,"
	
	para "you're dumber than"
	line "you look!"
	
	para "Let's do this,"
	line "boys!"
	done
	
LusterSewersThroneRoomFrankieCutsceneText2:
	text "HOLD IT!"
	done
	
LusterSewersThroneRoomFrankieCutsceneText3:
	text "Step aside."
	
	para "…"
	
	para "NOW!"
	done
	
LusterSewersThroneRoomFrankieCutsceneText4:
	text "Uhh…"
	
	para "Sure thing, boss."
	done
	
LusterSewersThroneRoomFrankieCutsceneText5:
	text "Why are you here,"
	line "kid?"
	
	para "“THE NIDOKINGS”"
	line "probably sent"
	cont "you, right?"
	
	para "What's that about,"
	line "huh?"
	
	para "Can't fight their"
	line "own battles?"
	
	para "Have to send a kid"
	line "to do their dirty"
	cont "work for them?"
	
	para "Huh?"
	
	para "HUH!?"
	done
	
LusterSewersThroneRoomFrankieCutsceneText6:
	text "…"
	done
	
LusterSewersThroneRoomFrankieCutsceneText7:
	text "So…"
	done
	
LusterSewersThroneRoomFrankieCutsceneText8:
	text "THEY THINK THEY"
	line "CAN DISRESPECT US"
	cont "LIKE THIS!?"
	
	para "HUH!?"
	
	para "ANSWER ME!"
	
	para "…"
	
	para "…"
	
	para "Fine!"
	
	para "You really made a"
	line "big mistake"
	cont "coming here…"
	
	para "I'm gonna have to"
	line "end you, kid."
	
	para "Right here, right"
	line "now!"
	done
	
LusterSewersThroneRoomFrankieCutsceneText9:
	text "That's enough,"
	line "BRUTUS."
	done	
	
LusterSewersThroneRoomFrankieCutsceneText10:
	text "Right!"
	
	para "Of course, MISS"
	line "FRANKIE!"
	done
	
	
LusterSewersThroneRoomFrankieCutsceneText11:
	text "…"
	
	para "Ahem…"
	done
	
LusterSewersThroneRoomFrankieCutsceneText12:
	text "Please leave us"
	line "alone, big kid…"
	
	para "We're being good,"
	line "I promise!"
	
	para "Those “NIDOKINGS”"
	line "are just big"
	cont "bullies."
	
	para "They made every-"
	line "thing up!"
	
	para "You'll leave us"
	line "alone, won't you?"
	done
	
LusterSewersThroneRoomFrankieCutsceneText13:
	text "Please?"
	done
	
LusterSewersThroneRoomFrankieCutsceneText14:
	text "Pwetty pweeeease?"
	done
	
LusterSewersThroneRoomFrankieCutsceneText15:
	text "ARGH!"
	done
	
LusterSewersThroneRoomFrankieCutsceneText16:
	text "FINE!"
	done
	
LusterSewersThroneRoomFrankieCutsceneText17:
	text "YOU WANNA GO, YOU"
	line "LITTLE PUNK?"
	
	para "LET'S DANCE!"
	done
	
LusterSewersThroneRoomFrankieCutsceneText18:
	text "Grrr…"
	
	para "No wonder those"
	line "“NIDOKINGS” sent"
	cont "you down here…"
	
	para "You're tougher than"
	line "they could EVER"
	cont "hope to be."
	
	para "You wouldn't be"
	line "lookin' to switch"
	cont "sides, would ya?"
	
	para "…"
	
	para "Nah, of course"
	line "not!"
	
	para "Yeah, yeah…"
	
	para "We'll leave for"
	line "now."
	
	para "But this ain't"
	line "over, punk!"
	
	para "Not by a long"
	line "shot!"
	done
	
LusterSewersThroneRoomFrankieCutsceneText19:
	text "Pack it in, boys!"
	
	para "We're outta here!"
	done
	
LusterSewersThroneRoomFrankieCutsceneText20:
	text "But, MISS FRANKIE!"
	done
	
LusterSewersThroneRoomFrankieCutsceneText21:
	text "No ifs, no buts,"
	line "no coconuts!"
	
	para "Move it!"
	done

LusterSewersThroneRoomFrankieCutsceneText22:
	text "And you!"
	
	para "Watch your back,"
	line "punk…"
	done
	
LusterSewersThroneRoomFrankieYesText:
	text "Really?"
	
	para "No foolin'?"
	done
	
LusterSewerThroneRoomGrunt1Text:
	text "What are you"
	line "lookin' at?"
	done
	
LusterSewerThroneRoomGrunt2Text:
	text "Move along, kid"
	done
	
Movement_LusterSewerThroneRoomGruntStepAside:
	fix_facing
	step_left
	remove_fixed_facing
	step_end
	
Movement_LusterSewerThroneRoomGruntStepAside2:
	fix_facing
	step_right
	remove_fixed_facing
	step_end
	
Movement_LusterSewerThroneRoomFakeFrankie1:
	fix_facing
	jump_step_up
	remove_fixed_facing
	step_end
	
Movement_LusterSewerThroneRoomFakeFrankie2:
	turn_step_up
	turn_step_up
	turn_step_up
	run_step_right
	step_end
	
Movement_LusterSewerThroneRoomFakeFrankie3:
	turn_step_left
	turn_step_left
	turn_step_left
	run_step_left
	step_end
	
Movement_LusterSewerThroneRoomFrankie1:
	jump_step_down
	step_sleep 20
	step_down
	step_down
	step_end
	
Movement_LusterSewerThroneRoomFrankie2:
	step_right
	step_down
	step_down
	step_left
	step_down
	step_down
	step_end
	
Movement_LusterSewerThroneRoomPlayerCutscene:
	slow_step_up
	slow_step_up
	step_end
	
Movement_LusterSewerThroneRoomPlayerCutscene2:
	slow_step_down
	slow_step_down
	step_end
