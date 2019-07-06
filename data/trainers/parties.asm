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


StanleyGroup:
; ================================
; ================

	; STANLEY
	db "STANLEY@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_EVS | TRAINERTYPE_MOVES
	; party
	db 11, PIDGEY, NO_ITEM, 16
		db TACKLE, GUST, MUD_SLAP, ROOST
	db 11, HOOTHOOT, NO_ITEM, 16
		db TACKLE, HYPNOSIS, CONFUSION, ROOST
	db 13, PIDGEOTTO, LUM_BERRY, 16
		db GUST, MUD_SLAP, QUICK_ATTACK, ROOST
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
	db 14, BUTTERFREE, NO_ITEM, 32, ABILITY_1 | QUIRKY, MALE
		db TACKLE, POISONPOWDER, SLEEP_POWDER, CONFUSION
	db 14, BEEDRILL, NO_ITEM, 32, ABILITY_1 | QUIRKY, MALE
		db POISON_STING, STRING_SHOT, DEFENSE_CURL, FURY_STRIKES
	db 14, YANMA, NO_ITEM, 32, ABILITY_1 | QUIRKY, FEMALE
		db FORESIGHT, QUICK_ATTACK, DOUBLE_TEAM, SONIC_BOOM
	db 17, SCYTHER, SITRUS_BERRY, 32, ABILITY_1 | QUIRKY, FEMALE
		db QUICK_ATTACK, LEER, PURSUIT, U_TURN
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
	db 19, CLEFAIRY, NO_ITEM, 48, ABILITY_1 | QUIRKY, FEMALE
		db METRONOME, DISARM_VOICE, DOUBLE_SLAP, ATTRACT
	db 20, TEDDIURSA, NO_ITEM, 48, ABILITY_1 | QUIRKY, FEMALE
		db SCRATCH, ATTRACT, LICK, FEINT_ATTACK
	db 19, MUNCHLAX, NO_ITEM, 48, ABILITY_1 | QUIRKY, FEMALE
		db ATTRACT, METRONOME, DEFENSE_CURL, ROLLOUT
	db 21, MILTANK, LUM_BERRY, 48, ABILITY_2 | QUIRKY, FEMALE ; Scrappy
		db DEFENSE_CURL, STOMP, MILK_DRINK, ROLLOUT
	db -1 ; end

; ================
; ================================


MortyGroup:
; ================================
; ================

	; MORTY
	db "Morty@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_EVS | TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES
	; party
	db 24, HAUNTER, NO_ITEM, 64, ABILITY_2 | QUIRKY, MALE ; Levitate
		db HYPNOSIS, ICE_PUNCH, NIGHT_SHADE, SHADOW_CLAW
if DEF(FAITHFUL)
	db 24, HAUNTER, NO_ITEM, 64, ABILITY_2 | QUIRKY, MALE ; Levitate
		db HYPNOSIS, CONFUSE_RAY, DISABLE, SHADOW_BALL
else
	db 24, NOCTOWL, NO_ITEM, 64, ABILITY_1 | QUIRKY, MALE
		db HYPNOSIS, FORESIGHT, CONFUSION, HEX
endc
	db 25, MISDREAVUS, NO_ITEM, 64, ABILITY_1 | QUIRKY, MALE
		db DISARM_VOICE, DARK_PULSE, NASTY_PLOT, SHADOW_BALL
	db 26, GENGAR, WIDE_LENS, 64, ABILITY_2 | QUIRKY, MALE ; Levitate
		db HYPNOSIS, THUNDERBOLT, SHADOW_BALL, DREAM_EATER
	db -1 ; end

; ================

	; MORTY
	db "Morty@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES
	; party
	db 72, GENGAR, LEFTOVERS, ABILITY_2 | QUIRKY, MALE ; Levitate
		db WILL_O_WISP, SHADOW_BALL, FOCUS_BLAST, SUBSTITUTE
	db 70, NINETALES, CHARCOAL, ABILITY_1 | QUIRKY, MALE
		db NASTY_PLOT, SHADOW_BALL, FLAMETHROWER, WILL_O_WISP
	db 71, MAROWAK, THICK_CLUB, ABILITY_1 | QUIRKY, MALE
		db BONEMERANG, STONE_EDGE, ICE_PUNCH, SHADOW_CLAW
	db 73, MISMAGIUS, PINK_BOW, ABILITY_1 | QUIRKY, MALE
		db DAZZLINGLEAM, SHADOW_BALL, NASTY_PLOT, THUNDERBOLT
if DEF(FAITHFUL)
	db 74, HAUNTER, EVIOLITE, ABILITY_2 | QUIRKY, MALE ; Levitate
		db SHADOW_BALL, SLUDGE_BOMB, DESTINY_BOND, PAIN_SPLIT
else
	db 74, NOCTOWL, SHARP_BEAK, ABILITY_1 | QUIRKY, MALE
		db MOONBLAST, AIR_SLASH, SHADOW_BALL, REFLECT
endc
	db 75, GENGAR, SPELL_TAG, ABILITY_2 | QUIRKY, MALE ; Levitate
		db NASTY_PLOT, SHADOW_BALL, THUNDERBOLT, DESTINY_BOND
	db -1 ; end

; ================
; ================================


ChuckGroup:
; ================================
; ================

	; CHUCK
	db "Chuck@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_EVS | TRAINERTYPE_MOVES
	; party
	db 30, PRIMEAPE, NO_ITEM, 80
		db KARATE_CHOP, SEISMIC_TOSS, SCREECH, DYNAMICPUNCH
