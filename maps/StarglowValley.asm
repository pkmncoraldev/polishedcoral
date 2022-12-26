StarglowValley_MapScriptHeader:
	db 4 ; scene scripts
	scene_script StarglowValleyTrigger0
	scene_script StarglowValleyTrigger1
	scene_script StarglowValleyTrigger2
	scene_script StarglowValleyTrigger3

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, StarglowValleyFlyPoint
	callback MAPCALLBACK_OBJECTS, StarglowValleyRodneyRematch

	db 7 ; warp events
	warp_def 5, 5, 1, STARGLOW_TOGEPI_HOUSE
	warp_def 5, 23, 1, STARGLOW_NO_POKEMON_HOUSE
	warp_def 9, 31, 1, STARGLOW_GRANDPA_HOUSE
	warp_def 27, 23, 1, STARGLOW_FISHING_GURU_HOUSE
	warp_def 17, 17, 1, STARGLOW_POKECENTER
	warp_def 17, 31, 2, STARGLOW_MART
	warp_def 21, 6, 1, STARGLOW_GYM

	db 5 ; coord events
	xy_trigger 0,  4, 12, 0, StarglowGirlStopsYouL, 0, 0
	xy_trigger 0,  4, 13, 0, StarglowGirlStopsYouR, 0, 0
	xy_trigger 1, 18, 36, 0, StarglowSnareStopsYou, 0, 0
	xy_trigger 2, 18, 36, 0, StarglowSnareStopsYou, 0, 0
	xy_trigger 3, 18, 36, 0, StarglowSnareStopsYou, 0, 0

	db 7 ; bg events
	signpost  4, 14, SIGNPOST_READ, StarglowValleySign
	signpost 22,  5, SIGNPOST_READ, StarglowGymSign
	signpost 27, 21, SIGNPOST_READ, StarglowGuruSign
	signpost 17, 18, SIGNPOST_READ, StarglowCenterSign
	signpost 17, 32, SIGNPOST_READ, StarglowMartSign
	bg_event  6, 16, SIGNPOST_ITEM + RARE_CANDY, EVENT_STARGLOW_HIDDEN_RARE_CANDY
	bg_event 35, 13, SIGNPOST_ITEM + GREAT_BALL, EVENT_STARGLOW_HIDDEN_GREAT_BALL
;	signpost 8, 14, SIGNPOST_READ, StarglowClue

	db 18 ; object events
	person_event SPRITE_TWIN,  6,  5, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, StarglowLittleGirl, EVENT_STARGLOW_HELPED_LITTLEGIRL
	person_event SPRITE_SNARE, 6, 23, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, StarglowSnare1, EVENT_BEAT_STARGLOW_SNARE_1
	person_event SPRITE_SNARE_GIRL, 10, 31, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, StarglowSnare2, EVENT_BEAT_STARGLOW_SNARE_2
	person_event SPRITE_SNARE, 22, 6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, StarglowSnare3, EVENT_STARGLOW_MAIN_PUNK
	person_event SPRITE_SNARE, 19, 36, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, StarglowSnare4, EVENT_PUNKS_LEAVE_STARGLOW
	person_event SPRITE_GRAMPS, 10, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, StarglowGramps, -1
	person_event SPRITE_YOUNGSTER, 14, 26, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, StarglowYoungster, -1
	person_event SPRITE_LASS, 19, 29, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, StarglowLass, EVENT_PUNKS_LEAVE_STARGLOW
	person_event SPRITE_FISHER, 16, 7, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, StarglowFisher1, EVENT_PUNKS_HAVENT_LEFT_STARGLOW
	person_event SPRITE_FISHER, 9, 19, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, StarglowFisher2, EVENT_PUNKS_HAVENT_LEFT_STARGLOW
	person_event SPRITE_FISHER, 24, 20, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, StarglowFisher3, EVENT_PUNKS_HAVENT_LEFT_STARGLOW
	person_event SPRITE_SCHOOLBOY, 20, 31, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, StarglowYoungster2, -1
	object_event 32, 20, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, POLIWHIRL, -1, -1, PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, StarglowPoliwhirl, -1
	person_event SPRITE_COOLTRAINER_F, 18, 13, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, StarglowLass2, EVENT_PUNKS_HAVENT_LEFT_STARGLOW
	person_event SPRITE_RODNEY, 21,  6, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, StarglowLass, EVENT_ALWAYS_SET
	person_event SPRITE_SNARE, 22, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, StarglowSnare3, EVENT_STARGLOW_MAIN_PUNK_2
	fruittree_event 28, 26, FRUITTREE_STARGLOW_VALLEY, PERSIM_BERRY
	cuttree_event 34, 30, EVENT_STARGLOW_VALLEY_CUT_TREE
	
	
	
	const_def 1 ; object constants
	const STARGLOWLITTLEGIRL
	const STARGLOWSNARE1
	const STARGLOWSNARE2
	const STARGLOWSNARE3
	const STARGLOWSNARE4
	const STARGLOWGRAMPS
	const STARGLOWYOUNGSTER
	const STARGLOWLASS
	const STARGLOWFISHER1
	const STARGLOWFISHER2
	const STARGLOWFISHER3
	const STARGLOWYOUNGSTER2
	const STARGLOWPOLIWHIRL
	const STARGLOWLASS2
	const STARGLOWRODNEY
	const STARGLOWSNARE3_2

