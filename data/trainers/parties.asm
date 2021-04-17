; All trainers follow a basic structure:
	; Name
		; String in format "TEXT@"
	; Type
		; TRAINERTYPE_NORMAL:      level, species (2 bytes)
		; TRAINERTYPE_ITEM:        item (1 byte)
		; TRAINERTYPE_EVS:         EVs (1 byte, marks the setting of all EVs)
		; TRAINERTYPE_DVS:         DVs (3 bytes)
		; TRAINERTYPE_PERSONALITY: personality (2 bytes)
		; TRAINERTYPE_NICKNAME:    nickname (max 10 bytes)
		; TRAINERTYPE_MOVES:       moves (4 bytes)
	; Party
		; Up to six monsters following the data type
	; $ff

; Do not use the byte $ff in trainer data, since it's the end marker.
; That means:
; * DVs cannot be $ff -- use $00 instead (ReadTrainerParty converts it to $ff)
; * "9" cannot be used in nicknames

; TODO: boss trainers need better movesets, held items, natures, and abilities
; TODO: swap ABILITY_1 and ABILITY_2 in base data as need so that ABILITY_1 is the better one for default NPCs (e.g. NPCs should have Sturdy when possible)


SECTION "Enemy Trainer Parties 1", ROMX


CoryGroup:
; ================================
; ================
; ================
; ================================


CoraGroup:
; ================================
; ================
; ================
; ================================


PippiGroup:
; ================================
; ================
; ================
; ================================

RedGroup:
; ================================
; ================
; ================
; ================================

LeafGroup:
; ================================
; ================
; ================
; ================================

GoldGroup:
; ================================
; ================
; ================
; ================================

KrisGroup:
; ================================
; ================
; ================
; ================================


StanleyGroup:
; ================================
; ================

	; STANLEY
	db "STANLEY@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_EVS | TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES
	; party
	db 11, SMEARGLE, NO_ITEM, 16, ABILITY_2 | JOLLY, MALE
		db DOUBLE_EDGE, CONFUSION, THUNDER_WAVE, FAKE_OUT
	db 15, DITTO, NO_ITEM, 16, ABILITY_1 | JOLLY, MALE
		db TRANSFORM_SPLASH, 0, 0, 0
	db -1 ; end

; ================
; ================================


RodneyGroup:
; ================================
; ================

	; RODNEY
	db "RODNEY@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_EVS | TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES
	; party
	db 17, CHINCHOU, NO_ITEM, 16, ABILITY_1 | SASSY, MALE
		db RAIN_DANCE, WATER_GUN, SPARK, CONFUSE_RAY
	db 18, WOOPER, NO_ITEM, 32, HIDDEN_ABILITY | TIMID, FEMALE
		db RAIN_DANCE, WATER_GUN, BODY_SLAM, 0
	db 20, GYARADOS, NO_ITEM, 32, ABILITY_1 | QUIRKY, MALE
		db WATER_GUN, BITE, TACKLE_SCRATCH_POUND, TWISTER
	db -1 ; end

; ================
; ================================


WendyGroup:
; ================================
; ================

	; WENDY
	db "WENDY@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_EVS | TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES
	; party
	db 1, BULBASAUR, NO_ITEM, 48, ABILITY_1 | QUIRKY, FEMALE
		db TACKLE_SCRATCH_POUND, 0, 0, 0
	db -1 ; end

; ================
; ================================


CharlieGroup:
; ================================
; ================

	; CHARLIE
	db "CHARLIE@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


ChuckGroup:
; ================================
; ================

	; CHUCK
	db "UNUSED@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


JasmineGroup:
; ================================
; ================

	; JASMINE
	db "UNUSED@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


PryceGroup:
; ================================
; ================

	; PRYCE
	db "UNUSED@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


ClairGroup:
; ================================
; ================

	; CLAIR
	db "UNUSED@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


WillGroup:
; ================================
; ================

	; WILL_OLD
	db "UNUSED@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


KogaGroup:
; ================================
; ================

	; KOGA
	db "UNUSED@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


BrunoGroup:
; ================================
; ================

	; BURNO
	db "UNUSED@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


KarenGroup:
; ================================
; ================

	; KAREN
	db "UNUSED@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


ChampionGroup:
; ================================
; ================

	; CHAMPION
	db "UNUSED@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


RivalGroup:
; ================================
; ================

	; RIVAL (1-1)
	db "<RIVAL>@"
	db TRAINERTYPE_DVS | TRAINERTYPE_PERSONALITY
	; party
	db 5, TOTODILE, $66, $66, $66, ABILITY_1 | HARDY, MALE
	db -1 ; end