if DEF(FAITHFUL)
	db 29, MACHOKE, NO_ITEM, 80
		db KARATE_CHOP, BULLET_PUNCH, BULK_UP, DYNAMICPUNCH
else
	db 29, FARFETCH_D, NO_ITEM, 80
		db NIGHT_SLASH, AERIAL_ACE, SWORDS_DANCE, HI_JUMP_KICK
endc
	db 28, HITMONTOP, NO_ITEM, 80
		db BULK_UP, SUCKER_PUNCH, DOUBLE_KICK, RAPID_SPIN
	db 31, POLIWRATH, ZOOM_LENS, 80
		db ICE_PUNCH, HYPNOSIS, WATERFALL, DYNAMICPUNCH
	db -1 ; end

; ================

	; CHUCK
	db "Chuck@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_MOVES
	; party
	db 73, MACHAMP, FOCUS_BAND
		db STONE_EDGE, CROSS_CHOP, ICE_PUNCH, BULLET_PUNCH
	db 71, PRIMEAPE, DRAGON_FANG
		db EARTHQUAKE, STONE_EDGE, OUTRAGE, CROSS_CHOP
	db 72, HITMONCHAN, NEVERMELTICE
		db THUNDERPUNCH, ICE_PUNCH, FIRE_PUNCH, MACH_PUNCH
	db 72, HITMONLEE, QUICK_CLAW
		db SUCKER_PUNCH, BULK_UP, REVERSAL, HI_JUMP_KICK
	db 72, HITMONTOP, KINGS_ROCK
		db RAPID_SPIN, TOXIC, CLOSE_COMBAT, SUCKER_PUNCH
	db 75, POLIWRATH, LEFTOVERS
		db WATERFALL, BULK_UP, ICE_PUNCH, CROSS_CHOP
	db -1 ; end

; ================
; ================================


JasmineGroup:
; ================================
; ================

	; JASMINE
	db "Jasmine@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_EVS | TRAINERTYPE_MOVES
	; party
	db 34, SKARMORY, NO_ITEM, 96
		db MUD_SLAP, DRILL_PECK, SPIKES, STEEL_WING
	db 33, MAGNETON, NO_ITEM, 96
		db SUPERSONIC, THUNDER_WAVE, THUNDERBOLT, TRI_ATTACK
	db 34, FORRETRESS, NO_ITEM, 96
		db SPIKES, GYRO_BALL, DEFENSE_CURL, ROLLOUT
	db 33, SCIZOR, NO_ITEM, 96
		db PURSUIT, AERIAL_ACE, METAL_CLAW, SLASH
	db 37, STEELIX, LEFTOVERS, 96
		db BODY_SLAM, SCREECH, ROCK_SLIDE, IRON_TAIL
	db -1 ; end

; ================

	; JASMINE
	db "Jasmine@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_DVS | TRAINERTYPE_MOVES
	; party
	db 74, SKARMORY, LEFTOVERS, $EE, $EE, $EE
		db SPIKES, SCREECH, DRILL_PECK, STEEL_WING
	db 72, MAGNEZONE, MIRACLE_SEED, DVS_HP_GRASS
		db THUNDERBOLT, HIDDEN_POWER, FLASH_CANNON, EXPLOSION ; HP Grass
	db 73, FORRETRESS, SOFT_SAND, $EE, $EE, $EE
		db EARTHQUAKE, GYRO_BALL, EXPLOSION, SPIKES
if DEF(FAITHFUL)
	db 72, MAGNEZONE, CHARCOAL, DVS_HP_FIRE
		db THUNDERBOLT, HIDDEN_POWER, FLASH_CANNON, EXPLOSION ; HP Fire
else
	db 72, RHYPERIOR, SILVERPOWDER, $EE, $EE, $EE
		db EARTHQUAKE, STONE_EDGE, MEGAHORN, IRON_HEAD
endc
	db 73, SCIZOR, METAL_COAT, $EE, $EE, $EE
		db SWORDS_DANCE, BULLET_PUNCH, PURSUIT, IRON_HEAD
	db 75, STEELIX, LEFTOVERS, $EE, $EE, $EE
		db EARTHQUAKE, ROCK_SLIDE, CRUNCH, IRON_HEAD
	db -1 ; end

; ================
; ================================


PryceGroup:
; ================================
; ================

	; PRYCE
	db "Pryce@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_EVS | TRAINERTYPE_MOVES
	; party
	db 39, DEWGONG, CHESTO_BERRY, 112
		db WATERFALL, REST, RAIN_DANCE, AURORA_BEAM
	db 38, SNEASEL, NO_ITEM, 112
		db SWORDS_DANCE, ICICLE_CRASH, SCREECH, SLASH
	db 38, CLOYSTER, NO_ITEM, 112
		db DEFENSE_CURL, SUPERSONIC, WATER_PULSE, ICE_SHARD
	db 40, LAPRAS, NO_ITEM, 112
		db SING, CONFUSE_RAY, ANCIENTPOWER, ICE_BEAM
	db 42, MAMOSWINE, SITRUS_BERRY, 112
		db MAGNITUDE, ANCIENTPOWER, AVALANCHE, FURY_STRIKES
	db -1 ; end