StarglowValleyTrigger0:
	end

StarglowValleyTrigger1:
	domaptrigger STARGLOW_TOGEPI_HOUSE, $1
	end

StarglowValleyTrigger2:
	checkevent EVENT_BEAT_STARGLOW_SNARE_1
	iffalse .end
	checkevent EVENT_BEAT_STARGLOW_SNARE_2
	iffalse .end
	checkevent EVENT_BEAT_STARGLOW_SNARE_3
	iffalse .end
	checkevent EVENT_STARGLOW_HELPED_LITTLEGIRL
	iffalse .end
	disappear STARGLOWSNARE3
	appear STARGLOWSNARE3_2
	dotrigger $3
.end
	end

StarglowValleyTrigger3:
	end
	
StarglowValleyTrigger4:
	end

StarglowValleyFlyPoint:
	setflag ENGINE_FLYPOINT_STARGLOW
	return
	
StarglowValleyRodneyRematch:
	checkevent EVENT_BEAT_RODNEY_REMATCH
	iffalse .end
	clearevent EVENT_BEAT_RODNEY_REMATCH
	clearevent EVENT_BEAT_STARGLOW_GYM_TRAINER_1_REMATCH
	clearevent EVENT_BEAT_STARGLOW_GYM_TRAINER_2_REMATCH
	clearevent EVENT_BEAT_STARGLOW_GYM_TRAINER_3_REMATCH
	clearevent EVENT_BEAT_STARGLOW_GYM_TRAINER_4_REMATCH
.end
	return
	
;StarglowClue:
;	checkitem CLUE_3
;	iffalse .end
;	checkitem CLUE_4
;	iftrue .end
;	opentext
;	writetext StarglowClueText
;	waitbutton
;	verbosegiveitem CLUE_4
;	closetext
;	end
;.end
;	killsfx
;	end
	
;StarglowClueText:
;	text "You find something"
;	line "in the knot of the"
;	cont "tree…"
	
;	para "It's another clue!"
;	done
	
;FruitTreeScript_Starglow:
;	fruittree FRUITTREE_STARGLOW
	
StarglowFisher1:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM01_CUT
	iftrue .gotcut
	writetext StarglowFisher1Text1
	buttonsound
	verbosegivetmhm HM_CUT
	setevent EVENT_GOT_HM01_CUT
	setflag ENGINE_GOT_CUT
.gotcut
	writetext StarglowFisher1Text2
	waitbutton
	spriteface STARGLOWFISHER1, UP
	closetext
	end
	
StarglowFisher2:
	faceplayer
	opentext
	writetext StarglowFisher2Text
	waitbutton
	spriteface STARGLOWFISHER2, DOWN
	closetext
	end
	
StarglowFisher3:
	faceplayer
	opentext
	writetext StarglowFisher3Text
	waitbutton
	spriteface STARGLOWFISHER3, UP
	closetext
	end
	
StarglowGramps:
	checkevent EVENT_PUNKS_LEAVE_STARGLOW
	iffalse .punksinstarglow
	faceplayer
	opentext
	writetext StarglowGrampsText2
	waitbutton
	spriteface STARGLOWGRAMPS, DOWN
	closetext
	end
