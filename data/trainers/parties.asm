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

	; STANLEY_1
	db "STANLEY@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_EVS | TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES
	; party
	db 11, SMEARGLE, NO_ITEM, 16, ABILITY_2 | JOLLY, MALE
		db DOUBLE_EDGE, CONFUSION, THUNDER_WAVE, FAKE_OUT
	db 15, DITTO, NO_ITEM, 16, ABILITY_1 | JOLLY, MALE
		db TRANSFORM_SPLASH, 0, 0, 0
	db -1 ; end

; ================

	; STANLEY_2
	db "STANLEY@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_EVS | TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES
	; party
	db 19, SMEARGLE, NO_ITEM, 16, ABILITY_2 | JOLLY, MALE
		db DOUBLE_EDGE, CONFUSION, THUNDER_WAVE, FAKE_OUT
	db 25, DITTO, NO_ITEM, 16, ABILITY_1 | JOLLY, MALE
		db TRANSFORM_SPLASH, 0, 0, 0
	db -1 ; end

; ================

	; STANLEY_3
	db "STANLEY@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_EVS | TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES
	; party
	db 28, SMEARGLE, NO_ITEM, 16, ABILITY_2 | JOLLY, MALE
		db DOUBLE_EDGE, CONFUSION, THUNDER_WAVE, FAKE_OUT
	db 30, DITTO, NO_ITEM, 16, ABILITY_1 | JOLLY, MALE
		db TRANSFORM_SPLASH, 0, 0, 0
	db -1 ; end

; ================

	; STANLEY_4
	db "STANLEY@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_EVS | TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES
	; party
	db 33, SMEARGLE, NO_ITEM, 16, ABILITY_2 | JOLLY, MALE
		db DOUBLE_EDGE, CONFUSION, THUNDER_WAVE, FAKE_OUT
	db 39, DITTO, NO_ITEM, 16, ABILITY_1 | JOLLY, MALE
		db TRANSFORM_SPLASH, 0, 0, 0
	db -1 ; end

; ================

	; STANLEY_5
	db "STANLEY@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_EVS | TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES
	; party
	db 11, SMEARGLE, NO_ITEM, 16, ABILITY_2 | JOLLY, MALE
		db DOUBLE_EDGE, CONFUSION, THUNDER_WAVE, FAKE_OUT
	db 15, DITTO, NO_ITEM, 16, ABILITY_1 | JOLLY, MALE
		db TRANSFORM_SPLASH, 0, 0, 0
	db -1 ; end

; ================

	; STANLEY_6
	db "STANLEY@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_EVS | TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES
	; party
	db 11, SMEARGLE, NO_ITEM, 16, ABILITY_2 | JOLLY, MALE
		db DOUBLE_EDGE, CONFUSION, THUNDER_WAVE, FAKE_OUT
	db 15, DITTO, NO_ITEM, 16, ABILITY_1 | JOLLY, MALE
		db TRANSFORM_SPLASH, 0, 0, 0
	db -1 ; end

; ================

	; STANLEY_7
	db "STANLEY@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_EVS | TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES
	; party
	db 11, SMEARGLE, NO_ITEM, 16, ABILITY_2 | JOLLY, MALE
		db DOUBLE_EDGE, CONFUSION, THUNDER_WAVE, FAKE_OUT
	db 15, DITTO, NO_ITEM, 16, ABILITY_1 | JOLLY, MALE
		db TRANSFORM_SPLASH, 0, 0, 0
	db -1 ; end

; ================

	; STANLEY_8
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

	; RODNEY_2
	db "RODNEY@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_EVS | TRAINERTYPE_DVS | TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES
	; party
	db 17, CHINCHOU, NO_ITEM, 16, $99, $99, $99, ABILITY_1 | SASSY, MALE
		db RAIN_DANCE, WATER_GUN, SPARK, CONFUSE_RAY
	db 18, WOOPER, NO_ITEM, 32, $99, $99, $99, HIDDEN_ABILITY | TIMID, FEMALE
		db RAIN_DANCE, WATER_GUN, BODY_SLAM, 0
	db 19, GYARADOS, NO_ITEM, 0, $99, $09, $70, ABILITY_1 | GENTLE, MALE
		db WATER_GUN, BITE, TACKLE_SCRATCH_POUND, GUST
	db -1 ; end

; ================

	; RODNEY_3
	db "RODNEY@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_EVS | TRAINERTYPE_DVS | TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES
	; party
	db 27, LANTURN, NO_ITEM, 16, $99, $99, $99, ABILITY_1 | SASSY, MALE
		db RAIN_DANCE, BUBBLE_BEAM, SPARK, CONFUSE_RAY
	db 28, QUAGSIRE, NO_ITEM, 32, $99, $99, $99, HIDDEN_ABILITY | TIMID, FEMALE
		db RAIN_DANCE, BUBBLE_BEAM, BODY_SLAM, MUD_SLAP
	db 30, GYARADOS, NO_ITEM, 0, $99, $09, $70, ABILITY_1 | GENTLE, MALE
		db AQUA_TAIL, BITE, THRASH, GUST
	db -1 ; end

; ================

	; RODNEY_4
	db "RODNEY@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_EVS | TRAINERTYPE_DVS | TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES
	; party
	db 33, LANTURN, NO_ITEM, 16, $99, $99, $99, ABILITY_1 | SASSY, MALE
		db RAIN_DANCE, BUBBLE_BEAM, SPARK, CONFUSE_RAY
	db 34, QUAGSIRE, NO_ITEM, 32, $99, $99, $99, HIDDEN_ABILITY | TIMID, FEMALE
		db RAIN_DANCE, BUBBLE_BEAM, BODY_SLAM, MUD_SLAP
	db 36, GYARADOS, NO_ITEM, 0, $99, $09, $70, ABILITY_1 | GENTLE, MALE
		db AQUA_TAIL, BITE, THRASH, ICE_FANG
	db -1 ; end

; ================

	; RODNEY_5
	db "RODNEY@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_EVS | TRAINERTYPE_DVS | TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES
	; party
	db 17, CHINCHOU, NO_ITEM, 16, $99, $99, $99, ABILITY_1 | SASSY, MALE
		db RAIN_DANCE, WATER_GUN, SPARK, CONFUSE_RAY
	db 18, WOOPER, NO_ITEM, 32, $99, $99, $99, HIDDEN_ABILITY | TIMID, FEMALE
		db RAIN_DANCE, WATER_GUN, BODY_SLAM, 0
	db 19, GYARADOS, NO_ITEM, 0, $99, $09, $70, ABILITY_1 | GENTLE, MALE
		db WATER_GUN, BITE, TACKLE_SCRATCH_POUND, GUST
	db -1 ; end

