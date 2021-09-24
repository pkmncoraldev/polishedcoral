engine_flag: MACRO
	dwb \1 + (\2 / 8), 1 << (\2 % 8)
ENDM

EngineFlags: ; 80462
; All locations are in WRAM bank 1.

	; location, bit

	; pokegear
	engine_flag wPokegearFlags, 1 ; radio card ; $0
	engine_flag wPokegearFlags, 0 ; map card
	engine_flag wPokegearFlags, 2 ; phone card
	engine_flag wPokegearFlags, 3 ; expn card
	engine_flag wPokegearFlags, 7 ; on/off

	;   wDaycareMan, 7 ; daycare 1 on
	engine_flag wDaycareMan, 6 ; egg is ready
	;   wDaycareMan, 5 ; monster 1 and 2 are compatible
	engine_flag wDaycareMan, 0 ; monster 1 in daycare
	;   wDaycareLady, 7 = daycare 2 on
	engine_flag wDaycareLady, 0 ; monster 2 in daycare

	engine_flag wMomSavingMoney, 0 ; mom saving money ; $8
	engine_flag wMomSavingMoney, 7 ; dst

	engine_flag wStatusFlags, 0 ; pokedex
	engine_flag wStatusFlags, 1 ; unown dex
	                            ; flash
	engine_flag wStatusFlags, 3 ; pokerus
	engine_flag wStatusFlags, 4 ; rocket signal on ch20
	                            ; wild encounters on/off
	engine_flag wStatusFlags, 6 ; credits skip
	engine_flag wStatusFlags, 7 ; bug contest on

	engine_flag wStatusFlags2, 0 ; rockets in radio tower
	engine_flag wStatusFlags2, 1 ; safari game
	engine_flag wStatusFlags2, 2 ; bug contest timer
	engine_flag wStatusFlags2, 3 ; seen shamouti island
	engine_flag wStatusFlags2, 4 ; bike shop call enabled (1024 bike steps reqd)
	engine_flag wStatusFlags2, 5 ; give pokerus
	engine_flag wStatusFlags2, 6 ; exorcised lav radio tower
	engine_flag wStatusFlags2, 7 ; rockets in mahogany

	engine_flag wOWState, OWSTATE_STRENGTH
	engine_flag wOWState, OWSTATE_BIKING_FORCED
	engine_flag wOWState, OWSTATE_BIKING_DOWNHILL
	engine_flag wOWState, OWSTATE_SURF
	engine_flag wOWState, OWSTATE_ROCK_SMASH
	engine_flag wOWState, OWSTATE_HEADBUTT
	engine_flag wOWState, OWSTATE_WHIRLPOOL
	engine_flag wOWState, OWSTATE_WATERFALL
	engine_flag wOWState, OWSTATE_CUT
	engine_flag wOWState, OWSTATE_ROCK_CLIMB

	engine_flag wBikeGear, 0
	
	engine_flag wHaveFollower, 0
	
	engine_flag wEncounterHouse, 0
	
	engine_flag wOnwaBadges, FIRSTBADGE
	engine_flag wOnwaBadges, SECONDBADGE
	engine_flag wOnwaBadges, THIRDBADGE
	engine_flag wOnwaBadges, FOURTHBADGE
	engine_flag wOnwaBadges, FIFTHBADGE
	engine_flag wOnwaBadges, SIXTHBADGE
	engine_flag wOnwaBadges, SEVENTHBADGE
	engine_flag wOnwaBadges, EIGHTHBADGE

	; unown sets
	engine_flag wUnlockedUnowns, 0 ; 1
	engine_flag wUnlockedUnowns, 1 ; 2
	engine_flag wUnlockedUnowns, 2 ; 3
	engine_flag wUnlockedUnowns, 3 ; 4
	engine_flag wUnlockedUnowns, 4 ; 5
	engine_flag wUnlockedUnowns, 5 ; 6
	engine_flag wUnlockedUnowns, 6 ; 7
	engine_flag wUnlockedUnowns, 7 ; 8

	; fly
	engine_flag wVisitedSpawns, 0  ; your house
	engine_flag wVisitedSpawns, 1  ; sunset
	engine_flag wVisitedSpawns, 2  ; daybreak
	engine_flag wVisitedSpawns, 3  ; glint
	engine_flag wVisitedSpawns, 4  ; starglow
	engine_flag wVisitedSpawns, 5  ; lake
	engine_flag wVisitedSpawns, 6  ; sunbeam
	engine_flag wVisitedSpawns, 7  ; eventide
	engine_flag wVisitedSpawns, 8  ; flicker
	engine_flag wVisitedSpawns, 9  ; twinkle
	engine_flag wVisitedSpawns, 10 ; luster
	engine_flag wVisitedSpawns, 11 ; unused
	engine_flag wVisitedSpawns, 12 ; unused
	engine_flag wVisitedSpawns, 13 ; unused
	engine_flag wVisitedSpawns, 14 ; unused
	engine_flag wVisitedSpawns, 15 ; unused
	engine_flag wVisitedSpawns, 16 ; unused
	engine_flag wVisitedSpawns, 17 ; unused
	engine_flag wVisitedSpawns, 18 ; unused
	engine_flag wVisitedSpawns, 19 ; unused
	engine_flag wVisitedSpawns, 20 ; unused
	engine_flag wVisitedSpawns, 21 ; unused
	engine_flag wVisitedSpawns, 22 ; unused
	engine_flag wVisitedSpawns, 23 ; unused
	engine_flag wVisitedSpawns, 24 ; unused
	engine_flag wVisitedSpawns, 25 ; unused
	engine_flag wVisitedSpawns, 26 ; unused

	engine_flag wLuckyNumberShowFlag, 0 ; lucky number show

	engine_flag wDailyFlags, 0 ; daily bikini contest
	engine_flag wDailyFlags, 1 ; daily bug contest?
	engine_flag wDailyFlags, 2 ; special wilddata?
	engine_flag wDailyFlags, 3 ; daily route 8 garden
	engine_flag wDailyFlags, 4 ; all fruit trees
	engine_flag wDailyFlags, 5 ; daily dodrio race
	engine_flag wDailyFlags, 6 ; goldenrod underground merchant closed
	engine_flag wDailyFlags, 7 ; streetlights

	engine_flag wDailyFlags2, 0 ; gym leader rematch 1
	engine_flag wDailyFlags2, 1 ; gym leader rematch 2
	engine_flag wDailyFlags2, 2 ; gym leader rematch 3
	engine_flag wDailyFlags2, 3 ; daily photograph
	engine_flag wDailyFlags2, 4 ; daily shrine visit
	engine_flag wDailyFlags2, 5 ; daily mystery gift
	engine_flag wDailyFlags2, 6 ; red in mt. silver
	engine_flag wDailyFlags2, 7 ; leaf in navel rock

	engine_flag wDailyFlags3, 0 ; bought leftovers
	engine_flag wDailyFlags3, 1 ; took hyper test
	engine_flag wDailyFlags3, 2 ; cheryl done today
	engine_flag wDailyFlags3, 3 ; riley done today
	engine_flag wDailyFlags3, 4 ; buck done today
	engine_flag wDailyFlags3, 5 ; marley done today
	engine_flag wDailyFlags3, 6 ; mira done today
	engine_flag wDailyFlags3, 7 ; anabel done today

	engine_flag wWeeklyFlags, 0 ; mt moon square clefairy
	engine_flag wWeeklyFlags, 1 ; union cave lapras
	engine_flag wWeeklyFlags, 2 ; goldenrod underground haircut used
	engine_flag wWeeklyFlags, 3 ; goldenrod mall happiness event floor05 person07
	engine_flag wWeeklyFlags, 4 ; tea in blues house
	engine_flag wWeeklyFlags, 5 ; indigo plateau rival fight
	engine_flag wWeeklyFlags, 6 ; indigo plateau lyra fight
	engine_flag wWeeklyFlags, 7 ; buenas password

	engine_flag wFlowerPileFlags, 0 ; glint grove pile 1
	engine_flag wFlowerPileFlags, 1 ; glint grove pile 2
	engine_flag wFlowerPileFlags, 2 ; glint grove pile 3
	engine_flag wFlowerPileFlags, 3 ; glint grove pile 4
	engine_flag wFlowerPileFlags, 4 ; glint grove pile 5
	engine_flag wFlowerPileFlags, 5 ; glint grove pile 6
	engine_flag wFlowerPileFlags, 6 ; glint grove pile 7
	engine_flag wFlowerPileFlags, 7 ; unused
	
	engine_flag wSwarmFlags, 0 ; buenas password 2
	engine_flag wSwarmFlags, 1 ; goldenrod dept store sale is on

	engine_flag wGameTimerPause, 7 ; game timer pause

	engine_flag wCelebiEvent, 2 ; have gs ball after kurt examined it
	engine_flag wCelebiEvent, 3 ; have silphscope2
	engine_flag wCelebiEvent, 4 ; have shiny charm

	; rematches
	engine_flag wDailyRematchFlags, 0  ; jack
	engine_flag wDailyRematchFlags, 1  ; huey
	engine_flag wDailyRematchFlags, 2  ; gaven
	engine_flag wDailyRematchFlags, 3  ; beth
	engine_flag wDailyRematchFlags, 4  ; jose
	engine_flag wDailyRematchFlags, 5  ; reena
	engine_flag wDailyRematchFlags, 6  ; joey
	engine_flag wDailyRematchFlags, 7  ; wade
	engine_flag wDailyRematchFlags, 8  ; ralph
	engine_flag wDailyRematchFlags, 9  ; liz
	engine_flag wDailyRematchFlags, 10 ; anthony
	engine_flag wDailyRematchFlags, 11 ; todd
	engine_flag wDailyRematchFlags, 12 ; gina
	engine_flag wDailyRematchFlags, 13 ; arnie
	engine_flag wDailyRematchFlags, 14 ; alan
	engine_flag wDailyRematchFlags, 15 ; dana
	engine_flag wDailyRematchFlags, 16 ; chad
	engine_flag wDailyRematchFlags, 17 ; tully
	engine_flag wDailyRematchFlags, 18 ; brent
	engine_flag wDailyRematchFlags, 19 ; tiffany
	engine_flag wDailyRematchFlags, 20 ; vance
	engine_flag wDailyRematchFlags, 21 ; wilton
	engine_flag wDailyRematchFlags, 22 ; parry
	engine_flag wDailyRematchFlags, 23 ; erin

	engine_flag wDailyPhoneItemFlags, 0 ; beverly has nugget
	engine_flag wDailyPhoneItemFlags, 1 ; jose has star piece
	engine_flag wDailyPhoneItemFlags, 2 ; wade has item (see EVENT_WADE_HAS_*** in constants/event_flags.asm)
	engine_flag wDailyPhoneItemFlags, 3 ; gina has leaf stone
	engine_flag wDailyPhoneItemFlags, 4 ; alan has fire stone
	engine_flag wDailyPhoneItemFlags, 5 ; liz has thunderstone
	engine_flag wDailyPhoneItemFlags, 6 ; derek has nugget
	engine_flag wDailyPhoneItemFlags, 7 ; tully has water stone
	engine_flag wDailyPhoneItemFlags, 8 ; tiffany has pink bow
	engine_flag wDailyPhoneItemFlags, 9 ; wilton has item (see EVENT_WILTON_HAS_*** in constants/event_flags.asm)

	engine_flag wDailyPhoneTimeOfDayFlags, 0  ; jack monday morning
	engine_flag wDailyPhoneTimeOfDayFlags, 1  ; huey wednesday night
	engine_flag wDailyPhoneTimeOfDayFlags, 2  ; gaven thursday morning
	engine_flag wDailyPhoneTimeOfDayFlags, 3  ; beth friday afternoon
	engine_flag wDailyPhoneTimeOfDayFlags, 4  ; jose saturday night
	engine_flag wDailyPhoneTimeOfDayFlags, 5  ; reena sunday morning
	engine_flag wDailyPhoneTimeOfDayFlags, 6  ; joey monday afternoon
	engine_flag wDailyPhoneTimeOfDayFlags, 7  ; wade tuesday night
	engine_flag wDailyPhoneTimeOfDayFlags, 8  ; ralph wednesday morning
	engine_flag wDailyPhoneTimeOfDayFlags, 9  ; liz thursday afternoon
	engine_flag wDailyPhoneTimeOfDayFlags, 10 ; anthony fiday night
	engine_flag wDailyPhoneTimeOfDayFlags, 11 ; todd saturday morning
	engine_flag wDailyPhoneTimeOfDayFlags, 12 ; gina sunday afternoon
	engine_flag wDailyPhoneTimeOfDayFlags, 13 ; arnie tuesday morning
	engine_flag wDailyPhoneTimeOfDayFlags, 14 ; alan wednesday afternoon
	engine_flag wDailyPhoneTimeOfDayFlags, 15 ; dana thursday night
	engine_flag wDailyPhoneTimeOfDayFlags, 16 ; chad friday morning
	engine_flag wDailyPhoneTimeOfDayFlags, 17 ; tully sunday night
	engine_flag wDailyPhoneTimeOfDayFlags, 18 ; brent monday morning
	engine_flag wDailyPhoneTimeOfDayFlags, 19 ; tiffany tuesday afternoon
	engine_flag wDailyPhoneTimeOfDayFlags, 20 ; vance wednesday night
	engine_flag wDailyPhoneTimeOfDayFlags, 21 ; wilton thursday morning
	engine_flag wDailyPhoneTimeOfDayFlags, 22 ; parry friday afternoon
	engine_flag wDailyPhoneTimeOfDayFlags, 23 ; erin saturday night

	engine_flag wPlayerSpriteSetupFlags, 2 ; female player has been transformed into male

	engine_flag wSwarmFlags, 2 ; dunsparce swarm
	engine_flag wSwarmFlags, 3 ; yanma swarm
	
	engine_flag wGotHMFlags, 0 ; rock smash
	engine_flag wGotHMFlags, 1 ; cut
	engine_flag wGotHMFlags, 2 ; fly
	engine_flag wGotHMFlags, 3 ; rock climb
	engine_flag wGotHMFlags, 4 ; surf

	engine_flag wMetGymLeaderFlags, 0  ; stanley
	engine_flag wMetGymLeaderFlags, 1  ; rodney
	engine_flag wMetGymLeaderFlags, 2  ; wendy
	engine_flag wMetGymLeaderFlags, 3  ; charlie
	engine_flag wMetGymLeaderFlags, 4  ; chuck
	engine_flag wMetGymLeaderFlags, 5  ; jasmine
	engine_flag wMetGymLeaderFlags, 6  ; pryce
	engine_flag wMetGymLeaderFlags, 7  ; clair
	
	engine_flag wSnareFlags, 0	; starglow
	engine_flag wSnareFlags, 1	; sunbeam
	engine_flag wSnareFlags, 2  ; train
	
	engine_flag wIsNearCampfire, 0  ; used to light up player on Route 10 East