; ================

	; PRYCE
	db "Pryce@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_DVS | TRAINERTYPE_MOVES
	; party
	db 73, DEWGONG, FOCUS_BAND, FAKE_PERFECT_DVS
		db PROTECT, TOXIC, SURF, ICE_BEAM
	db 73, CLOYSTER, KINGS_ROCK, FAKE_PERFECT_DVS
		db SPIKES, SURF, EXPLOSION, ICICLE_CRASH
	db 72, WEAVILE, KINGS_ROCK, FAKE_PERFECT_DVS
		db SWORDS_DANCE, ICICLE_CRASH, SLASH, CRUNCH
	db 71, GLACEON, NEVERMELTICE, DVS_HP_GROUND
		db ICE_BEAM, HIDDEN_POWER, BARRIER, BATON_PASS ; HP Ground
	db 73, LAPRAS, LEFTOVERS, FAKE_PERFECT_DVS
		db SING, TOXIC, ICE_BEAM, THUNDERBOLT
	db 75, MAMOSWINE, HARD_STONE, FAKE_PERFECT_DVS
		db EARTHQUAKE, AVALANCHE, STONE_EDGE, ANCIENTPOWER
	db -1 ; end

; ================
; ================================


ClairGroup:
; ================================
; ================

	; CLAIR
	db "Clair@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_EVS | TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES
	; party
	db 43, GYARADOS, NO_ITEM, 128, ABILITY_1 | QUIRKY, FEMALE
		db CRUNCH, THRASH, DRAGON_PULSE, AQUA_TAIL
	db 45, YANMEGA, NO_ITEM, 128, ABILITY_1 | QUIRKY, FEMALE
if DEF(FAITHFUL)
		db DOUBLE_TEAM, SUPERSONIC, ANCIENTPOWER, AIR_SLASH
else
		db DOUBLE_TEAM, SUPERSONIC, ANCIENTPOWER, DRAGON_PULSE
endc
if DEF(FAITHFUL)
	db 44, DRAGONAIR, NO_ITEM, 128, ABILITY_1 | QUIRKY, FEMALE
		db THUNDER_WAVE, AQUA_TAIL, FLAMETHROWER, DRAGON_PULSE
else
	db 44, AMPHAROS, NO_ITEM, 128, ABILITY_1 | QUIRKY, FEMALE
		db THUNDER_WAVE, CONFUSE_RAY, THUNDERBOLT, DRAGON_PULSE
endc
	db 44, DRAGONAIR, NO_ITEM, 128, ABILITY_1 | QUIRKY, FEMALE
		db THUNDER_WAVE, THUNDERBOLT, ICE_BEAM, DRAGON_PULSE
	db 47, KINGDRA, SHELL_BELL, 128, ABILITY_2 | QUIRKY, FEMALE ; Sniper
		db SMOKESCREEN, HYPER_BEAM, DRAGON_PULSE, SURF
	db -1 ; end

; ================

	; CLAIR
	db "Clair@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES
	; party
	db 72, GYARADOS, LUM_BERRY, ABILITY_1 | QUIRKY, FEMALE
		db DRAGON_DANCE, WATERFALL, FLY, EARTHQUAKE
	db 74, YANMEGA, BRIGHTPOWDER, ABILITY_1 | QUIRKY, FEMALE
if DEF(FAITHFUL)
		db DOUBLE_TEAM, BUG_BUZZ, AIR_SLASH, ANCIENTPOWER
else
		db DOUBLE_TEAM, BUG_BUZZ, AIR_SLASH, DRAGON_PULSE
endc
	db 73, DRAGONITE, LEFTOVERS, ABILITY_1 | QUIRKY, FEMALE
		db OUTRAGE, EXTREMESPEED, FIRE_PUNCH, EARTHQUAKE
if DEF(FAITHFUL)
	db 73, DRAGONITE, DRAGON_FANG, ABILITY_1 | QUIRKY, FEMALE
		db DRAGON_DANCE, DRAGON_CLAW, WATERFALL, GIGA_IMPACT
else
	db 73, AMPHAROS, DRAGON_FANG, ABILITY_1 | QUIRKY, FEMALE
		db THUNDER_WAVE, CONFUSE_RAY, THUNDERBOLT, DRAGON_PULSE
endc
	db 74, DRAGONAIR, EVIOLITE, ABILITY_1 | QUIRKY, FEMALE
		db DRAGON_DANCE, EXTREMESPEED, OUTRAGE, AQUA_TAIL
	db 75, KINGDRA, CHESTO_BERRY, ABILITY_2 | QUIRKY, FEMALE ; Sniper
		db DRAGON_DANCE, WATERFALL, OUTRAGE, REST
	db -1 ; end

; ================
; ================================


WillGroup:
; ================================
; ================

	; WILL
	db "Will@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_EVS | TRAINERTYPE_MOVES
	; party
	db 48, XATU, TWISTEDSPOON, 180
		db QUICK_ATTACK, CONFUSE_RAY, RECOVER, PSYCHIC_M
	db 49, JYNX, BRIGHTPOWDER, 180
		db NASTY_PLOT, DRAIN_KISS, ICE_BEAM, PSYCHIC_M
	db 50, EXEGGUTOR, MIRACLE_SEED, 180
		db REFLECT, LEECH_SEED, SEED_BOMB, PSYCHIC_M
	db 50, ALAKAZAM, LUM_BERRY, 180
		db CALM_MIND, RECOVER, LIGHT_SCREEN, PSYCHIC_M
	db 49, SLOWBRO, SITRUS_BERRY, 180
		db SURF, CALM_MIND, BODY_SLAM, PSYCHIC_M
	db 51, XATU, LEFTOVERS, 180
		db QUICK_ATTACK, CONFUSE_RAY, PSYCHIC_M, FUTURE_SIGHT
	db -1 ; end