; ================

	; RODNEY_6
	db "RODNEY@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_EVS | TRAINERTYPE_DVS | TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES
	; party
	db 17, CHINCHOU, NO_ITEM, 16, $99, $99, $99, ABILITY_1 | SASSY, MALE
		db RAIN_DANCE, WATER_GUN, SPARK, CONFUSE_RAY
	db 18, WOOPER, NO_ITEM, 32, $99, $99, $99, HIDDEN_ABILITY | TIMID, FEMALE
		db RAIN_DANCE, WATER_GUN, BODY_SLAM, 0
	db 19, GYARADOS, NO_ITEM, 0, $99, $09, $70, ABILITY_1 | GENTLE, MALE
		db WATER_GUN, BITE, TACKLE_SCRATCH_POUND, GUST
	db -1 ; end

; ================

	; RODNEY_7
	db "RODNEY@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_EVS | TRAINERTYPE_DVS | TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES
	; party
	db 17, CHINCHOU, NO_ITEM, 16, $99, $99, $99, ABILITY_1 | SASSY, MALE
		db RAIN_DANCE, WATER_GUN, SPARK, CONFUSE_RAY
	db 18, WOOPER, NO_ITEM, 32, $99, $99, $99, HIDDEN_ABILITY | TIMID, FEMALE
		db RAIN_DANCE, WATER_GUN, BODY_SLAM, 0
	db 19, GYARADOS, NO_ITEM, 0, $99, $09, $70, ABILITY_1 | GENTLE, MALE
		db WATER_GUN, BITE, TACKLE_SCRATCH_POUND, GUST
	db -1 ; end

; ================

	; RODNEY_8
	db "RODNEY@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_EVS | TRAINERTYPE_DVS | TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES
	; party
	db 17, CHINCHOU, NO_ITEM, 16, $99, $99, $99, ABILITY_1 | SASSY, MALE
		db RAIN_DANCE, WATER_GUN, SPARK, CONFUSE_RAY
	db 18, WOOPER, NO_ITEM, 32, $99, $99, $99, HIDDEN_ABILITY | TIMID, FEMALE
		db RAIN_DANCE, WATER_GUN, BODY_SLAM, 0
	db 19, GYARADOS, NO_ITEM, 0, $99, $09, $70, ABILITY_1 | GENTLE, MALE
		db WATER_GUN, BITE, TACKLE_SCRATCH_POUND, GUST
	db -1 ; end

; ================
; ================================


WendyGroup:
; ================================
; ================

	; WENDY_3
	db "WENDY@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_EVS | TRAINERTYPE_DVS | TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES
	; party
	db 32, TOGETIC, NO_ITEM, 100, $77, $7A, $77, ABILITY_2 | QUIRKY, FEMALE
		db CHARM_FEATHER_DANCE, FAIRY_WIND, ROOST, ENCORE
	db 31, DODRIO, NO_ITEM, 100, $77, $7A, $77, HIDDEN_ABILITY | QUIRKY, MALE
		db AGILITY_ROCK_POLISH, TRI_ATTACK, ROOST, DRILL_PECK
	db 35, SWABLU, NO_ITEM, 100, $77, $7A, $77, HIDDEN_ABILITY | QUIRKY, MALE
		db SAFEGUARD, PERISH_SONG, ROOST, DRAGON_PULSE
	db 34, SKARMORY, NO_ITEM, 0, $77, $0A, $A0, ABILITY_1 | QUIRKY, FEMALE
		db STEEL_WING, SPIKES, FLY, 0
	db -1 ; end

; ================

	; WENDY_4
	db "WENDY@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_EVS | TRAINERTYPE_DVS | TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES
	; party
	db 32, TOGETIC, NO_ITEM, 100, $77, $7A, $77, ABILITY_2 | QUIRKY, FEMALE
		db CHARM_FEATHER_DANCE, FAIRY_WIND, ROOST, ENCORE
	db 31, DODRIO, NO_ITEM, 100, $77, $7A, $77, HIDDEN_ABILITY | QUIRKY, MALE
		db AGILITY_ROCK_POLISH, TRI_ATTACK, ROOST, DRILL_PECK
	db 35, SWABLU, NO_ITEM, 100, $77, $7A, $77, HIDDEN_ABILITY | QUIRKY, MALE
		db SAFEGUARD, PERISH_SONG, ROOST, DRAGON_PULSE
	db 34, SKARMORY, NO_ITEM, 0, $77, $0A, $A0, ABILITY_1 | QUIRKY, FEMALE
		db STEEL_WING, SPIKES, FLY, 0
	db -1 ; end

; ================

	; WENDY_5
	db "WENDY@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_EVS | TRAINERTYPE_DVS | TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES
	; party
	db 32, TOGETIC, NO_ITEM, 100, $77, $7A, $77, ABILITY_2 | QUIRKY, FEMALE
		db CHARM_FEATHER_DANCE, FAIRY_WIND, ROOST, ENCORE
	db 31, DODRIO, NO_ITEM, 100, $77, $7A, $77, HIDDEN_ABILITY | QUIRKY, MALE
		db AGILITY_ROCK_POLISH, TRI_ATTACK, ROOST, DRILL_PECK
	db 35, SWABLU, NO_ITEM, 100, $77, $7A, $77, HIDDEN_ABILITY | QUIRKY, MALE
		db SAFEGUARD, PERISH_SONG, ROOST, DRAGON_PULSE
	db 34, SKARMORY, NO_ITEM, 0, $77, $0A, $A0, ABILITY_1 | QUIRKY, FEMALE
		db STEEL_WING, SPIKES, FLY, 0
	db -1 ; end

; ================

	; WENDY_6
	db "WENDY@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_EVS | TRAINERTYPE_DVS | TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES
	; party
	db 32, TOGETIC, NO_ITEM, 100, $77, $7A, $77, ABILITY_2 | QUIRKY, FEMALE
		db CHARM_FEATHER_DANCE, FAIRY_WIND, ROOST, ENCORE
	db 31, DODRIO, NO_ITEM, 100, $77, $7A, $77, HIDDEN_ABILITY | QUIRKY, MALE
		db AGILITY_ROCK_POLISH, TRI_ATTACK, ROOST, DRILL_PECK
	db 35, SWABLU, NO_ITEM, 100, $77, $7A, $77, HIDDEN_ABILITY | QUIRKY, MALE
		db SAFEGUARD, PERISH_SONG, ROOST, DRAGON_PULSE
	db 34, SKARMORY, NO_ITEM, 0, $77, $0A, $A0, ABILITY_1 | QUIRKY, FEMALE
		db STEEL_WING, SPIKES, FLY, 0
	db -1 ; end