.punksinstarglow
	faceplayer
	opentext
	writetext StarglowGrampsText1
	waitbutton
	spriteface STARGLOWGRAMPS, DOWN
	closetext
	end
	
StarglowYoungster:
	checkevent EVENT_PUNKS_LEAVE_STARGLOW
	iffalse .punksinstarglow
	jumptextfaceplayer StarglowYoungsterText2
.punksinstarglow
	jumptextfaceplayer StarglowYoungsterText1
	
StarglowLass:
	jumptextfaceplayer StarglowLassText
	
StarglowYoungster2:
	faceplayer
	opentext
	writetext StarglowYoungster2Text
	waitbutton
	spriteface STARGLOWYOUNGSTER2, DOWN
	closetext
	end
	
StarglowLass2:
	jumptextfaceplayer StarglowLass2Text
	
StarglowPoliwhirl:
	opentext
	writetext StarglowPoliwhirlText1
	cry POLIWHIRL
	waitsfx
	buttonsound
	writetext StarglowPoliwhirlText2
	waitbutton
	closetext
	end
	
StarglowValleySign:
	jumptext StarglowValleySignText
	
StarglowGymSign:
	jumptext StarglowGymSignText
	
StarglowGuruSign:
	jumptext StarglowGuruSignText
	
StarglowCenterSign:
	jumpstd pokecentersign

StarglowMartSign:
	jumpstd martsign
	
StarglowSnare1:
	faceplayer
	opentext
	writetext StarglowSnare1Text1
	yesorno
	iffalse .end
	special SaveMusic
	playmusic MUSIC_TEAM_SNARE_ENCOUNTER
	writetext StarglowSnare1Text4
	waitbutton
	closetext
	waitsfx
	winlosstext StarglowSnare1WinText, 0
	setlasttalked STARGLOWSNARE1
	loadtrainer GRUNTM, STARGLOW_GRUNTM_3
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	reloadmapafterbattle
	special RestoreMusic
	opentext
	writetext StarglowSnare1Text2
	waitbutton
	closetext
	checkcode VAR_FACING
	if_equal RIGHT, .YouAreFacingRight
	applymovement STARGLOWSNARE1, Movement_StarglowSnare1_1
	jump .StarglowSnare1Disappear
.YouAreFacingRight
	applymovement STARGLOWSNARE1, Movement_StarglowSnare1_2
.StarglowSnare1Disappear
	disappear STARGLOWSNARE1
	setevent EVENT_BEAT_STARGLOW_SNARE_1
	end
.end
	writetext StarglowSnare1Text3
	waitbutton
	spriteface STARGLOWSNARE1, DOWN
	closetext
	end
	
StarglowSnare2:
	faceplayer
	opentext
	writetext StarglowSnare2Text1
	yesorno
	iffalse .end
	special SaveMusic
	playmusic MUSIC_TEAM_SNARE_ENCOUNTER
	writetext StarglowSnare2Text4
	waitbutton
	closetext
	waitsfx
	winlosstext StarglowSnare2WinText, 0
	setlasttalked STARGLOWSNARE2
	loadtrainer GRUNTF, STARGLOW_GRUNTF_1
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	reloadmapafterbattle
	special RestoreMusic
	opentext
	writetext StarglowSnare2Text2
	waitbutton
	closetext
	checkcode VAR_FACING
	if_equal RIGHT, .YouAreFacingRight
	applymovement STARGLOWSNARE2, Movement_StarglowSnare2_1
	jump .StarglowSnare1Disappear
.YouAreFacingRight
	applymovement STARGLOWSNARE2, Movement_StarglowSnare2_2
.StarglowSnare1Disappear
	disappear STARGLOWSNARE2
	setevent EVENT_BEAT_STARGLOW_SNARE_2
	end
.end
	writetext StarglowSnare2Text3
	waitbutton
	spriteface STARGLOWSNARE2, DOWN
	closetext
	end
	
