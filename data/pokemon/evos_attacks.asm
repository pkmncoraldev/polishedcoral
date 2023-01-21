INCLUDE "constants.asm"


SECTION "Evolutions and Attacks", ROMX


INCLUDE "data/pokemon/evolution_moves.asm"

INCLUDE "data/pokemon/evos_attacks_pointers.asm"

EvosAttacks::
;	db
BulbasaurEvosAttacks:
	db EVOLVE_LEVEL, 16, IVYSAUR
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 4, GROWL
	db 8, LEECH_SEED
	db 11, VINE_WHIP
	db 14, POISONPOWDER
	db 14, SLEEP_POWDER
	db 17, TAKE_DOWN
	db 21, RAZOR_LEAF
	db 24, WORK_UP_GROWTH
	db 28, DOUBLE_EDGE
	db 33, TOXIC
	db 37, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db 38, SOLAR_BEAM
	db  0 ; no more level-up moves

IvysaurEvosAttacks:
	db EVOLVE_LEVEL, 32, VENUSAUR
	db 0 ; no more evolutions
	db 1, SLUDGE
	db 1, TACKLE_SCRATCH_POUND
	db 1, GROWL
	db 1, LEECH_SEED
	db 1, VINE_WHIP
	db 1, POISONPOWDER
	db 1, SLEEP_POWDER
	db 18, TAKE_DOWN
	db 23, RAZOR_LEAF
	db 27, WORK_UP_GROWTH
	db 32, DOUBLE_EDGE
	db 36, TOXIC
	db 41, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db 45, SOLAR_BEAM
	db  0 ; no more level-up moves

VenusaurEvosAttacks:
	db  0 ; no more evolutions
	db 1, PETAL_DANCE
	db 1, SLUDGE
	db 1, TACKLE_SCRATCH_POUND
	db 1, GROWL
	db 1, LEECH_SEED
	db 1, VINE_WHIP
	db 1, POISONPOWDER
	db 1, SLEEP_POWDER
	db 1, TAKE_DOWN
	db 1, RAZOR_LEAF
	db 1, WORK_UP_GROWTH
	db 1, DOUBLE_EDGE
	db 39, TOXIC
	db 46, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db 53, SOLAR_BEAM
	db  0 ; no more level-up moves

CharmanderEvosAttacks:
	db EVOLVE_LEVEL, 16, CHARMELEON
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, GROWL
	db 7, EMBER
	db 10, SAND_ATTACK_SMOKESCREEN
	db 16, METAL_CLAW
	db 19, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 25, FLAME_BURST
	db 28, FIRE_FANG
	db 27, SLASH
	db 32, FLAMETHROWER
	db 35, FIRE_SPIN
	db 40, FIRE_BLAST
	db 0 ; no more level-up moves

CharmeleonEvosAttacks:
	db EVOLVE_LEVEL, 36, CHARIZARD
	db 0 ; no more evolutions
	db 1, DRAGONBREATH
	db 1, FIRE_FANG
	db 1, TACKLE_SCRATCH_POUND
	db 1, GROWL
	db 1, EMBER
	db 1, SAND_ATTACK_SMOKESCREEN
	db 1, METAL_CLAW
	db 21, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 28, FLAME_BURST
	db 32, DRAGON_RAGE
	db 39, SLASH
	db 43, FLAMETHROWER
	db 50, FIRE_SPIN
	db 54, FIRE_BLAST
	db 0 ; no more level-up moves

CharizardEvosAttacks:
	db 0 ; no more evolutions
	db 1, AIR_SLASH
	db 1, DRAGONBREATH
	db 1, FIRE_FANG
	db 1, TACKLE_SCRATCH_POUND
	db 1, GROWL
	db 1, EMBER
	db 1, SAND_ATTACK_SMOKESCREEN
	db 1, METAL_CLAW
	db 1, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 1, FLAME_BURST
	db 1, DRAGON_RAGE
	db 41, SLASH
	db 47, FLAMETHROWER
	db 56, FIRE_SPIN
	db 62, FIRE_BLAST
	db 0 ; no more level-up moves

SquirtleEvosAttacks:
	db EVOLVE_LEVEL, 16, WARTORTLE
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 4, LEER_TAIL_WHIP
	db 7, WATER_GUN
	db 10, DEFENSE_CURL_HARDEN_WITHDRAW
	db 13, RAPID_SPIN
	db 16, BITE
	db 19, BUBBLE_BEAM
	db 22, PROTECT
	db 25, AQUA_TAIL
	db 28, SHELL_SMASH
	db 31, DOUBLE_EDGE
	db 34, BARRIER_IRON_DEFENSE_ACID_ARMOR
	db 37, RAIN_DANCE
	db 40, HYDRO_PUMP
	db 0 ; no more level-up moves

WartortleEvosAttacks:
	db EVOLVE_LEVEL, 36, BLASTOISE
	db 0 ; no more evolutions
	db 1, ICY_WIND
	db 1, TACKLE_SCRATCH_POUND
	db 1, LEER_TAIL_WHIP
	db 1, WATER_GUN
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 1, RAPID_SPIN
	db 1, BITE
	db 21, BUBBLE_BEAM
	db 25, PROTECT
	db 29, AQUA_TAIL
	db 33, SHELL_SMASH
	db 37, DOUBLE_EDGE
	db 41, BARRIER_IRON_DEFENSE_ACID_ARMOR
	db 45, RAIN_DANCE
	db 49, HYDRO_PUMP
	db 0 ; no more level-up moves

BlastoiseEvosAttacks:
	db 0 ; no more evolutions
	db 1, FLASH_CANNON
	db 1, ICY_WIND
	db 1, TACKLE_SCRATCH_POUND
	db 1, LEER_TAIL_WHIP
	db 1, WATER_GUN
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 1, RAPID_SPIN
	db 1, BITE
	db 1, BUBBLE_BEAM
	db 1, PROTECT
	db 1, AQUA_TAIL
	db 1, SHELL_SMASH
	db 40, DOUBLE_EDGE
	db 47, BARRIER_IRON_DEFENSE_ACID_ARMOR
	db 54, RAIN_DANCE
	db 60, HYDRO_PUMP
	db 0 ; no more level-up moves

PidgeyEvosAttacks:
	db EVOLVE_LEVEL, 18, PIDGEOTTO
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 4, SAND_ATTACK_SMOKESCREEN
	db 8, GUST
	db 12, QUICK_ATTACK
	db 15, ROAR_WHIRLWIND
	db 19, TWISTER
	db 23, CHARM_FEATHER_DANCE
	db 26, WING_ATTACK
	db 30, AGILITY_ROCK_POLISH
	db 34, ROOST
	db 37, MIRROR_MOVE
	db 41, AIR_SLASH
	db 45, BRAVE_BIRD
	db 0 ; no more level-up moves

PidgeottoEvosAttacks:
	db EVOLVE_LEVEL, 36, PIDGEOT
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, SAND_ATTACK_SMOKESCREEN
	db 1, GUST
	db 1, QUICK_ATTACK
	db 1, ROAR_WHIRLWIND
	db 20, TWISTER
	db 25, CHARM_FEATHER_DANCE
	db 29, WING_ATTACK
	db 34, AGILITY_ROCK_POLISH
	db 39, ROOST
	db 43, MIRROR_MOVE
	db 48, AIR_SLASH
	db 53, BRAVE_BIRD
	db 0 ; no more level-up moves

PidgeotEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, SAND_ATTACK_SMOKESCREEN
	db 1, GUST
	db 1, QUICK_ATTACK
	db 1, ROAR_WHIRLWIND
	db 1, TWISTER
	db 1, CHARM_FEATHER_DANCE
	db 1, WING_ATTACK
	db 1, AGILITY_ROCK_POLISH
	db 40, ROOST
	db 45, MIRROR_MOVE
	db 50, AIR_SLASH
	db 56, BRAVE_BIRD
	db 0 ; no more level-up moves

RattataEvosAttacks:
	db EVOLVE_LEVEL, 20, RATICATE
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, LEER_TAIL_WHIP
	db 4, QUICK_ATTACK
	db 7, FOCUS_ENERGY
	db 10, BITE
	db 13, PURSUIT
	db 16, TAKE_DOWN
	db 19, WORK_UP_GROWTH
	db 22, CRUNCH
	db 25, SUCKER_PUNCH
	db 28, SCREECH
	db 31, DOUBLE_EDGE
	db 34, REVERSAL
	db 0 ; no more level-up moves

RaticateEvosAttacks:
	db  0 ; no more evolutions
	db 1, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 1, TACKLE_SCRATCH_POUND
	db 1, LEER_TAIL_WHIP
	db 1, QUICK_ATTACK
	db 1, FOCUS_ENERGY
	db 1, BITE
	db 1, PURSUIT
	db 1, TAKE_DOWN
	db 1, WORK_UP_GROWTH
	db 24, CRUNCH
	db 29, SUCKER_PUNCH
	db 34, SCREECH
	db 39, DOUBLE_EDGE
	db 44, REVERSAL
	db 0 ; no more level-up moves

PikachuEvosAttacks:
	db EVOLVE_ITEM, THUNDERSTONE, RAICHU
	db EVOLVE_ITEM, BIG_MALASADA, RAICHU_A
	db 0 ; no more evolutions
	db 1, THUNDERSHOCK
	db 1, GROWL
	db 5, LEER_TAIL_WHIP
	db 9, QUICK_ATTACK
	db 13, ELECTRO_BALL
	db 18, THUNDER_WAVE
	db 22, DOUBLE_TEAM
	db 26, SPARK
	db 30, AGILITY_ROCK_POLISH
	db 35, IRON_TAIL
	db 39, THUNDERBOLT
	db 43, WILD_CHARGE
	db 47, LIGHT_SCREEN
	db 53, THUNDER
	db 0 ; no more level-up moves

RaichuEvosAttacks:
	db 0 ; no more evolutions
	db 1, THUNDERPUNCH
	db 1, THUNDERSHOCK
	db 1, GROWL
	db 1, LEER_TAIL_WHIP
	db 1, QUICK_ATTACK
	db 1, ELECTRO_BALL
	db 1, THUNDER_WAVE
	db 1, DOUBLE_TEAM
	db 1, SPARK
	db 1, AGILITY_ROCK_POLISH
	db 1, IRON_TAIL
	db 1, THUNDERBOLT
	db 1, WILD_CHARGE
	db 1, LIGHT_SCREEN
	db 1, THUNDER
	db 0 ; no more level-up moves

SandshrewEvosAttacks:
	db EVOLVE_LEVEL, 22, SANDSLASH
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

SandslashEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

NidoranFEvosAttacks:
	db EVOLVE_LEVEL, 16, NIDORINA
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, POISON_STING
	db 7, TACKLE_SCRATCH_POUND
	db 9, LEER_TAIL_WHIP
	db 13, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 19, DOUBLE_KICK
	db 21, BITE
	db 25, TOXIC_SPIKES
	db 31, POISON_FANG
	db 33, SWAGGER
	db 37, EARTH_POWER
	db 43, CRUNCH
	db 0 ; no more level-up moves

NidorinaEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, NIDOQUEEN
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, POISON_STING
	db 1, TACKLE_SCRATCH_POUND
	db 1, LEER_TAIL_WHIP
	db 1, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 20, DOUBLE_KICK
	db 23, BITE
	db 28, TOXIC_SPIKES
	db 35, POISON_FANG
	db 38, SWAGGER
	db 43, EARTH_POWER
	db 50, CRUNCH
	db 0 ; no more level-up moves

NidoqueenEvosAttacks:
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, POISON_STING
	db 1, TACKLE_SCRATCH_POUND
	db 1, LEER_TAIL_WHIP
	db 1, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 1, DOUBLE_KICK
	db 1, BITE
	db 1, TOXIC_SPIKES
	db 1, POISON_FANG
	db 1, SWAGGER
	db 1, CRUNCH
	db 35, BODY_SLAM
	db 43, EARTH_POWER
	db 50, SUPERPOWER
	db 0 ; no more level-up moves

NidoranMEvosAttacks:
	db EVOLVE_LEVEL, 16, NIDORINO
	db 0 ; no more evolutions
	db 1, LEER_TAIL_WHIP
	db 1, POISON_STING
	db 7, PECK
	db 9, FOCUS_ENERGY
	db 13, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 19, DOUBLE_KICK
	db 21, HORN_ATTACK
	db 25, TOXIC_SPIKES
	db 31, POISON_JAB
	db 33, SWAGGER
	db 37, EARTH_POWER
	db 43, MEGAHORN
	db 0 ; no more level-up moves

NidorinoEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, NIDOKING
	db 0 ; no more evolutions
	db 1, LEER_TAIL_WHIP
	db 1, POISON_STING
	db 1, PECK
	db 1, FOCUS_ENERGY
	db 1, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 20, DOUBLE_KICK
	db 23, HORN_ATTACK
	db 28, TOXIC_SPIKES
	db 35, POISON_JAB
	db 38, SWAGGER
	db 43, EARTH_POWER
	db 50, MEGAHORN
	db 0 ; no more level-up moves

NidokingEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEER_TAIL_WHIP
	db 1, POISON_STING
	db 1, PECK
	db 1, FOCUS_ENERGY
	db 1, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 1, DOUBLE_KICK
	db 1, HORN_ATTACK
	db 1, TOXIC_SPIKES
	db 1, POISON_JAB
	db 1, SWAGGER
	db 35, THRASH
	db 43, EARTH_POWER
	db 50, OUTRAGE
	db 0 ; no more level-up moves

ClefairyEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, CLEFABLE
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, GROWL
	db 1, ENCORE
	db 6, FAIRY_WIND
	db 9, SING_HYPNOSIS
	db 14, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 17, DEFENSE_CURL_HARDEN_WITHDRAW
	db 22, BODY_SLAM
	db 25, MINIMIZE
	db 31, METRONOME
	db 34, COSMIC_POWER
	db 39, CHARM_FEATHER_DANCE
	db 42, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db 47, MOONBLAST
	db 0 ; no more level-up moves

ClefableEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, GROWL
	db 1, ENCORE
	db 1, FAIRY_WIND
	db 1, SING_HYPNOSIS
	db 1, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 1, BODY_SLAM
	db 1, MINIMIZE
	db 1, METRONOME
	db 1, COSMIC_POWER
	db 1, CHARM_FEATHER_DANCE
	db 1, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db 1, MOONBLAST
	db 0 ; no more level-up moves

JigglypuffEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, WIGGLYTUFF
	db 0 ; no more evolutions
	db 1, SING_HYPNOSIS
	db 1, TACKLE_SCRATCH_POUND
	db 5, DEFENSE_CURL_HARDEN_WITHDRAW
	db 9, FAIRY_WIND
	db 13, DISABLE
	db 17, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 21, ROLLOUT
	db 25, SWEET_KISS
	db 29, REST
	db 33, BODY_SLAM
	db 37, GYRO_BALL
	db 41, MIMIC
	db 45, HYPER_VOICE
	db 49, DOUBLE_EDGE
	db 0 ; no more level-up moves

WigglytuffEvosAttacks:
	db  0 ; no more evolutions
	db 1, PLAY_ROUGH
	db 1, SING_HYPNOSIS
	db 1, TACKLE_SCRATCH_POUND
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 1, FAIRY_WIND
	db 1, DISABLE
	db 1, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 1, ROLLOUT
	db 1, SWEET_KISS
	db 1, REST
	db 1, BODY_SLAM
	db 1, GYRO_BALL
	db 1, MIMIC
	db 1, HYPER_VOICE
	db 1, DOUBLE_EDGE
	db 0 ; no more level-up moves

ZubatEvosAttacks:
	db EVOLVE_LEVEL, 22, GOLBAT
	db 0 ; no more evolutions
	db 1, ABSORB
	db 5, SUPERSONIC
	db 7, SWIFT
	db 11, BITE
	db 13, WING_ATTACK
	db 17, CONFUSE_RAY
	db 19, SCREECH
	db 23, ACROBATICS
	db 25, POISON_FANG
	db 29, MEAN_LOOK_BLOCK_SPIDER_WEB
	db 31, LEECH_LIFE
	db 35, HAZE
	db 37, VENOSHOCK
	db 41, AIR_SLASH
	db 0 ; no more level-up moves

GolbatEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, CROBAT
	db 0 ; no more evolutions
	db 1, CRUNCH
	db 1, ABSORB
	db 1, SUPERSONIC
	db 1, SWIFT
	db 1, BITE
	db 1, WING_ATTACK
	db 1, CONFUSE_RAY
	db 1, SCREECH
	db 24, ACROBATICS
	db 27, POISON_FANG
	db 32, MEAN_LOOK_BLOCK_SPIDER_WEB
	db 35, LEECH_LIFE
	db 40, HAZE
	db 43, VENOSHOCK
	db 48, AIR_SLASH
	db 0 ; no more level-up moves

OddishEvosAttacks:
	db EVOLVE_LEVEL, 21, GLOOM
	db 0 ; no more evolutions
	db 1, ABSORB
	db 5, WORK_UP_GROWTH
	db 9, ACID
	db 13, POISONPOWDER
	db 14, STUN_SPORE
	db 15, SLEEP_POWDER
	db 19, MEGA_DRAIN
	db 23, SAFEGUARD
	db 27, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db 31, GIGA_DRAIN
	db 35, TOXIC
	db 39, HEAL_BELL
	db 43, MOONBLAST
	db 47, PETAL_DANCE
	db 0 ; no more level-up moves