; ================

	; WENDY_7
	db "WENDY@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_EVS | TRAINERTYPE_DVS | TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES
	; party
	db 32, TOGETIC, NO_ITEM, 100, $77, $7A, $77, ABILITY_2 | QUIRKY, FEMALE
		db CHARM_FEATHER_DANCE, FAIRY_WIND, ROOST, ENCORE
	db 31, DODRIO, NO_ITEM, 100, $77, $7A, $77, HIDDEN_ABILITY | QUIRKY, MALE
		db AGILITY_ROCK_POLISH, TRI_ATTACK, ROOST, DRILL_PECK
	db 35, SWABLU, NO_ITEM, 100, $77, $7A, $77, HIDDEN_ABILITY | QUIRKY, MALE
		db SAFEGUARD, PERISH_SONG, ROOST, DRAGON_PULSE
	db 34, SKARMORY, NO_ITEM, 0, $77, $0A, $A0, ABILITY_1 | QUIRKY, FEMALE
		db STEEL_WING, SPIKES, FLY, 0
	db -1 ; end

; ================

	; WENDY_8
	db "WENDY@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_EVS | TRAINERTYPE_DVS | TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES
	; party
	db 32, TOGETIC, NO_ITEM, 100, $77, $7A, $77, ABILITY_2 | QUIRKY, FEMALE
		db CHARM_FEATHER_DANCE, FAIRY_WIND, ROOST, ENCORE
	db 31, DODRIO, NO_ITEM, 100, $77, $7A, $77, HIDDEN_ABILITY | QUIRKY, MALE
		db AGILITY_ROCK_POLISH, TRI_ATTACK, ROOST, DRILL_PECK
	db 35, SWABLU, NO_ITEM, 100, $77, $7A, $77, HIDDEN_ABILITY | QUIRKY, MALE
		db SAFEGUARD, PERISH_SONG, ROOST, DRAGON_PULSE
	db 34, SKARMORY, NO_ITEM, 0, $77, $0A, $A0, ABILITY_1 | QUIRKY, FEMALE
		db STEEL_WING, SPIKES, FLY, 0
	db -1 ; end

; ================
; ================================


CharlieGroup:
; ================================
; ================

	; CHARLIE_3
	db "CHARLIE@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_EVS | TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES
	; party
	db 32, HOUNDOOM, NO_ITEM, 48, ABILITY_2 | QUIRKY, MALE
		db SUNNY_DAY, FIRE_FANG, BITE, SWAGGER
	db 32, FLOATZEL, NO_ITEM, 48, HIDDEN_ABILITY | CAREFUL, FEMALE
		db AQUA_JET, SCALD, PURSUIT, DOUBLE_HIT
	db 33, CAMERUPT, HEAT_ROCK, 48, ABILITY_1 | CALM, MALE
		db SUNNY_DAY, AMNESIA, FLAMETHROWER, REST
	db 36, MAROWAK_A, NO_ITEM, 48, HIDDEN_ABILITY | QUIRKY, MALE
		db FLARE_BLITZ, SHADOW_BONE, BONE_CLUB, HEADBUTT
	db -1 ; end

; ================

	; CHARLIE_4
	db "CHARLIE@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_EVS | TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES
	; party
	db 32, HOUNDOOM, NO_ITEM, 48, ABILITY_2 | QUIRKY, MALE
		db SUNNY_DAY, FIRE_FANG, BITE, SWAGGER
	db 32, FLOATZEL, NO_ITEM, 48, HIDDEN_ABILITY | CAREFUL, FEMALE
		db AQUA_JET, SCALD, PURSUIT, DOUBLE_HIT
	db 33, CAMERUPT, HEAT_ROCK, 48, ABILITY_1 | CALM, MALE
		db SUNNY_DAY, AMNESIA, FLAMETHROWER, REST
	db 36, MAROWAK_A, NO_ITEM, 48, HIDDEN_ABILITY | QUIRKY, MALE
		db FLARE_BLITZ, SHADOW_BONE, BONE_CLUB, HEADBUTT
	db -1 ; end

; ================

	; CHARLIE_5
	db "CHARLIE@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_EVS | TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES
	; party
	db 32, HOUNDOOM, NO_ITEM, 48, ABILITY_2 | QUIRKY, MALE
		db SUNNY_DAY, FIRE_FANG, BITE, SWAGGER
	db 32, FLOATZEL, NO_ITEM, 48, HIDDEN_ABILITY | CAREFUL, FEMALE
		db AQUA_JET, SCALD, PURSUIT, DOUBLE_HIT
	db 33, CAMERUPT, HEAT_ROCK, 48, ABILITY_1 | CALM, MALE
		db SUNNY_DAY, AMNESIA, FLAMETHROWER, REST
	db 36, MAROWAK_A, NO_ITEM, 48, HIDDEN_ABILITY | QUIRKY, MALE
		db FLARE_BLITZ, SHADOW_BONE, BONE_CLUB, HEADBUTT
	db -1 ; end

; ================

	; CHARLIE_6
	db "CHARLIE@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_EVS | TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES
	; party
	db 32, HOUNDOOM, NO_ITEM, 48, ABILITY_2 | QUIRKY, MALE
		db SUNNY_DAY, FIRE_FANG, BITE, SWAGGER
	db 32, FLOATZEL, NO_ITEM, 48, HIDDEN_ABILITY | CAREFUL, FEMALE
		db AQUA_JET, SCALD, PURSUIT, DOUBLE_HIT
	db 33, CAMERUPT, HEAT_ROCK, 48, ABILITY_1 | CALM, MALE
		db SUNNY_DAY, AMNESIA, FLAMETHROWER, REST
	db 36, MAROWAK_A, NO_ITEM, 48, HIDDEN_ABILITY | QUIRKY, MALE
		db FLARE_BLITZ, SHADOW_BONE, BONE_CLUB, HEADBUTT
	db -1 ; end

; ================

	; CHARLIE_7
	db "CHARLIE@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_EVS | TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES
	; party
	db 32, HOUNDOOM, NO_ITEM, 48, ABILITY_2 | QUIRKY, MALE
		db SUNNY_DAY, FIRE_FANG, BITE, SWAGGER
	db 32, FLOATZEL, NO_ITEM, 48, HIDDEN_ABILITY | CAREFUL, FEMALE
		db AQUA_JET, SCALD, PURSUIT, DOUBLE_HIT
	db 33, CAMERUPT, HEAT_ROCK, 48, ABILITY_1 | CALM, MALE
		db SUNNY_DAY, AMNESIA, FLAMETHROWER, REST
	db 36, MAROWAK_A, NO_ITEM, 48, HIDDEN_ABILITY | QUIRKY, MALE
		db FLARE_BLITZ, SHADOW_BONE, BONE_CLUB, HEADBUTT
	db -1 ; end

