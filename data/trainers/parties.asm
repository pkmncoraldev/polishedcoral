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


PlayermGroup:
; ================================
; ================
; ================
; ================================


PlayerfGroup:
; ================================
; ================
; ================
; ================================


PlayerpGroup:
; ================================
; ================
; ================
; ================================


StanleyGroup:
; ================================
; ================

	; STANLEY
	db "STANLEY@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_EVS | TRAINERTYPE_MOVES
	; party
	db 11, SMEARGLE, NO_ITEM, 16
		db DOUBLE_EDGE, CONFUSION, THUNDER_WAVE, FAKE_OUT
	db 15, DITTO, NO_ITEM, 16
		db TRANSFORM, 0, 0, 0
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
	db 18, WOOPER, NO_ITEM, 32, HIDDEN_ABILITY | HASTY, MALE
		db RAIN_DANCE, WATER_GUN, BODY_SLAM, 0
	db 20, POLIWHIRL, NO_ITEM, 32, HIDDEN_ABILITY | TIMID, MALE
		db RAIN_DANCE, WATER_GUN, HYPNOSIS, MUD_SLAP
	db -1 ; end

; ================
; ================================


LeilaniGroup:
; ================================
; ================

	; LEILANI
	db "LEILANI@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_EVS | TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES
	; party
	db 1, BULBASAUR, NO_ITEM, 48, ABILITY_1 | QUIRKY, FEMALE
		db TACKLE, 0, 0, 0
	db -1 ; end

; ================
; ================================


MortyGroup:
; ================================
; ================

	; MORTY
	db "UNUSED@"
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
	db TRAINERTYPE_NORMAL
	; party
	db 5, TOTODILE
	db -1 ; end

; ================

	; RIVAL (1-2)
	db "<RIVAL>@"
	db TRAINERTYPE_NORMAL
	; party
	db 5, CYNDAQUIL
	db -1 ; end

; ================

	; RIVAL (1-3)
	db "<RIVAL>@"
	db TRAINERTYPE_NORMAL
	; party
	db 5, CHIKORITA
	db -1 ; end

; ================

	; RIVAL (1-4)
	db "<RIVAL>@"
	db TRAINERTYPE_NORMAL
	; party
	db 5, SQUIRTLE
	db -1 ; end

; ================

	; RIVAL (1-5)
	db "<RIVAL>@"
	db TRAINERTYPE_NORMAL
	; party
	db 5, CHARMANDER
	db -1 ; end

; ================

	; RIVAL (1-6)
	db "<RIVAL>@"
	db TRAINERTYPE_NORMAL
	; party
	db 5, BULBASAUR
	db -1 ; end

; ================

	; RIVAL (2-1)
	db "<RIVAL>@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
;	db 7, SNUBBULL
;	db 8, TOTODILE
	db -1 ; end

; ================

	; RIVAL (2-2)
	db "<RIVAL>@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
;	db 7, SNUBBULL
;	db 8, CYNDAQUIL
	db -1 ; end

; ================

	; RIVAL (2-3)
	db "<RIVAL>@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
;	db 7, SNUBBULL
;	db 8, CHIKORITA
	db -1 ; end

; ================

	; RIVAL (2-4)
	db "<RIVAL>@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
;	db 7, SNUBBULL
;	db 8, SQUIRTLE
	db -1 ; end

; ================

	; RIVAL (2-5)
	db "<RIVAL>@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
;	db 7, SNUBBULL
;	db 8, CHARMANDER
	db -1 ; end

; ================

	; RIVAL (2-6)
	db "<RIVAL>@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
;	db 7, SNUBBULL
;	db 8, BULBASAUR
	db -1 ; end

; ================
; ================================


YoungsterGroup:
; ================================
; ================

	; YOUNGSTER
	db "JOEY@"
;	db TRAINERTYPE_DVS | TRAINERTYPE_PERSONALITY
;	; party
;	db 5, RATTATA, FAKE_PERFECT_DVS, ABILITY_2 | ADAMANT, MALE
;	db -1 ; end
	db TRAINERTYPE_NORMAL
	; party
	db 1, RATTATA
	db -1 ; end

; ================

	; YOUNGSTER
	db "BILLY@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; YOUNGSTER
	db "CHRIS@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; YOUNGSTER
	db "TOMMY@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
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
	db 1, BULBASAUR
	db -1 ; end

; ================

	; BUG_CATCHER
	db "JOSH@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; BUG_CATCHER
	db "ARNOLD@"
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
	db 1, BULBASAUR
	db -1 ; end