; ================

	; RIVAL (1-2)
	db "<RIVAL>@"
	db TRAINERTYPE_PERSONALITY
	; party
	db 5, CYNDAQUIL, ABILITY_1 | HARDY, MALE
	db -1 ; end

; ================

	; RIVAL (1-3)
	db "<RIVAL>@"
	db TRAINERTYPE_PERSONALITY
	; party
	db 5, CHIKORITA, ABILITY_1 | HARDY, MALE
	db -1 ; end

; ================

	; RIVAL (1-4)
	db "<RIVAL>@"
	db TRAINERTYPE_PERSONALITY
	; party
	db 5, SQUIRTLE, ABILITY_1 | HARDY, MALE
	db -1 ; end

; ================

	; RIVAL (1-5)
	db "<RIVAL>@"
	db TRAINERTYPE_PERSONALITY
	; party
	db 5, CHARMANDER, ABILITY_1 | HARDY, MALE
	db -1 ; end

; ================

	; RIVAL (1-6)
	db "<RIVAL>@"
	db TRAINERTYPE_PERSONALITY
	; party
	db 5, BULBASAUR, ABILITY_1 | HARDY, MALE
	db -1 ; end

; ================

	; RIVAL (2-1)
	db "<RIVAL>@"
	db TRAINERTYPE_DVS | TRAINERTYPE_PERSONALITY
	; party
	db 6, SNUBBULL, $99, $99, $99, ABILITY_2 | HARDY, FEMALE
	db 8, TOTODILE, $66, $66, $66, ABILITY_1 | HARDY, MALE
	db -1 ; end

; ================

	; RIVAL (2-2)
	db "<RIVAL>@"
	db TRAINERTYPE_DVS | TRAINERTYPE_PERSONALITY
	; party
	db 6, SNUBBULL, $99, $99, $99, ABILITY_2 | HARDY, FEMALE
	db 8, CYNDAQUIL, $66, $66, $66, ABILITY_1 | HARDY, MALE
	db -1 ; end

; ================

	; RIVAL (2-3)
	db "<RIVAL>@"
	db TRAINERTYPE_DVS | TRAINERTYPE_PERSONALITY
	; party
	db 6, SNUBBULL, $99, $99, $99, ABILITY_2 | HARDY, FEMALE
	db 8, CHIKORITA, $66, $66, $66, ABILITY_1 | HARDY, MALE
	db -1 ; end

; ================

	; RIVAL (2-4)
	db "<RIVAL>@"
	db TRAINERTYPE_DVS | TRAINERTYPE_PERSONALITY
	; party
	db 6, SNUBBULL, $99, $99, $99, ABILITY_2 | HARDY, FEMALE
	db 8, SQUIRTLE, $66, $66, $66, ABILITY_1 | HARDY, MALE
	db -1 ; end

; ================

	; RIVAL (2-5)
	db "<RIVAL>@"
	db TRAINERTYPE_DVS | TRAINERTYPE_PERSONALITY
	; party
	db 6, SNUBBULL, $99, $99, $99, ABILITY_2 | HARDY, FEMALE
	db 8, CHARMANDER, $66, $66, $66, ABILITY_1 | HARDY, MALE
	db -1 ; end

; ================

	; RIVAL (2-6)
	db "<RIVAL>@"
	db TRAINERTYPE_DVS | TRAINERTYPE_PERSONALITY
	; party
	db 6, SNUBBULL, $99, $99, $99, ABILITY_2 | HARDY, FEMALE
	db 8, BULBASAUR, $66, $66, $66, ABILITY_1 | HARDY, MALE
	db -1 ; end

; ================
; ================================


YoungsterGroup:
; ================================
; ================

	; YOUNGSTER
	db "JOEY@"
	db TRAINERTYPE_DVS | TRAINERTYPE_PERSONALITY
	; party
	db 5, RATTATA, FAKE_PERFECT_DVS, ABILITY_1 | ADAMANT, MALE
	db -1 ; end

; ================

	; YOUNGSTER
	db "BILLY@"
	db TRAINERTYPE_NORMAL
	; party
	db 4, PIDGEY
	db 4, COTTONEE
	db -1 ; end

; ================

	; YOUNGSTER
	db "CHRIS@"
	db TRAINERTYPE_NORMAL
	; party
	db  9, NIDORAN_M
	db  8, PIDGEY
	db -1 ; end