; ================

	; CHARLIE_8
	db "CHARLIE@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_EVS | TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES
	; party
	db 32, HOUNDOOM, NO_ITEM, 48, ABILITY_2 | QUIRKY, MALE
		db SUNNY_DAY, FIRE_FANG, BITE, SWAGGER
	db 32, FLOATZEL, NO_ITEM, 48, HIDDEN_ABILITY | CAREFUL, FEMALE
		db AQUA_JET, SCALD, PURSUIT, DOUBLE_HIT
	db 33, CAMERUPT, HEAT_ROCK, 48, ABILITY_1 | CALM, MALE
		db SUNNY_DAY, AMNESIA, FLAMETHROWER, REST
	db 36, MAROWAK_A, NO_ITEM, 48, HIDDEN_ABILITY | QUIRKY, MALE
		db FLARE_BLITZ, SHADOW_BONE, BONE_CLUB, HEADBUTT
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

	; RIVAL (3-1)
	db "<RIVAL>@"
	db TRAINERTYPE_DVS | TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES
	; party
	db 19, SNUBBULL, $99, $99, $99, ABILITY_2 | HARDY, FEMALE
		db FAKE_OUT, CHARM_FEATHER_DANCE, BITE, HEADBUTT
	db 21, SCYTHER, $66, $66, $66, ABILITY_1 | HARDY, MALE
		db AGILITY_ROCK_POLISH, FALSE_SWIPE, PURSUIT, FOCUS_ENERGY
	db 22, CROCONAW, $66, $66, $66, ABILITY_1 | HARDY, MALE
		db ICE_FANG, SCARY_FACE_COTTON_SPORE_STRING_SHOT, AQUA_JET, BITE
	db -1 ; end

; ================

	; RIVAL (3-2)
	db "<RIVAL>@"
	db TRAINERTYPE_DVS | TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES
	; party
	db 19, SNUBBULL, $99, $99, $99, ABILITY_2 | HARDY, FEMALE
		db FAKE_OUT, CHARM_FEATHER_DANCE, BITE, HEADBUTT
	db 21, SCYTHER, $66, $66, $66, ABILITY_1 | HARDY, MALE
		db AGILITY_ROCK_POLISH, FALSE_SWIPE, PURSUIT, FOCUS_ENERGY
	db 22, QUILAVA, $66, $66, $66, ABILITY_1 | HARDY, MALE
		db FLAME_BURST, SAND_ATTACK_SMOKESCREEN, FLAME_CHARGE, QUICK_ATTACK
	db -1 ; end

; ================

	; RIVAL (3-3)
	db "<RIVAL>@"
	db TRAINERTYPE_DVS | TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES
	; party
	db 19, SNUBBULL, $99, $99, $99, ABILITY_2 | HARDY, FEMALE
		db FAKE_OUT, CHARM_FEATHER_DANCE, BITE, HEADBUTT
	db 21, SCYTHER, $66, $66, $66, ABILITY_1 | HARDY, MALE
		db AGILITY_ROCK_POLISH, FALSE_SWIPE, PURSUIT, FOCUS_ENERGY
	db 22, BAYLEEF, $66, $66, $66, ABILITY_1 | HARDY, MALE
		db REFLECT, RAZOR_LEAF, MEGA_DRAIN, POISONPOWDER
	db -1 ; end

; ================

	; RIVAL (3-4)
	db "<RIVAL>@"
	db TRAINERTYPE_DVS | TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES
	; party
	db 19, SNUBBULL, $99, $99, $99, ABILITY_2 | HARDY, FEMALE
		db FAKE_OUT, CHARM_FEATHER_DANCE, BITE, HEADBUTT
	db 21, SCYTHER, $66, $66, $66, ABILITY_1 | HARDY, MALE
		db AGILITY_ROCK_POLISH, FALSE_SWIPE, PURSUIT, FOCUS_ENERGY
	db 22, WARTORTLE, $66, $66, $66, ABILITY_1 | HARDY, MALE
		db BUBBLE_BEAM, DEFENSE_CURL_HARDEN_WITHDRAW, ICY_WIND, RAPID_SPIN
	db -1 ; end

; ================

	; RIVAL (3-5)
	db "<RIVAL>@"
	db TRAINERTYPE_DVS | TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES
	; party
	db 19, SNUBBULL, $99, $99, $99, ABILITY_2 | HARDY, FEMALE
		db FAKE_OUT, CHARM_FEATHER_DANCE, BITE, HEADBUTT
	db 21, SCYTHER, $66, $66, $66, ABILITY_1 | HARDY, MALE
		db AGILITY_ROCK_POLISH, FALSE_SWIPE, PURSUIT, FOCUS_ENERGY
	db 22, CHARMELEON, $66, $66, $66, ABILITY_1 | HARDY, MALE
		db EMBER, FIRE_SPIN, DRAGONBREATH, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db -1 ; end

; ================

	; RIVAL (3-6)
	db "<RIVAL>@"
	db TRAINERTYPE_DVS | TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES
	; party
	db 19, SNUBBULL, $99, $99, $99, ABILITY_2 | HARDY, FEMALE
		db FAKE_OUT, CHARM_FEATHER_DANCE, BITE, HEADBUTT
	db 21, SCYTHER, $66, $66, $66, ABILITY_1 | HARDY, MALE
		db AGILITY_ROCK_POLISH, FALSE_SWIPE, PURSUIT, FOCUS_ENERGY
	db 22, IVYSAUR, $66, $66, $66, ABILITY_1 | HARDY, MALE
		db RAZOR_LEAF, LEECH_SEED, SLUDGE, TAKE_DOWN
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
	db  7, NIDORAN_M
	db  7, PIDGEY
	db -1 ; end

; ================

	; YOUNGSTER
	db "TOMMY@"
	db TRAINERTYPE_NORMAL
	; party
	db 21, PIDGEOTTO
	db 22, GASTLY
	db 23, GASTLY
	db -1 ; end

; ================

	; YOUNGSTER ;TRAIN
	db "JIMMY@"
	db TRAINERTYPE_NORMAL
	; party
	db 30, SLOWPOKE
	db 30, POLIWHIRL
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
	db 25, JOLTIK
	db 24, LEDIAN
	db 25, JOLTIK
	db -1 ; end

; ================

	; BUG_CATCHER
	db "TURK@"
	db TRAINERTYPE_NORMAL
	; party
	db 22, WHIRLIPEDE
	db 21, LEDIAN
	db 23, WHIRLIPEDE
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
	db 14, EXEGGCUTE
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

	; TWINS ;TRAIN
	db "TIA & MIA@"
	db TRAINERTYPE_NORMAL
	; party
	db 30, ELEKID
	db 30, MAGBY
	db -1 ; end

; ================

	; TWINS ;TRAIN
	db "MIA & TIA@"
	db TRAINERTYPE_NORMAL
	; party
	db 30, MAGBY
	db 30, ELEKID
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
	db 25, POLIWAG
	db 24, MARILL
	db -1 ; end