; ================

	; WILL
	db "Will@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_DVS | TRAINERTYPE_MOVES
	; party
	db 67, XATU, TWISTEDSPOON, FAKE_PERFECT_DVS
		db AIR_SLASH, FUTURE_SIGHT, CONFUSE_RAY, PSYCHIC_M
	db 68, JYNX, BRIGHTPOWDER, FAKE_PERFECT_DVS
		db NASTY_PLOT, DRAIN_KISS, ICE_BEAM, PSYCHIC_M
	db 68, EXEGGUTOR, MIRACLE_SEED, FAKE_PERFECT_DVS
		db REFLECT, GIGA_DRAIN, SLEEP_POWDER, PSYCHIC_M
	db 69, ALAKAZAM, LUM_BERRY, DVS_HP_FIGHTING
		db HIDDEN_POWER, RECOVER, SHADOW_BALL, PSYCHIC_M ; HP Fighting
	db 69, SLOWBRO, WISE_GLASSES, FAKE_PERFECT_DVS
		db SURF, PSYCHIC_M, THUNDER_WAVE, REST
	db 70, XATU, LEFTOVERS, FAKE_PERFECT_DVS
		db QUICK_ATTACK, FUTURE_SIGHT, CONFUSE_RAY, PSYCHIC_M
	db -1 ; end

; ================
; ================================


KogaGroup:
; ================================
; ================

	; KOGA
	db "Koga@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_EVS | TRAINERTYPE_MOVES
	; party
	db 50, ARIADOS, SITRUS_BERRY, 200
		db DOUBLE_TEAM, GLARE, BATON_PASS, GIGA_DRAIN
	db 50, VENOMOTH, SILVERPOWDER, 200
		db SUPERSONIC, BUG_BUZZ, PSYCHIC_M, TOXIC
	db 52, FORRETRESS, SILK_SCARF, 200
		db PROTECT, EXPLOSION, SPIKES, IRON_HEAD
	db 51, MUK, BRIGHTPOWDER, 200
		db MINIMIZE, SCREECH, SLUDGE_BOMB, TOXIC
	db 51, WEEZING, POISON_BARB, 200
		db WILL_O_WISP, TOXIC, SLUDGE_BOMB, EXPLOSION
	db 53, CROBAT, LEFTOVERS, 200
		db DOUBLE_TEAM, POISON_JAB, SUPER_FANG, TOXIC
	db -1 ; end

; ================

	; KOGA
	db "Koga@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES
	; party
	db 69, TENTACRUEL, WISE_GLASSES, ABILITY_1 | QUIRKY, MALE
		db POWER_WHIP, ICE_BEAM, SURF, SLUDGE_BOMB
	db 71, FORRETRESS, SILK_SCARF, ABILITY_1 | QUIRKY, MALE
		db PROTECT, TOXIC, EXPLOSION, SPIKES
	db 69, ARBOK, SOFT_SAND, ABILITY_1 | QUIRKY, MALE | ARBOK_KOGA_FORM
		db SLUDGE_BOMB, GLARE, EARTHQUAKE, SCREECH
	db 70, MUK, BRIGHTPOWDER, ABILITY_1 | QUIRKY, MALE
		db MINIMIZE, FIRE_BLAST, GUNK_SHOT, TOXIC
	db 71, WEEZING, MAGNET, ABILITY_1 | QUIRKY, MALE
		db WILL_O_WISP, THUNDER, SLUDGE_BOMB, EXPLOSION
	db 72, CROBAT, LEFTOVERS, ABILITY_1 | QUIRKY, MALE
		db SCREECH, TOXIC, CRUNCH, AERIAL_ACE
	db -1 ; end

; ================
; ================================


BrunoGroup:
; ================================
; ================

	; BRUNO
	db "Bruno@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_EVS |  TRAINERTYPE_MOVES
	; party
	db 51, HITMONTOP, QUICK_CLAW, 220
		db PURSUIT, CLOSE_COMBAT, DIG, PROTECT
	db 53, HERACROSS, SILVERPOWDER, 220
		db SWORDS_DANCE, EARTHQUAKE, MEGAHORN, CLOSE_COMBAT
	db 51, HITMONLEE, FOCUS_BAND, 220
		db SUCKER_PUNCH, DOUBLE_KICK, HI_JUMP_KICK, FORESIGHT
	db 51, HITMONCHAN, NEVERMELTICE, 220
		db THUNDERPUNCH, ICE_PUNCH, POISON_JAB, MACH_PUNCH
	db 53, ONIX, HARD_STONE, 220
		db BODY_SLAM, EARTHQUAKE, CRUNCH, ROCK_SLIDE
	db 55, MACHAMP, LEFTOVERS, 220
		db ROCK_SLIDE, FORESIGHT, CROSS_CHOP, SWORDS_DANCE
	db -1 ; end