GloomEvosAttacks:
	db EVOLVE_ITEM, LEAF_STONE, VILEPLUME
	db EVOLVE_ITEM, SUN_STONE, BELLOSSOM
	db  0 ; no more evolutions
	db 1, ABSORB
	db 1, WORK_UP_GROWTH
	db 1, ACID
	db 1, POISONPOWDER
	db 1, STUN_SPORE
	db 1, SLEEP_POWDER
	db 1, MEGA_DRAIN
	db 24, SAFEGUARD
	db 29, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db 34, GIGA_DRAIN
	db 39, TOXIC
	db 44, HEAL_BELL
	db 49, MOONBLAST
	db 54, PETAL_DANCE
	db 0 ; no more level-up moves

VileplumeEvosAttacks:
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, ACID
	db 1, SLEEP_POWDER
	db 1, SAFEGUARD
	db 1, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db 1, GIGA_DRAIN
	db 1, TOXIC
	db 1, HEAL_BELL
	db 1, MOONBLAST
	db 1, MEGA_DRAIN
	db 1, POISONPOWDER
	db 1, STUN_SPORE
	db 1, WORK_UP_GROWTH
	db 54, PETAL_DANCE
	db 59, SOLAR_BEAM
	db 0 ; no more level-up moves

MeowthEvosAttacks:
	db EVOLVE_LEVEL, 28, PERSIAN
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, GROWL
	db 6, BITE
	db 10, FAKE_OUT
	db 15, PAY_DAY
	db 17, SCREECH
	db 22, FEINT_ATTACK
	db 25, TAUNT
	db 30, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 33, SLASH
	db 38, NASTY_PLOT
	db 41, SWAGGER
	db 46, NIGHT_SLASH
	db 50, PLAY_ROUGH
	db 0 ; no more level-up moves

PersianEvosAttacks:
	db 0 ; no more evolutions
	db 1, POWER_GEM
	db 1, TACKLE_SCRATCH_POUND
	db 1, GROWL
	db 1, BITE
	db 1, FAKE_OUT
	db 1, PAY_DAY
	db 1, SCREECH
	db 1, FEINT_ATTACK
	db 1, TAUNT
	db 32, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 37, SLASH
	db 44, NASTY_PLOT
	db 49, SWAGGER
	db 56, NIGHT_SLASH
	db 61, PLAY_ROUGH
	db 0 ; no more level-up moves

GrowlitheEvosAttacks:
	db EVOLVE_ITEM, FIRE_STONE, ARCANINE
	db 0 ; no more evolutions
	db 1, EMBER
	db 1, LEER_TAIL_WHIP
	db 6, SHARPEN_HOWL_MEDITATE
	db 9, BITE
	db 14, FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	db 17, FLAME_CHARGE
	db 22, REVERSAL
	db 25, FIRE_FANG
	db 30, TAKE_DOWN
	db 33, FLAME_BURST
	db 38, AGILITY_ROCK_POLISH
	db 41, FLAMETHROWER
	db 46, CRUNCH
	db 49, OUTRAGE
	db 54, PLAY_ROUGH
	db 57, FLARE_BLITZ
	db 0 ; no more level-up moves

ArcanineEvosAttacks:
	db 0 ; no more evolutions
	db 1, EXTREMESPEED
	db 1, THUNDER_FANG
	db 1, EMBER
	db 1, LEER_TAIL_WHIP
	db 1, SHARPEN_HOWL_MEDITATE
	db 1, BITE
	db 1, FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	db 1, FLAME_CHARGE
	db 1, REVERSAL
	db 1, FIRE_FANG
	db 1, TAKE_DOWN
	db 1, FLAME_BURST
	db 1, AGILITY_ROCK_POLISH
	db 1, FLAMETHROWER
	db 1, CRUNCH
	db 1, OUTRAGE
	db 1, PLAY_ROUGH
	db 1, FLARE_BLITZ
	db 0 ; no more level-up moves

PoliwagEvosAttacks:
	db EVOLVE_LEVEL, 25, POLIWHIRL
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 5, SING_HYPNOSIS
	db 8, TACKLE_SCRATCH_POUND
	db 11, MUD_SLAP
	db 15, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 18, RAIN_DANCE
	db 21, BUBBLE_BEAM
	db 25, BODY_SLAM
	db 28, BELLY_DRUM
	db 42, LOW_KICK
	db 48, EARTH_POWER
	db 54, HYDRO_PUMP
	db 0 ; no more level-up moves

PoliwhirlEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, POLIWRATH
	db EVOLVE_TRADE, KINGS_ROCK, POLITOED
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, SING_HYPNOSIS
	db 1, TACKLE_SCRATCH_POUND
	db 1, MUD_SLAP
	db 1, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 1, RAIN_DANCE
	db 1, BUBBLE_BEAM
	db 1, BODY_SLAM
	db 32, BELLY_DRUM
	db 37, LOW_KICK
	db 43, EARTH_POWER
	db 48, HYDRO_PUMP
	db 0 ; no more level-up moves

PoliwrathEvosAttacks:
	db 0 ; no more evolutions
	db 1, EARTH_POWER
	db 1, HYDRO_PUMP
	db 1, DYNAMICPUNCH
	db 1, WATER_GUN
	db 1, SING_HYPNOSIS
	db 1, TACKLE_SCRATCH_POUND
	db 1, MUD_SLAP
	db 1, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 1, RAIN_DANCE
	db 1, BUBBLE_BEAM
	db 1, BODY_SLAM
	db 1, BELLY_DRUM
	db 37, LOW_KICK
	db 43, LOCK_ON_MIND_READER
	db 48, BRICK_BREAK
	db 0 ; no more level-up moves

AbraEvosAttacks:
	db EVOLVE_LEVEL, 16, KADABRA
	db 0 ; no more evolutions
	db 1, TELEPORT
	db 0 ; no more level-up moves

KadabraEvosAttacks:
	db EVOLVE_TRADE, -1, ALAKAZAM
	db 0 ; no more evolutions
	db 1, SAND_ATTACK_SMOKESCREEN
	db 1, TELEPORT
	db 1, CONFUSION
	db 16, CONFUSION
	db 18, DISABLE
	db 22, FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	db 24, PSYBEAM
	db 28, REFLECT
	db 30, SOFTBOILED_MILK_DRINK_RECOVER
	db 34, PSYSHOCK
	db 36, SUBSTITUTE
	db 40, PSYCHIC_M
	db 42, FUTURE_SIGHT
	db 0 ; no more level-up moves

AlakazamEvosAttacks:
	db 0 ; no more evolutions
	db 1, SAND_ATTACK_SMOKESCREEN
	db 1, TELEPORT
	db 1, CONFUSION
	db 16, CONFUSION
	db 18, DISABLE
	db 22, FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	db 24, PSYBEAM
	db 26, REFLECT
	db 31, SOFTBOILED_MILK_DRINK_RECOVER
	db 31, DISABLE
	db 38, PSYCHIC_M
	db 43, FUTURE_SIGHT
	db 0 ; no more level-up moves

MachopEvosAttacks:
	db EVOLVE_LEVEL, 28, MACHOKE
	db 0 ; no more evolutions
	db 1, LOW_KICK
	db 1, LEER_TAIL_WHIP
	db 3, FOCUS_ENERGY
	db 7, ROCK_SMASH
	db 9, FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	db 13, HEADBUTT
	db 15, SEISMIC_TOSS
	db 19, REVERSAL
	db 21, KNOCK_OFF
	db 25, STRENGTH
	db 27, BRICK_BREAK
	db 31, MACH_PUNCH
	db 33, BULK_UP
	db 37, CROSS_CHOP
	db 39, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 43, DYNAMICPUNCH
	db 0 ; no more level-up moves

MachokeEvosAttacks:
	db EVOLVE_TRADE, -1, MACHAMP
	db 0 ; no more evolutions
	db 1, LOW_KICK
	db 1, LEER_TAIL_WHIP
	db 1, FOCUS_ENERGY
	db 1, ROCK_SMASH
	db 1, FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	db 1, HEADBUTT
	db 1, SEISMIC_TOSS
	db 1, REVERSAL
	db 1, KNOCK_OFF
	db 1, STRENGTH
	db 1, BRICK_BREAK
	db 33, MACH_PUNCH
	db 37, BULK_UP
	db 43, CROSS_CHOP
	db 47, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 53, DYNAMICPUNCH
	db 0 ; no more level-up moves

MachampEvosAttacks:
	db 0 ; no more evolutions
	db 1, LOW_KICK
	db 1, LEER_TAIL_WHIP
	db 1, FOCUS_ENERGY
	db 1, ROCK_SMASH
	db 1, FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	db 1, HEADBUTT
	db 1, SEISMIC_TOSS
	db 1, REVERSAL
	db 1, KNOCK_OFF
	db 1, STRENGTH
	db 1, BRICK_BREAK
	db 33, MACH_PUNCH
	db 37, BULK_UP
	db 43, CROSS_CHOP
	db 47, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 53, DYNAMICPUNCH
	db 0 ; no more level-up moves

GeodudeEvosAttacks:
	db EVOLVE_LEVEL, 25, GRAVELER
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 6, AGILITY_ROCK_POLISH
	db 10, ROCK_THROW
	db 12, MAGNITUDE
	db 16, ROLLOUT
	db 18, TAKE_DOWN
	db 22, BULLDOZE
	db 24, SELFDESTRUCT
	db 28, ROCK_BLAST
	db 30, EARTHQUAKE
	db 34, EXPLOSION
	db 36, DOUBLE_EDGE
	db 40, STONE_EDGE
	db 0 ; no more level-up moves

GravelerEvosAttacks:
	db EVOLVE_TRADE, -1, GOLEM
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 1, AGILITY_ROCK_POLISH
	db 1, ROCK_THROW
	db 1, MAGNITUDE
	db 1, ROLLOUT
	db 1, TAKE_DOWN
	db 1, BULLDOZE
	db 1, SELFDESTRUCT
	db 30, ROCK_BLAST
	db 34, EARTHQUAKE
	db 40, EXPLOSION
	db 44, DOUBLE_EDGE
	db 50, STONE_EDGE
	db 0 ; no more level-up moves

GolemEvosAttacks:
	db 0 ; no more evolutions
	db 1, ROCK_WRECKER
	db 1, TACKLE_SCRATCH_POUND
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 1, AGILITY_ROCK_POLISH
	db 1, ROCK_THROW
	db 1, MAGNITUDE
	db 1, ROLLOUT
	db 1, TAKE_DOWN
	db 1, BULLDOZE
	db 1, SELFDESTRUCT
	db 30, ROCK_BLAST
	db 34, EARTHQUAKE
	db 40, EXPLOSION
	db 44, DOUBLE_EDGE
	db 50, STONE_EDGE
	db 0 ; no more level-up moves

PonytaEvosAttacks:
	db EVOLVE_LEVEL, 40, RAPIDASH
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, GROWL
	db 5, LEER_TAIL_WHIP
	db 9, EMBER
	db 13, FLAME_CHARGE
	db 17, STOMP
	db 21, DOUBLE_KICK
	db 25, FIRE_SPIN
	db 29, TAKE_DOWN
	db 33, FLAME_BURST
	db 37, AGILITY_ROCK_POLISH
	db 41, FIRE_BLAST
	db 45, BODY_SLAM
	db 49, FLARE_BLITZ
	db  0 ; no more level-up moves

RapidashEvosAttacks:
	db  0 ; no more evolutions
	db 1, MEGAHORN
	db 1, POISON_JAB
	db 1, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 1, TACKLE_SCRATCH_POUND
	db 1, GROWL
	db 1, LEER_TAIL_WHIP
	db 1, EMBER
	db 1, FLAME_CHARGE
	db 1, STOMP
	db 1, DOUBLE_KICK
	db 1, FIRE_SPIN
	db 1, TAKE_DOWN
	db 1, FLAME_BURST
	db 1, AGILITY_ROCK_POLISH
	db 43, FIRE_BLAST
	db 49, BODY_SLAM
	db 55, FLARE_BLITZ
	db  0 ; no more level-up moves

SlowpokeEvosAttacks:
	db EVOLVE_LEVEL, 37, SLOWBRO
	db EVOLVE_TRADE, KINGS_ROCK, SLOWKING
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, CURSE
	db 4, GROWL
	db 8, WATER_GUN
	db 11, SING_HYPNOSIS
	db 15, CONFUSION
	db 18, DISABLE
	db 22, HEADBUTT
	db 25, BUBBLE_BEAM
	db 29, ZEN_HEADBUTT
	db 32, AMNESIA
	db 36, REST
	db 39, PSYCHIC_M
	db 43, RAIN_DANCE
	db 46, SAFEGUARD
	db  0 ; no more level-up moves

SlowbroEvosAttacks:
	db 0 ; no more evolutions
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 1, TACKLE_SCRATCH_POUND
	db 1, CURSE
	db 1, GROWL
	db 1, WATER_GUN
	db 1, SING_HYPNOSIS
	db 1, CONFUSION
	db 1, DISABLE
	db 1, HEADBUTT
	db 1, BUBBLE_BEAM
	db 1, ZEN_HEADBUTT
	db 1, AMNESIA
	db 1, REST
	db 41, PSYCHIC_M
	db 45, RAIN_DANCE
	db 50, SAFEGUARD
	db 0 ; no more level-up moves

MagnemiteEvosAttacks:
	db EVOLVE_LEVEL, 30, MAGNETON
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

MagnetonEvosAttacks:
	db EVOLVE_LOCATION, SUNSET_BAY, MAGNEZONE
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

DoduoEvosAttacks:
	db EVOLVE_LEVEL, 31, DODRIO
	db 0 ; no more evolutions
	db 1, PECK
	db 1, GROWL
	db 5, QUICK_ATTACK
	db 9, RAGE
	db 13, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 17, PURSUIT
	db 21, DOUBLE_HIT
	db 25, AGILITY_ROCK_POLISH
	db 29, MIRROR_MOVE
	db 33, FLAIL
	db 37, JUMP_KICK
	db 41, DRILL_PECK
	db 45, SWORDS_DANCE
	db 49, THRASH
	db 0 ; no more level-up moves

DodrioEvosAttacks:
	db 0 ; no more evolutions
	db 1, TRI_ATTACK
	db 1, PECK
	db 1, GROWL
	db 1, QUICK_ATTACK
	db 1, RAGE
	db 1, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 1, PURSUIT
	db 1, DOUBLE_HIT
	db 1, AGILITY_ROCK_POLISH
	db 1, MIRROR_MOVE
	db 34, FLAIL
	db 40, JUMP_KICK
	db 45, DRILL_PECK
	db 51, SWORDS_DANCE
	db 56, THRASH
	db 0 ; no more level-up moves

GrimerEvosAttacks:
	db EVOLVE_LEVEL, 38, MUK
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, SMOG
	db 6, DEFENSE_CURL_HARDEN_WITHDRAW
	db 9, MUD_SLAP
	db 14, DISABLE
	db 17, SLUDGE
	db 22, BULLDOZE
	db 25, MINIMIZE
	db 30, KNOCK_OFF
	db 33, SLUDGE_BOMB
	db 38, SCREECH
	db 41, TOXIC
	db 46, BARRIER_IRON_DEFENSE_ACID_ARMOR
	db 49, GUNK_SHOT
	db 0 ; no more level-up moves
	
MukEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, SMOG
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 1, MUD_SLAP
	db 1, DISABLE
	db 1, SLUDGE
	db 1, BULLDOZE
	db 1, MINIMIZE
	db 1, KNOCK_OFF
	db 1, SLUDGE_BOMB
	db 1, SCREECH
	db 42, TOXIC
	db 48, BARRIER_IRON_DEFENSE_ACID_ARMOR
	db 52, GUNK_SHOT
	db 0 ; no more level-up moves
	
GastlyEvosAttacks:
	db EVOLVE_LEVEL, 25, HAUNTER
	db 0 ; no more evolutions
	db 1, SING_HYPNOSIS
	db 1, PURSUIT
	db 5, SMOG
	db 8, MEAN_LOOK_BLOCK_SPIDER_WEB
	db 12, CURSE
	db 15, NIGHT_SHADE
	db 19, CONFUSE_RAY
	db 22, SUCKER_PUNCH
	db 26, FEINT_ATTACK
	db 29, SHADOW_BALL
	db 33, DREAM_EATER
	db 36, DARK_PULSE
	db 40, DESTINY_BOND
	db 43, HEX
	db 47, TOXIC
	db 0 ; no more level-up moves

HaunterEvosAttacks:
	db EVOLVE_TRADE, -1, GENGAR
	db  0 ; no more evolutions
	db 1, SHADOW_CLAW
	db 1, SING_HYPNOSIS
	db 1, PURSUIT
	db 1, SMOG
	db 1, MEAN_LOOK_BLOCK_SPIDER_WEB
	db 1, CURSE
	db 1, NIGHT_SHADE
	db 1, CONFUSE_RAY
	db 1, SUCKER_PUNCH
	db 28, FEINT_ATTACK
	db 33, SHADOW_BALL
	db 39, DREAM_EATER
	db 44, DARK_PULSE
	db 50, DESTINY_BOND
	db 55, HEX
	db 61, TOXIC
	db 0 ; no more level-up moves

GengarEvosAttacks:
	db 0 ; no more evolutions
	db 1, SHADOW_CLAW
	db 1, SING_HYPNOSIS
	db 1, PURSUIT
	db 1, SMOG
	db 1, MEAN_LOOK_BLOCK_SPIDER_WEB
	db 1, CURSE
	db 1, NIGHT_SHADE
	db 1, CONFUSE_RAY
	db 1, SUCKER_PUNCH
	db 28, FEINT_ATTACK
	db 33, SHADOW_BALL
	db 39, DREAM_EATER
	db 44, DARK_PULSE
	db 50, DESTINY_BOND
	db 55, HEX
	db 61, TOXIC
	db 0 ; no more level-up moves