; ================

	; CAMPER
	db "DENNY@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; CAMPER
	db "TREVOR@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; CAMPER
	db "VINCENT@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

; CAMPER
	db "DANTE@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
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
	db 1, BULBASAUR
	db -1 ; end

; ================

	; PICNICKER
	db "ERIN@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; PICNICKER
	db "TRISTA@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; PICNICKER
	db "SHAUNA@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; PICNICKER
	db "BETH@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; PICNICKER
	db "TINA@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


TwinsGroup:
; ================================
; ================

	; TWINS
	db "JEN & JAN@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; TWINS
	db "JAN & JEN@"
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
	db 1, BULBASAUR
	db -1 ; end

; ================

	; FISHER
	db "GERALD@"	;2 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
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
	db 1, BULBASAUR
	db -1 ; end

; ================

	; FISHER
	db "WALTER@"	;2 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
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
	db 1, BULBASAUR
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
	db 1, BULBASAUR
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
	db 1, BULBASAUR
	db -1 ; end

; ================

	; FISHER
	db "HUE@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; FISHER
	db "DARREN@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
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
	db 1, BULBASAUR
	db -1 ; end

; ================

	; BIRD_KEEPER
	db "TODD@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; BIRD_KEEPER
	db "RANDY@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; BIRD_KEEPER
	db "JAZZ@"
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
	db 1, BULBASAUR
	db -1 ; end

; ================

	; HIKER
	db "WILL@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; HIKER
	db "ROB@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; HIKER
	db "BENJAMIN@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; HIKER
	db "LANDON@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; HIKER
	db "SIMON@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; HIKER
	db "STEVEN@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; HIKER
	db "GILL@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; HIKER
	db "HARVEY@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; HIKER
	db "TED@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; HIKER
	db "LEROY@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; HIKER
	db "SAMSON@"
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

	; GRUNTM (1)
	db "GRUNT@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; GRUNTM (2)
	db "GRUNT@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; GRUNTM (3)
	db "GRUNT@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; GRUNTM (4)
	db "GRUNT@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; GRUNTM (5)
	db "GRUNT@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; GRUNTM (6)
	db "GRUNT@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; GRUNTM (7)
	db "GRUNT@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; GRUNTM (8)
	db "GRUNT@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


GruntFGroup:
; ================================
; ================

	; GRUNTF (1)
	db "GRUNT@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; GRUNTF (2)
	db "GRUNT@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; GRUNTF (3)
	db "GRUNT@"
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
	db 1, BULBASAUR
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
	db "RICK@"
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
; ================================


PokefanFGroup:
; ================================
; ================

	; POKEFANF
	db "SUSAN@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
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
	db "WENDY@"
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
	db 1, BULBASAUR
	db -1 ; end

; ================

	; LASS
	db "VERONICA@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; LASS
	db "CHARLOTEE@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; LASS
	db "JUNE@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; LASS
	db "MELANIE@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; LASS
	db "SARAH@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; LASS
	db "MARSHA@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


BeautyGroup:
; ================================
; ================

	; BEAUTY
	db "UNUSED@"
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
	db 1, BULBASAUR
	db -1 ; end

; ================

	; FIREBREATHER
	db "FRITZ@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; FIREBREATHER
	db "MEL@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; FIREBREATHER
	db "DOM@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
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
	db 1, BULBASAUR
	db -1 ; end

; ================

	; JUGGLER
	db "WILLY@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; JUGGLER
	db "QUINN@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
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
	db 1, BULBASAUR
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
	db 1, BULBASAUR
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
	db 1, BULBASAUR
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
	db 1, BULBASAUR
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
	db 1, BULBASAUR
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
	db 1, BULBASAUR
	db -1 ; end

; ================

	; COOLTRAINERF
	db "SALLY@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; COOLTRAINERF
	db "HAILEY@"
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
	db TRAINERTYPE_ITEM
	; party
	db 6, MEOWTH, QUICK_CLAW
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
	db TRAINERTYPE_NORMAL
	; party
;	db 12, VOLTORB
;	db 12, MARILL
;	db 13, JIGGLYPUFF
	db  1, BULBASAUR
	db -1 ; end

; ================
; ================================


BikiniPGroup:
; ================================
; ================

	; BIKINIP
	db "UNUSED@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


BikiniRGroup:
; ================================
; ================

	; BIKINIR
	db "UNUSED@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


BikiniYGroup:
; ================================
; ================

	; BIKINIY
	db "UNUSED@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
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


SafariGroup:
; ================================
; ================

	; SAFARI
	db "JULIAN@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; SAFARI
	db "PAUL@"
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; SAFARI
	db "PHILLIP@"
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