; ================

	; YOUNGSTER
	db "TOMMY@"
	db TRAINERTYPE_NORMAL
	; party
	db 25, MINCCINO
	db 24, GASTLY
	db 26, GASTLY
	db -1 ; end

; ================

	; YOUNGSTER
	db "JIMMY@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


BugCatcherGroup:
; ================================
; ================

	; BUG_CATCHER
	db "BARNEY@"
	db TRAINERTYPE_NORMAL
	; party
	db 6, VENIPEDE
	db 7, VENIPEDE
	db 8, VENIPEDE
	db -1 ; end

; ================

	; BUG_CATCHER
	db "JOSH@"
	db TRAINERTYPE_NORMAL
	; party
	db 13, DWEBBLE
	db 13, DWEBBLE
	db -1 ; end

; ================

	; BUG_CATCHER
	db "ARNOLD@"
	db TRAINERTYPE_NORMAL
	; party
	db 17, LEDYBA
	db 15, JOLTIK
	db -1 ; end

; ================

	; BUG_CATCHER
	db "DANNY@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


CamperGroup:
; ================================
; ================

	; CAMPER
	db "BART@"
	db TRAINERTYPE_NORMAL
	; party
	db 9, CLEFAIRY
	db -1 ; end

; ================

	; CAMPER
	db "DENNY@"
	db TRAINERTYPE_NORMAL
	; party
	db 11, NIDORAN_M
	db -1 ; end

; ================

	; CAMPER
	db "TREVOR@"
	db TRAINERTYPE_NORMAL
	; party
	db 15, SHROOMISH
	db 15, ODDISH
	db -1 ; end

; ================

	; CAMPER
	db "VINCENT@"
	db TRAINERTYPE_NORMAL
	; party
	db 16, NIDORINO
	db -1 ; end

; ================

; CAMPER
	db "DANTE@"
	db TRAINERTYPE_NORMAL
	; party
	db 24, BAYLEEF
	db 25, SHROOMISH
	db -1 ; end

; ================
; ================================


PicnickerGroup:
; ================================
; ================

	; PICNICKER
	db "MOLLY@"
	db TRAINERTYPE_NORMAL
	; party
	db 9, JIGGLYPUFF
	db -1 ; end

; ================

	; PICNICKER
	db "ERIN@"
	db TRAINERTYPE_NORMAL
	; party
	db 11, NIDORAN_F
	db -1 ; end

; ================

	; PICNICKER
	db "TRISTA@"
	db TRAINERTYPE_NORMAL
	; party
	db 13, MARILL
	db 14, PIKIPEK
	db -1 ; end

; ================

	; PICNICKER
	db "SHAUNA@"
	db TRAINERTYPE_NORMAL
	; party
	db 15, MEOWTH
	db 15, TRUMBEAK
	db -1 ; end

; ================

	; PICNICKER
	db "BETH@"
	db TRAINERTYPE_NORMAL
	; party
	db 16, NIDORINA
	db -1 ; end

; ================

	; PICNICKER
	db "TINA@"
	db TRAINERTYPE_NORMAL
	; party
	db 24, BULBASAUR
	db 24, CHIKORITA
	db -1 ; end

; ================
; ================================


TwinsGroup:
; ================================
; ================

	; TWINS
	db "JEN & JAN@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_MOVES
	; party
	db 7, TOGEPI, NO_ITEM
		db METRONOME, 0, 0, 0
	db 8, TOGEPI, ORAN_BERRY
		db METRONOME, 0, 0, 0
	db -1 ; end

; ================

	; TWINS
	db "JAN & JEN@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_MOVES
	; party
	db 7, TOGEPI, NO_ITEM
		db METRONOME, 0, 0, 0
	db 8, TOGEPI, ORAN_BERRY
		db METRONOME, 0, 0, 0
	db -1 ; end

; ================

	; TWINS
	db "TIA & MIA@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; TWINS
	db "MIA & TIA@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


FisherGroup:
; ================================
; ================

	; FISHER
	db "DAVE@"
	db TRAINERTYPE_NORMAL
	; party
	db 10, WOOPER
	db 8, POLIWAG
	db -1 ; end

; ================

	; FISHER
	db "GERALD@"	;2 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 15, POLIWAG
	db 14, MARILL
	db -1 ; end

; ================

	; FISHER
	db "GERALD@"	;3 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; FISHER
	db "GERALD@"	;4 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; FISHER
	db "GERALD@"	;5 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; FISHER
	db "GERALD@"	;6 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; FISHER
	db "GERALD@"	;7 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; FISHER
	db "GERALD@"	;8 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; FISHER
	db "WALTER@"	;2 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 14, CHINCHOU
	db 15, SQUIRTLE
	db -1 ; end