OnixEvosAttacks:
	db EVOLVE_TRADE, METAL_COAT, STEELIX
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 4, RAGE
	db 7, ROCK_THROW
	db 10, CURSE
	db 14, ROLLOUT
	db 17, AGILITY_ROCK_POLISH
	db 21, GYRO_BALL
	db 25, BULLDOZE
	db 28, DRAGONBREATH
	db 31, BODY_SLAM
	db 34, SCREECH
	db 37, ROCK_SLIDE
	db 40, IRON_TAIL
	db 44, DIG
	db 47, STONE_EDGE
	db 50, DOUBLE_EDGE
	db 54, SANDSTORM
	db 0 ; no more level-up moves

VoltorbEvosAttacks:
	db EVOLVE_LEVEL, 30, ELECTRODE
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, SONIC_BOOM
	db 9, THUNDERSHOCK
	db 11, ROLLOUT
	db 13, SCREECH
	db 16, SPARK
	db 20, SWIFT
	db 22, ELECTRO_BALL
	db 26, SELFDESTRUCT
	db 29, LIGHT_SCREEN
	db 34, THUNDER_WAVE
	db 37, THUNDERBOLT
	db 41, EXPLOSION
	db 46, REFLECT
	db 48, GYRO_BALL
	db 0 ; no more level-up moves

ElectrodeEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, SONIC_BOOM
	db 1, THUNDERSHOCK
	db 1, ROLLOUT
	db 1, SCREECH
	db 1, SPARK
	db 1, SWIFT
	db 1, ELECTRO_BALL
	db 1, SELFDESTRUCT
	db 1, LIGHT_SCREEN
	db 36, THUNDER_WAVE
	db 41, THUNDERBOLT
	db 47, EXPLOSION
	db 54, REFLECT
	db 58, GYRO_BALL
	db 0 ; no more level-up moves

ExeggcuteEvosAttacks:
	db EVOLVE_ITEM, LEAF_STONE, EXEGGUTOR
	db 0 ; no more evolutions
	db 1, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 1, ABSORB
	db 1, SING_HYPNOSIS
	db 7, REFLECT
	db 11, LEECH_SEED
	db 15, MEGA_DRAIN
	db 20, CONFUSION
	db 24, BULLET_SEED
	db 26, STUN_SPORE
	db 28, POISONPOWDER
	db 32, SLEEP_POWDER
	db 37, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db 41, GIGA_DRAIN
	db 45, PSYSHOCK
	db 49, SOLAR_BEAM
	db 0 ; no more level-up moves

ExeggutorEvosAttacks:
	db 0 ; no more evolutions
	db 1, STOMP
	db 1, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 1, ABSORB
	db 1, SING_HYPNOSIS
	db 1, REFLECT
	db 1, LEECH_SEED
	db 1, MEGA_DRAIN
	db 1, CONFUSION
	db 1, STUN_SPORE
	db 1, POISONPOWDER
	db 1, SLEEP_POWDER
	db 1, BULLET_SEED
	db 1, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db 1, GIGA_DRAIN
	db 1, PSYSHOCK
	db 1, SOLAR_BEAM
	db 45, EGG_BOMB
	db 49, WOOD_HAMMER
	db 0 ; no more level-up moves

CuboneEvosAttacks:
	db EVOLVE_CUBONE, TR_MORNDAY, MAROWAK
	db EVOLVE_CUBONE, TR_NITE, MAROWAK_A
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 3, GROWL
	db 7, BONE_CLUB
	db 11, HEADBUTT
	db 13, LEER_TAIL_WHIP
	db 17, FOCUS_ENERGY
	db 21, BONEMERANG
	db 23, RAGE
	db 27, FALSE_SWIPE
	db 31, THRASH
	db 33, DIG
	db 47, SWORDS_DANCE
	db 41, DOUBLE_EDGE
	db 43, EARTHQUAKE
	db 0 ; no more level-up moves

MarowakEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, GROWL
	db 1, BONE_CLUB
	db 1, HEADBUTT
	db 1, LEER_TAIL_WHIP
	db 1, FOCUS_ENERGY
	db 1, BONEMERANG
	db 1, RAGE
	db 1, FALSE_SWIPE
	db 33, THRASH
	db 37, DIG
	db 43, SWORDS_DANCE
	db 49, DOUBLE_EDGE
	db 53, EARTHQUAKE
	db 0 ; no more level-up moves

KoffingEvosAttacks:
	db EVOLVE_LEVEL, 35, WEEZING
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 4, SMOG
	db 7, SAND_ATTACK_SMOKESCREEN
	db 12, FEINT_ATTACK
	db 15, CLEAR_SMOG
	db 18, SLUDGE
	db 23, SELFDESTRUCT
	db 26, HAZE
	db 29, GYRO_BALL
	db 34, SLUDGE_BOMB
	db 37, EXPLOSION
	db 40, TOXIC
	db 45, DESTINY_BOND
	db 0 ; no more level-up moves

WeezingEvosAttacks:
	db 0 ; no more evolutions
	db 1, DOUBLE_HIT
	db 1, TACKLE_SCRATCH_POUND
	db 1, SMOG
	db 1, SAND_ATTACK_SMOKESCREEN
	db 1, FEINT_ATTACK
	db 1, CLEAR_SMOG
	db 1, SLUDGE
	db 1, SELFDESTRUCT
	db 1, HAZE
	db 1, GYRO_BALL
	db 1, SLUDGE_BOMB
	db 38, EXPLOSION
	db 44, TOXIC
	db 50, DESTINY_BOND
	db 0 ; no more level-up moves
	
ChanseyEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, BLISSEY
	db  0 ; no more evolutions
	db  1, SOFTBOILED_MILK_DRINK_RECOVER
	db  0 ; no more level-up moves

HorseaEvosAttacks:
	db EVOLVE_LEVEL, 32, SEADRA
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 4, LEER_TAIL_WHIP
	db 9, SAND_ATTACK_SMOKESCREEN
	db 13, TWISTER
	db 18, BUBBLE_BEAM
	db 22, FOCUS_ENERGY
	db 27, DRAGONBREATH
	db 31, FLAIL
	db 36, AGILITY_ROCK_POLISH
	db 40, HYDRO_PUMP
	db 45, DRAGON_PULSE
	db 49, DRAGON_DANCE
	db 54, RAIN_DANCE
	db 0 ; no more level-up moves

SeadraEvosAttacks:
	db EVOLVE_TRADE, DRAGON_SCALE, KINGDRA
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, LEER_TAIL_WHIP
	db 1, SAND_ATTACK_SMOKESCREEN
	db 1, TWISTER
	db 1, DRAGONBREATH
	db 1, BUBBLE_BEAM
	db 1, FOCUS_ENERGY
	db 1, FLAIL
	db 37, AGILITY_ROCK_POLISH
	db 43, DRAGON_PULSE
	db 49, HYDRO_PUMP
	db 55, DRAGON_DANCE
	db 61, RAIN_DANCE
	db 0 ; no more level-up moves

StaryuEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, STARMIE
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 4, WATER_GUN
	db 9, RAPID_SPIN
	db 13, MINIMIZE
	db 18, SWIFT
	db 22, PSYBEAM
	db 27, BUBBLE_BEAM
	db 31, SOFTBOILED_MILK_DRINK_RECOVER
	db 36, LIGHT_SCREEN
	db 40, POWER_GEM
	db 45, CONFUSE_RAY
	db 49, PSYCHIC_M
	db 53, COSMIC_POWER
	db 57, HYDRO_PUMP
	db 0 ; no more level-up moves

StarmieEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 1, WATER_GUN
	db 1, RAPID_SPIN
	db 1, MINIMIZE
	db 1, SWIFT
	db 1, PSYBEAM
	db 1, BUBBLE_BEAM
	db 1, SOFTBOILED_MILK_DRINK_RECOVER
	db 1, LIGHT_SCREEN
	db 1, POWER_GEM
	db 1, PSYCHIC_M
	db 1, COSMIC_POWER
	db 1, HYDRO_PUMP
	db 45, CONFUSE_RAY
	db 0 ; no more level-up moves

ScytherEvosAttacks:
	db EVOLVE_TRADE, METAL_COAT, SCIZOR
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, LEER_TAIL_WHIP
	db 6, FOCUS_ENERGY
	db 10, PURSUIT
	db 14, FALSE_SWIPE
	db 19, AGILITY_ROCK_POLISH
	db 23, WING_ATTACK
	db 27, FURY_CUTTER
	db 32, SLASH
	db 36, DOUBLE_HIT
	db 40, DOUBLE_TEAM
	db 45, X_SCISSOR
	db 49, NIGHT_SLASH
	db 53, AIR_SLASH
	db 58, SWORDS_DANCE
	db 0 ; no more level-up moves

ElectabuzzEvosAttacks:
	db EVOLVE_TRADE, ELECTIRIZER, ELECTIVIRE
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, LEER_TAIL_WHIP
	db 5, THUNDERSHOCK
	db 8, DOUBLE_TEAM
	db 12, SWIFT
	db 15, SHOCK_WAVE
	db 19, THUNDER_WAVE
	db 22, ELECTRO_BALL
	db 26, SCREECH
	db 29, THUNDERPUNCH
	db 36, LOW_KICK
	db 42, LIGHT_SCREEN
	db 49, THUNDERBOLT
	db 55, THUNDER
	db 0 ; no more level-up moves

MagmarEvosAttacks:
	db EVOLVE_TRADE, MAGMARIZER, MAGMORTAR
	db 0 ; no more evolutions
	db 1, SMOG
	db 1, LEER_TAIL_WHIP
	db 5, EMBER
	db 8, SAND_ATTACK_SMOKESCREEN
	db 12, FEINT_ATTACK
	db 15, FIRE_SPIN
	db 19, CLEAR_SMOG
	db 22, FLAME_BURST
	db 26, CONFUSE_RAY
	db 29, FIRE_PUNCH
	db 36, LOW_KICK
	db 42, SUNNY_DAY
	db 49, FLAMETHROWER
	db 55, FIRE_BLAST
	db 0 ; no more level-up moves

TaurosEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, LEER_TAIL_WHIP
	db 5, RAGE
	db 10, HORN_ATTACK
	db 14, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 19, PURSUIT
	db 23, REST
	db 28, REVERSAL
	db 32, WORK_UP_GROWTH
	db 37, TAKE_DOWN
	db 41, ZEN_HEADBUTT
	db 46, SWAGGER
	db 50, THRASH
	db 55, DOUBLE_EDGE
	db 59, GIGA_IMPACT
	db 0 ; no more level-up moves

MagikarpEvosAttacks:
	db EVOLVE_LEVEL, 20, GYARADOS
	db 0 ; no more evolutions
	db 1, TRANSFORM_SPLASH
	db 0 ; no more level-up moves

GyaradosEvosAttacks:
	db 0 ; no more evolutions
	db 1, GUST
	db 1, BITE
	db 1, THRASH
	db 21, LEER_TAIL_WHIP
	db 24, TWISTER
	db 27, ICE_FANG
	db 30, AQUA_TAIL
	db 33, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 36, DRAGON_RAGE
	db 39, CRUNCH
	db 42, HYDRO_PUMP
	db 45, DRAGON_DANCE
	db 48, HURRICANE
	db 51, RAIN_DANCE
	db 54, HYPER_BEAM
	db 0 ; no more level-up moves

LaprasEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

DittoEvosAttacks:
	db 0 ; no more evolutions
	db 1, TRANSFORM_SPLASH
	db 0 ; no more level-up moves

EeveeEvosAttacks:
	db EVOLVE_ITEM, THUNDERSTONE, JOLTEON
	db EVOLVE_ITEM, WATER_STONE, VAPOREON
	db EVOLVE_ITEM, FIRE_STONE, FLAREON
	db EVOLVE_LOCATION, HUNTERS_THICKET, LEAFEON
	db EVOLVE_LOCATION, EVENTIDE_FOREST, LEAFEON
	db EVOLVE_LOCATION, ROUTE_10, GLACEON
	db EVOLVE_LOCATION, TWINKLE_TOWN, GLACEON
	db EVOLVE_LOCATION, FROZEN_RUINS, GLACEON
	db EVOLVE_LOCATION, GLINT_GROVE, SYLVEON
	db EVOLVE_HAPPINESS, TR_MORNDAY, ESPEON
	db EVOLVE_HAPPINESS, TR_NITE, UMBREON
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, TACKLE_SCRATCH_POUND
	db 5, LEER_TAIL_WHIP
	db 9, SAND_ATTACK_SMOKESCREEN
	db 13, QUICK_ATTACK
	db 17, BITE
	db 17, SWIFT
	db 20, MIMIC
	db 25, TAKE_DOWN
	db 29, CHARM_FEATHER_DANCE
	db 33, BATON_PASS
	db 37, HYPER_VOICE
	db 41, DOUBLE_EDGE
	db 45, WISH
	db 0 ; no more level-up moves

VaporeonEvosAttacks:
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, GROWL
	db 1, TACKLE_SCRATCH_POUND
	db 5, LEER_TAIL_WHIP
	db 9, SAND_ATTACK_SMOKESCREEN
	db 13, QUICK_ATTACK
	db 17, BUBBLE_BEAM
	db 20, AURORA_BEAM
	db 25, RAIN_DANCE
	db 29, BARRIER_IRON_DEFENSE_ACID_ARMOR
	db 33, HAZE
	db 37, SCALD
	db 41, DOUBLE_EDGE
	db 45, HYDRO_PUMP
	db 0 ; no more level-up moves

JolteonEvosAttacks:
	db 0 ; no more evolutions
	db 1, THUNDERSHOCK
	db 1, GROWL
	db 1, TACKLE_SCRATCH_POUND
	db 5, LEER_TAIL_WHIP
	db 9, SAND_ATTACK_SMOKESCREEN
	db 13, QUICK_ATTACK
	db 17, DOUBLE_KICK
	db 20, THUNDER_FANG
	db 25, PIN_MISSILE
	db 29, AGILITY_ROCK_POLISH
	db 33, THUNDER_WAVE
	db 37, THUNDERBOLT
	db 41, DOUBLE_EDGE
	db 45, THUNDER
	db 0 ; no more level-up moves

FlareonEvosAttacks:
	db 0 ; no more evolutions
	db 1, EMBER
	db 1, GROWL
	db 1, TACKLE_SCRATCH_POUND
	db 5, LEER_TAIL_WHIP
	db 9, SAND_ATTACK_SMOKESCREEN
	db 13, QUICK_ATTACK
	db 17, BITE
	db 20, FIRE_FANG
	db 25, FIRE_SPIN
	db 29, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 33, SMOG
	db 37, FLAMETHROWER
	db 41, DOUBLE_EDGE
	db 45, FLARE_BLITZ
	db 0 ; no more level-up moves

PorygonEvosAttacks:
	db EVOLVE_TRADE, UP_GRADE, PORYGON2
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, SHARPEN_HOWL_MEDITATE
	db 7, CONVERSION
	db 12, THUNDERSHOCK
	db 16, PSYBEAM
	db 21, CONVERSION2
	db 25, SWIFT
	db 30, AGILITY_ROCK_POLISH
	db 34, SIGNAL_BEAM
	db 39, SOFTBOILED_MILK_DRINK_RECOVER
	db 43, THUNDERBOLT
	db 48, TRI_ATTACK
	db 52, LOCK_ON_MIND_READER
	db 57, ZAP_CANNON
	db 0 ; no more level-up moves

AerodactylEvosAttacks:
	db  0 ; no more evolutions
	db  1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
SnorlaxEvosAttacks:
	db 0 ; no more evolutions
	db 1, METRONOME
	db 1, FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	db 1, TACKLE_SCRATCH_POUND
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 1, AMNESIA
	db 1, BITE
	db 17, HEADBUTT
	db 20, SCREECH
	db 25, BODY_SLAM
	db 28, REST
	db 28, SNORE
	db 33, WORK_UP_GROWTH
	db 35, FLAIL
	db 36, ROLLOUT
	db 41, MEAN_LOOK_BLOCK_SPIDER_WEB
	db 44, BELLY_DRUM
	db 49, CRUNCH
	db 53, GIGA_IMPACT
	db 0 ; no more level-up moves

DratiniEvosAttacks:
	db EVOLVE_LEVEL, 30, DRAGONAIR
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, LEER_TAIL_WHIP
	db 5, THUNDER_WAVE
	db 11, TWISTER
	db 15, DRAGON_RAGE
	db 21, BODY_SLAM
	db 25, AGILITY_ROCK_POLISH
	db 31, DRAGONBREATH
	db 35, AQUA_TAIL
	db 41, DRAGON_PULSE
	db 46, SAFEGUARD
	db 51, DRAGON_DANCE
	db 55, OUTRAGE
	db 61, HYPER_BEAM
	db 0 ; no more level-up moves

DragonairEvosAttacks:
	db EVOLVE_LEVEL, 55, DRAGONITE
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, LEER_TAIL_WHIP
	db 1, THUNDER_WAVE
	db 1, TWISTER
	db 1, DRAGON_RAGE
	db 1, BODY_SLAM
	db 1, AGILITY_ROCK_POLISH
	db 33, DRAGONBREATH
	db 39, AQUA_TAIL
	db 47, DRAGON_PULSE
	db 53, SAFEGUARD
	db 61, DRAGON_DANCE
	db 67, OUTRAGE
	db 75, HYPER_BEAM
	db 0 ; no more level-up moves