; ================

	; FISHER
	db "GERALD@"	;4 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 30, POLIWAG
	db 29, MARILL
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
	db 15, TOTODILE
	db -1 ; end

; ================

	; FISHER
	db "WALTER@"	;3 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 24, CHINCHOU
	db 25, SQUIRTLE
	db 25, TOTODILE
	db -1 ; end

; ================

	; FISHER
	db "WALTER@"	;4 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 29, CHINCHOU
	db 30, SQUIRTLE
	db 30, TOTODILE
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
	db 25, WARTORTLE
	db -1 ; end

; ================

	; FISHER
	db "BORRIS@"	;4 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 31, WARTORTLE
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
	db 24, BUIZEL
	db 25, WOOPER
	db -1 ; end

; ================

	; FISHER
	db "CLINT@"	;4 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 24, BUIZEL
	db 25, WOOPER
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
	db 16, MAGIKARP
	db -1 ; end

; ================

	; FISHER
	db "LESLIE@"
	db TRAINERTYPE_NORMAL
	; party
	db 21, CARVANHA
	db 23, POLIWHIRL
	db 21, CROCONAW
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
	db 27, MURKROW
	db -1 ; end

; ================

	; BIRD_KEEPER
	db "TODD@"
	db TRAINERTYPE_NORMAL
	; party
	db 24, DODUO
	db 25, DODUO
	db 24, MURKROW
	db -1 ; end

; ================

	; BIRD_KEEPER
	db "RANDY@"
	db TRAINERTYPE_NORMAL
	; party
	db 24, PIDGEOTTO
	db 24, TRUMBEAK
	db -1 ; end

; ================

	; BIRD_KEEPER ;TRAIN
	db "JAZZ@"
	db TRAINERTYPE_NORMAL
	; party
	db 29, SWABLU
	db 27, XATU
	db -1 ; end

; ================

	; BIRD_KEEPER
	db "RICKY@"	;3 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 26, PIDGEOTTO
	db 28, DODUO
	db 27, TRUMBEAK
	db -1 ; end

; ================

	; BIRD_KEEPER
	db "RICKY@"	;4 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 26, PIDGEOTTO
	db 28, DODUO
	db 27, TRUMBEAK
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
	db 28, NATU
	db 28, SWABLU
	db -1 ; end

; ================

	; BIRD_KEEPER
	db "VERN@"	;4 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 28, NATU
	db 28, SWABLU
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
	db 27, WINGULL
	db 27, WINGULL
	db 27, TRUMBEAK
	db -1 ; end

; ================

	; BIRD_KEEPER
	db "ROY@"	;4 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 27, WINGULL
	db 27, WINGULL
	db 27, TRUMBEAK
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
	db "CHANCE@"	;3 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 29, PELIPPER
	db -1 ; end

; ================

	; BIRD_KEEPER
	db "CHANCE@"	;4 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 29, PELIPPER
	db -1 ; end

; ================

	; BIRD_KEEPER
	db "CHANCE@"	;5 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; BIRD_KEEPER
	db "CHANCE@"	;6 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; BIRD_KEEPER
	db "CHANCE@"	;7 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; BIRD_KEEPER
	db "CHANCE@"	;8 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; BIRD_KEEPER
	db "CALEB@"	;3 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 27, NATU
	db 27, NATU
	db 27, PIDGEOTTO
	db -1 ; end

; ================

	; BIRD_KEEPER
	db "CALEB@"	;4 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 27, NATU
	db 27, NATU
	db 27, PIDGEOTTO
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
	db 14, GEODUDE
	db 15, GEODUDE
	db 16, ONIX
	db -1 ; end

; ================

	; HIKER
	db "GILL@"
	db TRAINERTYPE_MOVES
	; party
	db 18, NUMEL
		db AMNESIA, FIRE_SPIN, MAGNITUDE, FOCUS_ENERGY
	db 17, CORSOLA
		db TACKLE_SCRATCH_POUND, DEFENSE_CURL_HARDEN_WITHDRAW, WATER_GUN, SOFTBOILED_MILK_DRINK_RECOVER
	db -1 ; end

; ================

	; HIKER
	db "HARVEY@"
	db TRAINERTYPE_NORMAL
	; party
	db 18, ARON
	db 19, NOIBAT
	db 19, ZUBAT
	db -1 ; end

; ================

	; HIKER
	db "TED@"
	db TRAINERTYPE_NORMAL
	; party
	db 19, KOFFING
	db 20, GEODUDE
	db 20, ZUBAT
	db -1 ; end

; ================

	; HIKER
	db "LEROY@"
	db TRAINERTYPE_NORMAL
	; party
	db 18, LARVITAR
	db 20, MAGBY
	db -1 ; end

; ================

	; HIKER
	db "DARRYL@"
	db TRAINERTYPE_NORMAL
	; party
	db 23, PHANPY
	db 21, RATICATE
	db -1 ; end

; ================

	; HIKER
	db "HENRY@"
	db TRAINERTYPE_NORMAL
	; party
	db 28, MACHOKE
	db -1 ; end

; ================
; ================================


GruntMGroup:
; ================================
; ================

	; STARGLOW_GRUNTM_1
	db "GRUNT@";"STARGLOWM1@"
	db TRAINERTYPE_NORMAL
	; party
	db 12, ZUBAT
	db 12, GROWLITHE
	db 12, BUIZEL
	db -1 ; end

; ================

	; STARGLOW_GRUNTM_2
	db "GRUNT@";"STARGLOWM2@"
	db TRAINERTYPE_NORMAL
	; party
	db 13, MAREEP
	db 13, PIDGEY
	db -1 ; end

; ================

	; STARGLOW_GRUNTM_3
	db "GRUNT@";"STARGLOWM3@"
	db TRAINERTYPE_NORMAL
	; party
	db 13, ZUBAT
	db 11, COTTONEE
	db 12, CLEFAIRY
	db -1 ; end

; ================

	; SUNBEAM_GRUNTM_1
	db "GRUNT@";"SUNBEAMM1@"
	db TRAINERTYPE_NORMAL
	; party
	db 19, TRUMBEAK
	db 18, ODDISH
	db -1 ; end

; ================

	; SUNBEAM_GRUNTM_2
	db "GRUNT@";"SUNBEAMM2@"
	db TRAINERTYPE_NORMAL
	; party
	db 20, NOIBAT
	db 19, HORSEA
	db 18, ODDISH
	db -1 ; end

; ================

	; SUNBEAM_GRUNTM_3
	db "GRUNT@";"SUNBEAMM3@"
	db TRAINERTYPE_NORMAL
	; party
	db 18, ZUBAT
	db 19, WINGULL
	db 19, SWABLU
	db -1 ; end

; ================

	; SUNBEAM_GRUNTM_4
	db "GRUNT@";"SUNBEAMM4@"
	db TRAINERTYPE_NORMAL
	; party
	db 18, ELEKID
	db 21, NOIBAT
	db -1 ; end