; ================

	; BRUNO
	db "Bruno@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_MOVES
	; party
	db 70, HITMONTOP, QUICK_CLAW
		db BULK_UP, SUCKER_PUNCH, COUNTER, HI_JUMP_KICK
	db 71, HERACROSS, SILVERPOWDER
		db SWORDS_DANCE, EARTHQUAKE, MEGAHORN, CLOSE_COMBAT
	db 70, HITMONLEE, FOCUS_BAND
		db BULK_UP, SUCKER_PUNCH, HI_JUMP_KICK, REVERSAL
	db 70, HITMONCHAN, NEVERMELTICE
		db THUNDERPUNCH, ICE_PUNCH, POISON_JAB, MACH_PUNCH
	db 72, STEELIX, LEFTOVERS
		db CURSE, EARTHQUAKE, STONE_EDGE, IRON_HEAD
	db 74, MACHAMP, MUSCLE_BAND
		db BULK_UP, STONE_EDGE, BODY_SLAM, CROSS_CHOP
	db -1 ; end

; ================
; ================================


KarenGroup:
; ================================
; ================

	; KAREN
	db "Karen@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_EVS | TRAINERTYPE_MOVES
	; party
	db 53, UMBREON, LEFTOVERS, 240
		db MUD_SLAP, CONFUSE_RAY, FEINT_ATTACK, MEAN_LOOK
	db 53, PERSIAN, PINK_BOW, 240
		db NIGHT_SLASH, FEINT_ATTACK, SCREECH, PLAY_ROUGH
	db 54, WEAVILE, KINGS_ROCK, 240
		db SWORDS_DANCE, SCREECH, NIGHT_SLASH, ICE_PUNCH
	db 55, GENGAR, SPELL_TAG, 240
		db SHADOW_BALL, WILL_O_WISP, CURSE, DESTINY_BOND
	db 55, HONCHKROW, BLACKGLASSES, 240
		db DRILL_PECK, SUCKER_PUNCH, PURSUIT, BRAVE_BIRD
	db 57, HOUNDOOM, CHARCOAL, 240
		db ROAR, PURSUIT, FLAMETHROWER, DARK_PULSE
	db -1 ; end

; ================

	; KAREN
	db "Karen@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_MOVES
	; party
	db 71, UMBREON, LEFTOVERS
		db CHARM, HEALINGLIGHT, PURSUIT, TOXIC
	db 72, WEAVILE, KINGS_ROCK
		db SWORDS_DANCE, SCREECH, SLASH, ICE_PUNCH
	db 74, GENGAR, MAGNET
		db HYPNOSIS, THUNDER, SHADOW_BALL, DESTINY_BOND
	db 73, HONCHKROW, BLACKGLASSES
		db DRILL_PECK, SUCKER_PUNCH, NIGHT_SLASH, BRAVE_BIRD
	db 74, TYRANITAR, SOFT_SAND
		db EARTHQUAKE, CRUNCH, STONE_EDGE, PURSUIT
	db 76, HOUNDOOM, WISE_GLASSES
		db ROAR, NASTY_PLOT, FIRE_BLAST, DARK_PULSE
	db -1 ; end

; ================
; ================================


ChampionGroup:
; ================================
; ================

	; CHAMPION
	db "Lance@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES
	; party
	db 57, GYARADOS, MUSCLE_BAND, ABILITY_1 | JOLLY, MALE
		db DRAGON_DANCE, FLY, WATERFALL, EARTHQUAKE
	db 58, DRAGONITE, WIDE_LENS, HIDDEN_ABILITY | MODEST, MALE
		db FIRE_BLAST, BLIZZARD, THUNDER, HYPER_BEAM
	db 58, KINGDRA, SCOPE_LENS, ABILITY_2 | MODEST, MALE
		db FOCUS_ENERGY, DRAGON_PULSE, SURF, HYPER_BEAM
	db 57, AERODACTYL, KINGS_ROCK, HIDDEN_ABILITY | ADAMANT, MALE
		db AERIAL_ACE, ANCIENTPOWER, ROCK_SLIDE, GIGA_IMPACT
	db 57, CHARIZARD, WISE_GLASSES, ABILITY_2 | MODEST, MALE
if DEF(FAITHFUL)
		db FLAMETHROWER, HYPER_BEAM, FOCUS_BLAST, AIR_SLASH
else
		db FLAMETHROWER, HYPER_BEAM, FOCUS_BLAST, DRAGON_PULSE
endc
	db 60, DRAGONITE, LEFTOVERS, SHINY_MASK | HIDDEN_ABILITY | ADAMANT, MALE
		db SUBSTITUTE, DRAGON_DANCE, FLY, EXTREMESPEED
	db -1 ; end

; ================

	; CHAMPION
	db "Lance@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES
	; party
	db 75, GYARADOS, FIGY_BERRY, ABILITY_1 | JOLLY, MALE
		db RAIN_DANCE, SUBSTITUTE, WATERFALL, EARTHQUAKE
	db 77, DRAGONITE, LEFTOVERS, HIDDEN_ABILITY | MODEST, MALE
		db THUNDER_WAVE, BLIZZARD, THUNDER, HURRICANE
	db 77, KINGDRA, CHOICE_SPECS, ABILITY_1 | MODEST, MALE
		db HYDRO_PUMP, SCALD, ICE_BEAM, DRAGON_PULSE
	db 76, AERODACTYL, CHOICE_BAND, HIDDEN_ABILITY | ADAMANT, MALE
		db STONE_EDGE, EARTHQUAKE, IRON_HEAD, CRUNCH
	db 75, CHARIZARD, LIFE_ORB, ABILITY_2 | MODEST, MALE
		db FIRE_BLAST, AIR_SLASH, FOCUS_BLAST, DRAGON_PULSE
	db 80, DRAGONITE, WEAK_POLICY, SHINY_MASK | HIDDEN_ABILITY | ADAMANT, MALE
		db DRAGON_DANCE, EXTREMESPEED, OUTRAGE, IRON_HEAD
	db -1 ; end