DragoniteEvosAttacks:
	db 0 ; no more evolutions
	db 1, WING_ATTACK
	db 1, EXTREMESPEED
	db 1, HURRICANE
	db 1, FIRE_PUNCH
	db 1, THUNDERPUNCH
	db 1, ROOST
	db 1, TACKLE_SCRATCH_POUND
	db 1, LEER_TAIL_WHIP
	db 1, THUNDER_WAVE
	db 1, TWISTER
	db 1, DRAGON_RAGE
	db 1, BODY_SLAM
	db 1, AGILITY_ROCK_POLISH
	db 1, DRAGONBREATH
	db 1, AQUA_TAIL
	db 1, DRAGON_PULSE
	db 1, SAFEGUARD
	db 62, DRAGON_DANCE
	db 71, OUTRAGE
	db 80, HYPER_BEAM
	db 0 ; no more level-up moves

ChikoritaEvosAttacks:
	db EVOLVE_LEVEL, 16, BAYLEEF
	db  0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, GROWL
	db 7, RAZOR_LEAF
	db 9, POISONPOWDER
	db 12, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db 16, REFLECT
	db 19, BULLET_SEED
	db 22, STUN_SPORE
	db 26, LEECH_SEED
	db 29, LIGHT_SCREEN
	db 32, BODY_SLAM
	db 36, SAFEGUARD
	db 39, HEAL_BELL
	db 42, SOLAR_BEAM
	db 0 ; no more level-up moves

BayleefEvosAttacks:
	db EVOLVE_LEVEL, 32, MEGANIUM
	db 0 ; no more evolutions
	db 1, MEGA_DRAIN
	db 1, TACKLE_SCRATCH_POUND
	db 1, GROWL
	db 1, RAZOR_LEAF
	db 1, POISONPOWDER
	db 1, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db 1, REFLECT
	db 20, BULLET_SEED
	db 25, STUN_SPORE
	db 30, LEECH_SEED
	db 34, LIGHT_SCREEN
	db 40, BODY_SLAM
	db 45, SAFEGUARD
	db 49, HEAL_BELL
	db 54, SOLAR_BEAM
	db 0 ; no more level-up moves

MeganiumEvosAttacks:
	db  0 ; no more evolutions
	db 1, CALM_MIND
	db 1, LEECH_SEED
	db 1, GIGA_DRAIN
	db 1, MEGA_DRAIN
	db 1, TACKLE_SCRATCH_POUND
	db 1, GROWL
	db 1, RAZOR_LEAF
	db 1, POISONPOWDER
	db 1, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db 1, REFLECT
	db 1, BULLET_SEED
	db 1, STUN_SPORE
	db 33, PETAL_DANCE
	db 38, LIGHT_SCREEN
	db 44, BODY_SLAM
	db 49, SAFEGUARD
	db 54, HEAL_BELL
	db 60, SOLAR_BEAM
	db  0 ; no more level-up moves

CyndaquilEvosAttacks:
	db EVOLVE_LEVEL, 14, QUILAVA
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, LEER_TAIL_WHIP
	db 7, EMBER
	db 10, SAND_ATTACK_SMOKESCREEN
	db 13, QUICK_ATTACK
	db 18, SWIFT
	db 21, DEFENSE_CURL_HARDEN_WITHDRAW
	db 26, FLAME_BURST
	db 29, ROLLOUT
	db 34, REVERSAL
	db 37, FLAMETHROWER
	db 42, DOUBLE_EDGE
	db 45, FIRE_BLAST
	db 0 ; no more level-up moves

QuilavaEvosAttacks:
	db EVOLVE_LEVEL, 36, TYPHLOSION
	db 0 ; no more evolutions
	db 1, FLAME_CHARGE
	db 1, TACKLE_SCRATCH_POUND
	db 1, LEER_TAIL_WHIP
	db 1, EMBER
	db 1, SAND_ATTACK_SMOKESCREEN
	db 1, QUICK_ATTACK
	db 19, SWIFT
	db 23, DEFENSE_CURL_HARDEN_WITHDRAW
	db 29, FLAME_BURST
	db 33, ROLLOUT
	db 39, REVERSAL
	db 43, FLAMETHROWER
	db 49, DOUBLE_EDGE
	db 53, FIRE_BLAST
	db 0 ; no more level-up moves

TyphlosionEvosAttacks:
	db  0 ; no more evolutions
	db 1, WORK_UP_GROWTH
	db 1, FLAME_CHARGE
	db 1, TACKLE_SCRATCH_POUND
	db 1, LEER_TAIL_WHIP
	db 1, EMBER
	db 1, SAND_ATTACK_SMOKESCREEN
	db 1, QUICK_ATTACK
	db 1, SWIFT
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 1, FLAME_BURST
	db 1, ROLLOUT
	db 40, REVERSAL
	db 45, FLAMETHROWER
	db 50, DOUBLE_EDGE
	db 57, FIRE_BLAST
	db 0 ; no more level-up moves

TotodileEvosAttacks:
	db EVOLVE_LEVEL, 18, CROCONAW
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, LEER_TAIL_WHIP
	db 7, WATER_GUN
	db 9, RAGE
	db 13, BITE
	db 15, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 20, ICE_FANG
	db 22, FLAIL
	db 27, CRUNCH
	db 29, LOW_KICK
	db 34, SLASH
	db 36, SCREECH
	db 41, AQUA_TAIL
	db 43, SUPERPOWER
	db 48, HYDRO_PUMP
	db 0 ; no more level-up moves

CroconawEvosAttacks:
	db EVOLVE_LEVEL, 30, FERALIGATR
	db 0 ; no more evolutions
	db 1, AQUA_JET
	db 1, TACKLE_SCRATCH_POUND
	db 1, LEER_TAIL_WHIP
	db 1, WATER_GUN
	db 1, RAGE
	db 1, BITE
	db 1, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 21, ICE_FANG
	db 24, FLAIL
	db 30, CRUNCH
	db 33, LOW_KICK
	db 39, SLASH
	db 42, SCREECH
	db 48, AQUA_TAIL
	db 51, SUPERPOWER
	db 57, HYDRO_PUMP
	db 0 ; no more level-up moves

FeraligatrEvosAttacks:
	db 0 ; no more evolutions
	db 1, BULK_UP
	db 1, THRASH
	db 1, AQUA_JET
	db 1, TACKLE_SCRATCH_POUND
	db 1, LEER_TAIL_WHIP
	db 1, WATER_GUN
	db 1, RAGE
	db 1, BITE
	db 1, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 1, ICE_FANG
	db 1, FLAIL
	db 1, CRUNCH
	db 35, LOW_KICK
	db 41, SLASH
	db 46, SCREECH
	db 52, AQUA_TAIL
	db 57, SUPERPOWER
	db 63, HYDRO_PUMP
	db 0 ; no more level-up moves

LedybaEvosAttacks:
	db EVOLVE_LEVEL, 18, LEDIAN
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 5, SUPERSONIC
	db 8, SWIFT
	db 10, GUST
	db 12, LIGHT_SCREEN
	db 12, REFLECT
	db 15, MACH_PUNCH
	db 19, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 22, SIGNAL_BEAM
	db 25, ROOST
	db 29, BATON_PASS
	db 32, AGILITY_ROCK_POLISH
	db 35, BUG_BUZZ
	db 39, AIR_SLASH
	db 42, DOUBLE_EDGE
	db 45, QUIVER_DANCE
	db 0 ; no more level-up moves

LedianEvosAttacks:
	db  0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, SUPERSONIC
	db 1, SWIFT
	db 1, GUST
	db 1, LIGHT_SCREEN
	db 1, REFLECT
	db 1, MACH_PUNCH
	db 20, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 24, SIGNAL_BEAM
	db 28, ROOST
	db 32, BATON_PASS
	db 36, AGILITY_ROCK_POLISH
	db 40, BUG_BUZZ
	db 44, AIR_SLASH
	db 48, DOUBLE_EDGE
	db 52, QUIVER_DANCE
	db 0 ; no more level-up moves

CrobatEvosAttacks:
	db  0 ; no more evolutions
	db 1, X_SCISSOR
	db 1, CRUNCH
	db 1, ABSORB
	db 1, SUPERSONIC
	db 1, SWIFT
	db 1, BITE
	db 1, WING_ATTACK
	db 1, CONFUSE_RAY
	db 1, SCREECH
	db 24, ACROBATICS
	db 27, POISON_FANG
	db 32, MEAN_LOOK_BLOCK_SPIDER_WEB
	db 35, LEECH_LIFE
	db 40, HAZE
	db 43, VENOSHOCK
	db 48, AIR_SLASH
	db  0 ; no more level-up moves

ChinchouEvosAttacks:
	db EVOLVE_LEVEL, 27, LANTURN
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, SUPERSONIC
	db 6, THUNDER_WAVE
	db 9, THUNDERSHOCK
	db 12, CONFUSE_RAY
	db 17, BUBBLE_BEAM
	db 20, ELECTRO_BALL
	db 23, SPARK
	db 28, SIGNAL_BEAM
	db 31, FLAIL
	db 34, THUNDERBOLT
	db 39, TAKE_DOWN
	db 42, AMNESIA
	db 45, HYDRO_PUMP
	db 0 ; no more level-up moves

LanturnEvosAttacks:
	db 0 ; no more evolutions
	db 1, DAZZLINGLEAM
	db 1, WATER_GUN
	db 1, SUPERSONIC
	db 1, THUNDER_WAVE
	db 1, THUNDERSHOCK
	db 1, CONFUSE_RAY
	db 1, BUBBLE_BEAM
	db 1, ELECTRO_BALL
	db 1, SPARK
	db 29, SIGNAL_BEAM
	db 33, FLAIL
	db 37, THUNDERBOLT
	db 43, TAKE_DOWN
	db 47, AMNESIA
	db 51, HYDRO_PUMP
	db 0 ; no more level-up moves

TogepiEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, TOGETIC
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, CHARM_FEATHER_DANCE
	db 5, METRONOME
	db 9, SWEET_KISS
	db 13, FAIRY_WIND
	db 17, SING_HYPNOSIS
	db 21, ENCORE
	db 25, SAFEGUARD
	db 29, WISH
	db 33, ANCIENTPOWER
	db 37, BATON_PASS
	db 41, HYPER_VOICE
	db 45, DOUBLE_EDGE
	db 0 ; no more level-up moves

TogeticEvosAttacks:
	db EVOLVE_ITEM, SHINY_STONE, TOGEKISS
	db 0 ; no more evolutions
	db 1, ENERGY_BALL
	db 1, AIR_SLASH
	db 1, GROWL
	db 1, CHARM_FEATHER_DANCE
	db 1, METRONOME
	db 9, SING_HYPNOSIS
	db 13, FAIRY_WIND
	db 15, ENCORE
	db 21, SAFEGUARD
	db 27, WISH
	db 33, ANCIENTPOWER
	db 37, BATON_PASS
	db 41, HYPER_VOICE
	db 47, DOUBLE_EDGE
	db 0 ; no more level-up moves

NatuEvosAttacks:
	db EVOLVE_LEVEL, 25, XATU
	db 0 ; no more evolutions
	db 1, PECK
	db 1, LEER_TAIL_WHIP
	db 6, NIGHT_SHADE
	db 9, TELEPORT
	db 12, REFLECT
	db 17, CONFUSION
	db 20, OMINOUS_WIND
	db 23, CONFUSE_RAY
	db 28, WISH
	db 33, PSYCHIC_M
	db 36, FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	db 39, CALM_MIND
	db 44, FUTURE_SIGHT
	db 47, REFLECT
	db 47, LIGHT_SCREEN
	db 50, DRILL_PECK
	db 0 ; no more level-up moves

XatuEvosAttacks:
	db 0 ; no more evolutions
	db 1, AIR_SLASH
	db 1, PECK
	db 1, LEER_TAIL_WHIP
	db 1, NIGHT_SHADE
	db 1, TELEPORT
	db 1, REFLECT
	db 1, CONFUSION
	db 1, OMINOUS_WIND
	db 1, CONFUSE_RAY
	db 29, WISH
	db 35, PSYCHIC_M
	db 39, FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	db 43, CALM_MIND
	db 49, FUTURE_SIGHT
	db 53, REFLECT
	db 53, LIGHT_SCREEN
	db 57, DRILL_PECK
	db 0 ; no more level-up moves

MareepEvosAttacks:
	db EVOLVE_LEVEL, 15, FLAAFFY
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, GROWL
	db 4, THUNDER_WAVE
	db 8, THUNDERSHOCK
	db 11, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 15, SAND_ATTACK_SMOKESCREEN
	db 18, TAKE_DOWN
	db 22, ELECTRO_BALL
	db 25, CONFUSE_RAY
	db 29, POWER_GEM
	db 32, THUNDERBOLT
	db 36, COTTON_GUARD
	db 39, SIGNAL_BEAM
	db 43, LIGHT_SCREEN
	db 46, THUNDER
	db 0 ; no more level-up moves

FlaaffyEvosAttacks:
	db EVOLVE_LEVEL, 30, AMPHAROS
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, GROWL
	db 1, THUNDER_WAVE
	db 1, THUNDERSHOCK
	db 1, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 1, SAND_ATTACK_SMOKESCREEN
	db 20, TAKE_DOWN
	db 25, ELECTRO_BALL
	db 29, CONFUSE_RAY
	db 34, POWER_GEM
	db 38, THUNDERBOLT
	db 43, COTTON_GUARD
	db 47, SIGNAL_BEAM
	db 52, LIGHT_SCREEN
	db 56, THUNDER
	db 0 ; no more level-up moves

AmpharosEvosAttacks:
	db 0 ; no more evolutions
	db 1, THUNDERPUNCH
	db 1, ZAP_CANNON
	db 1, DRAGON_PULSE
	db 1, FIRE_PUNCH
	db 1, GROWL
	db 1, THUNDER_WAVE
	db 1, THUNDERSHOCK
	db 1, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 1, SAND_ATTACK_SMOKESCREEN
	db 1, TAKE_DOWN
	db 1, ELECTRO_BALL
	db 1, CONFUSE_RAY
	db 35, POWER_GEM
	db 40, THUNDERBOLT
	db 46, COTTON_GUARD
	db 51, SIGNAL_BEAM
	db 57, LIGHT_SCREEN
	db 62, THUNDER
	db 0 ; no more level-up moves

BellossomEvosAttacks:
	db 0 ; no more evolutions
	db 1, ENERGY_BALL
	db 1, ABSORB
	db 1, WORK_UP_GROWTH
	db 1, ACID
	db 1, POISONPOWDER
	db 1, STUN_SPORE
	db 1, MEGA_DRAIN
	db 1, SAFEGUARD
	db 1, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db 1, GIGA_DRAIN
	db 1, TOXIC
	db 1, HEAL_BELL
	db 1, MOONBLAST
	db 1, MEGA_DRAIN
	db 1, SUNNY_DAY
	db 1, STUN_SPORE
	db 1, SLEEP_POWDER
	db 39, QUIVER_DANCE
	db 54, PETAL_DANCE
	db 59, SOLAR_BEAM
	db 0 ; no more level-up moves

MarillEvosAttacks:
	db EVOLVE_LEVEL, 18, AZUMARILL
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 5, WATER_GUN
	db 7, LEER_TAIL_WHIP
	db 10, AQUA_JET
	db 13, DEFENSE_CURL_HARDEN_WITHDRAW
	db 13, ROLLOUT
	db 16, BUBBLE_BEAM
	db 20, CHARM_FEATHER_DANCE
	db 23, AQUA_TAIL
	db 28, PLAY_ROUGH
	db 31, RAIN_DANCE
	db 37, DOUBLE_EDGE
	db 40, SUPERPOWER
	db 47, HYDRO_PUMP
	db 0 ; no more level-up moves

AzumarillEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, WATER_GUN
	db 1, LEER_TAIL_WHIP
	db 1, AQUA_JET
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 1, ROLLOUT
	db 1, BUBBLE_BEAM
	db 21, CHARM_FEATHER_DANCE
	db 25, AQUA_TAIL
	db 31, PLAY_ROUGH
	db 35, RAIN_DANCE
	db 42, DOUBLE_EDGE
	db 46, SUPERPOWER
	db 55, HYDRO_PUMP
	db 0 ; no more level-up moves

SudowoodoEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 5, FLAIL
	db 8, LOW_KICK
	db 12, ROCK_THROW
	db 15, MIMIC
	db 19, FEINT_ATTACK
	db 22, BODY_SLAM
	db 26, ROLLOUT
	db 29, MEAN_LOOK_BLOCK_SPIDER_WEB
	db 33, ROCK_SLIDE
	db 36, REVERSAL
	db 40, SUCKER_PUNCH
	db 43, DOUBLE_EDGE
	db 47, STONE_EDGE
	db 50, WOOD_HAMMER
	db 0 ; no more level-up moves

PolitoedEvosAttacks:
	db 0 ; no more evolutions
	db 1, EARTH_POWER
	db 1, HYDRO_PUMP
	db 1, DYNAMICPUNCH
	db 1, WATER_GUN
	db 1, SING_HYPNOSIS
	db 1, TACKLE_SCRATCH_POUND
	db 1, MUD_SLAP
	db 1, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 1, RAIN_DANCE
	db 1, BUBBLE_BEAM
	db 1, BODY_SLAM
	db 1, BELLY_DRUM
	db 37, SWAGGER
	db 43, ACROBATICS
	db 48, HYPER_VOICE
	db 0 ; no more level-up moves