; ================

	; TRAIN_GRUNTM_1
	db "GRUNT@"
	db TRAINERTYPE_NORMAL
	; party
	db 30, TRUMBEAK
	db 31, PIDGEOTTO
	db -1 ; end

; ================

	; TRAIN_GRUNTM_2
	db "GRUNT@"
	db TRAINERTYPE_NORMAL
	; party
	db 30, GOLBAT
	db 31, ZUBAT
	db -1 ; end

; ================

	; TRAIN_GRUNTM_3
	db "GRUNT@"
	db TRAINERTYPE_NORMAL
	; party
	db 32, NIDORINO
	db 33, NIDORAN_F
	db -1 ; end

; ================

	; TRAIN_GRUNTM_4
	db "GRUNT@"
	db TRAINERTYPE_NORMAL
	; party
	db 28, GLOOM
	db 26, RATICATE
	db 30, WINGULL
	db -1 ; end

; ================

	; TRAIN_GRUNTM_5
	db "GRUNT@"
	db TRAINERTYPE_NORMAL
	; party
	db 32, SHROOMISH
	db 31, PERSIAN
	db -1 ; end

; ================

	; LUSTER_GRUNTM ;PART TIME JOB
	db "GRUNT@"
	db TRAINERTYPE_NORMAL
	; party
	db 28, GRIMER
	db 30, ELECTRODE
	db -1 ; end

; ================
; ================================


GruntFGroup:
; ================================
; ================

	; STARGLOW_GRUNTF_1
	db "GRUNT@";"STARGLOWF1@"
	db TRAINERTYPE_NORMAL
	; party
	db 13, NIDORAN_M
	db 13, COTTONEE
	db 12, PIKACHU
	db -1 ; end

; ================

	; SUNBEAM_GRUNTF_1
	db "GRUNT@";"SUNBEAMF1@"
	db TRAINERTYPE_NORMAL
	; party
	db 18, GLOOM
	db 18, STARYU
	db -1 ; end

; ================

	; SUNBEAM_GRUNTF_2
	db "GRUNT@";"SUNBEAMF2@"
	db TRAINERTYPE_NORMAL
	; party
	db 19, PIKIPEK
	db 19, TRUMBEAK
	db -1 ; end

; ================

	; TRAIN_GRUNTF_1
	db "GRUNT@"
	db TRAINERTYPE_MOVES
	; party
	db 31, KIRLIA
		db PSYCHIC_M, CALM_MIND, WISH, SAFEGUARD
	db 32, DODUO
		db FLAIL, MIRROR_MOVE, AGILITY_ROCK_POLISH, DOUBLE_HIT
	db 33, LEDIAN
		db LIGHT_SCREEN, REFLECT, SIGNAL_BEAM, 0
	db -1 ; end

; ================

	; TRAIN_GRUNTF_2
	db "GRUNT@"
	db TRAINERTYPE_NORMAL
	; party
	db 31, BUNEARY
	db 31, PIKACHU
	db -1 ; end

; ================
; ================================


KageGroup:
; ================================
; ================

	; SUNBEAM_KAGE
	db "KAGE@";"KAGE1@"
	db TRAINERTYPE_DVS
	; party
	db 24, AZUMARILL, $DD, $8D, $D8
	db 24, RATICATE, $DD, $DD, $DD
	db 25, URSARING, $D8, $AD, $DA
	db -1 ; end

; ================
; ================================


LockeGroup:
; ================================
; ================

	; TRAIN_LOCKE
	db "LOCKE@";"LOCKE1@"
	db TRAINERTYPE_NORMAL
	; party
	db 34, BRELOOM
	db 35, NIDORINA
	db 36, MACHOKE
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
	db 16, WINGULL
	db -1 ; end

; ================

	; POKEFANM
	db "SID@"
	db TRAINERTYPE_NORMAL
	; party
	db 20, STANTLER
	
	db -1 ; end

; ================

	; POKEFANM
	db "REG@"
	db TRAINERTYPE_NORMAL
	; party
	db 21, SWABLU
	db 22, SWABLU
	db 23, SWABLU
	db 24, SWABLU
	db -1 ; end

; ================

	; POKEFANM
	db "RICK@"
	db TRAINERTYPE_NORMAL
	; party
	db 22, CHIKORITA
	db 21, BAYLEEF
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
	db 22, RATICATE
	db 23, LITWICK
	db 24, LITWICK
	db -1 ; end

; ================

	; POKEFANF
	db "NICHOLE@"
	db TRAINERTYPE_NORMAL
	; party
	db 23, BULBASAUR
	db 21, IVYSAUR
	db -1 ; end

; ================

	; POKEFANF ;TRAIN
	db "URSALA@"
	db TRAINERTYPE_NORMAL
	; party
	db 27, VAPOREON
	db 29, EXEGGCUTE
	db 23, STARYU
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
	db "CARLOS@"
	db TRAINERTYPE_NORMAL
	; party
	db 24, PIKACHU
	db 24, CUBONE
	db 25, MEOWTH
	db -1 ; end

; ================

	; POKEMANIAC
	db "TRISTEN@"
	db TRAINERTYPE_NORMAL
	; party
	db 26, NOIBAT
	db 24, FLAAFFY
	db 25, MEOWTH
	db -1 ; end

; ================

	; POKEMANIAC
	db "SIMION@"
	db TRAINERTYPE_NORMAL
	; party
	db 26, JIGGLYPUFF
	db 27, ELEKID
	db -1 ; end

; ================

	; POKEMANIAC
	db "THOMAS@"
	db TRAINERTYPE_NORMAL
	; party
	db 25, MEDITITE
	db 26, RALTS
	db 25, KIRLIA
	db -1 ; end

; ================
; ================================


SuperNerdGroup:
; ================================
; ================

	; SUPER_NERD
	db "CHESTER@"
	db TRAINERTYPE_NORMAL
	; party
	db 23, LOPUNNY
	db 23, GRANBULL
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
	db 15, WINGULL
	db 15, MEOWTH
	db 15, PIKACHU
	db -1 ; end

; ================

	; LASS
	db "MARSHA@"
	db TRAINERTYPE_NORMAL
	; party
	db 21, PHANTUMP
	db 23, MEOWTH
	db 22, ZUBAT
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
	db 23, RALTS
	db 21, KIRLIA
	db -1 ; end

; ================

	; BEAUTY
	db "SANDRA@"
	db TRAINERTYPE_NORMAL
	; party
	db 25, TOGETIC
	db 23, WHIMSICOTT
	db 22, LEAFEON
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
	db 19, SLUGMA
	db 20, MAGBY
	db -1 ; end

; ================

	; FIREBREATHER
	db "FRITZ@"
	db TRAINERTYPE_NORMAL
	; party
	db 17, NUMEL
	db 18, SLUGMA
	db 16, LARVITAR
	db -1 ; end