StarglowSnare3:
	checkevent EVENT_BEAT_STARGLOW_SNARE_1
	iffalse .end
	checkevent EVENT_BEAT_STARGLOW_SNARE_2
	iffalse .end
	checkevent EVENT_BEAT_STARGLOW_SNARE_3
	iffalse .end
	checkevent EVENT_STARGLOW_HELPED_LITTLEGIRL
	iffalse .end
	checkcode VAR_FACING
	if_equal LEFT, .cont
	applymovement PLAYER, Movement_StarglowPlayerSnare3
	spriteface PLAYER, LEFT
.cont
	setevent EVENT_MET_RODNEY
	callasm .MetRodney
	faceplayer
	opentext
	writetext StarglowSnare3Text2
	pause 20
	closetext
	pause 20
	playmusic MUSIC_TEAM_SNARE_ENCOUNTER
	moveperson STARGLOWSNARE1, $d, $16
	appear STARGLOWSNARE1
	moveperson STARGLOWSNARE4, $d, $16
	appear STARGLOWSNARE4
	follow STARGLOWSNARE1, STARGLOWSNARE4
	applymovement STARGLOWSNARE1, Movement_StarglowDummySnare1
	stopfollow
	applymovement STARGLOWSNARE1, Movement_StarglowDummySnare1cont
	spriteface STARGLOWSNARE1, UP
	spriteface PLAYER, DOWN
	pause 16
	spriteface PLAYER, RIGHT
	pause 16
	spriteface PLAYER, LEFT
	opentext
	writetext StarglowSnare3Text3
	waitbutton
	closetext
	pause 32
	playmusic MUSIC_NONE
	opentext
	writetext StarglowRodneyText1
	waitbutton
	closetext
	playsound SFX_PAY_DAY
	spriteface STARGLOWSNARE3_2, UP
	showemote EMOTE_SHOCK, STARGLOWSNARE3_2, 15
	pause 7
	opentext
	writetext StarglowSnare3Text4
	playmusic MUSIC_ENCOUNTER_GYM_LEADER
	pause 48
	closetext
	appear STARGLOWRODNEY
	playsound SFX_EXIT_BUILDING
	applymovement STARGLOWSNARE3_2, Movement_StarglowSnare3
	applymovement STARGLOWRODNEY, Movement_StarglowSnare3
	opentext
	writetext StarglowRodneyText2
	waitbutton
	closetext
	pause 16
	spriteface STARGLOWRODNEY, RIGHT
	opentext
	writetext StarglowRodneyText3
	waitbutton
	spriteface STARGLOWRODNEY, DOWN
	closetext
	playsound SFX_PAY_DAY
	spriteface STARGLOWSNARE3_2, UP
	showemote EMOTE_SHOCK, STARGLOWSNARE3_2, 15
	pause 7
	opentext
	writetext StarglowSnare3Text5
	waitbutton
	closetext
	spriteface STARGLOWSNARE3_2, RIGHT
	pause 20
	spriteface STARGLOWSNARE3_2, UP
	pause 20
	spriteface STARGLOWSNARE3_2, RIGHT
	opentext
	writetext StarglowSnare3Text6
	waitbutton
	closetext
	follow STARGLOWSNARE4, STARGLOWSNARE1
	applymovement STARGLOWSNARE4, Movement_StarglowDummySnare2
	disappear STARGLOWSNARE1
	disappear STARGLOWSNARE4
	spriteface STARGLOWSNARE3_2, UP
	opentext
	writetext StarglowSnare3Text7
	waitbutton
	closetext
	applymovement STARGLOWSNARE3_2, Movement_StarglowSnare3_2
	disappear STARGLOWSNARE3_2
	clearflag ENGINE_PUNKS_IN_STARGLOW
	setevent EVENT_PUNKS_LEAVE_STARGLOW
	setevent EVENT_STARGLOW_MAIN_PUNK
	setevent EVENT_STARGLOW_MAIN_PUNK_2
	clearevent EVENT_PUNKS_HAVENT_LEFT_STARGLOW
	special Special_FadeOutMusic
	pause 10
	playmapmusic
	spriteface STARGLOWRODNEY, RIGHT
	opentext
	writetext StarglowRodneyText4
	waitbutton
	closetext
	applymovement STARGLOWRODNEY, Movement_StarglowRodney
	playsound SFX_ENTER_DOOR
	disappear STARGLOWRODNEY
	disappear STARGLOWSNARE4
	appear STARGLOWFISHER1
	appear STARGLOWFISHER2
	appear STARGLOWFISHER3
	appear STARGLOWYOUNGSTER2
	appear STARGLOWLASS2
	appear STARGLOWPOLIWHIRL
	disappear STARGLOWLASS
	dotrigger $4
	end
	