WooperEvosAttacks:
	db EVOLVE_LEVEL, 20, QUAGSIRE
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, LEER_TAIL_WHIP
	db 8, MUD_SLAP
	db 12, HAZE
	db 15, BODY_SLAM
	db 19, EARTH_POWER
	db 23, RAIN_DANCE
	db 26, AQUA_TAIL
	db 30, ENCORE
	db 34, AMNESIA
	db 37, EARTHQUAKE
	db 41, TOXIC
	db 45, HYDRO_PUMP
	db 0 ; no more level-up moves

QuagsireEvosAttacks:
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, LEER_TAIL_WHIP
	db 1, MUD_SLAP
	db 1, HAZE
	db 1, BODY_SLAM
	db 1, EARTH_POWER
	db 24, RAIN_DANCE
	db 28, AQUA_TAIL
	db 33, ENCORE
	db 38, AMNESIA
	db 42, EARTHQUAKE
	db 47, TOXIC
	db 51, HYDRO_PUMP
	db 0 ; no more level-up moves

EspeonEvosAttacks:
	db 0 ; no more evolutions
	db 1, CONFUSION
	db 1, GROWL
	db 1, TACKLE_SCRATCH_POUND
	db 5, LEER_TAIL_WHIP
	db 9, SAND_ATTACK_SMOKESCREEN
	db 13, QUICK_ATTACK
	db 17, SWIFT
	db 20, PSYBEAM
	db 25, FUTURE_SIGHT
	db 29, REFLECT
	db 33, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db 37, PSYCHIC
	db 41, DOUBLE_EDGE
	db 45, CALM_MIND
	db 0 ; no more level-up moves

UmbreonEvosAttacks:
	db 0 ; no more evolutions
	db 1, PURSUIT
	db 1, GROWL
	db 1, TACKLE_SCRATCH_POUND
	db 5, LEER_TAIL_WHIP
	db 9, SAND_ATTACK_SMOKESCREEN
	db 13, QUICK_ATTACK
	db 17, BITE
	db 20, CONFUSE_RAY
	db 25, FEINT_ATTACK
	db 29, SCREECH
	db 33, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db 37, MEAN_LOOK_BLOCK_SPIDER_WEB
	db 41, DOUBLE_EDGE
	db 45, DARK_PULSE
	db 0 ; no more level-up moves

MurkrowEvosAttacks:
	db EVOLVE_ITEM, DUSK_STONE, HONCHKROW
	db 0 ; no more evolutions
	db 1, PECK
	db 1, LEER_TAIL_WHIP
	db 5, PURSUIT
	db 11, HAZE
	db 15, WING_ATTACK
	db 21, NIGHT_SHADE
	db 25, FEINT_ATTACK
	db 31, TAUNT
	db 35, MEAN_LOOK_BLOCK_SPIDER_WEB
	db 41, DRILL_PECK
	db 45, MIRROR_MOVE
	db 51, SUCKER_PUNCH
	db 55, PERISH_SONG
	db 0 ; no more level-up moves

SlowkingEvosAttacks:
	db 0 ; no more evolutions
	db 1, POWER_GEM
	db 1, REST
	db 1, TACKLE_SCRATCH_POUND
	db 1, CURSE
	db 1, GROWL
	db 1, WATER_GUN
	db 11, SING_HYPNOSIS
	db 15, CONFUSION
	db 18, DISABLE
	db 22, HEADBUTT
	db 25, BUBBLE_BEAM
	db 29, ZEN_HEADBUTT
	db 32, NASTY_PLOT
	db 36, SWAGGER
	db 39, PSYCHIC_M
	db 43, RAIN_DANCE
	db 46, SAFEGUARD
	db 0 ; no more level-up moves

PinecoEvosAttacks:
	db EVOLVE_LEVEL, 31, FORRETRESS
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, PROTECT
	db 6, SELFDESTRUCT
	db 9, ROCK_SMASH
	db 12, TAKE_DOWN
	db 16, RAPID_SPIN
	db 20, ROLLOUT
	db 23, CURSE
	db 28, SPIKES
	db 31, PIN_MISSILE
	db 34, EXPLOSION
	db 39, BARRIER_IRON_DEFENSE_ACID_ARMOR
	db 42, GYRO_BALL
	db 45, DOUBLE_EDGE
	db 0 ; no more level-up moves

ForretressEvosAttacks:
	db 0 ; no more evolutions
	db 1, BODY_SLAM
	db 1, TACKLE_SCRATCH_POUND
	db 1, PROTECT
	db 1, SELFDESTRUCT
	db 1, ROCK_SMASH
	db 1, TAKE_DOWN
	db 1, RAPID_SPIN
	db 1, ROLLOUT
	db 1, CURSE
	db 1, SPIKES
	db 32, PIN_MISSILE
	db 36, EXPLOSION
	db 42, BARRIER_IRON_DEFENSE_ACID_ARMOR
	db 46, GYRO_BALL
	db 50, DOUBLE_EDGE
	db 0 ; no more level-up moves

GligarEvosAttacks:
	db EVOLVE_HOLDING_NITE, RAZOR_FANG, GLISCOR
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 4, SAND_ATTACK_SMOKESCREEN
	db 7, DEFENSE_CURL_HARDEN_WITHDRAW
	db 10, KNOCK_OFF
	db 13, QUICK_ATTACK
	db 16, FURY_CUTTER
	db 19, FEINT_ATTACK
	db 22, ACROBATICS
	db 27, SLASH
	db 30, REVERSAL
	db 35, SCREECH
	db 40, X_SCISSOR
	db 45, BRICK_BREAK
	db 50, SWORDS_DANCE
	db 0 ; no more level-up moves

SteelixEvosAttacks:
	db 0 ; no more evolutions
	db 1, CRUNCH
	db 1, THUNDER_FANG
	db 1, ICE_FANG
	db 1, FIRE_FANG
	db 1, TACKLE_SCRATCH_POUND
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 4, RAGE
	db 7, ROCK_THROW
	db 10, CURSE
	db 14, ROLLOUT
	db 17, AGILITY_ROCK_POLISH
	db 21, GYRO_BALL
	db 25, BULLDOZE
	db 28, DRAGONBREATH
	db 31, BODY_SLAM
	db 34, SCREECH
	db 37, ROCK_SLIDE
	db 40, IRON_TAIL
	db 44, DIG
	db 47, STONE_EDGE
	db 50, DOUBLE_EDGE
	db 54, SANDSTORM
	db 0 ; no more level-up moves

SnubbullEvosAttacks:
	db EVOLVE_LEVEL, 23, GRANBULL
	db 0 ; no more evolutions
	db 1, ICE_FANG
	db 1, FIRE_FANG
	db 1, THUNDER_FANG
	db 1, TACKLE_SCRATCH_POUND
	db 1, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 1, LEER_TAIL_WHIP
	db 1, CHARM_FEATHER_DANCE
	db 7, BITE
	db 13, TAUNT
	db 19, HEADBUTT
	db 25, ROAR_WHIRLWIND
	db 31, RAGE
	db 37, PLAY_ROUGH
	db 43, SUCKER_PUNCH
	db 49, CRUNCH
	db 0 ; no more level-up moves

GranbullEvosAttacks:
	db 0 ; no more evolutions
	db 1, ICE_FANG
	db 1, FIRE_FANG
	db 1, THUNDER_FANG
	db 1, TACKLE_SCRATCH_POUND
	db 1, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 1, LEER_TAIL_WHIP
	db 1, CHARM_FEATHER_DANCE
	db 1, BITE
	db 1, TAUNT
	db 1, HEADBUTT
	db 27, ROAR_WHIRLWIND
	db 35, RAGE
	db 43, PLAY_ROUGH
	db 51, SUCKER_PUNCH
	db 59, CRUNCH
	db 67, OUTRAGE
	db 0 ; no more level-up moves

ScizorEvosAttacks:
	db 0 ; no more evolutions
	db 1, BULLET_PUNCH
	db 1, WING_ATTACK
	db 1, QUICK_ATTACK
	db 1, LEER_TAIL_WHIP
	db 1, FOCUS_ENERGY
	db 1, PURSUIT
	db 14, FALSE_SWIPE
	db 19, AGILITY_ROCK_POLISH
	db 23, METAL_CLAW
	db 27, FURY_CUTTER
	db 32, SLASH
	db 36, DOUBLE_HIT
	db 40, BARRIER_IRON_DEFENSE_ACID_ARMOR
	db 45, X_SCISSOR
	db 49, NIGHT_SLASH
	db 53, AIR_SLASH
	db 58, SWORDS_DANCE
	db 0 ; no more level-up moves

ShuckleEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

HeracrossEvosAttacks:
	db 0 ; no more evolutions
	db 1, NIGHT_SLASH
	db 1, TACKLE_SCRATCH_POUND
	db 1, LEER_TAIL_WHIP
	db 1, HORN_ATTACK
	db 1, ENDURE
	db 10, ROCK_SMASH
	db 16, HEADBUTT
	db 19, WORK_UP_GROWTH
	db 25, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 28, BRICK_BREAK
	db 31, PIN_MISSILE
	db 34, THRASH
	db 37, SWORDS_DANCE
	db 43, REVERSAL
	db 46, MEGAHORN
	db 0 ; no more level-up moves

SneaselEvosAttacks:
	db EVOLVE_HOLDING_NITE, RAZOR_CLAW, WEAVILE
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, LEER_TAIL_WHIP
	db 1, TAUNT
	db 8, QUICK_ATTACK
	db 10, FEINT_ATTACK
	db 14, ICY_WIND
	db 16, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 20, AGILITY_ROCK_POLISH
	db 22, METAL_CLAW
	db 25, WORK_UP_GROWTH
	db 28, PURSUIT
	db 32, SCREECH
	db 35, SLASH
	db 40, TAUNT
	db 44, KNOCK_OFF
	db 47, ICE_SHARD
	db 0 ; no more level-up moves

TeddiursaEvosAttacks:
	db EVOLVE_LEVEL, 30, URSARING
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, GROWL
	db 1, BITE
	db 8, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 13, FEINT_ATTACK
	db 17, SWAGGER
	db 22, SLASH
	db 26, PLAY_ROUGH
	db 31, CHARM_FEATHER_DANCE
	db 35, REST
	db 35, SNORE
	db 40, THRASH
	db 0 ; no more level-up moves

UrsaringEvosAttacks:
	db 0 ; no more evolutions
	db 1, CHARM_FEATHER_DANCE
	db 1, TACKLE_SCRATCH_POUND
	db 1, GROWL
	db 1, BITE
	db 1, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 1, FEINT_ATTACK
	db 1, SWAGGER
	db 1, SLASH
	db 1, PLAY_ROUGH
	db 35, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 41, REST
	db 41, SNORE
	db 48, THRASH
	db 56, CROSS_CHOP
	db 0 ; no more level-up moves

SlugmaEvosAttacks:
	db EVOLVE_LEVEL, 38, MAGCARGO
	db 0 ; no more evolutions
	db 1, SAND_ATTACK_SMOKESCREEN
	db 1, SMOG
	db 6, EMBER
	db 8, ROCK_THROW
	db 13, DEFENSE_CURL_HARDEN_WITHDRAW
	db 15, FIRE_SPIN
	db 20, CLEAR_SMOG
	db 22, ANCIENTPOWER
	db 27, FLAME_CHARGE
	db 29, ROCK_SLIDE
	db 34, FLAME_BURST
	db 36, AMNESIA
	db 41, BODY_SLAM
	db 43, SOFTBOILED_MILK_DRINK_RECOVER
	db 48, FLAMETHROWER
	db 50, EARTH_POWER
	db 0 ; no more level-up moves

MagcargoEvosAttacks:
	db 0 ; no more evolutions
	db 1, SHELL_SMASH
	db 1, SAND_ATTACK_SMOKESCREEN
	db 1, SMOG
	db 1, EMBER
	db 1, ROCK_THROW
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 1, FIRE_SPIN
	db 1, CLEAR_SMOG
	db 1, ANCIENTPOWER
	db 1, FLAME_CHARGE
	db 1, ROCK_SLIDE
	db 1, FLAME_BURST
	db 1, AMNESIA
	db 43, BODY_SLAM
	db 47, SOFTBOILED_MILK_DRINK_RECOVER
	db 54, FLAMETHROWER
	db 58, EARTH_POWER
	db 0 ; no more level-up moves

SwinubEvosAttacks:
	db EVOLVE_LEVEL, 33, PILOSWINE
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	db 5, SAND_ATTACK_SMOKESCREEN
	db 8, ICE_SHARD
	db 11, MUD_SLAP
	db 14, ENDURE
	db 18, HAIL
	db 21, ICY_WIND
	db 24, MAGNITUDE
	db 28, TAKE_DOWN
	db 35, HAZE
	db 37, EARTHQUAKE
	db 40, FLAIL
	db 44, BLIZZARD
	db 48, AMNESIA
	db 0 ; no more level-up moves

PiloswineEvosAttacks:
	db EVOLVE_MOVE, ANCIENTPOWER, MAMOSWINE
	db 0 ; no more evolutions
	db 1, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 1, ANCIENTPOWER
	db 1, FLAIL
	db 1, PECK
	db 1, TACKLE_SCRATCH_POUND
	db 1, FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	db 1, SAND_ATTACK_SMOKESCREEN
	db 1, ICE_SHARD
	db 1, MUD_SLAP
	db 1, ENDURE
	db 1, HAIL
	db 1, ICY_WIND
	db 1, MAGNITUDE
	db 1, TAKE_DOWN
	db 37, HAZE
	db 41, EARTHQUAKE
	db 46, THRASH
	db 52, BLIZZARD
	db 58, AMNESIA
	db 0 ; no more level-up moves

CorsolaEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 4, DEFENSE_CURL_HARDEN_WITHDRAW
	db 8, WATER_GUN
	db 10, SOFTBOILED_MILK_DRINK_RECOVER
	db 13, PROTECT
	db 17, ANCIENTPOWER
	db 20, BUBBLE_BEAM
	db 23, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 27, SAFEGUARD
	db 29, BARRIER_IRON_DEFENSE_ACID_ARMOR
	db 31, ROCK_BLAST
	db 35, ENDURE
	db 38, SCALD
	db 41, POWER_GEM
	db 45, EARTH_POWER
	db 48, FLAIL
	db 0 ; no more level-up moves

SkarmoryEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

HoundourEvosAttacks:
	db EVOLVE_LEVEL, 24, HOUNDOOM
	db 0 ; no more evolutions
	db 1, LEER_TAIL_WHIP
	db 1, EMBER
	db 4, SHARPEN_HOWL_MEDITATE
	db 8, SMOG
	db 13, ROAR_WHIRLWIND
	db 16, BITE
	db 20, FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	db 25, FIRE_FANG
	db 28, FEINT_ATTACK
	db 32, SWAGGER
	db 37, FLAMETHROWER
	db 40, CRUNCH
	db 44, NASTY_PLOT
	db 49, FIRE_BLAST
	db 0 ; no more level-up moves

HoundoomEvosAttacks:
	db 0 ; no more evolutions
	db 1, THUNDER_FANG
	db 1, LEER_TAIL_WHIP
	db 1, EMBER
	db 1, SHARPEN_HOWL_MEDITATE
	db 1, SMOG
	db 13, ROAR_WHIRLWIND
	db 16, BITE
	db 20, FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	db 26, FIRE_FANG
	db 30, FEINT_ATTACK
	db 35, SWAGGER
	db 41, FLAMETHROWER
	db 45, CRUNCH
	db 50, NASTY_PLOT
	db 56, FIRE_BLAST
	db 0 ; no more level-up moves

KingdraEvosAttacks:
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, LEER_TAIL_WHIP
	db 1, SAND_ATTACK_SMOKESCREEN
	db 1, TWISTER
	db 1, DRAGONBREATH
	db 1, BUBBLE_BEAM
	db 1, FOCUS_ENERGY
	db 1, FLAIL
	db 37, AGILITY_ROCK_POLISH
	db 43, DRAGON_PULSE
	db 49, HYDRO_PUMP
	db 55, DRAGON_DANCE
	db 61, RAIN_DANCE
	db 0 ; no more level-up moves

PhanpyEvosAttacks:
	db EVOLVE_LEVEL, 25, DONPHAN
	db 0 ; no more evolutions
	db 1, FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	db 1, TACKLE_SCRATCH_POUND
	db 1, GROWL
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 6, FLAIL
	db 10, ROLLOUT
	db 15, ENDURE
	db 19, MAGNITUDE
	db 24, RAPID_SPIN
	db 28, TAKE_DOWN
	db 33, CHARM_FEATHER_DANCE
	db 37, EARTHQUAKE
	db 42, DOUBLE_EDGE
	db 0 ; no more level-up moves

DonphanEvosAttacks:
	db 0 ; no more evolutions
	db 1, FIRE_FANG
	db 1, THUNDER_FANG
	db 1, HORN_ATTACK
	db 1, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 1, FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	db 1, CHARM_FEATHER_DANCE
	db 1, TAKE_DOWN
	db 1, DOUBLE_EDGE
	db 1, TACKLE_SCRATCH_POUND
	db 1, GROWL
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 1, FLAIL
	db 1, ROLLOUT
	db 1, ENDURE
	db 1, MAGNITUDE
	db 1, RAPID_SPIN
	db 31, KNOCK_OFF
	db 36, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 37, EARTHQUAKE
	db 42, GIGA_IMPACT
	db 0 ; no more level-up moves