; ================

	; FISHER
	db "WALTER@"	;3 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; FISHER
	db "WALTER@"	;4 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; FISHER
	db "WALTER@"	;5 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; FISHER
	db "WALTER@"	;6 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; FISHER
	db "WALTER@"	;7 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; FISHER
	db "WALTER@"	;8 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; FISHER
	db "BORRIS@"	;2 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 16, WARTORTLE
	db -1 ; end

; ================

	; FISHER
	db "BORRIS@"	;3 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; FISHER
	db "BORRIS@"	;4 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; FISHER
	db "BORRIS@"	;5 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; FISHER
	db "BORRIS@"	;6 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; FISHER
	db "BORRIS@"	;7 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; FISHER
	db "BORRIS@"	;8 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; FISHER
	db "CLINT@"	;2 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 14, BUIZEL
	db 14, WOOPER
	db -1 ; end

; ================

	; FISHER
	db "CLINT@"	;3 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; FISHER
	db "CLINT@"	;4 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; FISHER
	db "CLINT@"	;5 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; FISHER
	db "CLINT@"	;6 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; FISHER
	db "CLINT@"	;7 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; FISHER
	db "CLINT@"	;8 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; FISHER
	db "HOMER@"
	db TRAINERTYPE_NORMAL
	; party
	db 14, CHINCHOU
	db 13, WOOPER
	db 13, BUIZEL
	db -1 ; end

; ================

	; FISHER
	db "HUE@"
	db TRAINERTYPE_NORMAL
	; party
	db 14, CHINCHOU
	db 14, HORSEA
	db -1 ; end

; ================

	; FISHER
	db "DARREN@"
	db TRAINERTYPE_NORMAL
	; party
	db 14, CARVANHA
	db 13, CARVANHA
	db -1 ; end

; ================

	; FISHER
	db "LESLIE@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


BirdKeeperGroup:
; ================================
; ================

	; BIRD_KEEPER
	db "BRYANT@"
	db TRAINERTYPE_NORMAL
	; party
	db 28, PIDGEOTTO
	db 28, TRUMBEAK
	db -1 ; end

; ================

	; BIRD_KEEPER
	db "TODD@"
	db TRAINERTYPE_NORMAL
	; party
	db 29, DODUO
	db 29, DODUO
	db 27, MURKROW
	db -1 ; end

; ================

	; BIRD_KEEPER
	db "RANDY@"
	db TRAINERTYPE_NORMAL
	; party
	db 31, DODRIO
	db -1 ; end

; ================

	; BIRD_KEEPER
	db "JAZZ@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; BIRD_KEEPER
	db "RICKY@"	;3 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; BIRD_KEEPER
	db "RICKY@"	;4 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; BIRD_KEEPER
	db "RICKY@"	;5 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; BIRD_KEEPER
	db "RICKY@"	;6 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; BIRD_KEEPER
	db "RICKY@"	;7 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; BIRD_KEEPER
	db "RICKY@"	;8 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; BIRD_KEEPER
	db "VERN@"	;3 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; BIRD_KEEPER
	db "VERN@"	;4 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; BIRD_KEEPER
	db "VERN@"	;5 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; BIRD_KEEPER
	db "VERN@"	;6 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; BIRD_KEEPER
	db "VERN@"	;7 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; BIRD_KEEPER
	db "VERN@"	;8 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; BIRD_KEEPER
	db "ROY@"	;3 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; BIRD_KEEPER
	db "ROY@"	;4 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; BIRD_KEEPER
	db "ROY@"	;5 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; BIRD_KEEPER
	db "ROY@"	;6 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; BIRD_KEEPER
	db "ROY@"	;7 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; BIRD_KEEPER
	db "ROY@"	;8 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; BIRD_KEEPER
	db "SPENCER@"	;3 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; BIRD_KEEPER
	db "SPENCER@"	;4 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; BIRD_KEEPER
	db "SPENCER@"	;5 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; BIRD_KEEPER
	db "SPENCER@"	;6 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; BIRD_KEEPER
	db "SPENCER@"	;7 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; BIRD_KEEPER
	db "SPENCER@"	;8 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; BIRD_KEEPER
	db "CALEB@"	;3 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; BIRD_KEEPER
	db "CALEB@"	;4 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; BIRD_KEEPER
	db "CALEB@"	;5 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; BIRD_KEEPER
	db "CALEB@"	;6 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; BIRD_KEEPER
	db "CALEB@"	;7 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; BIRD_KEEPER
	db "CALEB@"	;8 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