.end
	opentext
	writetext StarglowSnare3Text8
	waitbutton
	closetext
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, STARGLOWSNARE3, 15
	pause 7
	faceplayer
	opentext
	writetext StarglowSnare3Text1
	waitbutton
	spriteface STARGLOWSNARE3, UP
	closetext
	end
	
.MetRodney
	ld hl, wMetGymLeaderFlags
	set 1, [hl] ; metrodney
	ret
	
StarglowSnare4:
	faceplayer
	opentext
	writetext StarglowSnare4Text1
	waitbutton
	closetext
	end
	
StarglowSnareStopsYou:
	checkevent EVENT_PUNKS_LEAVE_STARGLOW
	iftrue .end
	special Special_StopRunning
	playsound SFX_PAY_DAY
	spriteface STARGLOWSNARE4, UP
	showemote EMOTE_SHOCK, STARGLOWSNARE4, 15
	pause 7
	spriteface PLAYER, DOWN
	opentext
	writetext StarglowSnare4Text2
	waitbutton
	closetext
	follow PLAYER, STARGLOWSNARE4
	applymovement PLAYER, Movement_StarglowSnareStopsYouPlayer
	stopfollow
	spriteface PLAYER, RIGHT
	spriteface STARGLOWSNARE4, LEFT
	opentext
	writetext StarglowSnare4Text1
	waitbutton
	closetext
	applymovement STARGLOWSNARE4, Movement_StarglowSnareStopsYou2
.end
	end
	
StarglowGirlStopsYouL:
	moveperson STARGLOWLITTLEGIRL, 12, 10
	jump StarglowGirlStopsYouCont
	
StarglowGirlStopsYouR:
	moveperson STARGLOWLITTLEGIRL, 13, 10
	
StarglowGirlStopsYouCont:
	setevent EVENT_STARGLOW_HAVENT_HELPED_GIRL
	setevent EVENT_STARGLOW_HAVENT_HELPED_GIRL_TOGEPI
	special Special_StopRunning
	applymovement PLAYER, Movement_StarglowSnareStopsYou2
	applymovement STARGLOWLITTLEGIRL, Movement_StarglowLittleGirlWalksUp1
	spriteface STARGLOWLITTLEGIRL, UP
	opentext
	writetext StarglowLittleGirlText1
	waitbutton
	closetext
	applymovement STARGLOWLITTLEGIRL, Movement_StarglowLittleGirlWalksUp2
	disappear STARGLOWLITTLEGIRL
	moveperson STARGLOWLITTLEGIRL, 5, 6
	appear STARGLOWLITTLEGIRL
	dotrigger $1
.end	
	end
	
StarglowSnare:
	end
	
StarglowLittleGirl:
	setevent EVENT_STARGLOW_HOUSE
	checkevent EVENT_SAID_NO_TO_LITTLE_GIRL
	iftrue .alreadytalked
	opentext
	writetext StarglowLittleGirlText4
	waitbutton
	closetext
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, STARGLOWLITTLEGIRL, 15
	faceplayer
	pause 7
	opentext
	writetext StarglowLittleGirlText2
	yesorno
	iffalse .no
.yes
	writetext StarglowLittleGirlText6
	waitbutton
	closetext
	checkcode VAR_FACING
	if_equal RIGHT, .YouAreFacingRight
	applymovement STARGLOWLITTLEGIRL, Movement_StarglowPlayerDontGo1
	faceplayer
	if_equal UP, .YouAreFacingUp
	applymovement PLAYER, Movement_StarglowPlayerEnterHouse1
	warpcheck
	end
.YouAreFacingRight
	applymovement STARGLOWLITTLEGIRL, Movement_StarglowPlayerDontGo2
	faceplayer
	applymovement PLAYER, Movement_StarglowPlayerEnterHouse2
	warpcheck
	end