Porygon2EvosAttacks:
	db EVOLVE_HOLDING, DUBIOUS_DISC, PORYGON_Z
	db 0 ; no more evolutions
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 1, TACKLE_SCRATCH_POUND
	db 1, SHARPEN_HOWL_MEDITATE
	db 7, CONVERSION
	db 12, THUNDERSHOCK
	db 16, PSYBEAM
	db 21, CONVERSION2
	db 25, SWIFT
	db 30, AGILITY_ROCK_POLISH
	db 34, SIGNAL_BEAM
	db 39, SOFTBOILED_MILK_DRINK_RECOVER
	db 43, THUNDERBOLT
	db 48, TRI_ATTACK
	db 52, LOCK_ON_MIND_READER
	db 57, ZAP_CANNON
	db 0 ; no more level-up moves

StantlerEvosAttacks:
	db EVOLVE_LOCATION, ROUTE_10, WYRDEER
	db EVOLVE_LOCATION, TWINKLE_TOWN, WYRDEER
	db EVOLVE_LOCATION, FROZEN_RUINS, WYRDEER
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 3, LEER_TAIL_WHIP
	db 7, DISABLE
	db 10, SING_HYPNOSIS
	db 13, STOMP
	db 16, SAND_ATTACK_SMOKESCREEN
	db 21, TAKE_DOWN
	db 23, CONFUSE_RAY
	db 27, CALM_MIND
	db 33, SUBSTITUTE
	db 38, ZEN_HEADBUTT
	db 43, JUMP_KICK
	db 49, SWAGGER
	db 55, DOUBLE_EDGE
	db 0 ; no more level-up moves

SmeargleEvosAttacks:
	db 0 ; no more evolutions
	db 1, SKETCH
	db 11, SKETCH
	db 21, SKETCH
	db 31, SKETCH
	db 41, SKETCH
	db 51, SKETCH
	db 61, SKETCH
	db 71, SKETCH
	db 81, SKETCH
	db 91, SKETCH
	db 0 ; no more level-up moves

ElekidEvosAttacks:
	db EVOLVE_LEVEL, 30, ELECTABUZZ
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, LEER_TAIL_WHIP
	db 5, THUNDERSHOCK
	db 8, DOUBLE_TEAM
	db 12, SWIFT
	db 15, SHOCK_WAVE
	db 19, THUNDER_WAVE
	db 22, ELECTRO_BALL
	db 26, SCREECH
	db 29, THUNDERPUNCH
	db 33, LOW_KICK
	db 36, LIGHT_SCREEN
	db 40, THUNDERBOLT
	db 43, THUNDER
	db 0 ; no more level-up moves

MagbyEvosAttacks:
	db EVOLVE_LEVEL, 30, MAGMAR
	db 0 ; no more evolutions
	db 1, SMOG
	db 1, LEER_TAIL_WHIP
	db 5, EMBER
	db 8, SAND_ATTACK_SMOKESCREEN
	db 12, FEINT_ATTACK
	db 15, FIRE_SPIN
	db 19, CLEAR_SMOG
	db 22, FLAME_BURST
	db 26, CONFUSE_RAY
	db 29, FIRE_PUNCH
	db 33, LOW_KICK
	db 36, SUNNY_DAY
	db 40, FLAMETHROWER
	db 43, FIRE_BLAST
	db 0 ; no more level-up moves

MiltankEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 3, GROWL
	db 5, DEFENSE_CURL_HARDEN_WITHDRAW
	db 8, STOMP
	db 11, MUD_SLAP
	db 15, HEAL_BELL
	db 19, ROLLOUT
	db 23, HEADBUTT
	db 28, ZEN_HEADBUTT
	db 33, SOFTBOILED_MILK_DRINK_RECOVER
	db 38, BODY_SLAM
	db 44, PLAY_ROUGH
	db 50, CHARM_FEATHER_DANCE
	db 56, REVERSAL
	db 0 ; no more level-up moves
	
BlisseyEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

LarvitarEvosAttacks:
	db EVOLVE_LEVEL, 30, PUPITAR
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, LEER_TAIL_WHIP
	db 6, ROCK_THROW
	db 9, BITE
	db 12, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 15, MAGNITUDE
	db 18, ROCK_SLIDE
	db 21, SCREECH
	db 24, DIG
	db 27, CRUNCH
	db 31, STONE_EDGE
	db 33, EARTHQUAKE
	db 36, THRASH
	db 39, SANDSTORM
	db 42, HYPER_BEAM
	db 0 ; no more level-up moves

PupitarEvosAttacks:
	db EVOLVE_LEVEL, 55, TYRANITAR
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, LEER_TAIL_WHIP
	db 1, ROCK_THROW
	db 1, BITE
	db 1, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 1, MAGNITUDE
	db 1, ROCK_SLIDE
	db 1, SCREECH
	db 1, DIG
	db 1, CRUNCH
	db 33, STONE_EDGE
	db 37, EARTHQUAKE
	db 42, THRASH
	db 47, SANDSTORM
	db 52, HYPER_BEAM
	db 0 ; no more level-up moves

TyranitarEvosAttacks:
	db 0 ; no more evolutions
	db 1, BARRIER_IRON_DEFENSE_ACID_ARMOR
	db 1, THUNDER_FANG
	db 1, ICE_FANG
	db 1, FIRE_FANG
	db 1, TACKLE_SCRATCH_POUND
	db 1, LEER_TAIL_WHIP
	db 1, ROCK_THROW
	db 1, BITE
	db 1, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 1, MAGNITUDE
	db 1, ROCK_SLIDE
	db 1, SCREECH
	db 1, DIG
	db 1, CRUNCH
	db 1, STONE_EDGE
	db 1, EARTHQUAKE
	db 1, THRASH
	db 1, SANDSTORM
	db 1, HYPER_BEAM
	db 59, GIGA_IMPACT
	db 0 ; no more level-up moves
	
WingullEvosAttacks:
	db EVOLVE_LEVEL, 25, PELIPPER
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, WATER_GUN
	db 5, SUPERSONIC
	db 8, WING_ATTACK
	db 12, HAZE
	db 15, BUBBLE_BEAM
	db 19, QUICK_ATTACK
	db 22, AIR_SLASH
	db 26, PURSUIT
	db 29, TWISTER
	db 33, ROOST
	db 36, AIR_SLASH
	db 40, AGILITY_ROCK_POLISH
	db 43, HURRICANE
	db 0 ; no more level-up moves
	
PelipperEvosAttacks:
	db 0 ; no more evolutions
	db 1, PROTECT
	db 1, GROWL
	db 1, WATER_GUN
	db 1, SUPERSONIC
	db 1, WING_ATTACK
	db 1, HAZE
	db 1, BUBBLE_BEAM
	db 1, QUICK_ATTACK
	db 1, AIR_SLASH
	db 28, PURSUIT
	db 33, TWISTER
	db 39, ROOST
	db 44, AIR_SLASH
	db 50, AGILITY_ROCK_POLISH
	db 55, HURRICANE
	db 0 ; no more level-up moves
	
RaltsEvosAttacks:
	db EVOLVE_LEVEL, 20, KIRLIA
	db 0 ; no more evolutions
	db 1, GROWL
	db 4, CONFUSION
	db 8, DOUBLE_TEAM
	db 11, TELEPORT
	db 15, FAIRY_WIND
	db 17, SAFEGUARD
	db 21, WISH
	db 24, CALM_MIND
	db 28, PSYCHIC_M
	db 31, FUTURE_SIGHT
	db 35, CHARM_FEATHER_DANCE
	db 38, SING_HYPNOSIS
	db 42, DREAM_EATER
	db 45, MOONBLAST
	db 0 ; no more level-up moves
	
KirliaEvosAttacks:
	db EVOLVE_LEVEL, 30, GARDEVOIR
	db EVOLVE_ITEM_MALE, DAWN_STONE, GALLADE
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, CONFUSION
	db 1, DOUBLE_TEAM
	db 1, TELEPORT
	db 1, FAIRY_WIND
	db 1, SAFEGUARD
	db 22, WISH
	db 26, CALM_MIND
	db 30, PSYCHIC_M
	db 35, FUTURE_SIGHT
	db 39, CHARM_FEATHER_DANCE
	db 43, SING_HYPNOSIS
	db 48, DREAM_EATER
	db 52, MOONBLAST
	db 0 ; no more level-up moves
	
GardevoirEvosAttacks:
	db 0 ; no more evolutions
	db 1, DAZZLINGLEAM
	db 1, GROWL
	db 1, CONFUSION
	db 1, DOUBLE_TEAM
	db 1, TELEPORT
	db 1, FAIRY_WIND
	db 1, SAFEGUARD
	db 1, WISH
	db 1, CALM_MIND
	db 1, PSYCHIC_M
	db 36, FUTURE_SIGHT
	db 42, CHARM_FEATHER_DANCE
	db 48, SING_HYPNOSIS
	db 54, DREAM_EATER
	db 60, MOONBLAST
	db 0 ; no more level-up moves
	
ShroomishEvosAttacks:
	db EVOLVE_LEVEL, 23, BRELOOM
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, TACKLE_SCRATCH_POUND
	db 5, STUN_SPORE
	db 8, LEECH_SEED
	db 12, MEGA_DRAIN
	db 15, HEADBUTT
	db 19, POISONPOWDER
	db 22, ENDURE
	db 26, GIGA_DRAIN
	db 29, WORK_UP_GROWTH
	db 33, TOXIC
	db 36, BULLET_SEED
	db 40, SPORE
	db 0 ; no more level-up moves
	
BreloomEvosAttacks:
	db 0 ; no more evolutions
	db 1, GIGA_DRAIN
	db 1, TOXIC
	db 1, WORK_UP_GROWTH
	db 1, MACH_PUNCH
	db 1, ABSORB
	db 1, TACKLE_SCRATCH_POUND
	db 1, STUN_SPORE
	db 1, LEECH_SEED
	db 1, MEGA_DRAIN
	db 1, HEADBUTT
	db 1, POISONPOWDER
	db 1, ENDURE
	db 28, REVERSAL
	db 33, LOCK_ON_MIND_READER
	db 39, DRAIN_PUNCH
	db 44, BULLET_SEED
	db 50, DYNAMICPUNCH
	db 0 ; no more level-up moves

AronEvosAttacks:
	db EVOLVE_LEVEL, 32, LAIRON
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 4, MUD_SLAP
	db 7, HEADBUTT
	db 10, ROCK_THROW
	db 13, METAL_CLAW
	db 16, PROTECT
	db 19, ROAR_WHIRLWIND
	db 22, ROCK_SLIDE
	db 25, FLASH_CANNON
	db 28, TAKE_DOWN
	db 31, SCREECH
	db 34, BARRIER_IRON_DEFENSE_ACID_ARMOR
	db 37, IRON_TAIL
	db 40, DOUBLE_EDGE
	db 43, AGILITY_ROCK_POLISH
	db 46, SUPERPOWER
	db 0 ; no more level-up moves
	
LaironEvosAttacks:
	db EVOLVE_LEVEL, 42, AGGRON
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 1, MUD_SLAP
	db 1, HEADBUTT
	db 1, ROCK_THROW
	db 1, METAL_CLAW
	db 1, PROTECT
	db 1, ROAR_WHIRLWIND
	db 1, ROCK_SLIDE
	db 1, FLASH_CANNON
	db 1, TAKE_DOWN
	db 1, SCREECH
	db 35, BARRIER_IRON_DEFENSE_ACID_ARMOR
	db 39, IRON_TAIL
	db 43, DOUBLE_EDGE
	db 47, AGILITY_ROCK_POLISH
	db 51, SUPERPOWER
	db 0 ; no more level-up moves
	
AggronEvosAttacks: 
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 1, MUD_SLAP
	db 1, HEADBUTT
	db 1, ROCK_THROW
	db 1, METAL_CLAW
	db 1, PROTECT
	db 1, ROAR_WHIRLWIND
	db 1, ROCK_SLIDE
	db 1, FLASH_CANNON
	db 1, TAKE_DOWN
	db 1, SCREECH
	db 1, BARRIER_IRON_DEFENSE_ACID_ARMOR
	db 1, IRON_TAIL
	db 45, DOUBLE_EDGE
	db 51, AGILITY_ROCK_POLISH
	db 57, SUPERPOWER
	db 0 ; no more level-up moves
	
MedititeEvosAttacks:
	db EVOLVE_LEVEL, 37, MEDICHAM
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 4, SHARPEN_HOWL_MEDITATE
	db 8, CONFUSION
	db 11, PROTECT
	db 15, ENDURE
	db 18, LOW_KICK
	db 22, FAKE_OUT
	db 25, LOCK_ON_MIND_READER
	db 29, HI_JUMP_KICK
	db 32, CALM_MIND
	db 36, FUTURE_SIGHT
	db 39, SOFTBOILED_MILK_DRINK_RECOVER
	db 43, REVERSAL
	db 46, DRAIN_PUNCH
	db 0 ; no more level-up moves
	
MedichamEvosAttacks:
	db 0 ; no more evolutions
	db 1, FIRE_PUNCH
	db 1, ICE_PUNCH
	db 1, THUNDERPUNCH
	db 1, ZEN_HEADBUTT
	db 1, TACKLE_SCRATCH_POUND
	db 1, SHARPEN_HOWL_MEDITATE
	db 1, CONFUSION
	db 1, PROTECT
	db 1, ENDURE
	db 1, LOW_KICK
	db 1, FAKE_OUT
	db 1, LOCK_ON_MIND_READER
	db 1, HI_JUMP_KICK
	db 1, CALM_MIND
	db 1, FUTURE_SIGHT
	db 42, SOFTBOILED_MILK_DRINK_RECOVER
	db 49, REVERSAL
	db 55, DRAIN_PUNCH
	db 0 ; no more level-up moves
	
CarvanhaEvosAttacks:
	db EVOLVE_LEVEL, 30, SHARPEDO
	db 0 ; no more evolutions
	db 1, LEER_TAIL_WHIP
	db 1, PURSUIT
	db 4, RAGE
	db 8, FOCUS_ENERGY
	db 11, AQUA_JET
	db 15, BITE
	db 18, SCREECH
	db 22, SWAGGER
	db 25, ICE_FANG
	db 29, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 32, POISON_FANG
	db 36, CRUNCH
	db 39, AGILITY_ROCK_POLISH
	db 43, TAKE_DOWN
	db 0 ; no more level-up moves
	
SharpedoEvosAttacks:
	db 0 ; no more evolutions
	db 1, SLASH
	db 1, LEER_TAIL_WHIP
	db 1, PURSUIT
	db 1, RAGE
	db 1, FOCUS_ENERGY
	db 1, AQUA_JET
	db 1, BITE
	db 1, SCREECH
	db 1, SWAGGER
	db 1, ICE_FANG
	db 1, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 33, POISON_FANG
	db 38, CRUNCH
	db 42, AGILITY_ROCK_POLISH
	db 47, DOUBLE_EDGE
	db 51, TAUNT
	db 56, NIGHT_SLASH
	db 0 ; no more level-up moves
	
NumelEvosAttacks:
	db EVOLVE_LEVEL, 33, CAMERUPT
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, GROWL
	db 5, EMBER
	db 8, FOCUS_ENERGY
	db 12, MAGNITUDE
	db 15, FIRE_SPIN
	db 19, AMNESIA
	db 22, FLAME_BURST
	db 26, EARTH_POWER
	db 29, CURSE
	db 33, TAKE_DOWN
	db 36, FLAMETHROWER
	db 40, EARTHQUAKE
	db 43, DOUBLE_EDGE
	db 0 ; no more level-up moves
	
CameruptEvosAttacks:
	db 0 ; no more evolutions
	db 1, ROCK_SLIDE
	db 1, TACKLE_SCRATCH_POUND
	db 1, GROWL
	db 1, EMBER
	db 1, FOCUS_ENERGY
	db 1, MAGNITUDE
	db 1, FIRE_SPIN
	db 1, AMNESIA
	db 1, FLAME_BURST
	db 1, EARTH_POWER
	db 1, CURSE
	db 35, TAKE_DOWN
	db 40, FLAMETHROWER
	db 46, EARTHQUAKE
	db 51, DOUBLE_EDGE
	db 0 ; no more level-up moves
	
CacneaEvosAttacks:
	db EVOLVE_LEVEL, 32, CACTURNE
	db  0 ; no more evolutions
	db  1, TACKLE_SCRATCH_POUND
	db  0 ; no more level-up moves
	
CacturneEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
SwabluEvosAttacks:
	db EVOLVE_LEVEL, 35, ALTARIA
	db 0 ; no more evolutions
	db 1, PECK
	db 1, GROWL
	db 4, SING_HYPNOSIS
	db 7, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 10, SAFEGUARD
	db 13, FAIRY_WIND
	db 16, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 19, DRAGONBREATH
	db 22, HAZE
	db 25, TAKE_DOWN
	db 28, HEAL_BELL
	db 31, MIRROR_MOVE
	db 34, COTTON_GUARD
	db 37, DRAGON_PULSE
	db 40, PERISH_SONG
	db 43, MOONBLAST
	db 0 ; no more level-up moves
	
AltariaEvosAttacks:
	db 0 ; no more evolutions
	db 1, HURRICANE
	db 1, PECK
	db 1, GROWL
	db 1, SING_HYPNOSIS
	db 1, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 1, SAFEGUARD
	db 1, FAIRY_WIND
	db 1, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 1, DRAGONBREATH
	db 1, HAZE
	db 1, TAKE_DOWN
	db 1, HEAL_BELL
	db 1, MIRROR_MOVE
	db 1, COTTON_GUARD
	db 40, DRAGON_PULSE
	db 46, PERISH_SONG
	db 52, MOONBLAST
	db 0 ; no more level-up moves
	