HikerGroup:
; ================================
; ================

	; HIKER
	db "DOUG@"
	db TRAINERTYPE_NORMAL
	; party
	db 11, GEODUDE
	db 10, CUBONE
	db -1 ; end

; ================

	; HIKER
	db "WILL@"
	db TRAINERTYPE_NORMAL
	; party
	db 10, ONIX
	db -1 ; end

; ================

	; HIKER
	db "ROB@"
	db TRAINERTYPE_NORMAL
	; party
	db 10, ONIX
	db 11, GEODUDE
	db -1 ; end

; ================

	; HIKER
	db "BENJAMIN@"
	db TRAINERTYPE_NORMAL
	; party
	db 11, WOOPER
	db 12, MACHOP
	db -1 ; end

; ================

	; HIKER
	db "LANDON@"
	db TRAINERTYPE_NORMAL
	; party
	db 11, GEODUDE
	db 12, MACHOP
	db -1 ; end

; ================

	; HIKER
	db "SIMON@"
	db TRAINERTYPE_NORMAL
	; party
	db 15, MACHOP
	db 15, TEDDIURSA
	db -1 ; end

; ================

	; HIKER
	db "STEVEN@"
	db TRAINERTYPE_NORMAL
	; party
	db 18, GEODUDE
	db 19, GEODUDE
	db 19, ONIX
	db -1 ; end

; ================

	; HIKER
	db "GILL@"
	db TRAINERTYPE_NORMAL
	; party
	db 20, NUMEL
	db 18, CORSOLA
	db -1 ; end

; ================

	; HIKER
	db "HARVEY@"
	db TRAINERTYPE_NORMAL
	; party
	db 19, ARON
	db 21, NOIBAT
	db 21, ZUBAT
	db -1 ; end

; ================

	; HIKER
	db "TED@"
	db TRAINERTYPE_NORMAL
	; party
	db 21, KOFFING
	db 21, GEODUDE
	db 21, ZUBAT
	db -1 ; end

; ================

	; HIKER
	db "LEROY@"
	db TRAINERTYPE_NORMAL
	; party
	db 22, LARVITAR
	db 22, MAGBY
	db -1 ; end

; ================

	; HIKER
	db "SAMSON@" ;UNUSED
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; HIKER
	db "DARRYL@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; HIKER
	db "HENRY@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


GruntMGroup:
; ================================
; ================

	; STARGLOW_GRUNTM_1
	db "STARGLOWM1@"
	db TRAINERTYPE_NORMAL
	; party
	db 12, ZUBAT
	db 12, GROWLITHE
	db 12, BUIZEL
	db -1 ; end

; ================

	; STARGLOW_GRUNTM_2
	db "STARGLOWM2@"
	db TRAINERTYPE_NORMAL
	; party
	db 13, MAREEP
	db 13, PIDGEY
	db -1 ; end

; ================

	; STARGLOW_GRUNTM_3
	db "STARGLOWM3@"
	db TRAINERTYPE_NORMAL
	; party
	db 13, ZUBAT
	db 11, COTTONEE
	db 12, CLEFAIRY
	db -1 ; end

; ================

	; SUNBEAM_GRUNTM_1
	db "SUNBEAMM1@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; SUNBEAM_GRUNTM_2
	db "SUNBEAMM2@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; SUNBEAM_GRUNTM_3
	db "SUNBEAMM3@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; SUNBEAM_GRUNTM_4
	db "SUNBEAMM4@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; TRAIN_GRUNTM_1
	db "TRAINM1@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; TRAIN_GRUNTM_2
	db "TRAINM2@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; TRAIN_GRUNTM_3
	db "TRAINM3@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; TRAIN_GRUNTM_4
	db "TRAINM4@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; TRAIN_GRUNTM_5
	db "TRAINM5@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


GruntFGroup:
; ================================
; ================

	; STARGLOW_GRUNTF_1
	db "STARGLOWF1@"
	db TRAINERTYPE_NORMAL
	; party
	db 13, NIDORAN_M
	db 13, COTTONEE
	db 12, PIKACHU
	db -1 ; end

; ================

	; SUNBEAM_GRUNTF_1
	db "SUNBEAMF1@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; SUNBEAM_GRUNTF_2
	db "SUNBEAMF2@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; TRAIN_GRUNTF_1
	db "TRAINF1@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; TRAIN_GRUNTF_2
	db "TRAINF2@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