; ================
; ================================


RivalGroup:
; ================================
; ================

	; RIVAL
	db "<RIVAL>@"
	db TRAINERTYPE_ITEM
	; party
	db 4, RATTATA, NO_ITEM
	db 5, CHIKORITA, ORAN_BERRY
	db -1 ; end

; ================

	; RIVAL
	db "<RIVAL>@"
	db TRAINERTYPE_ITEM
	; party
	db 4, RATTATA, NO_ITEM
	db 5, CYNDAQUIL, ORAN_BERRY
	db -1 ; end

; ================

	; RIVAL
	db "<RIVAL>@"
	db TRAINERTYPE_ITEM
	; party
	db 4, RATTATA, NO_ITEM
	db 5, TOTODILE, ORAN_BERRY
	db -1 ; end

; ================
; ================================


YoungsterGroup:
; ================================
; ================

	; YOUNGSTER
	db "Joey@"
	db TRAINERTYPE_DVS | TRAINERTYPE_PERSONALITY
	; party
	db 5, RATTATA, FAKE_PERFECT_DVS, ABILITY_2 | ADAMANT, MALE
	db -1 ; end

; ================
; ================================


BugCatcherGroup:
; ================================
; ================

	; BUG_CATCHER
	db "Wade@"
	db TRAINERTYPE_NORMAL
	; party
	db 2, CATERPIE
	db 2, CATERPIE
	db 3, WEEDLE
	db 2, CATERPIE
	db -1 ; end

; ================
; ================================


CamperGroup:
; ================================
; ================

	; CAMPER
	db "Todd@"
	db TRAINERTYPE_NORMAL
	; party
	db 14, PSYDUCK
	db -1 ; end

; ================
; ================================


PicnickerGroup:
; ================================
; ================

	; PICNICKER
	db "Liz@"
	db TRAINERTYPE_NORMAL
	; party
	db 9, NIDORAN_F
	db -1 ; end

; ================
; ================================


TwinsGroup:
; ================================
; ================

	; TWINS
	db "Amy & Mimi@"
	db TRAINERTYPE_NORMAL
	; party
	db 10, SPINARAK
	db 10, LEDYBA
	db -1 ; end

; ================
; ================================


FisherGroup:
; ================================
; ================

	; FISHER
	db "Ralph@"
	db TRAINERTYPE_NORMAL
	; party
	db 10, CHINCHOU
	db -1 ; end

; ================
; ================================


BirdKeeperGroup:
; ================================
; ================

	; BIRD_KEEPER
	db "Vance@"
	db TRAINERTYPE_NORMAL
	; party
	db 36, PIDGEOTTO
	db 36, PIDGEOTTO
	db -1 ; end

; ================
; ================================


HikerGroup:
; ================================
; ================

	; HIKER
	db "Anthony@"
	db TRAINERTYPE_NORMAL
	; party
	db 11, GEODUDE
	db 11, MACHOP
	db -1 ; end

; ================
; ================================


GruntMGroup:
; ================================
; ================

	; GRUNTM
	db "Grunt@"
	db TRAINERTYPE_NORMAL
	; party
	db 7, RATTATA
	db 9, ZUBAT
	db 9, GASTLY
	db -1 ; end

; ================
; ================================


GruntFGroup:
; ================================
; ================

	; GRUNTF
	db "Grunt@"
	db TRAINERTYPE_NORMAL
	; party
	db 9, ZUBAT
	db 11, EKANS
	db -1 ; end

; ================
; ================================


PokefanMGroup:
; ================================
; ================

	; POKEFANM
	db "Derek@"
	db TRAINERTYPE_ITEM
	; party
	db 18, PIKACHU, ORAN_BERRY
	db -1 ; end

; ================
; ================================


PokefanFGroup:
; ================================
; ================

	; POKEFANF
	db "Beverly@"
	db TRAINERTYPE_ITEM
	; party
	db 16, SNUBBULL, ORAN_BERRY
	db -1 ; end

; ================
; ================================


OfficerMGroup:
; ================================
; ================

	; OFFICERM
	db "Keith@"
	db TRAINERTYPE_NORMAL
	; party
	db 15, GROWLITHE
	db 15, GROWLITHE
	db -1 ; end

; ================
; ================================


OfficerFGroup:
; ================================
; ================

	; OFFICERF
	db "JENNY@"
	db TRAINERTYPE_NORMAL
	; party
	db 54, GROWLITHE
	db 58, ARCANINE
	db 57, BLASTOISE
	db -1 ; end

; ================
; ================================


NurseGroup:
; ================================
; ================

	; NURSE
	db "JOY@"
	db TRAINERTYPE_NORMAL
	; party
	db 50, CHANSEY
	db -1 ; end

; ================
; ================================


PokemaniacGroup:
; ================================
; ================

	; POKEMANIAC
	db "Brent@"
	db TRAINERTYPE_NORMAL
	; party
	db 32, MAROWAK
	db -1 ; end