; ================

	; FIREBREATHER
	db "MEL@"
	db TRAINERTYPE_NORMAL
	; party
	db 18, SLUGMA
	db 17, KOFFING
	db 17, NUMEL
	db -1 ; end

; ================

	; FIREBREATHER
	db "DOM@"
	db TRAINERTYPE_NORMAL
	; party
	db 18, PONYTA
	db 20, MAGBY
	db -1 ; end

; ================

	; FIREBREATHER
	db "JOB@"
	db TRAINERTYPE_NORMAL
	; party
	db 25, HOUNDOUR
	db 26, GROWLITHE
	db -1 ; end

; ================

	; FIREBREATHER
	db "WIZ@"
	db TRAINERTYPE_NORMAL
	; party
	db 26, LITWICK
	db 24, CYNDAQUIL
	db 24, QUILAVA
	db -1 ; end

; ================

	; FIREBREATHER
	db "GARTH@"
	db TRAINERTYPE_NORMAL
	; party
	db 26, CHARMANDER
	db 24, CHARMELEON
	db -1 ; end

; ================

	; FIREBREATHER
	db "ART@"
	db TRAINERTYPE_NORMAL
	; party
	db 25, HOUNDOUR
	db 24, KOFFING
	db -1 ; end

; ================

	; FIREBREATHER
	db "TEX@"
	db TRAINERTYPE_NORMAL
	; party
	db 28, FLAREON
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
	db 19, SWABLU
	db 22, RALTS
	db 16, MEDITITE
	db -1 ; end

; ================

	; JUGGLER
	db "WILLY@"
	db TRAINERTYPE_NORMAL
	; party
	db 18, NATU
	db 18, MEDITITE
	db -1 ; end

; ================

	; JUGGLER
	db "QUINN@"
	db TRAINERTYPE_NORMAL
	; party
	db 20, KOFFING
	db 16, MEDITITE
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
	db 17, PIDGEY
	db 16, RATTATA
	db -1 ; end

; ================

	; SCHOOLBOY
	db "TIMMY@"	;3 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 25, PIDGEOTTO
	db 24, RATICATE
	db -1 ; end

; ================

	; SCHOOLBOY
	db "TIMMY@"	;4 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 30, PIDGEOTTO
	db 29, RATICATE
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
	db 17, PIKIPEK
	db 16, RATTATA
	db -1 ; end

; ================

	; SCHOOLBOY
	db "DAMIAN@"	;3 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 25, TRUMBEAK
	db 24, RATICATE
	db -1 ; end

; ================

	; SCHOOLBOY
	db "DAMIAN@"	;4 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 30, TRUMBEAK
	db 29, RATICATE
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
	db 16, GROWLITHE
	db 15, SWABLU
	db -1 ; end

; ================

	; GENTLEMAN ;TRAIN
	db "HOWARD@"
	db TRAINERTYPE_NORMAL
	; party
	db 31, ARCANINE
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

	; LADY ;TRAIN
	db "GRETCHEN@"
	db TRAINERTYPE_NORMAL
	; party
	db 29, CORSOLA
	db 28, HAUNTER
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
	db 25, SWINUB
	db 26, MACHOP
	db 26, SWINUB
	db -1 ; end

; ================

	; BOARDER
	db "FRANK@"
	db TRAINERTYPE_NORMAL
	; party
	db 27, SWINUB
	db 25, JOLTEON
	db -1 ; end

; ================

	; BOARDER
	db "JOSE@"
	db TRAINERTYPE_NORMAL
	; party
	db 27, SNORUNT
	db 28, GLOOM
	db -1 ; end

; ================

	; BOARDER
	db "PETER@"
	db TRAINERTYPE_NORMAL
	; party
	db 28, PONYTA
	db 28, SNEASEL
	db -1 ; end

; ================

	; BOARDER
	db "GLENN@"
	db TRAINERTYPE_NORMAL
	; party
	db 29, XATU
	db -1 ; end

; ================

	; BOARDER
	db "GEORGE@"
	db TRAINERTYPE_NORMAL
	; party
	db 27, WYRDEER
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
	db 26, SNOVER
	db 25, SNOVER
	db -1 ; end

; ================

	; SKIER
	db "RHONDA@"
	db TRAINERTYPE_NORMAL
	; party
	db 27, SNEASEL
	db 28, SNOVER
	db 27, SNEASEL
	db -1 ; end

; ================

	; SKIER
	db "KIM@"
	db TRAINERTYPE_NORMAL
	; party
	db 25, BUNEARY
	db 28, PERSIAN
	db -1 ; end

; ================

	; SKIER
	db "SHERRY@"
	db TRAINERTYPE_NORMAL
	; party
	db 28, GLACEON
	db -1 ; end

; ================

	; SKIER
	db "LEXI@"
	db TRAINERTYPE_NORMAL
	; party
	db 26, LOPUNNY
	db 27, SNORUNT
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
	db "HANK@"
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
	db 21, PONYTA
	db -1 ; end

; ================

	; COOLTRAINERM
	db "SAMMY@"
	db TRAINERTYPE_NORMAL
	; party
	db 22, WIGGLYTUFF
	db -1 ; end

; ================

	; COOLTRAINERM
	db "ANDY@"
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
	db 21, NUMEL
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
	db 22, HERACROSS
	db -1 ; end

; ================

	; COOLTRAINERF
	db "MARY@"
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

	; DISGUISE
	db "MASTER@"
	db TRAINERTYPE_MOVES
	; party
	db 19, VOLTORB
		db TACKLE_SCRATCH_POUND, ROLLOUT, 0, 0
	db 19, MARILL
		db TACKLE_SCRATCH_POUND, ROLLOUT, 0, 0
	db 19, JIGGLYPUFF
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
	db 23, NUMEL
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
	db 23, PHANPY
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
	db 23, GLIGAR
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
	db "HELGA@"
	db TRAINERTYPE_NORMAL
	; party
	db 29, FLAAFFY
	db 28, UMBREON
	db -1 ; end

; ================

	; DELINQUENT_F
	db "MERTLE@"
	db TRAINERTYPE_NORMAL
	; party
	db 29, DWEBBLE
	db 28, ESPEON
	db -1 ; end

; ================

	; DELINQUENT_F
	db "REGINA@"
	db TRAINERTYPE_NORMAL
	; party
	db 29, MACHOKE
	db 28, SYLVEON
	db -1 ; end

; ================
; ================================


BunearymGroup:
; ================================
; ================

	; BUNEARY_M
	db "BOY@"
	db TRAINERTYPE_NORMAL
	; party
	db 31, BUNEARY
	db 30, GRIMER
	db -1 ; end