KageGroup:
; ================================
; ================

	; SUNBEAM_KAGE
	db "KAGE1@"
	db TRAINERTYPE_NORMAL
	; party
	db 25, AZUMARILL
	db 23, CINCCINO
	db 30, URSARING
	db -1 ; end

; ================
; ================================


LockeGroup:
; ================================
; ================

	; TRAIN_LOCKE
	db "LOCKE1@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


PokefanMGroup:
; ================================
; ================

	; POKEFANM
	db "RON@"
	db TRAINERTYPE_NORMAL
	; party
	db 15, PHANPY
	db 16, PSYDUCK
	db -1 ; end

; ================

	; POKEFANM
	db "SID@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; POKEFANM
	db "REG@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; POKEFANM
	db "RICK@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


PokefanFGroup:
; ================================
; ================

	; POKEFANF
	db "SUSAN@"
	db TRAINERTYPE_MOVES
	; party
	db 14, STANTLER
		db STOMP, 0, 0, 0
	db -1 ; end

; ================

	; POKEFANF
	db "JILL@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; POKEFANF
	db "NICHOLE@" ;UNUSED
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; POKEFANF
	db "URSALA@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


OfficerMGroup:
; ================================
; ================

	; OFFICERM
	db "UNUSED@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


OfficerFGroup:
; ================================
; ================

	; OFFICERF
	db "UNUSED@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


NurseGroup:
; ================================
; ================

	; NURSE
	db "UNUSED@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


PokemaniacGroup:
; ================================
; ================

	; POKEMANIAC
	db "UNUSED@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


SuperNerdGroup:
; ================================
; ================

	; SUPER_NERD
	db "UNUSED@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


LassGroup:
; ================================
; ================

	; LASS
	db "LIBBY@"
	db TRAINERTYPE_NORMAL
	; party
	db 6, SNUBBULL
	db -1 ; end

; ================

	; LASS
	db "VERONICA@"
	db TRAINERTYPE_NORMAL
	; party
	db 7, CLEFAIRY
	db 7, CLEFAIRY
	db -1 ; end

; ================

	; LASS
	db "CHARLOTE@"
	db TRAINERTYPE_NORMAL
	; party
	db 10, PIKACHU
	db 11, MAREEP
	db -1 ; end

; ================

	; LASS
	db "JUNE@"
	db TRAINERTYPE_NORMAL
	; party
	db 12, ODDISH
	db 13, JIGGLYPUFF
	db -1 ; end

; ================

	; LASS
	db "MELANIE@"
	db TRAINERTYPE_NORMAL
	; party
	db 15, TEDDIURSA
	db 14, MARILL
	db 16, EEVEE
	db -1 ; end

; ================

	; LASS
	db "SARAH@"
	db TRAINERTYPE_NORMAL
	; party
	db 17, SNUBBULL
	db 18, MEOWTH
	db 19, PSYDUCK
	db -1 ; end

; ================

	; LASS
	db "MARSHA@"
	db TRAINERTYPE_NORMAL
	; party
	db 26, BULBASAUR
	db 25, MEOWTH
	db 26, BULBASAUR
	db -1 ; end

; ================
; ================================


BeautyGroup:
; ================================
; ================

	; BEAUTY
	db "BRITNEY@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; BEAUTY
	db "SANDRA@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


FirebreatherGroup:
; ================================
; ================

	; FIREBREATHER
	db "MORT@"
	db TRAINERTYPE_NORMAL
	; party
	db 20, SLUGMA
	db 21, MAGBY
	db -1 ; end

; ================

	; FIREBREATHER
	db "FRITZ@"
	db TRAINERTYPE_NORMAL
	; party
	db 19, NUMEL
	db 19, SLUGMA
	db 19, LARVITAR
	db -1 ; end

; ================

	; FIREBREATHER
	db "MEL@"
	db TRAINERTYPE_NORMAL
	; party
	db 20, SLUGMA
	db 19, KOFFING
	db 20, NUMEL
	db -1 ; end

; ================

	; FIREBREATHER
	db "DOM@"
	db TRAINERTYPE_NORMAL
	; party
	db 20, PONYTA
	db 22, MAGBY
	db -1 ; end

; ================

	; FIREBREATHER
	db "JOB@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; FIREBREATHER
	db "WIZ@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; FIREBREATHER
	db "GARTH@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; FIREBREATHER
	db "ART@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


JugglerGroup:
; ================================
; ================

	; JUGGLER
	db "ERNIE@"
	db TRAINERTYPE_NORMAL
	; party
	db 20, SWABLU
	db 22, ABRA
	db 18, KADABRA
	db -1 ; end