; ================
; ================================


SuperNerdGroup:
; ================================
; ================

	; SUPER_NERD
	db "Stan@"
	db TRAINERTYPE_NORMAL
	; party
	db 20, GRIMER
	db -1 ; end

; ================
; ================================


LassGroup:
; ================================
; ================

	; LASS
	db "Dana@"
	db TRAINERTYPE_MOVES
	; party
	db 19, FLAAFFY
		db TACKLE, GROWL, THUNDERSHOCK, THUNDER_WAVE
	db 19, PSYDUCK
		db SCRATCH, LEER, DISABLE, CONFUSION
	db -1 ; end

; ================
; ================================


BeautyGroup:
; ================================
; ================

	; BEAUTY
	db "Victoria@"
	db TRAINERTYPE_NORMAL
	; party
	db 9, SENTRET
	db 13, SENTRET
	db 17, SENTRET
	db -1 ; end

; ================
; ================================


FirebreatherGroup:
; ================================
; ================

	; FIREBREATHER
	db "Otis@"
	db TRAINERTYPE_NORMAL
	; party
	db 59, MAGMAR
	db 58, WEEZING
	db 61, MAGMAR
	db -1 ; end

; ================
; ================================


JugglerGroup:
; ================================
; ================

	; JUGGLER
	db "Irwin@"
	db TRAINERTYPE_NORMAL
	; party
	db 2, VOLTORB
	db 6, VOLTORB
	db 10, VOLTORB
	db 14, VOLTORB
	db -1 ; end

; ================
; ================================


SchoolboyGroup:
; ================================
; ================

	; SCHOOLBOY
	db "Jack@"
	db TRAINERTYPE_NORMAL
	; party
	db 12, ODDISH
	db 15, VOLTORB
	db -1 ; end

; ================
; ================================


SchoolgirlGroup:
; ================================
; ================

	; SCHOOLGIRL
	db "Molly@"
	db TRAINERTYPE_NICKNAME
	; party
	db 6, TEDDIURSA, "Teddy@"
	db 6, PHANPY, "Phanpy@"
	db -1 ; end

; ================
; ================================


PsychicGroup:
; ================================
; ================

	; PSYCHIC_T
	db "Nathan@"
	db TRAINERTYPE_NORMAL
	; party
	db 26, GIRAFARIG
	db -1 ; end

; ================
; ================================


HexManiacGroup:
; ================================
; ================

	; HEX_MANIAC
	db "Tamara@"
	db TRAINERTYPE_NORMAL
	; party
	db 16, GASTLY
	db 18, MISDREAVUS
	db -1 ; end

; ================
; ================================


CoupleGroup:
; ================================
; ================

	; COUPLE
	db "Gail & Eli@"
	db TRAINERTYPE_PERSONALITY
	; party
	db 13, SANDSHREW, ABILITY_1 | QUIRKY, MALE
	db 15, MARILL, ABILITY_1 | QUIRKY, MALE
	db 15, PIKACHU, ABILITY_1 | QUIRKY, FEMALE
	db 13, POLIWAG, ABILITY_1 | QUIRKY, FEMALE
	db -1 ; end

; ================
; ================================


GentlemanGroup:
; ================================
; ================

	; GENTLEMAN
	db "Preston@"
	db TRAINERTYPE_NORMAL
	; party
	db 18, GROWLITHE
	db 18, SKARMORY
	db -1 ; end

; ================
; ================================


RichBoyGroup:
; ================================
; ================

	; RICH_BOY
	db "Winston@"
	db TRAINERTYPE_NORMAL
	; party
	db 46, PIDGEOT
	db 44, FURRET
	db 45, AMPHAROS
	db -1 ; end

; ================
; ================================


LadyGroup:
; ================================
; ================

	; LADY
	db "Jessica@"
	db TRAINERTYPE_ITEM
	; party
	db 55, BLISSEY, NUGGET
	db 54, FURRET, NUGGET
	db -1 ; end

; ================
; ================================


SailorGroup:
; ================================
; ================

	; SAILOR
	db "Huey@"
	db TRAINERTYPE_NORMAL
	; party
	db 18, POLIWAG
	db 20, POLIWHIRL
	db -1 ; end

; ================
; ================================


SwimmerMGroup:
; ================================
; ================

	; SWIMMERM
	db "Harold@"
	db TRAINERTYPE_NORMAL
	; party
	db 60, REMORAID
	db 58, SEADRA
	db -1 ; end

; ================
; ================================


SwimmerFGroup:
; ================================
; ================

	; SWIMMERF
	db "Elaine@"
	db TRAINERTYPE_NORMAL
	; party
	db 21, STARYU
	db -1 ; end

; ================
; ================================


BurglarGroup:
; ================================
; ================

	; BURGLAR
	db "Duncan@"
	db TRAINERTYPE_NORMAL
	; party
	db 34, KOFFING
	db 35, MAGMAR
	db 34, WEEZING
	db -1 ; end

; ================
; ================================


ScientistGroup:
; ================================
; ================

	; SCIENTIST
	db "Lowell@"
	db TRAINERTYPE_NORMAL
	; party
	db 60, ARCANINE
	db -1 ; end

; ================
; ================================


BoarderGroup:
; ================================
; ================

	; BOARDER
	db "Ronald@"
	db TRAINERTYPE_NORMAL
	; party
	db 33, SEEL
	db 35, DEWGONG
	db 33, SNEASEL
	db -1 ; end