SnoruntEvosAttacks:
	db EVOLVE_LEVEL, 42, GLALIE
	db EVOLVE_ITEM_FEMALE, DAWN_STONE, FROSLASS
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, LEER_TAIL_WHIP
	db 5, DOUBLE_TEAM
	db 10, ICE_SHARD
	db 14, ICY_WIND
	db 19, BITE
	db 23, ICE_FANG
	db 28, HEADBUTT
	db 34, PROTECT
	db 37, ICICLE_CRASH
	db 41, CRUNCH
	db 46, BLIZZARD
	db 50, HAIL
	db 0 ; no more level-up moves
	
GlalieEvosAttacks:
	db 0 ; no more evolutions
	db 1, ICE_BEAM
	db 1, TACKLE_SCRATCH_POUND
	db 1, LEER_TAIL_WHIP
	db 1, DOUBLE_TEAM
	db 1, ICE_SHARD
	db 1, ICY_WIND
	db 1, BITE
	db 1, AURORA_BEAM
	db 1, HEADBUTT
	db 1, PROTECT
	db 1, ICICLE_CRASH
	db 1, CRUNCH
	db 48, BLIZZARD
	db 54, HAIL
	db 0 ; no more level-up moves
	
BuizelEvosAttacks:
	db EVOLVE_LEVEL, 26, FLOATZEL
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 4, GROWL
	db 7, LEER_TAIL_WHIP
	db 11, WATER_GUN
	db 15, QUICK_ATTACK
	db 18, PURSUIT
	db 21, SWIFT
	db 24, AQUA_JET
	db 27, DOUBLE_HIT
	db 31, SLASH
	db 35, AQUA_TAIL
	db 38, HEADBUTT
	db 41, AGILITY_ROCK_POLISH
	db 45, HYDRO_PUMP
	db 0 ; no more level-up moves
	
FloatzelEvosAttacks:
	db 0 ; no more evolutions
	db 1, ICE_FANG
	db 1, HEADBUTT
	db 1, TACKLE_SCRATCH_POUND
	db 1, GROWL
	db 1, LEER_TAIL_WHIP
	db 1, WATER_GUN
	db 1, QUICK_ATTACK
	db 1, PURSUIT
	db 1, SWIFT
	db 1, AQUA_JET
	db 29, DOUBLE_HIT
	db 35, SLASH
	db 41, AQUA_TAIL
	db 46, CRUNCH
	db 51, AGILITY_ROCK_POLISH
	db 57, HYDRO_PUMP
	db 0 ; no more level-up moves
	
DrifloonEvosAttacks:
	db EVOLVE_LEVEL, 28, DRIFBLIM
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
DrifblimEvosAttacks:
	db 0 ; no more evolutions
	db 1, FLAMETHROWER
	db 0 ; no more level-up moves
	
BunearyEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, LOPUNNY
LopunnyEvosAttacks:
	db 0 ; no more evolutions
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 1, TRANSFORM_SPLASH
	db 1, TACKLE_SCRATCH_POUND
	db 1, FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	db 6, ENDURE
	db 13, GROWL
	db 16, QUICK_ATTACK
	db 23, JUMP_KICK
	db 26, BATON_PASS
	db 33, AGILITY_ROCK_POLISH
	db 36, DOUBLE_HIT
	db 43, CHARM_FEATHER_DANCE
	db 46, ATTRACT
	db 53, ACROBATICS
	db 56, HI_JUMP_KICK
	db 0 ; no more level-up moves
	
HonchkrowEvosAttacks:
	db 0 ; no more evolutions
	db 1, SUCKER_PUNCH
	db 1, PECK
	db 1, LEER_TAIL_WHIP
	db 1, PURSUIT
	db 1, HAZE
	db 15, WING_ATTACK
	db 21, NIGHT_SHADE
	db 25, FEINT_ATTACK
	db 31, TAUNT
	db 35, MEAN_LOOK_BLOCK_SPIDER_WEB
	db 41, DRILL_PECK
	db 45, MIRROR_MOVE
	db 51, NIGHT_SLASH
	db 55, PERISH_SONG
	db 61, DARK_PULSE
	db 0 ; no more level-up moves
	
SpiritombEvosAttacks:
	db 0 ; no more evolutions
	db 1, NIGHT_SHADE
	db 1, CONFUSE_RAY
	db 5, PURSUIT
	db 10, DISABLE
	db 15, HEX
	db 20, CURSE
	db 25, FEINT_ATTACK
	db 30, SING_HYPNOSIS
	db 35, DREAM_EATER
	db 40, SUCKER_PUNCH
	db 45, SHADOW_BALL
	db 50, NASTY_PLOT
	db 55, DARK_PULSE
	db 0 ; no more level-up moves
	
MunchlaxEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, SNORLAX
	db 0 ; no more evolutions
	db 1, METRONOME
	db 1, FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	db 1, TACKLE_SCRATCH_POUND
	db 4, DEFENSE_CURL_HARDEN_WITHDRAW
	db 9, AMNESIA
	db 12, BITE
	db 17, HEADBUTT
	db 20, SCREECH
	db 25, BODY_SLAM
	db 28, REST
	db 28, SNORE
	db 33, WORK_UP_GROWTH
	db 35, FLAIL
	db 36, ROLLOUT
	db 41, MEAN_LOOK_BLOCK_SPIDER_WEB
	db 44, BELLY_DRUM
	db 49, CRUNCH
	db 0 ; no more level-up moves
	
RioluEvosAttacks:
	db EVOLVE_HAPPINESS, TR_MORNDAY, LUCARIO
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
LucarioEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
CroagunkEvosAttacks:
	db EVOLVE_LEVEL, 37, TOXICROAK
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 3, MUD_SLAP
	db 8, POISON_STING
	db 10, TAUNT
	db 15, PURSUIT
	db 17, FEINT_ATTACK
	db 22, REVERSAL
	db 24, SWAGGER
	db 29, BULLDOZE
	db 31, SUCKER_PUNCH
	db 36, VENOSHOCK
	db 38, NASTY_PLOT
	db 43, POISON_JAB
	db 45, SLUDGE_BOMB
	db 0 ; no more level-up moves
	
ToxicroakEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, MUD_SLAP
	db 1, POISON_STING
	db 1, TAUNT
	db 1, PURSUIT
	db 1, FEINT_ATTACK
	db 1, REVERSAL
	db 1, SWAGGER
	db 1, BULLDOZE
	db 1, SUCKER_PUNCH
	db 1, VENOSHOCK
	db 41, NASTY_PLOT
	db 49, POISON_JAB
	db 54, SLUDGE_BOMB
	db 0 ; no more level-up moves
	
SnoverEvosAttacks:
	db EVOLVE_LEVEL, 40, ABOMASNOW
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, LEER_TAIL_WHIP
	db 5, RAZOR_LEAF
	db 9, ICY_WIND
	db 13, SING_HYPNOSIS
	db 17, SWAGGER
	db 21, HAZE
	db 26, ICE_SHARD
	db 31, LEECH_SEED
	db 36, ENERGY_BALL
	db 41, BLIZZARD
	db 46, WOOD_HAMMER
	db 0 ; no more level-up moves
	
AbomasnowEvosAttacks:
	db 0 ; no more evolutions
	db 1, ICE_PUNCH
	db 1, TACKLE_SCRATCH_POUND
	db 1, LEER_TAIL_WHIP
	db 1, RAZOR_LEAF
	db 1, ICY_WIND
	db 1, SING_HYPNOSIS
	db 1, SWAGGER
	db 1, HAZE
	db 1, ICE_SHARD
	db 1, LEECH_SEED
	db 1, ENERGY_BALL
	db 47, BLIZZARD
	db 58, WOOD_HAMMER
	db 0 ; no more level-up moves
	
WeavileEvosAttacks:
	db 0 ; no more evolutions
	db 1, ICE_SHARD
	db 1, SLASH
	db 1, AGILITY_ROCK_POLISH
	db 1, LOW_KICK
	db 1, TACKLE_SCRATCH_POUND
	db 1, LEER_TAIL_WHIP
	db 1, TAUNT
	db 1, QUICK_ATTACK
	db 10, FEINT_ATTACK
	db 14, ICY_WIND
	db 16, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 20, NASTY_PLOT
	db 22, METAL_CLAW
	db 25, WORK_UP_GROWTH
	db 28, PURSUIT
	db 32, SCREECH
	db 35, NIGHT_SLASH
	db 40, TAUNT
	db 44, KNOCK_OFF
	db 47, DARK_PULSE
	db 0 ; no more level-up moves
	
MagnezoneEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
ElectivireEvosAttacks:
	db 0 ; no more evolutions
	db 1, FIRE_PUNCH
	db 1, QUICK_ATTACK
	db 1, LEER_TAIL_WHIP
	db 1, THUNDERSHOCK
	db 1, DOUBLE_TEAM
	db 12, SWIFT
	db 15, SHOCK_WAVE
	db 19, THUNDER_WAVE
	db 22, ELECTRO_BALL
	db 26, SCREECH
	db 29, THUNDERPUNCH
	db 36, LOW_KICK
	db 42, LIGHT_SCREEN
	db 49, THUNDERBOLT
	db 55, THUNDER
	db 62, GIGA_IMPACT
	db 0 ; no more level-up moves
	
MagmortarEvosAttacks:
	db 0 ; no more evolutions
	db 1, THUNDERPUNCH
	db 1, SMOG
	db 1, LEER_TAIL_WHIP
	db 1, EMBER
	db 1, SAND_ATTACK_SMOKESCREEN
	db 12, FEINT_ATTACK
	db 15, FIRE_SPIN
	db 19, CLEAR_SMOG
	db 22, FLAME_BURST
	db 26, CONFUSE_RAY
	db 29, FIRE_PUNCH
	db 36, LOW_KICK
	db 42, SUNNY_DAY
	db 49, FLAMETHROWER
	db 55, FIRE_BLAST
	db 62, HYPER_BEAM
	db 0 ; no more level-up moves
	
TogekissEvosAttacks:
	db  0 ; no more evolutions
	db  1, ENERGY_BALL
	db  1, EXTREMESPEED
	db  1, AURA_SPHERE
	db  1, AIR_SLASH
	db  1, GROWL
	db  1, CHARM_FEATHER_DANCE
	db  1, METRONOME
	db  1, SING_HYPNOSIS
	db  1, FAIRY_WIND
	db  1, ENCORE
	db  1, SAFEGUARD
	db  1, WISH
	db  1, ANCIENTPOWER
	db  1, BATON_PASS
	db  1, HYPER_VOICE
	db  1, DOUBLE_EDGE
	db  0 ; no more level-up moves
	
LeafeonEvosAttacks:
	db 0 ; no more evolutions
	db 1, RAZOR_LEAF
	db 1, GROWL
	db 1, TACKLE_SCRATCH_POUND
	db 5, LEER_TAIL_WHIP
	db 9, SAND_ATTACK_SMOKESCREEN
	db 13, QUICK_ATTACK
	db 17, LEECH_SEED
	db 20, BULLET_SEED
	db 25, GIGA_DRAIN
	db 29, SWORDS_DANCE
	db 33, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db 37, SUNNY_DAY
	db 41, DOUBLE_EDGE
	db 45, POWER_WHIP
	db 0 ; no more level-up moves
	
GlaceonEvosAttacks:
	db 0 ; no more evolutions
	db 1, ICY_WIND
	db 1, GROWL
	db 1, TACKLE_SCRATCH_POUND
	db 5, LEER_TAIL_WHIP
	db 9, SAND_ATTACK_SMOKESCREEN
	db 13, QUICK_ATTACK
	db 17, BITE
	db 20, ICE_FANG
	db 25, ICE_SHARD
	db 29, BARRIER_IRON_DEFENSE_ACID_ARMOR
	db 33, SAFEGUARD
	db 37, HAIL
	db 41, DOUBLE_EDGE
	db 45, BLIZZARD
	db 0 ; no more level-up moves
	
GliscorEvosAttacks:
	db 0 ; no more evolutions
	db 1, THUNDER_FANG
	db 1, ICE_FANG
	db 1, FIRE_FANG
	db 1, POISON_JAB
	db 1, SLASH
	db 1, POISON_STING
	db 4, SAND_ATTACK_SMOKESCREEN
	db 7, DEFENSE_CURL_HARDEN_WITHDRAW
	db 10, KNOCK_OFF
	db 13, QUICK_ATTACK
	db 16, FURY_CUTTER
	db 19, FEINT_ATTACK
	db 22, ACROBATICS
	db 27, NIGHT_SLASH
	db 30, REVERSAL
	db 35, SCREECH
	db 40, X_SCISSOR
	db 45, BRICK_BREAK
	db 50, SWORDS_DANCE
	db 0 ; no more level-up moves
	
MamoswineEvosAttacks:
	db 0 ; no more evolutions
	db 1, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 1, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 1, ANCIENTPOWER
	db 1, FLAIL
	db 1, ICE_SHARD
	db 1, PECK
	db 1, TACKLE_SCRATCH_POUND
	db 1, FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	db 1, SAND_ATTACK_SMOKESCREEN
	db 1, ICE_SHARD
	db 1, MUD_SLAP
	db 1, ENDURE
	db 1, HAIL
	db 1, ICY_WIND
	db 1, MAGNITUDE
	db 1, TAKE_DOWN
	db 1, DOUBLE_HIT
	db 37, HAZE
	db 41, EARTHQUAKE
	db 46, THRASH
	db 52, BLIZZARD
	db 58, AMNESIA
	db 0 ; no more level-up moves
	
PorygonZEvosAttacks:
	db 0 ; no more evolutions
	db 1, NASTY_PLOT
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 1, TACKLE_SCRATCH_POUND
	db 1, SHARPEN_HOWL_MEDITATE
	db 1, CONVERSION
	db 12, THUNDERSHOCK
	db 16, PSYBEAM
	db 21, CONVERSION2
	db 25, SWIFT
	db 30, AGILITY_ROCK_POLISH
	db 34, SIGNAL_BEAM
	db 39, SOFTBOILED_MILK_DRINK_RECOVER
	db 43, THUNDERBOLT
	db 48, TRI_ATTACK
	db 52, LOCK_ON_MIND_READER
	db 57, ZAP_CANNON
	db 62, HYPER_BEAM
	db 0 ; no more level-up moves
	
GalladeEvosAttacks:
	db 0 ; no more evolutions
	db 1, SLASH
	db 1, GROWL
	db 1, CONFUSION
	db 1, DOUBLE_TEAM
	db 1, TELEPORT
	db 1, FAIRY_WIND
	db 1, FURY_CUTTER
	db 1, WISH
	db 1, CALM_MIND
	db 1, PSYCHIC_M
	db 1, FALSE_SWIPE
	db 36, SWORDS_DANCE
	db 42, ZEN_HEADBUTT
	db 48, PROTECT
	db 54, NIGHT_SLASH
	db 60, SUPERPOWER
	db 0 ; no more level-up moves
	
FroslassEvosAttacks:
	db 0 ; no more evolutions
	db 1, HEX
	db 1, TACKLE_SCRATCH_POUND
	db 1, LEER_TAIL_WHIP
	db 5, DOUBLE_TEAM
	db 10, ICE_SHARD
	db 14, ICY_WIND
	db 19, NIGHT_SHADE
	db 23, OMINOUS_WIND
	db 28, SUCKER_PUNCH
	db 32, CONFUSE_RAY
	db 37, WILL_O_WISP
	db 40, ATTRACT
	db 42, SHADOW_BALL
	db 48, BLIZZARD
	db 54, HAIL
	db 61, DESTINY_BOND
	db 0 ; no more level-up moves
	
DrilburEvosAttacks:
	db EVOLVE_LEVEL, 31, EXCADRILL
	db  0 ; no more evolutions
	db  1, TACKLE_SCRATCH_POUND
	db  0 ; no more level-up moves

ExcadrillEvosAttacks:
	db  0 ; no more evolutions
	db  1, TACKLE_SCRATCH_POUND
	db  0 ; no more level-up moves
	
VenipedeEvosAttacks:
	db EVOLVE_LEVEL, 22, WHIRLIPEDE
	db 0 ; no more evolutions
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 1, ROLLOUT
	db 5, POISON_STING
	db 8, SCREECH
	db 12, PURSUIT
	db 15, PROTECT
	db 19, POISON_FANG
	db 22, FURY_CUTTER
	db 26, VENOSHOCK
	db 29, AGILITY_ROCK_POLISH
	db 33, PIN_MISSILE
	db 36, TOXIC
	db 38, VENOSHOCK
	db 40, DOUBLE_EDGE
	db 0 ; no more level-up moves

WhirlipedeEvosAttacks:
	db EVOLVE_LEVEL, 30, SCOLIPEDE
	db 0 ; no more evolutions
	db 1, BARRIER_IRON_DEFENSE_ACID_ARMOR
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 1, ROLLOUT
	db 1, POISON_STING
	db 1, SCREECH
	db 1, PURSUIT
	db 1, PROTECT
	db 1, POISON_FANG
	db 1, FURY_CUTTER
	db 28, VENOSHOCK
	db 32, AGILITY_ROCK_POLISH
	db 37, PIN_MISSILE
	db 41, TOXIC
	db 43, VENOSHOCK
	db 46, DOUBLE_EDGE
	db 0 ; no more level-up moves