; ================

	; JUGGLER
	db "WILLY@"
	db TRAINERTYPE_NORMAL
	; party
	db 19, NATU
	db 20, MEDITITE
	db -1 ; end

; ================

	; JUGGLER
	db "QUINN@"
	db TRAINERTYPE_NORMAL
	; party
	db 20, KOFFING
	db 19, KADABRA
	db -1 ; end

; ================
; ================================


SchoolboyGroup:
; ================================
; ================

	; SCHOOLBOY
	db "TIMMY@"	;1 BADGE
	db TRAINERTYPE_NORMAL
	; party
	db 9, PIDGEY
	db 8, RATTATA
	db -1 ; end

; ================

	; SCHOOLBOY
	db "TIMMY@"	;2 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; SCHOOLBOY
	db "TIMMY@"	;3 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; SCHOOLBOY
	db "TIMMY@"	;4 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; SCHOOLBOY
	db "TIMMY@"	;5 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; SCHOOLBOY
	db "TIMMY@"	;6 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; SCHOOLBOY
	db "TIMMY@"	;7 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; SCHOOLBOY
	db "TIMMY@"	;8 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; SCHOOLBOY
	db "DAMIAN@"	;1 BADGE
	db TRAINERTYPE_NORMAL
	; party
	db 9, PIKIPEK
	db 8, RATTATA
	db -1 ; end

; ================

	; SCHOOLBOY
	db "DAMIAN@"	;2 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; SCHOOLBOY
	db "DAMIAN@"	;3 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; SCHOOLBOY
	db "DAMIAN@"	;4 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; SCHOOLBOY
	db "DAMIAN@"	;5 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; SCHOOLBOY
	db "DAMIAN@"	;6 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; SCHOOLBOY
	db "DAMIAN@"	;7 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; SCHOOLBOY
	db "DAMIAN@"	;8 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


SchoolgirlGroup:
; ================================
; ================

	; SCHOOLGIRL
	db "UNUSED@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


PsychicGroup:
; ================================
; ================

	; PSYCHIC_T
	db "UNUSED@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


HexManiacGroup:
; ================================
; ================

	; HEX_MANIAC
	db "UNUSED@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


CoupleGroup:
; ================================
; ================

	; COUPLE
	db "JD & MEG@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


GentlemanGroup:
; ================================
; ================

	; GENTLEMAN
	db "DURWOOD@"
	db TRAINERTYPE_NORMAL
	; party
	db 17, GROWLITHE
	db 16, SWABLU
	db -1 ; end

; ================

	; GENTLEMAN
	db "HOWARD@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


RichBoyGroup:
; ================================
; ================

	; RICH_BOY
	db "UNUSED@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


LadyGroup:
; ================================
; ================

	; LADY
	db "RUTH@"
	db TRAINERTYPE_NORMAL
	; party
	db 15, MEOWTH
	db 15, BUNEARY
	db -1 ; end

; ================

	; LADY
	db "GRETCHEN@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


SailorGroup:
; ================================
; ================

	; SAILOR
	db "UNUSED@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


SwimmerMGroup:
; ================================
; ================

	; SWIMMERM
	db "UNUSED@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


SwimmerFGroup:
; ================================
; ================

	; SWIMMERF
	db "UNUSED@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


BurglarGroup:
; ================================
; ================

	; BURGLAR
	db "UNUSED@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


ScientistGroup:
; ================================
; ================

	; SCIENTIST
	db "UNUSED@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


BoarderGroup:
; ================================
; ================

	; BOARDER
	db "TOBY@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; BOARDER
	db "FRANK@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; BOARDER
	db "JOSE@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; BOARDER
	db "PETER@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; BOARDER
	db "FRANK@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


SkierGroup:
; ================================
; ================

	; SKIER
	db "DEBBIE@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; SKIER
	db "RHONDA@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; SKIER
	db "KIM@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; SKIER
	db "SHERRY@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; SKIER
	db "LAURA@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


BlackbeltGroup:
; ================================
; ================

	; BLACKBELT_T
	db "UNUSED@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


BattleGirlGroup:
; ================================
; ================

	; BATTLE_GIRL
	db "UNUSED@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


TeacherGroup:
; ================================
; ================

	; TEACHER
	db "UNUSED@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================



GuitaristMGroup:
; ================================
; ================

	; GUITARISTM
	db "UNUSED@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


GuitaristFGroup:
; ================================
; ================

	; GUITARISTF
	db "UNUSED@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


BikerGroup:
; ================================
; ================

	; BIKER
	db "UNUSED@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


CueballGroup:
; ================================
; ================

	; CUE_BALL
	db "UNUSED@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


