StarglowPokeCenter_MapScriptHeader:
	db 2 ; scene scripts
	scene_script StarglowPokeCenterTrigger0
	scene_script StarglowPokeCenterTrigger1

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 7, 4, 5, STARGLOW_VALLEY
	warp_def 7, 5, 5, STARGLOW_VALLEY

	db 2 ; coord events
	xy_trigger 1, 7, 4, 0, StarglowCenterRocketStopsYouL, 0, 0
	xy_trigger 1, 7, 5, 0, StarglowCenterRocketStopsYouR, 0, 0

	db 0 ; bg events

	db 6 ; object events
	person_event SPRITE_BOWING_NURSE, 1, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, StarglowCenterNurse, -1
	pc_chansey_event  5, 1
	person_event SPRITE_GAMEBOY_KID, 5, 8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, StarglowCenterGameboyKid, -1
	person_event SPRITE_GENTLEMAN, 5, 1, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, StarglowCenterGramps, -1
	person_event SPRITE_TEACHER, 2, 9, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, StarglowCenterGirl, -1
	person_event SPRITE_SNARE, -6, -6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, -1, -1

	
	const_def 1 ; object constants
	const STARGLOW_POKECENTER_NURSE
	const STARGLOW_POKECENTER_CHANSEY
	const STARGLOW_POKECENTER_GAMEBOYKID
	const STARGLOW_POKECENTER_GENTLEMAN
	const STARGLOW_POKECENTER_GIRL
	const STARGLOW_POKECENTER_SNARE

StarglowPokeCenterTrigger0:
	disappear STARGLOW_POKECENTER_SNARE
	end

StarglowPokeCenterTrigger1:
	end
	
StarglowCenterRocketStopsYouR:
	moveperson STARGLOW_POKECENTER_SNARE, $5, $8
	jump StarglowCenterRocketStopsYou
StarglowCenterRocketStopsYouL:
	moveperson STARGLOW_POKECENTER_SNARE, $4, $8
StarglowCenterRocketStopsYou:
	special Special_StopRunning
	playsound SFX_PAY_DAY
	spriteface PLAYER, DOWN
	showemote EMOTE_SHOCK, PLAYER, 15
	playmusic MUSIC_NONE
	pause 7
	appear STARGLOW_POKECENTER_SNARE
	playsound SFX_ENTER_DOOR
	applymovement PLAYER, Movement_StarglowCenterRocket
	applymovement STARGLOW_POKECENTER_SNARE, Movement_StarglowCenterRocket
	playmusic MUSIC_TEAM_SNARE_ENCOUNTER
	opentext
	writetext StarglowCenterRocketText1
	waitbutton
	closetext
	waitsfx
	winlosstext StarglowCenterRocketWinText, 0
	setlasttalked STARGLOW_POKECENTER_SNARE
	loadtrainer GRUNTM, STARGLOW_GRUNTM_2
	special SaveMusic
	startbattle
	reloadmapafterbattle
	special RestoreMusic
	opentext
	writetext StarglowCenterRocketText2
	waitbutton
	closetext
	applymovement STARGLOW_POKECENTER_SNARE, Movement_StarglowCenterRocket2
	pause 8
	playsound SFX_EXIT_BUILDING
	disappear STARGLOW_POKECENTER_SNARE
	pause 8
	special Special_FadeOutMusic
	pause 10
	playmusic MUSIC_POKEMON_CENTER
	setevent EVENT_BEAT_STARGLOW_SNARE_3
	dotrigger $0
	end
	
StarglowCenterNurse:
	checkevent EVENT_HEALED_AT_STARGLOW_CENTER
	iftrue .normal
	dotrigger $1
	setevent EVENT_HEALED_AT_STARGLOW_CENTER
.normal
	jumpstd pokecenternurse
	
StarglowCenterGameboyKid:
	faceplayer
	opentext
	writetext StarglowCenterGameboyKidText
	waitbutton
	spriteface STARGLOW_POKECENTER_GAMEBOYKID, DOWN
	closetext
	end
	
StarglowCenterGramps:
	jumptextfaceplayer StarglowCenterGrampsText
	
StarglowCenterGirl:
	jumptextfaceplayer StarglowCenterGirlText
	
StarglowCenterGameboyKidText:
	text "Some #MON only"
	line "evolve if you"
	cont "trade them with"
	cont "another person."
	
	para "I've heard that"
	line "they've recently"
	cont "developed another"
	cont "way to evolve"
	cont "them, though!"
	
	para "How cool is that?"
	done
	
StarglowCenterGrampsText:
	text "STARGLOW VALLEY"
	line "was founded as a"
	cont "fishing village."
	
	para "Plenty of fisher-"
	line "men still swear by"
	cont "the fishing around"
	cont "here,"
	
	para "but I'm not so"
	line "sure."
	done
	
StarglowCenterGirlText:
	text "Have you heard of"
	line "PROF. SPRUCE?"
	
	para "He's an authority"
	line "on #MON around"
	cont "here."
	
	para "I think he lives"
	line "on SUNBEAM ISLAND,"
	cont "south of here."
	done
	
StarglowCenterRocketText1:
	text "Woah!"
	
	para "Where ya going,"
	line "runt?"
	
	para "No one goes in or"
	line "out of here until"
	cont "I have all of the"
	cont "#MON in this"
	cont "#MON CENTER!"
	
	para "Hand 'em over,"
	line "kid!"
	done
	
StarglowCenterRocketText2:
	text "Man!"
	
	para "I can't even beat"
	line "a measly kid!"
	done
	
StarglowCenterRocketWinText:
	text "No way!"
	
	para "How?"
	done
	
Movement_StarglowCenterRocket:
	fix_facing
	step_up
	remove_fixed_facing
	step_end
	
Movement_StarglowCenterRocket2:
	turn_head_down
	step_end