.YouAreFacingUp
	applymovement PLAYER, Movement_StarglowPlayerEnterHouse3
	warpcheck
	end
	
.alreadytalked
	faceplayer
	opentext
	writetext StarglowLittleGirlText3
	yesorno
	iffalse .no
	jump .yes
	
.no
	closetext
	spriteface STARGLOWLITTLEGIRL, UP
	opentext
	writetext StarglowLittleGirlText5
	waitbutton
	closetext
	setevent EVENT_SAID_NO_TO_LITTLE_GIRL
	end
	
StarglowFisher1Text1:
	text "Sometimes, when"
	line "fishing, my line"
	cont "will get caught"
	cont "on something in"
	cont "the water."
	
	para "When that happens,"
	line "I have my #MON"
	cont "use CUT on the it."
	
	para "Here."
	done
	
StarglowFisher1Text2:
	text "That HM contains"
	line "the move CUT."

	para "You probably won't"
	line "need to use it"
	cont "while fishing,"
	
	para "but you could use"
	line "it to CUT down"
	cont "small trees in"
	cont "your way."
	
	para "You need the BADGE"
	line "from this town's"
	cont "GYM LEADER to use"
	cont "it outside of"
	cont "battle, though."
	done
	
StarglowFisher2Text:
	text "I've fished in"
	line "hundreds of lakes"
	cont "and rivers in my"
	cont "day,"
	
	para "and none of them"
	line "are as good as"
	cont "as STARGLOW"
	cont "VALLEY."
	done
	
StarglowFisher3Text:
	text "Sometimes when"
	line "fishing, you won't"
	cont "get a bite."
	
	para "In times like"
	line "that, persistence"
	cont "is the key."
	
	para "Don't give up!"
	done
	
StarglowGrampsText1:
	text "This town is so"
	line "quiet and quaint."
	
	para "Quiet is nice, but"
	line "sometimes it can"
	cont "get boring."
	
	para "I wish something"
	line "interesting would"
	cont "happen…"
	done
	
StarglowGrampsText2:
	text "Weird guys around"
	line "town?"
	
	para "I have no idea"
	line "what you're talking"
	cont "about, kiddo."
	
	para "Nothing interest-"
	line "ing ever happens"
	cont "around here."
	done
	
StarglowYoungsterText1:
	text "See those shady"
	line "guys over there?"

	para "I've heard that"
	line "they're trying to"
	cont "steal people's"
	cont "#MON."
	
	para "I'd steer clear of"
	line "them if I were"
	cont "you."
	done
	
StarglowYoungsterText2:
	text "Huh…"
	
	para "All those shady"
	line "guys are gone."
	
	para "I wonder who"
	line "chased them off…"
	done
	
StarglowLassText:
	text "That weirdo over"
	line "there won't let me"
	cont "leave town."
	
	para "What's his problem?"
	done
	
StarglowYoungster2Text:
	text "Are you a TRAINER?"
	
	para "I am too, but I"
	line "don't really like"
	cont "to battle."
	
	para "I'd rather just"
	line "sit here on this"
	cont "bench with my"
	cont "#MON."
	done
	
StarglowLass2Text:
	text "There's a lot of"
	line "people around here"
	cont "that are super"
	cont "into fishing."
	
	para "I've heard that"
	line "there's one person"
	cont "in town who even"
	cont "takes it more"
	cont "seriously than the"
	cont "GYM LEADER!"
	done
	
StarglowPoliwhirlText1:
	text "POLIWHIRL: Poli…"
	done
	
StarglowPoliwhirlText2:
	text "POLIWHIRL looks"
	line "very bored."
	done
	
;StarglowGetSuperPotionsText:
;	text "<PLAYER> received"
;	line "2 SUPER POTIONS!"
;	done
	
;StarglowPutAwaySuperPotionsText:
;	text "<PLAYER> put the"
;	line "SUPER POTIONS in"
;	cont "the ITEM POCKET."
;	done
	
StarglowValleySignText:
	text "STARGLOW VALLEY"
	
	para "A town as peaceful"
	line "as the river run-"
	cont "ning through it."
	done
	
StarglowGymSignText:
	text "STARGLOW VALLEY"
	line "#MON GYM"
	cont "LEADER: RODNEY"

	para "The master"
	line "fisherman."
	done
	