CooltrainerMGroup:
; ================================
; ================

	; COOLTRAINERM
	db "CODY@"
	db TRAINERTYPE_NORMAL
	; party
	db 23, PONYTA
	db -1 ; end

; ================

	; COOLTRAINERM
	db "SAMMY@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


SECTION "Enemy Trainer Parties 2", ROMX


CooltrainerFGroup:
; ================================
; ================

	; COOLTRAINERF
	db "CASEY@"
	db TRAINERTYPE_NORMAL
	; party
	db 23, NUMEL
	db -1 ; end

; ================

	; COOLTRAINERF
	db "SALLY@"
	db TRAINERTYPE_NORMAL
	; party
	db 13, GROWLITHE
	db 14, MAREEP
	db -1 ; end

; ================

	; COOLTRAINERF
	db "JULES@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


ProfSpruceGroup:
; ================================
; ================

	; PROF_SPRUCE
	db "UNUSED@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


TeacherFastGroup:
; ================================
; ================

	; TEACHER_FAST
	db "KATE@"
	db TRAINERTYPE_NORMAL
	; party
	db 6, MEOWTH
	db -1 ; end

; ================
; ================================


TrioBroRGroup:
; ================================
; ================

	; TRIOBROR
	db "RED@"
	db TRAINERTYPE_MOVES
	; party
	db 14, SMEARGLE
		db FIRE_BLAST, 0, 0, 0
	db -1 ; end

; ================
; ================================


TrioBroBGroup:
; ================================
; ================

	; TRIOBROB
	db "BLUE@"
	db TRAINERTYPE_MOVES
	; party
	db 14, SMEARGLE
		db BLIZZARD, 0, 0, 0
	db -1 ; end

; ================
; ================================


TrioBroYGroup:
; ================================
; ================

	; TRIOBROR
	db "YELLOW@"
	db TRAINERTYPE_MOVES
	; party
	db 14, SMEARGLE
		db THUNDER, 0, 0, 0
	db -1 ; end

; ================
; ================================


DisguiseGroup:
; ================================
; ================

	; DISGUISE
	db "MASTER@"
	db TRAINERTYPE_MOVES
	; party
	db 12, VOLTORB
		db TACKLE_SCRATCH_POUND, ROLLOUT, 0, 0
	db 12, MARILL
		db TACKLE_SCRATCH_POUND, ROLLOUT, 0, 0
	db 12, JIGGLYPUFF
		db TACKLE_SCRATCH_POUND, ROLLOUT, 0, 0
	db -1 ; end

; ================
; ================================


BikiniBRGroup:
; ================================
; ================

	; BIKINIP
	db "HAZEL@"
	db TRAINERTYPE_NORMAL
	; party
	db 23, SANDSHREW
	db -1 ; end

; ================
; ================================


BikiniBLGroup:
; ================================
; ================

	; BIKINIR
	db "ASTER@"
	db TRAINERTYPE_NORMAL
	; party
	db 22, PHANPY
	db -1 ; end

; ================
; ================================


BikiniPGroup:
; ================================
; ================

	; BIKINIY
	db "LILAC@"
	db TRAINERTYPE_NORMAL
	; party
	db 20, GLIGAR
	db -1 ; end

; ================
; ================================


DelinquentmGroup:
; ================================
; ================

	; DELINQUENT_M
	db "UNUSED@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


DelinquentfGroup:
; ================================
; ================

	; DELINQUENT_F
	db "UNUSED@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; DELINQUENT_F
	db "UNUSED@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; DELINQUENT_F
	db "UNUSED@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; DELINQUENT_F
	db "UNUSED@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


BunearymGroup:
; ================================
; ================

	; BUNEARY_M
	db "BOY1@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; BUNEARY_M
	db "BOY2@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end
	
; ================

	; BUNEARY_M
	db "BOY3@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end
	
; ================

	; BUNEARY_M
	db "BOY4@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end
	
; ================

	; BUNEARY_M
	db "BOY5@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end
	
; ================
; ================================


BunearyfGroup:
; ================================
; ================

	; BUNEARY_F
	db "GAL1@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; BUNEARY_F
	db "GAL2@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


FrankieGroup:
; ================================
; ================

	; FRANKIE
	db "THE KID@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


MallCopGroup:
; ================================
; ================

	; PHIL
	db "PHIL@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


SkaterGroup:
; ================================
; ================

	; TONY
	db "TONY@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


TowerTycoonGroup:
; ================================
; ================

	; TOWERTYCOON
	db "UNUSED@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================