ScolipedeEvosAttacks:
	db 0 ; no more evolutions
	db 1, BATON_PASS
	db 1, BARRIER_IRON_DEFENSE_ACID_ARMOR
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 1, ROLLOUT
	db 1, POISON_STING
	db 1, SCREECH
	db 1, PURSUIT
	db 1, PROTECT
	db 1, POISON_FANG
	db 1, FURY_CUTTER
	db 1, VENOSHOCK
	db 33, AGILITY_ROCK_POLISH
	db 39, PIN_MISSILE
	db 44, TOXIC
	db 47, VENOSHOCK
	db 50, DOUBLE_EDGE
	db 55, MEGAHORN
	db 0 ; no more level-up moves
	
CottoneeEvosAttacks:
	db EVOLVE_ITEM, SUN_STONE, WHIMSICOTT
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, FAIRY_WIND
	db 4, WORK_UP_GROWTH
	db 8, LEECH_SEED
	db 10, STUN_SPORE
	db 13, MEGA_DRAIN
	db 15, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 18, RAZOR_LEAF
	db 22, POISONPOWDER
	db 26, GIGA_DRAIN
	db 28, CHARM_FEATHER_DANCE
	db 31, ENCORE
	db 35, ENERGY_BALL
	db 37, COTTON_GUARD
	db 40, SUNNY_DAY
	db 44, SOLAR_BEAM
	db 0 ; no more level-up moves
	
WhimsicottEvosAttacks:
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, FAIRY_WIND
	db 1, WORK_UP_GROWTH
	db 1, LEECH_SEED
	db 1, STUN_SPORE
	db 1, MEGA_DRAIN
	db 1, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 1, RAZOR_LEAF
	db 1, POISONPOWDER
	db 1, GIGA_DRAIN
	db 1, CHARM_FEATHER_DANCE
	db 1, ENCORE
	db 1, ENERGY_BALL
	db 1, COTTON_GUARD
	db 1, SUNNY_DAY
	db 1, SOLAR_BEAM
	db 28, AIR_SLASH
	db 44, HURRICANE
	db 50, MOONBLAST
	db 0 ; no more level-up moves
	
SandileEvosAttacks:
	db EVOLVE_LEVEL, 29, KROKOROK
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
KrokorokEvosAttacks:
	db EVOLVE_LEVEL, 40, KROOKODILE
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
KrookodileEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
MaractusEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
DwebbleEvosAttacks:
	db EVOLVE_LEVEL, 34, CRUSTLE
	db 0 ; no more evolutions
	db 1, SAND_ATTACK_SMOKESCREEN
	db 5, ROCK_THROW
	db 7, DEFENSE_CURL_HARDEN_WITHDRAW
	db 11, FURY_CUTTER
	db 13, FEINT_ATTACK
	db 17, ROCK_BLAST
	db 19, AGILITY_ROCK_POLISH
	db 23, METAL_CLAW
	db 25, SPIKES
	db 29, ROCK_SLIDE
	db 31, SLASH
	db 35, X_SCISSOR
	db 37, SHELL_SMASH
	db 41, FLAIL
	db 43, ROCK_WRECKER
	db 0 ; no more level-up moves
	
CrustleEvosAttacks:
	db  0 ; no more evolutions
	db 1, SAND_ATTACK_SMOKESCREEN
	db 1, ROCK_THROW
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 1, FURY_CUTTER
	db 1, FEINT_ATTACK
	db 1, ROCK_BLAST
	db 1, AGILITY_ROCK_POLISH
	db 1, METAL_CLAW
	db 1, SPIKES
	db 1, ROCK_SLIDE
	db 1, SLASH
	db 38, X_SCISSOR
	db 43, SHELL_SMASH
	db 50, FLAIL
	db 55, ROCK_WRECKER
	db  0 ; no more level-up moves
	
ScraggyEvosAttacks:
	db EVOLVE_LEVEL, 39, SCRAFTY
	db  0 ; no more evolutions
	db  1, TACKLE_SCRATCH_POUND
	db  0 ; no more level-up moves
	
ScraftyEvosAttacks:
	db  0 ; no more evolutions
	db  1, TACKLE_SCRATCH_POUND
	db  0 ; no more level-up moves
	
TirtougaEvosAttacks:
	db EVOLVE_LEVEL, 37, CARRACOSTA
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
CarracostaEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
ArchenEvosAttacks:
	db EVOLVE_LEVEL, 37, ARCHEOPS
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
ArcheopsEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
MinccinoEvosAttacks:
	db EVOLVE_LEVEL, 22, CINCCINO
	db  0 ; no more evolutions
	db  1, TACKLE_SCRATCH_POUND
	db  0 ; no more level-up moves

CinccinoEvosAttacks:
	db  0 ; no more evolutions
	db  1, TACKLE_SCRATCH_POUND
	db  0 ; no more level-up moves
	
JoltikEvosAttacks:
	db EVOLVE_LEVEL, 36, GALVANTULA
	db 0 ; no more evolutions
	db 1, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 1, ABSORB
	db 1, MEAN_LOOK_BLOCK_SPIDER_WEB
	db 4, THUNDER_WAVE
	db 7, SCREECH
	db 12, FURY_CUTTER
	db 15, SHOCK_WAVE
	db 18, PIN_MISSILE
	db 23, DISABLE
	db 26, SLASH
	db 29, ELECTRO_BALL
	db 34, SIGNAL_BEAM
	db 37, AGILITY_ROCK_POLISH
	db 40, SUCKER_PUNCH
	db 45, THUNDERBOLT
	db 48, BUG_BUZZ
	db 0 ; no more level-up moves
	
GalvantulaEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 1, ABSORB
	db 1, MEAN_LOOK_BLOCK_SPIDER_WEB
	db 1, THUNDER_WAVE
	db 1, SCREECH
	db 1, FURY_CUTTER
	db 1, SHOCK_WAVE
	db 1, PIN_MISSILE
	db 1, DISABLE
	db 1, SLASH
	db 1, ELECTRO_BALL
	db 1, SIGNAL_BEAM
	db 40, AGILITY_ROCK_POLISH
	db 46, SUCKER_PUNCH
	db 54, THUNDERBOLT
	db 60, BUG_BUZZ
	db 0 ; no more level-up moves
	
LitwickEvosAttacks:
	db EVOLVE_LEVEL, 41, LAMPENT
	db 0 ; no more evolutions
	db 1, EMBER
	db 1, SMOG
	db 4, MINIMIZE
	db 8, FIRE_SPIN
	db 12, CONFUSE_RAY
	db 16, NIGHT_SHADE
	db 20, WILL_O_WISP
	db 24, FLAME_BURST
	db 28, HAZE
	db 32, HEX
	db 36, ENDURE
	db 40, FLAMETHROWER
	db 44, CURSE
	db 48, SHADOW_BALL
	db 52, FIRE_BLAST
	db 0 ; no more level-up moves
	
LampentEvosAttacks:
	db EVOLVE_ITEM, DUSK_STONE, CHANDELURE
	db 0 ; no more evolutions
	db 1, EMBER
	db 1, SMOG
	db 1, MINIMIZE
	db 1, FIRE_SPIN
	db 1, CONFUSE_RAY
	db 1, NIGHT_SHADE
	db 1, WILL_O_WISP
	db 1, FLAME_BURST
	db 1, HAZE
	db 1, HEX
	db 1, ENDURE
	db 1, FLAMETHROWER
	db 46, CURSE
	db 52, SHADOW_BALL
	db 58, FIRE_BLAST
	db 0 ; no more level-up moves
	
ChandelureEvosAttacks:
	db 0 ; no more evolutions
	db 1, SMOG
	db 1, CONFUSE_RAY
	db 1, FLAME_BURST
	db 1, HEX
	db 0 ; no more level-up moves
	
LarvestaEvosAttacks:
	db EVOLVE_LEVEL, 59, VOLCARONA
	db 0 ; no more evolutions
	db 1, EMBER
	db 1, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 6, ABSORB
	db 12, FLAME_CHARGE
	db 18, BITE
	db 24, SCREECH
	db 30, LEECH_LIFE
	db 36, TAKE_DOWN
	db 42, BUG_BUZZ
	db 48, AMNESIA
	db 54, DOUBLE_EDGE
	db 60, FLARE_BLITZ
	db 0 ; no more level-up moves
	
VolcaronaEvosAttacks:
	db 0 ; no more evolutions
	db 1, QUIVER_DANCE
	db 1, EMBER
	db 1, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 1, ABSORB
	db 1, FIRE_SPIN
	db 1, FIERY_DANCE
	db 1, GUST
	db 1, SCREECH
	db 1, LEECH_LIFE
	db 1, FLAMETHROWER
	db 1, BUG_BUZZ
	db 1, AMNESIA
	db 1, DOUBLE_EDGE
	db 62, HURRICANE
	db 70, FIRE_BLAST
	db 100, FIERY_DANCE
	db 0 ; no more level-up moves
	
SylveonEvosAttacks:
	db 0 ; no more evolutions
	db 1, FAIRY_WIND
	db 1, GROWL
	db 1, TACKLE_SCRATCH_POUND
	db 5, LEER_TAIL_WHIP
	db 9, SAND_ATTACK_SMOKESCREEN
	db 13, QUICK_ATTACK
	db 17, SWIFT
	db 20, MIMIC
	db 25, DAZZLINGLEAM
	db 29, LIGHT_SCREEN
	db 33, ATTRACT
	db 37, MOONBLAST
	db 41, DOUBLE_EDGE
	db 45, WISH

PhantumpEvosAttacks:
	db EVOLVE_TRADE, -1, TREVENANT
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, CONFUSE_RAY
	db 6, RAZOR_LEAF
	db 10, FEINT_ATTACK
	db 15, WILL_O_WISP
	db 19, HEX
	db 24, LEECH_SEED
	db 28, HORN_LEECH
	db 33, WORK_UP_GROWTH
	db 37, SHADOW_BALL
	db 42, CURSE
	db 46, WOOD_HAMMER
	db 51, DESTINY_BOND
	db 0 ; no more level-up moves

TrevenantEvosAttacks:
	db 0 ; no more evolutions
	db 1, SHADOW_CLAW
	db 1, TACKLE_SCRATCH_POUND
	db 1, CONFUSE_RAY
	db 6, RAZOR_LEAF
	db 10, FEINT_ATTACK
	db 15, WILL_O_WISP
	db 19, HEX
	db 24, LEECH_SEED
	db 28, HORN_LEECH
	db 33, WORK_UP_GROWTH
	db 37, SHADOW_BALL
	db 42, CURSE
	db 46, WOOD_HAMMER
	db 51, DESTINY_BOND
	db 0 ; no more level-up moves
	
NoibatEvosAttacks:
	db EVOLVE_LEVEL, 48, NOIVERN
	db 0 ; no more evolutions
	db 1, SCREECH
	db 1, SUPERSONIC
	db 1, TACKLE_SCRATCH_POUND
	db 6, ABSORB
	db 11, GUST
	db 15, BITE
	db 20, WING_ATTACK
	db 25, SONIC_BOOM
	db 29, ROOST
	db 34, ACROBATICS
	db 39, ROAR_WHIRLWIND
	db 43, CRUNCH
	db 48, AIR_SLASH
	db 53, AGILITY_ROCK_POLISH
	db 57, HURRICANE
	db 0 ; no more level-up moves
	
NoivernEvosAttacks:
	db 0 ; no more evolutions
	db 1, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db 1, DRAGON_PULSE
	db 1, SCREECH
	db 1, SUPERSONIC
	db 1, TACKLE_SCRATCH_POUND
	db 6, ABSORB
	db 11, GUST
	db 15, BITE
	db 20, WING_ATTACK
	db 25, SONIC_BOOM
	db 29, ROOST
	db 34, ACROBATICS
	db 39, ROAR_WHIRLWIND
	db 43, CRUNCH
	db 48, AIR_SLASH
	db 55, AGILITY_ROCK_POLISH
	db 62, HURRICANE
	db 0 ; no more level-up moves
	
PikipekEvosAttacks:
	db EVOLVE_LEVEL, 14, TRUMBEAK
	db  0 ; no more evolutions
	db  1, PECK
	db  3, GROWL
	db  8, GUST
	db 13, SUPERSONIC
	db 15, WING_ATTACK
	db 19, ROOST
	db 21, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 25, SCREECH
	db 27, DRILL_PECK
	db 31, BULLET_SEED
	db 33, CHARM_FEATHER_DANCE
	db 37, HYPER_VOICE
	db  0 ; no more level-up moves
	
TrumbeakEvosAttacks:
	db EVOLVE_LEVEL, 28, TOUCANNON
	db  0 ; no more evolutions
	db  1, ROCK_BLAST
	db  1, PECK
	db  1, GROWL
	db  1, GUST
	db  1, SUPERSONIC
	db 16, WING_ATTACK
	db 21, ROOST
	db 24, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 29, SCREECH
	db 32, DRILL_PECK
	db 35, BULLET_SEED
	db 38, CHARM_FEATHER_DANCE
	db 43, HYPER_VOICE
	db  0 ; no more level-up moves

ToucannonEvosAttacks:
	db  0 ; no more evolutions
	db  1, ROCK_BLAST
	db  1, PECK
	db  1, GROWL
	db  1, GUST
	db  1, SUPERSONIC
	db  1, WING_ATTACK
	db  1, ROOST
	db  1, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 30, SCREECH
	db 34, DRILL_PECK
	db 37, BULLET_SEED
	db 42, CHARM_FEATHER_DANCE
	db 48, HYPER_VOICE
	db 50, POWER_GEM
	db  0 ; no more level-up moves
	
MareanieEvosAttacks:
	db EVOLVE_LEVEL, 38, TOXAPEX
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
ToxapexEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
WyrdeerEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 5, LEER_TAIL_WHIP
	db 10, SING_HYPNOSIS
	db 14, STOMP
	db 19, SAND_ATTACK_SMOKESCREEN
	db 23, TAKE_DOWN
	db 28, CONFUSE_RAY
	db 32, CALM_MIND
	db 37, ZEN_HEADBUTT
	db 46, JUMP_KICK
	db 0 ; no more level-up moves
	
Raichu_AEvosAttacks:
	db  0 ; no more evolutions
	db  1, PSYCHIC_M
	db 	1, LEER_TAIL_WHIP
	db  1, THUNDERSHOCK
	db  1, GROWL
	db  1, QUICK_ATTACK
	db  1, THUNDER_WAVE
	db  1, DOUBLE_TEAM
	db  1, SPARK
	db  1, ELECTRO_BALL
	db  1, BODY_SLAM
	db  1, THUNDERBOLT
	db  1, AGILITY_ROCK_POLISH
	db  1, WILD_CHARGE
	db  1, LIGHT_SCREEN
	db  1, THUNDER
	db  0 ; no more level-up moves
	
Exeggcute_AEvosAttacks:
	db EVOLVE_ITEM, LEAF_STONE, EXEGGUTOR_A
	db  0 ; no more evolutions
	db  1, ABSORB
	db  1, SING_HYPNOSIS
	db  7, REFLECT
	db 11, BULLET_SEED
	db 14, LEECH_SEED
	db 17, CONFUSION
	db 19, STUN_SPORE
	db 21, POISONPOWDER
	db 23, SLEEP_POWDER
	db 27, MEGA_DRAIN
	db 33, PSYBEAM
	db 37, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db 43, SOLAR_BEAM
	db 47, PSYSHOCK
	db 0 ; no more level-up moves
	
Exeggutor_AEvosAttacks:
	db  0 ; no more evolutions
	db  1, DRAGONHAMMER
	db  1, ABSORB
	db  1, SING_HYPNOSIS
	db  1, REFLECT
	db  1, LEECH_SEED
	db  1, BULLET_SEED
	db  1, CONFUSION
	db  1, STUN_SPORE
	db  1, POISONPOWDER
	db  1, SLEEP_POWDER
	db  1, MEGA_DRAIN
	db  1, PSYBEAM
	db  1, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db  1, SOLAR_BEAM
	db 27, PSYSHOCK
	db 37, EGG_BOMB
	db 47, WOOD_HAMMER
	db 0 ; no more level-up moves
	
Marowak_AEvosAttacks:
	db  0 ; no more evolutions
	db  1, FLAME_BURST
	db  1, GROWL
	db  1, TACKLE_SCRATCH_POUND
	db  1, BONE_CLUB
	db  1, HEADBUTT
	db  1, LEER_TAIL_WHIP
	db  1, HEX
	db  1, BONEMERANG
	db  1, WILL_O_WISP
	db  1, FALSE_SWIPE
	db 33, THRASH
	db 37, DIG
	db 43, SLASH
	db 48, FLARE_BLITZ
	db 56, EARTHQUAKE
	db 0 ; no more level-up moves
	
Grimer_AEvosAttacks:
	db EVOLVE_LEVEL, 38, MUK_A
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 4, DEFENSE_CURL_HARDEN_WITHDRAW
	db 7, BITE
	db 12, DISABLE
	db 18, POISON_FANG
	db 21, MINIMIZE
	db 26, KNOCK_OFF
	db 30, CRUNCH
	db 37, SCREECH
	db 43, BARRIER_IRON_DEFENSE_ACID_ARMOR
	db 46, GUNK_SHOT
	db 0 ; no more level-up moves
	
Muk_AEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 1, BITE
	db 12, DISABLE
	db 15, SLUDGE
	db 18, POISON_FANG
	db 21, MINIMIZE
	db 26, KNOCK_OFF
	db 30, CRUNCH
	db 37, SCREECH
	db 40, BARRIER_IRON_DEFENSE_ACID_ARMOR
	db 46, GUNK_SHOT
	db 0 ; no more level-up moves