StarglowGuruSignText:
	text "Home of the"
	line "fabulous FISHING"
	cont "GURU!"
	done
	
StarglowSnare1Text1:
	text "What's that?"
	
	para "Stop trying to"
	line "take people's"
	cont "#MON?"
	
	para "Or what?"
	
	para "Are you gonna"
	line "make me?"
	done
	
StarglowSnare1Text2:
	text "Run away!"
	done
	
StarglowSnare1Text3:
	text "Right."
	
	para "Run along, now."
	done
	
StarglowSnare1Text4:
	text "I'll beat you AND"
	line "take your #MON!"
	done
	
StarglowSnare1WinText:
	text "I lost?"
	done
	
StarglowSnare2Text1:
	text "What are you"
	line "lookin' at?"
	
	para "You want a fight"
	line "or something?"
	done
	
StarglowSnare2Text2:
	text "I gotta watch who"
	line "I pick fights"
	cont "with!"
	done
	
StarglowSnare2Text3:
	text "Yeah, that's"
	line "what I thought."
	done
	
StarglowSnare2Text4:
	text "Heh…"
	
	para "This is gonna be"
	line "easy."
	done
	
StarglowSnare2WinText:
	text "Woah! Hey!"
	
	para "Chill!"
	done
	
StarglowSnare3Text1:
	text "Buzz off, kid."
	
	line "I'm busy."
	done
	
StarglowSnare3Text2:
	text "You're the one that"
	line "took out everyone"
	cont "else?"
	
	para "Well, you don't"
	line "look like much,"
	
	para "but if you beat"
	line "all those other"
	cont "guys, then I can't"
	cont "take any chances."
	
	para "BOYS!"
	done
	
StarglowSnare3Text3:
	text "This ends now,"
	line "runt!"
	done
	
StarglowSnare3Text4:
	text "Who…?"
	done
	
StarglowSnare3Text5:
	text "PUNK: A GYM"
	line "LEADER?"
	done

StarglowSnare3Text6:
	text "We can't take on"
	line "this kid AND"
	cont "a GYM LEADER!"
	
	para "Arrrgh…"
	
	para "RETREAT!"
	done
	
StarglowSnare3Text7:
	text "This isn't over."
	
	para "You haven't heard"
	line "the last of TEAM"
	cont "SNARE!"
	done
	
StarglowSnare3Text8:
	text "Yes, sir!"
	
	para "We have arrived"
	line "in the town."
	
	para "I have sent the"
	line "others to start"
	cont "taking the people's"
	cont "#MON now."
	done
	
StarglowRodneyText1:
	text "???: Now hold on"
	line "just one second."
	done
	
StarglowRodneyText2:
	text "???: Three on one"
	line "is hardly fair,"
	cont "wouldn't you say?"
	done
	
StarglowRodneyText3:
	text "Are these guys"
	line "causing trouble"
	cont "out here?"
	
	para "Surely they're not"
	line "right?"
	done

StarglowRodneyText4:
	text "???: Now that"
	line "THAT business is"
	cont "done, I should"
	cont "introduce myself."
	
	para "I'm RODNEY."
	
	para "I'm the GYM LEADER"
	line "here in STARGLOW"
	cont "VALLEY."
	
	para "You took out all"
	line "of the other goons"
	cont "around town all"
	cont "by yourself?"
	
	para "You must be quite"
	line "the TRAINER!"
	
	para "I'd love to take"
	line "you on in battle!"
	
	para "I'll be here in"
	line "the GYM, waiting."
	
	para "Come see me when"
	line "you're ready for"
	cont "a battle."
	done
	
StarglowSnare4Text1:
	text "Why don't you take"
	line "some time to look"
	cont "around town?"
	
	para "Hehehe…"
	done
	
StarglowSnare4Text2:
	text "Where ya going,"
	line "kid?"
	done
	
StarglowLittleGirlText1:
	text "Help! Help!"
	
	para "Someone please"
	line "help me!"
	done
	
StarglowLittleGirlText2:
	text "TRAINER!"
	
	para "Please help!"
	
	para "Some bad people"
	line "are trying to take"
	cont "my #MON!"
	
	para "I ran for help,"
	line "but another man"
	cont "won't let me see"
	cont "the GYM LEADER."
	
	para "My MOMMY is still"
	line "in the house!"
	
	para "Please help my"
	line "MOMMY!"
	done
	