; ================

	; BUNEARY_M
	db "BOY@"
	db TRAINERTYPE_NORMAL
	; party
	db 32, BUNEARY
	db 32, MEOWTH
	db -1 ; end
	
; ================

	; BUNEARY_M
	db "BOY@"
	db TRAINERTYPE_NORMAL
	; party
	db 30, RATICATE
	db 31, GRIMER
	db 32, BUNEARY
	db -1 ; end
	
; ================

	; BUNEARY_M
	db "BOY@"
	db TRAINERTYPE_NORMAL
	; party
	db 31, BUNEARY
	db 32, CROAGUNK
	db 32, GRIMER
	db -1 ; end
	
; ================

	; BUNEARY_M
	db "BOY@"
	db TRAINERTYPE_NORMAL
	; party
	db 30, LOPUNNY
	db -1 ; end
	
; ================
; ================================


BunearyfGroup:
; ================================
; ================

	; BUNEARY_F
	db "GAL@"
	db TRAINERTYPE_NORMAL
	; party
	db 30, CROAGUNK
	db 31, BUNEARY
	db -1 ; end

; ================

	; BUNEARY_F
	db "GAL@"
	db TRAINERTYPE_NORMAL
	; party
	db 30, GOLBAT
	db 32, BUNEARY
	db 32, CROAGUNK
	db -1 ; end

; ================
; ================================


FrankieGroup:
; ================================
; ================

	; FRANKIE
	db "THE KID@"
	db TRAINERTYPE_MOVES
	; party
	db 36, LOPUNNY
		db FAKE_OUT, DOUBLE_HIT, ATTRACT, CHARM_FEATHER_DANCE
	db 35, CLEFABLE
		db REFLECT, CHARM_FEATHER_DANCE, DAZZLINGLEAM, ICE_PUNCH
	db 36, TOXICROAK
		db TAUNT, TOXIC, FEINT_ATTACK, VENOSHOCK
	db -1 ; end

; ================
; ================================


MallCopGroup:
; ================================
; ================

	; PHIL
	db "PHIL@"
	db TRAINERTYPE_MOVES
	; party
	db 40, LEDYBA
		db TACKLE_SCRATCH_POUND, LIGHT_SCREEN, REFLECT, 0
	db 40, MAGIKARP
		db TACKLE_SCRATCH_POUND, TRANSFORM_SPLASH, 0, 0
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


SpaTrainerGroup:
; ================================
; ================

	; SPA_TRAINER
	db "DENNIS@"	;3 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 27, CHARMELEON
	db 30, NUMEL
	db -1 ; end

; ================

	; SPA_TRAINER
	db "DENNIS@"	;4 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 27, CHARMELEON
	db 30, NUMEL
	db -1 ; end

; ================

	; SPA_TRAINER
	db "DENNIS@"	;5 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; SPA_TRAINER
	db "DENNIS@"	;6 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; SPA_TRAINER
	db "DENNIS@"	;7 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; SPA_TRAINER
	db "DENNIS@"	;8 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; SPA_TRAINER
	db "SHAYMUS@"	;3 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 28, SLUGMA
	db 28, NUMEL
	db -1 ; end

; ================

	; SPA_TRAINER
	db "SHAYMUS@"	;4 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 28, SLUGMA
	db 28, NUMEL
	db -1 ; end

; ================

	; SPA_TRAINER
	db "SHAYMUS@"	;5 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; SPA_TRAINER
	db "SHAYMUS@"	;6 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; SPA_TRAINER
	db "SHAYMUS@"	;7 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; SPA_TRAINER
	db "SHAYMUS@"	;8 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; SPA_TRAINER
	db "CHUCK@"	;3 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 29, NUMEL
	db 28, GROWLITHE
	db 27, MACHOP
	db -1 ; end

; ================

	; SPA_TRAINER
	db "CHUCK@"	;4 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 29, NUMEL
	db 28, GROWLITHE
	db 27, MACHOP
	db -1 ; end

; ================

	; SPA_TRAINER
	db "CHUCK@"	;5 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; SPA_TRAINER
	db "CHUCK@"	;6 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; SPA_TRAINER
	db "CHUCK@"	;7 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; SPA_TRAINER
	db "CHUCK@"	;8 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; SPA_TRAINER
	db "SEYMOUR@"	;3 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 29, MAGBY
	db 27, MEDITITE
	db 28, PONYTA
	db -1 ; end

; ================

	; SPA_TRAINER
	db "SEYMOUR@"	;4 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 29, MAGBY
	db 27, MEDITITE
	db 28, PONYTA
	db -1 ; end

; ================

	; SPA_TRAINER
	db "SEYMOUR@"	;5 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; SPA_TRAINER
	db "SEYMOUR@"	;6 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; SPA_TRAINER
	db "SEYMOUR@"	;7 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; SPA_TRAINER
	db "SEYMOUR@"	;8 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; SPA_TRAINER
	db "MAC@"	;3 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 27, QUILAVA
	db 28, MAROWAK
	db -1 ; end

; ================

	; SPA_TRAINER
	db "MAC@"	;4 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 27, QUILAVA
	db 28, MAROWAK
	db -1 ; end

; ================

	; SPA_TRAINER
	db "MAC@"	;5 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; SPA_TRAINER
	db "MAC@"	;6 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; SPA_TRAINER
	db "MAC@"	;7 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; SPA_TRAINER
	db "MAC@"	;8 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================
; ================================


SpaTrainerFGroup:
; ================================
; ================

	; SPA_TRAINER_F
	db "LAURA@"	;3 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 29, HOUNDOUR
	db 30, BUIZEL
	db 30, MAGBY
	db -1 ; end

; ================

	; SPA_TRAINER_F
	db "LAURA@"	;4 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 29, HOUNDOUR
	db 30, BUIZEL
	db 30, MAGBY
	db -1 ; end

; ================

	; SPA_TRAINER_F
	db "LAURA@"	;5 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; SPA_TRAINER_F
	db "LAURA@"	;6 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; SPA_TRAINER_F
	db "LAURA@"	;7 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; SPA_TRAINER_F
	db "LAURA@"	;8 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; SPA_TRAINER_F
	db "BETTY@"	;3 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 29, NUMEL
	db 29, SLUGMA
	db 30, BUIZEL
	db -1 ; end

; ================

	; SPA_TRAINER_F
	db "BETTY@"	;4 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 29, NUMEL
	db 29, PONYTA
	db 30, BUIZEL
	db -1 ; end

; ================

	; SPA_TRAINER_F
	db "BETTY@"	;5 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; SPA_TRAINER_F
	db "BETTY@"	;6 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; SPA_TRAINER_F
	db "BETTY@"	;7 BADGES
	db TRAINERTYPE_NORMAL
	; party
	db 1, BULBASAUR
	db -1 ; end

; ================

	; SPA_TRAINER_F
	db "BETTY@"	;8 BADGES
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