; ================
; ================================


SkierGroup:
; ================================
; ================

	; SKIER
	db "Roxanne@"
	db TRAINERTYPE_NORMAL
	; party
	db 36, JYNX
	db -1 ; end

; ================
; ================================


BlackbeltGroup:
; ================================
; ================

	; BLACKBELT_T
	db "Kenji@"
	db TRAINERTYPE_NORMAL
	; party
	db 39, MACHOKE
	db -1 ; end

; ================
; ================================


BattleGirlGroup:
; ================================
; ================

	; BATTLE_GIRL
	db "Subaru@"
	db TRAINERTYPE_NORMAL
	; party
	db 26, MACHOP
	db 27, MACHOKE
	db 28, PRIMEAPE
	db -1 ; end

; ================
; ================================


TeacherGroup:
; ================================
; ================

	; TEACHER
	db "Colette@"
	db TRAINERTYPE_NORMAL
	; party
	db 60, CLEFAIRY
	db -1 ; end

; ================
; ================================



GuitaristMGroup:
; ================================
; ================

	; GUITARISTM
	db "Clyde@"
	db TRAINERTYPE_NORMAL
	; party
	db 50, ELECTABUZZ
	db -1 ; end

; ================
; ================================


GuitaristFGroup:
; ================================
; ================

	; GUITARISTF
	db "Janet@"
	db TRAINERTYPE_MOVES
	; party
	db 56, PIKACHU
		db IRON_TAIL, EXTREMESPEED, SURF, THUNDERBOLT
	db 54, ELECTABUZZ
		db LIGHT_SCREEN, THUNDERPUNCH, CROSS_CHOP, SCREECH
	db 55, RAICHU
		db EXTREMESPEED, SURF, THUNDERBOLT, AGILITY
	db -1 ; end

; ================
; ================================


BikerGroup:
; ================================
; ================

	; BIKER
	db "Dwayne@"
	db TRAINERTYPE_NORMAL
	; party
	db 54, KOFFING
	db 55, WEEZING
	db 56, KOFFING
	db 57, WEEZING
	db -1 ; end

; ================
; ================================


CueballGroup:
; ================================
; ================

	; CUE_BALL
	db "Brian@"
	db TRAINERTYPE_NORMAL
	; party
	db 55, TENTACRUEL
	db 55, WEEZING
	db 55, WEEZING
	db -1 ; end

; ================
; ================================


CooltrainerMGroup:
; ================================
; ================

	; COOLTRAINERM
	db "Gaven@"
	db TRAINERTYPE_MOVES
	; party
	db 39, VICTREEBEL
		db WRAP, TOXIC, ACID, RAZOR_LEAF
	db 39, KINGLER
		db BUBBLE_BEAM, STOMP, DIG, PROTECT
	db 39, FLAREON
		db MUD_SLAP, QUICK_ATTACK, BITE, FIRE_SPIN
	db -1 ; end

; ================
; ================================


SECTION "Enemy Trainer Parties 2", ROMX


CooltrainerFGroup:
; ================================
; ================

	; COOLTRAINERF
	db "Beth@"
	db TRAINERTYPE_MOVES
	; party
	db 40, RAPIDASH
		db STOMP, FIRE_SPIN, PLAY_ROUGH, AGILITY
	db 39, FLAAFFY
		db SWIFT, THUNDERSHOCK, THUNDER_WAVE, LIGHT_SCREEN
	db -1 ; end

; ================
; ================================


ProfSpruceGroup:
; ================================
; ================

	; PROF_SPRUCE
	db "SPRUCE@"
	db TRAINERTYPE_ITEM | TRAINERTYPE_MOVES
	; party
	db 58, SKARMORY, METAL_COAT
		db STEEL_WING, SPIKES, AIR_SLASH, NIGHT_SLASH
	db 59, TYPHLOSION, CHARCOAL
		db SUNNY_DAY, THUNDERPUNCH, FLAMETHROWER, SUBSTITUTE
	db 59, MEGANIUM, MIRACLE_SEED
		db GIGA_DRAIN, PROTECT, LEECH_SEED, TOXIC
	db 59, FERALIGATR, MYSTIC_WATER
		db SURF, CRUNCH, ICE_PUNCH, ROCK_SLIDE
	db 57, DONPHAN, SOFT_SAND
		db EARTHQUAKE, DEFENSE_CURL, ROLLOUT, GIGA_IMPACT
	db 57, URSARING, SILK_SCARF
		db PLAY_ROUGH, SLASH, CRUNCH, GUNK_SHOT
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


DisguiseManGroup:
; ================================
; ================

	; DISGUISEMAN
	db "MASTER@"
	db TRAINERTYPE_NORMAL
	; party
	db 12, VOLTORB
	db 12, MARILL
	db 13, JIGGLYPUFF
	db -1 ; end

; ================
; ================================


BikiniPGroup:
; ================================
; ================
; ================
; ================================


BikiniRGroup:
; ================================
; ================
; ================
; ================================


BikiniYGroup:
; ================================
; ================
; ================
; ================================


DelinquentmGroup:
; ================================
; ================
; ================
; ================================


DelinquentfGroup:
; ================================
; ================
; ================
; ================================


SafariGroup:
; ================================
; ================
; ================
; ================================


TowerTycoonGroup:
; ================================
; ================
; ================
; ================================