StarglowLittleGirlText3:
	text "Please help my"
	line "MOMMY!"
	done
	
StarglowLittleGirlText4:
	text "…Snivel…"
	done
	
StarglowLittleGirlText5:
	text "Sob…"
	done
	
StarglowLittleGirlText6:
	text "…Really?"
	
	para "Oh, thank you,"
	line "thank you!"
	done
	
Movement_StarglowPlayerSnare3:
	step_right
	step_up
	step_end
	
Movement_StarglowRodney:
	step_up
	step_end
	
Movement_StarglowSnare3:
	fix_facing
	step_down
	remove_fixed_facing
	step_end
	
Movement_StarglowSnare3_2:
	turn_step_right
	turn_step_right
	turn_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	step_end
	
Movement_StarglowDummySnare1:
	step_left
	step_left
	step_left
	step_left
	step_left
	step_down
	step_end
	
Movement_StarglowDummySnare1cont:
	step_left
	step_end
	
Movement_StarglowDummySnare2:
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	step_end
	
Movement_StarglowSnare1_1:
	turn_step_left
	turn_step_left
	turn_step_left
	run_step_left
	run_step_left
	run_step_left
	run_step_left
	run_step_left
	step_end
	
Movement_StarglowSnare1_2:
	turn_step_down
	turn_step_down
	turn_step_down
	run_step_down
	run_step_left
	run_step_left
	run_step_left
	run_step_left
	run_step_left
	run_step_left
	step_end
	
Movement_StarglowSnare2_1:
	turn_step_left
	turn_step_left
	turn_step_left
	run_step_left
	run_step_left
	run_step_left
	run_step_left
	run_step_left
	run_step_up
	run_step_left
	step_end
	
Movement_StarglowSnare2_2:
	turn_step_down
	turn_step_down
	turn_step_down
	run_step_down
	run_step_left
	run_step_left
	run_step_left
	run_step_left
	run_step_left
	run_step_up
	run_step_up
	run_step_left
	step_end
	
Movement_StarglowSnareStopsYou1:
	step_up
	step_end

Movement_StarglowSnareStopsYou2:
	step_down
	step_end
	
Movement_StarglowSnareStopsYouPlayer:
	step_left
	step_end
	
Movement_StarglowPlayerWalkDown:
	step_down
	step_down
	step_down
	step_end
	
Movement_StarglowLittleGirlWalksUp1:
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	turn_step_right
	turn_step_right
	turn_step_right
	turn_step_down
	turn_step_down
	turn_step_down
	turn_step_left
	turn_step_left
	turn_step_left
	turn_step_left
	turn_step_left
	step_end
	
Movement_StarglowLittleGirlWalksUp2:
	turn_step_left
	turn_step_left
	turn_step_left
	run_step_left
	run_step_left
	run_step_left
	run_step_left
	run_step_left
	step_end
	
Movement_StarglowLittleGirlWalkToHouse1:
	turn_step_down
	turn_step_down
	turn_step_down
	run_step_down
	run_step_left
	run_step_left
	run_step_left
	run_step_left
	run_step_left
	run_step_left
	run_step_left
	turn_head_right
	step_end
	
Movement_StarglowLittleGirlWalkToHouse2:
	turn_step_down
	turn_step_down
	turn_step_down
	run_step_down
	run_step_left
	run_step_left
	run_step_left
	run_step_left
	run_step_left
	run_step_left
	run_step_left
	run_step_left
	turn_head_right
	step_end
	
Movement_StarglowPlayerDontGo1:
	step_left
	step_end
	
Movement_StarglowPlayerDontGo2:
	step_right
	step_end
	
Movement_StarglowRocketRunInPlace:
	turn_step_right
	turn_step_right
	turn_step_right
	step_end
	
Movement_StarglowPlayerEnterHouse1:
	step_left
	step_up
	step_end
	
Movement_StarglowPlayerEnterHouse2:
	step_right
	step_up
	step_end
	
Movement_StarglowPlayerEnterHouse3:
	step_up
	step_up
	step_end
	