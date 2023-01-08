INCLUDE "constants.asm"


SECTION "Evolutions and Attacks", ROMX


INCLUDE "data/pokemon/evolution_moves.asm"

INCLUDE "data/pokemon/evos_attacks_pointers.asm"

EvosAttacks::
;	db
BulbasaurEvosAttacks:
	db EVOLVE_LEVEL, 16, IVYSAUR
	db  0 ; no more evolutions
	db  1, TACKLE_SCRATCH_POUND
	db  3, GROWL
	db  7, VINE_WHIP
	db  9, LEECH_SEED
	db 13, POISONPOWDER
	db 13, SLEEP_POWDER
	db 17, TAKE_DOWN
	db 19, RAZOR_LEAF
	db 25, WORK_UP_GROWTH
	db 28, DOUBLE_EDGE
	db 33, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db 37, SOLAR_BEAM
	db  0 ; no more level-up moves

IvysaurEvosAttacks:
	db EVOLVE_LEVEL, 32, VENUSAUR
	db  0 ; no more evolutions
	db  1, SLUDGE
	db  1, TACKLE_SCRATCH_POUND
	db  1, GROWL
	db  1, VINE_WHIP
	db  1, LEECH_SEED
	db  1, POISONPOWDER
	db  1, SLEEP_POWDER
	db 18, TAKE_DOWN
	db 20, RAZOR_LEAF
	db 27, WORK_UP_GROWTH
	db 34, DOUBLE_EDGE
	db 36, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db 40, SOLAR_BEAM
	db  0 ; no more level-up moves

VenusaurEvosAttacks:
	db  0 ; no more evolutions
	db  1, PETAL_DANCE
	db  1, TACKLE_SCRATCH_POUND
	db  1, GROWL
	db  1, VINE_WHIP
	db  1, POISONPOWDER
	db  1, SLEEP_POWDER
	db  1, TAKE_DOWN
	db  1, RAZOR_LEAF
	db  1, WORK_UP_GROWTH
	db  1, DOUBLE_EDGE
	db 42, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db 50, SOLAR_BEAM
	db  0 ; no more level-up moves

CharmanderEvosAttacks:
	db EVOLVE_LEVEL, 16, CHARMELEON
	db  0 ; no more evolutions
	db  1, TACKLE_SCRATCH_POUND
	db  1, GROWL
	db  7, EMBER
	db 10, SAND_ATTACK_SMOKESCREEN
	db 13, FIRE_SPIN
	db 15, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 20, FIRE_FANG
	db 27, SLASH
	db 32, METAL_CLAW
	db 35, FLAMETHROWER
	db 40, FIRE_BLAST
	db  0 ; no more level-up moves

CharmeleonEvosAttacks:
	db EVOLVE_LEVEL, 36, CHARIZARD
	db  0 ; no more evolutions
	db  1, DRAGON_RAGE
	db  1, TACKLE_SCRATCH_POUND
	db  1, GROWL
	db  1, EMBER
	db  1, SAND_ATTACK_SMOKESCREEN
	db  1, FIRE_SPIN
	db  1, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db  1, DRAGONBREATH
	db 23, FIRE_FANG
	db 29, SLASH
	db 35, METAL_CLAW
	db 38, FLAMETHROWER
	db 44, FIRE_BLAST
	db  0 ; no more level-up moves

CharizardEvosAttacks:
	db  0 ; no more evolutions
	db  1, AIR_SLASH
	db  1, TACKLE_SCRATCH_POUND
	db  1, GROWL
	db  1, EMBER
	db  1, SAND_ATTACK_SMOKESCREEN
	db  1, FIRE_SPIN
	db  1, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db  1, DRAGON_RAGE
	db  1, WING_ATTACK
	db  1, SHADOW_CLAW
	db  1, DRAGONBREATH
	db  1, FIRE_FANG
	db  1, SLASH
	db  1, BELLY_DRUM
	db 41, METAL_CLAW
	db 47, FLAMETHROWER
	db 54, FIRE_BLAST
	db  0 ; no more level-up moves

SquirtleEvosAttacks:
	db EVOLVE_LEVEL, 16, WARTORTLE
	db  0 ; no more evolutions
	db  1, TACKLE_SCRATCH_POUND
	db  4, LEER_TAIL_WHIP
	db  7, WATER_GUN
	db 10, DEFENSE_CURL_HARDEN_WITHDRAW
	db 15, BITE
	db 19, RAPID_SPIN
	db 22, BUBBLE_BEAM
	db 25, PROTECT
	db 31, DOUBLE_EDGE
	db 33, RAIN_DANCE
	db 35, HYDRO_PUMP
	db  0 ; no more level-up moves

WartortleEvosAttacks:
	db EVOLVE_LEVEL, 36, BLASTOISE
	db  0 ; no more evolutions
	db  1, ICY_WIND
	db  1, TACKLE_SCRATCH_POUND
	db  1, LEER_TAIL_WHIP
	db  1, WATER_GUN
	db  1, DEFENSE_CURL_HARDEN_WITHDRAW
	db  1, BITE
	db 21, RAPID_SPIN
	db 24, BUBBLE_BEAM
	db 27, PROTECT
	db 35, DOUBLE_EDGE
	db 37, RAIN_DANCE
	db 40, HYDRO_PUMP
	db  0 ; no more level-up moves

BlastoiseEvosAttacks:
	db  0 ; no more evolutions
	db  1, BARRIER_IRON_DEFENSE_ACID_ARMOR
	db  1, TACKLE_SCRATCH_POUND
	db  1, LEER_TAIL_WHIP
	db  1, WATER_GUN
	db  1, DEFENSE_CURL_HARDEN_WITHDRAW
	db  1, BITE
	db  1, RAPID_SPIN
	db  1, BUBBLE_BEAM
	db  1, PROTECT
	db  1, FLASH_CANNON
	db  1, SHELL_SMASH
	db 40, DOUBLE_EDGE
	db 45, RAIN_DANCE
	db 50, HYDRO_PUMP
	db  0 ; no more level-up moves

PidgeyEvosAttacks:
	db EVOLVE_LEVEL, 18, PIDGEOTTO
	db  0 ; no more evolutions
	db  1, TACKLE_SCRATCH_POUND
	db  4, SAND_ATTACK_SMOKESCREEN
	db  8, GUST
	db 13, QUICK_ATTACK
	db 17, ROAR_WHIRLWIND
	db 21, TWISTER
	db 25, CHARM_FEATHER_DANCE
	db 27, WING_ATTACK
	db 29, AGILITY_ROCK_POLISH
	db 33, ROOST
	db 41, MIRROR_MOVE
	db 45, AIR_SLASH
	db 53, BRAVE_BIRD
	db  0 ; no more level-up moves

PidgeottoEvosAttacks:
	db EVOLVE_LEVEL, 36, PIDGEOT
	db  0 ; no more evolutions
	db  1, TACKLE_SCRATCH_POUND
	db  1, SAND_ATTACK_SMOKESCREEN
	db  1, GUST
	db  1, QUICK_ATTACK
	db  1, ROAR_WHIRLWIND
	db 23, TWISTER
	db 27, CHARM_FEATHER_DANCE
	db 29, WING_ATTACK
	db 31, AGILITY_ROCK_POLISH
	db 35, ROOST
	db 43, MIRROR_MOVE
	db 47, AIR_SLASH
	db 55, BRAVE_BIRD
	db  0 ; no more level-up moves

PidgeotEvosAttacks:
	db  0 ; no more evolutions
	db  1, TACKLE_SCRATCH_POUND
	db  1, SAND_ATTACK_SMOKESCREEN
	db  1, GUST
	db  1, QUICK_ATTACK
	db  1, ROAR_WHIRLWIND
	db  1, TWISTER
	db  1, CHARM_FEATHER_DANCE
	db  1, WING_ATTACK
	db  1, AGILITY_ROCK_POLISH
	db  1, ROOST
	db 44, MIRROR_MOVE
	db 48, AIR_SLASH
	db 56, BRAVE_BIRD
	db  0 ; no more level-up moves

RattataEvosAttacks:
	db EVOLVE_LEVEL, 20, RATICATE
	db  0 ; no more evolutions
	db  1, TACKLE_SCRATCH_POUND
	db  1, LEER_TAIL_WHIP
	db  4, QUICK_ATTACK
	db  7, FOCUS_ENERGY
	db 10, BITE
	db 13, PURSUIT
	db 16, TAKE_DOWN
	db 22, CRUNCH
	db 26, SCREECH
	db 31, DOUBLE_EDGE
	db  0 ; no more level-up moves

RaticateEvosAttacks:
	db  0 ; no more evolutions
	db  1, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db  1, TACKLE_SCRATCH_POUND
	db  1, LEER_TAIL_WHIP
	db  1, QUICK_ATTACK
	db  1, FOCUS_ENERGY
	db  1, BITE
	db  1, PURSUIT
	db  1, TAKE_DOWN
	db 24, CRUNCH
	db 28, SCREECH
	db 35, DOUBLE_EDGE
	db  0 ; no more level-up moves

PikachuEvosAttacks:
	db EVOLVE_ITEM, THUNDERSTONE, RAICHU
	db EVOLVE_ITEM, BIG_MALASADA, RAICHU_A
	db 	0 ; no more evolutions
	db 	1, LEER_TAIL_WHIP
	db  1, THUNDERSHOCK
	db  5, GROWL
	db  9, QUICK_ATTACK
	db 14, THUNDER_WAVE
	db 20, DOUBLE_TEAM
	db 24, SPARK
	db 29, ELECTRO_BALL
	db 34, BODY_SLAM
	db 41, THUNDERBOLT
	db 45, AGILITY_ROCK_POLISH
	db 50, WILD_CHARGE
	db 54, LIGHT_SCREEN
	db 58, THUNDER
	db 	0 ; no more level-up moves

RaichuEvosAttacks:
	db  0 ; no more evolutions
	db 	1, THUNDERPUNCH
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
	db  0 ; no more evolutions
	db  1, GROWL
	db  1, TACKLE_SCRATCH_POUND
	db  7, LEER_TAIL_WHIP
	db  9, POISON_STING
	db 13, FURY_SWIPES_FURY_ATTACK_COMET_PUNCH
	db 17, BITE
	db 20, POISON_FANG
	db 22, TOXIC_SPIKES
	db 28, DIG
	db 34, CRUNCH
	db  0 ; no more level-up moves

NidorinaEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, NIDOQUEEN
	db 0 ; no more evolutions
	db  1, GROWL
	db  1, TACKLE_SCRATCH_POUND
	db  1, LEER_TAIL_WHIP
	db  1, POISON_STING
	db  1, FURY_SWIPES_FURY_ATTACK_COMET_PUNCH
	db 20, BITE
	db 24, POISON_FANG
	db 27, TOXIC_SPIKES
	db 33, DIG
	db 38, CRUNCH
	db 0 ; no more level-up moves

NidoqueenEvosAttacks:
	db 0 ; no more evolutions
	db  1, GROWL
	db  1, TACKLE_SCRATCH_POUND
	db  1, LEER_TAIL_WHIP
	db  1, POISON_STING
	db  1, FURY_SWIPES_FURY_ATTACK_COMET_PUNCH
	db  1, BITE
	db  1, POISON_FANG
	db  1, TOXIC_SPIKES
	db  1, DIG
	db  1, CRUNCH
	db 35, BODY_SLAM
	db 43, EARTH_POWER
	db 56, SUPERPOWER
	db 0 ; no more level-up moves

NidoranMEvosAttacks:
	db EVOLVE_LEVEL, 16, NIDORINO
	db  0 ; no more evolutions
	db  1, LEER_TAIL_WHIP
	db  1, PECK
	db  7, FOCUS_ENERGY
	db  9, POISON_STING
	db 13, FURY_SWIPES_FURY_ATTACK_COMET_PUNCH
	db 17, HORN_ATTACK
	db 22, TOXIC_SPIKES
	db 28, DIG
	db 34, POISON_JAB
	db  0 ; no more level-up moves

NidorinoEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, NIDOKING
	db  0 ; no more evolutions
	db  1, LEER_TAIL_WHIP
	db  1, PECK
	db  1, FOCUS_ENERGY
	db  1, POISON_STING
	db  1, FURY_SWIPES_FURY_ATTACK_COMET_PUNCH
	db 20, HORN_ATTACK
	db 27, TOXIC_SPIKES
	db 33, DIG
	db 38, POISON_JAB
	db  0 ; no more level-up moves

NidokingEvosAttacks:
	db  0 ; no more evolutions
	db  1, LEER_TAIL_WHIP
	db  1, PECK
	db  1, FOCUS_ENERGY
	db  1, POISON_STING
	db  1, FURY_SWIPES_FURY_ATTACK_COMET_PUNCH
	db  1, HORN_ATTACK
	db  1, TOXIC_SPIKES
	db  1, DIG
	db  1, POISON_JAB
	db 35, THRASH
	db 43, EARTH_POWER
	db 56, MEGAHORN
	db  0 ; no more level-up moves

ClefairyEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, CLEFABLE
	db  0 ; no more evolutions
	db  1, FAIRY_WIND
	db  1, TACKLE_SCRATCH_POUND
	db  1, GROWL
	db  1, ENCORE
	db  8, SING_HYPNOSIS
	db 13, FURY_SWIPES_FURY_ATTACK_COMET_PUNCH
	db 17, DEFENSE_CURL_HARDEN_WITHDRAW
	db 22, BODY_SLAM
	db 26, MINIMIZE
	db 32, METRONOME
	db 36, COSMIC_POWER
	db 40, CHARM_FEATHER_DANCE
	db 45, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db 50, MOONBLAST
	db  0 ; no more level-up moves

ClefableEvosAttacks:
	db  0 ; no more evolutions
	db  1, FAIRY_WIND
	db  1, TACKLE_SCRATCH_POUND
	db  1, GROWL
	db  1, ENCORE
	db  1, SING_HYPNOSIS
	db  1, FURY_SWIPES_FURY_ATTACK_COMET_PUNCH
	db  1, DEFENSE_CURL_HARDEN_WITHDRAW
	db  1, BODY_SLAM
	db  1, MINIMIZE
	db  1, METRONOME
	db  1, COSMIC_POWER
	db  1, CHARM_FEATHER_DANCE
	db  1, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db  1, MOONBLAST
	db  0 ; no more level-up moves

JigglypuffEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, WIGGLYTUFF
	db  0 ; no more evolutions
	db  1, SING_HYPNOSIS
	db  3, DEFENSE_CURL_HARDEN_WITHDRAW
	db  5, TACKLE_SCRATCH_POUND
	db  9, FAIRY_WIND
	db 13, DISABLE
	db 17, FURY_SWIPES_FURY_ATTACK_COMET_PUNCH
	db 20, ROLLOUT
	db 26, REST
	db 30, BODY_SLAM
	db 34, GYRO_BALL
	db 39, MIMIC
	db 42, HYPER_VOICE
	db 46, DOUBLE_EDGE
	db  0 ; no more level-up moves

WigglytuffEvosAttacks:
	db  0 ; no more evolutions
	db  1, SING_HYPNOSIS
	db  1, DEFENSE_CURL_HARDEN_WITHDRAW
	db  1, TACKLE_SCRATCH_POUND
	db  1, FAIRY_WIND
	db  1, DISABLE
	db  1, FURY_SWIPES_FURY_ATTACK_COMET_PUNCH
	db  1, ROLLOUT
	db  1, REST
	db  1, BODY_SLAM
	db  1, GYRO_BALL
	db  1, MIMIC
	db  1, MIRROR_MOVE
	db  1, HYPER_VOICE
	db  1, DOUBLE_EDGE
	db  1, ROAR_WHIRLWIND
	db  1, TAUNT
	db  0 ; no more level-up moves

ZubatEvosAttacks:
	db EVOLVE_LEVEL, 22, GOLBAT
	db  0 ; no more evolutions
	db  1, ABSORB
	db  5, SUPERSONIC
	db  7, GUST
	db 11, BITE
	db 13, WING_ATTACK
	db 17, CONFUSE_RAY
	db 19, AIR_SLASH
	db 23, ACROBATICS
	db 26, POISON_FANG
	db 29, MEAN_LOOK_BLOCK_SPIDER_WEB
	db 32, LEECH_LIFE
	db 35, HAZE
	db 38, VENOSHOCK
	db  0 ; no more level-up moves

GolbatEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, CROBAT
	db  0 ; no more evolutions
	db  1, ABSORB
	db  1, SUPERSONIC
	db  1, GUST
	db  1, BITE
	db  1, WING_ATTACK
	db  1, CONFUSE_RAY
	db  1, AIR_SLASH
	db 25, ACROBATICS
	db 28, POISON_FANG
	db 32, MEAN_LOOK_BLOCK_SPIDER_WEB
	db 36, LEECH_LIFE
	db 40, HAZE
	db 45, VENOSHOCK
	db  0 ; no more level-up moves

OddishEvosAttacks:
	db EVOLVE_LEVEL, 21, GLOOM
	db  0 ; no more evolutions
	db  1, ABSORB
	db  1, WORK_UP_GROWTH
	db  5, ACID
	db  9, POISONPOWDER
	db 12, STUN_SPORE
	db 15, SLEEP_POWDER
	db 20, MEGA_DRAIN
	db 27, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db 31, GIGA_DRAIN
	db 35, TOXIC
	db 39, HEAL_BELL
	db 43, MOONBLAST
	db 48, PETAL_DANCE
	db  0 ; no more level-up moves

GloomEvosAttacks:
	db EVOLVE_ITEM, LEAF_STONE, VILEPLUME
	db EVOLVE_ITEM, SUN_STONE, BELLOSSOM
	db  0 ; no more evolutions
	db  1, ABSORB
	db  1, WORK_UP_GROWTH
	db  1, ACID
	db  1, POISONPOWDER
	db  1, STUN_SPORE
	db  1, SLEEP_POWDER
	db  1, MEGA_DRAIN
	db 27, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db 31, GIGA_DRAIN
	db 35, TOXIC
	db 39, HEAL_BELL
	db 43, MOONBLAST
	db 48, PETAL_DANCE
	db  0 ; no more level-up moves

VileplumeEvosAttacks:
	db  0 ; no more evolutions
	db  1, ABSORB
	db  1, WORK_UP_GROWTH
	db  1, ACID
	db  1, POISONPOWDER
	db  1, STUN_SPORE
	db  1, SLEEP_POWDER
	db  1, MEGA_DRAIN
	db  1, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db  1, GIGA_DRAIN
	db  1, TOXIC
	db 48, PETAL_DANCE
	db 55, SOLAR_BEAM
	db  0 ; no more level-up moves

MeowthEvosAttacks:
	db EVOLVE_LEVEL, 28, PERSIAN
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, GROWL
	db 6, TAUNT
	db 10, FAKE_OUT
	db 15, FURY_SWIPES_FURY_ATTACK_COMET_PUNCH
	db 17, SCREECH
	db 22, FEINT_ATTACK
	db 25, TAUNT
	db 30, PAY_DAY
	db 33, SLASH
	db 37, NASTY_PLOT
	db 42, SWAGGER
	db 46, NIGHT_SLASH
	db 0 ; no more level-up moves

PersianEvosAttacks:
	db 0 ; no more evolutions
	db 1, PLAY_ROUGH
	db 1, TACKLE_SCRATCH_POUND
	db 1, GROWL
	db 1, BITE
	db 1, FAKE_OUT
	db 6, BITE
	db 10, FAKE_OUT
	db 15, FURY_SWIPES_FURY_ATTACK_COMET_PUNCH
	db 19, SCREECH
	db 22, FEINT_ATTACK
	db 26, TAUNT
	db 31, POWER_GEM
	db 36, SLASH
	db 42, NASTY_PLOT
	db 48, SWAGGER
	db 54, NIGHT_SLASH
	db 0 ; no more level-up moves

GrowlitheEvosAttacks:
	db EVOLVE_ITEM, FIRE_STONE, ARCANINE
	db  0 ; no more evolutions
	db  1, BITE
	db  1, LEER_TAIL_WHIP
	db  6, EMBER
	db  8, ROAR_WHIRLWIND
	db 10, FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	db 16, FLAME_BURST
	db 19, REVERSAL
	db 21, FIRE_FANG
	db 24, TAKE_DOWN
	db 28, FLAME_CHARGE
	db 30, AGILITY_ROCK_POLISH
	db 34, FLAMETHROWER
	db 38, CRUNCH
	db 43, OUTRAGE
	db 45, PLAY_ROUGH
	db 50, FLARE_BLITZ
	db  0 ; no more level-up moves

ArcanineEvosAttacks:
	db  0 ; no more evolutions
	db  1, EXTREMESPEED
	db  1, THUNDER_FANG
	db  1, BITE
	db  1, LEER_TAIL_WHIP
	db  1, FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	db  1, EMBER
	db  1, ROAR_WHIRLWIND
	db  1, FLAME_BURST
	db  1, REVERSAL
	db  1, FIRE_FANG
	db  1, TAKE_DOWN
	db  1, FLAME_CHARGE
	db  1, AGILITY_ROCK_POLISH
	db  1, FLAMETHROWER
	db  1, CRUNCH
	db  1, OUTRAGE
	db  1, PLAY_ROUGH
	db  1, FLARE_BLITZ
	db  0 ; no more level-up moves

PoliwagEvosAttacks:
	db EVOLVE_LEVEL, 25, POLIWHIRL
	db  0 ; no more evolutions
	db  1, WATER_GUN
	db  1, SING_HYPNOSIS
	db  6, TACKLE_SCRATCH_POUND
	db 12, FURY_SWIPES_FURY_ATTACK_COMET_PUNCH
	db 18, RAIN_DANCE
	db 24, BUBBLE_BEAM
	db 30, BODY_SLAM
	db 36, EARTH_POWER
	db 42, HYDRO_PUMP
	db 48, BELLY_DRUM
	db 54, DOUBLE_EDGE
	db 0 ; no more level-up moves

PoliwhirlEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, POLIWRATH
	db EVOLVE_TRADE, KINGS_ROCK, POLITOED
	db  0 ; no more evolutions
	db  1, WATER_GUN
	db  1, SING_HYPNOSIS
	db  6, TACKLE_SCRATCH_POUND
	db 12, FURY_SWIPES_FURY_ATTACK_COMET_PUNCH
	db 18, RAIN_DANCE
	db 24, BUBBLE_BEAM
	db 32, BODY_SLAM
	db 40, EARTH_POWER
	db 48, HYDRO_PUMP
	db 56, BELLY_DRUM
	db 66, DOUBLE_EDGE
	db 0 ; no more level-up moves

PoliwrathEvosAttacks:
	db  0 ; no more evolutions
	db  1, BRICK_BREAK
	db  1, LOCK_ON_MIND_READER
	db  1, DYNAMICPUNCH
	db  1, FURY_SWIPES_FURY_ATTACK_COMET_PUNCH
	db  1, RAIN_DANCE
	db  1, BUBBLE_BEAM
	db  1, BODY_SLAM
	db  1, EARTH_POWER
	db  1, HYDRO_PUMP
	db  1, BELLY_DRUM
	db  1, DOUBLE_EDGE
	db  1, WATER_GUN
	db  1, SING_HYPNOSIS
	db  1, TACKLE_SCRATCH_POUND
	db  1, BUBBLE_BEAM
	db 0 ; no more level-up moves

AbraEvosAttacks:
	db EVOLVE_LEVEL, 16, KADABRA
	db 0 ; no more evolutions
	db 1, TELEPORT
	db 0 ; no more level-up moves

KadabraEvosAttacks:
	db EVOLVE_TRADE, -1, ALAKAZAM
	db 0 ; no more evolutions
	db  1, SAND_ATTACK_SMOKESCREEN
	db  1, TELEPORT
	db  1, CONFUSION
	db 16, CONFUSION
	db 18, DISABLE
	db 21, PSYBEAM
	db 23, FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	db 26, REFLECT
	db 31, SOFTBOILED_MILK_DRINK_RECOVER
	db 38, PSYCHIC_M
	db 43, FUTURE_SIGHT
	db 0 ; no more level-up moves

AlakazamEvosAttacks:
	db 0 ; no more evolutions
	db  1, SAND_ATTACK_SMOKESCREEN
	db  1, TELEPORT
	db  1, CONFUSION
	db 16, CONFUSION
	db 18, DISABLE
	db 21, PSYBEAM
	db 23, FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	db 26, REFLECT
	db 31, SOFTBOILED_MILK_DRINK_RECOVER
	db 38, PSYCHIC_M
	db 43, FUTURE_SIGHT
	db 0 ; no more level-up moves

MachopEvosAttacks:
	db EVOLVE_LEVEL, 28, MACHOKE
	db  0 ; no more evolutions
	db  1, LOW_KICK
	db  1, LEER_TAIL_WHIP
	db  5, FOCUS_ENERGY
	db  9, FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	db 13, SEISMIC_TOSS
	db 18, BULK_UP
	db 21, KNOCK_OFF
	db 25, MACH_PUNCH
	db 30, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 38, CROSS_CHOP
	db 44, DYNAMICPUNCH
	db  0 ; no more level-up moves

MachokeEvosAttacks:
	db EVOLVE_TRADE, -1, MACHAMP
	db  0 ; no more evolutions
	db  1, LOW_KICK
	db  1, LEER_TAIL_WHIP
	db  1, FOCUS_ENERGY
	db  1, FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	db  1, SEISMIC_TOSS
	db  1, BULK_UP
	db  1, KNOCK_OFF
	db  1, MACH_PUNCH
	db 32, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 41, CROSS_CHOP
	db 50, DYNAMICPUNCH
	db  0 ; no more level-up moves

MachampEvosAttacks:
	db  0 ; no more evolutions
	db  1, LOW_KICK
	db  1, LEER_TAIL_WHIP
	db  1, FOCUS_ENERGY
	db  1, FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	db  1, SEISMIC_TOSS
	db  1, BULK_UP
	db  1, KNOCK_OFF
	db  1, MACH_PUNCH
	db 32, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 41, CROSS_CHOP
	db 50, DYNAMICPUNCH
	db  0 ; no more level-up moves

GeodudeEvosAttacks:
	db EVOLVE_LEVEL, 25, GRAVELER
	db  0 ; no more evolutions
	db  1, TACKLE_SCRATCH_POUND
	db  1, DEFENSE_CURL_HARDEN_WITHDRAW
	db  6, AGILITY_ROCK_POLISH
	db 10, ROCK_THROW
	db 12, MAGNITUDE
	db 16, ROLLOUT
	db 21, BULK_UP
	db 24, SELFDESTRUCT
	db 30, ROCK_BLAST
	db 34, EARTHQUAKE
	db 36, EXPLOSION
	db 40, DOUBLE_EDGE
	db 44, STONE_EDGE
	db  0 ; no more level-up moves

GravelerEvosAttacks:
	db EVOLVE_TRADE, -1, GOLEM
	db  0 ; no more evolutions
	db  1, TACKLE_SCRATCH_POUND
	db  1, DEFENSE_CURL_HARDEN_WITHDRAW
	db  1, AGILITY_ROCK_POLISH
	db  1, ROCK_THROW
	db  1, MAGNITUDE
	db  1, ROLLOUT
	db  1, BULK_UP
	db  1, SELFDESTRUCT
	db 33, ROCK_BLAST
	db 38, EARTHQUAKE
	db 42, EXPLOSION
	db 47, DOUBLE_EDGE
	db 53, STONE_EDGE
	db 0 ; no more level-up moves

GolemEvosAttacks:
	db  0 ; no more evolutions
	db  1, TACKLE_SCRATCH_POUND
	db  1, DEFENSE_CURL_HARDEN_WITHDRAW
	db  1, AGILITY_ROCK_POLISH
	db  1, ROCK_THROW
	db  1, MAGNITUDE
	db  1, ROLLOUT
	db  1, BULK_UP
	db  1, SELFDESTRUCT
	db 33, ROCK_BLAST
	db 38, EARTHQUAKE
	db 42, EXPLOSION
	db 47, DOUBLE_EDGE
	db 53, STONE_EDGE
	db 60, ROCK_WRECKER
	db 0 ; no more level-up moves

PonytaEvosAttacks:
	db EVOLVE_LEVEL, 40, RAPIDASH
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, GROWL
	db 6, LEER_TAIL_WHIP
	db 10, EMBER
	db 15, FLAME_CHARGE
	db 19, DOUBLE_KICK
	db 24, FIRE_SPIN
	db 28, STOMP
	db 33, TAKE_DOWN
	db 37, FIRE_BLAST
	db 42, AGILITY_ROCK_POLISH
	db 46, FLARE_BLITZ
	db 0 ; no more level-up moves

RapidashEvosAttacks:
	db 0 ; no more evolutions
	db 1, MEGAHORN
	db 1, POISON_JAB
	db 1, FURY_SWIPES_FURY_ATTACK_COMET_PUNCH
	db 1, TACKLE_SCRATCH_POUND
	db 1, GROWL
	db 1, LEER_TAIL_WHIP
	db 1, EMBER
	db 6, LEER_TAIL_WHIP
	db 10, EMBER
	db 15, FLAME_CHARGE
	db 19, DOUBLE_KICK
	db 24, FIRE_SPIN
	db 28, STOMP
	db 33, TAKE_DOWN
	db 37, FIRE_BLAST
	db 43, AGILITY_ROCK_POLISH
	db 50, FLARE_BLITZ
	db 0 ; no more level-up moves

SlowpokeEvosAttacks:
	db EVOLVE_LEVEL, 37, SLOWBRO
	db EVOLVE_TRADE, KINGS_ROCK, SLOWKING
	db 0 ; no more evolutions
	db 1, CURSE
	db 1, SING_HYPNOSIS
	db 1, TACKLE_SCRATCH_POUND
	db 5, GROWL
	db 9, WATER_GUN
	db 14, CONFUSION
	db 19, DISABLE
	db 23, HEADBUTT
	db 28, BUBBLE_BEAM
	db 32, ZEN_HEADBUTT
	db 36, REST
	db 45, AMNESIA
	db 49, SNORE
	db 54, PSYCHIC_M
	db 0 ; no more level-up moves

SlowbroEvosAttacks:
	db 0 ; no more evolutions
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 1, CURSE
	db 1, SING_HYPNOSIS
	db 1, TACKLE_SCRATCH_POUND
	db 5, GROWL
	db 9, WATER_GUN
	db 14, CONFUSION
	db 19, DISABLE
	db 23, HEADBUTT
	db 28, BUBBLE_BEAM
	db 32, ZEN_HEADBUTT
	db 36, REST
	db 45, AMNESIA
	db 49, SNORE
	db 54, PSYCHIC_M
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
	db 8, RAGE
	db 13, FURY_SWIPES_FURY_ATTACK_COMET_PUNCH
	db 16, PURSUIT
	db 20, DOUBLE_HIT
	db 25, AGILITY_ROCK_POLISH
	db 28, MIRROR_MOVE
	db 32, FLAIL
	db 37, JUMP_KICK
	db 40, DRILL_PECK
	db 44, SWORDS_DANCE
	db 49, THRASH
	db 0 ; no more level-up moves

DodrioEvosAttacks:
	db 0 ; no more evolutions
	db 1, TRI_ATTACK
	db 1, PECK
	db 1, GROWL
	db 5, QUICK_ATTACK
	db 8, RAGE
	db 13, FURY_SWIPES_FURY_ATTACK_COMET_PUNCH
	db 16, PURSUIT
	db 20, DOUBLE_HIT
	db 25, AGILITY_ROCK_POLISH
	db 28, MIRROR_MOVE
	db 34, FLAIL
	db 39, JUMP_KICK
	db 45, DRILL_PECK
	db 50, SWORDS_DANCE
	db 56, THRASH
	db 0 ; no more level-up moves

GrimerEvosAttacks:
	db EVOLVE_LEVEL, 38, MUK
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 4, DEFENSE_CURL_HARDEN_WITHDRAW
	db 7, MUD_SLAP
	db 12, DISABLE
	db 15, SLUDGE
	db 18, BULLDOZE
	db 21, MINIMIZE
	db 26, KNOCK_OFF
	db 30, SLUDGE_BOMB
	db 37, SCREECH
	db 43, BARRIER_IRON_DEFENSE_ACID_ARMOR
	db 46, GUNK_SHOT
	db 0 ; no more level-up moves
	
MukEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 1, MUD_SLAP
	db 12, DISABLE
	db 15, SLUDGE
	db 18, BULLDOZE
	db 21, MINIMIZE
	db 26, KNOCK_OFF
	db 30, SLUDGE_BOMB
	db 37, SCREECH
	db 40, BARRIER_IRON_DEFENSE_ACID_ARMOR
	db 46, GUNK_SHOT
	db 0 ; no more level-up moves
	
GastlyEvosAttacks:
	db EVOLVE_LEVEL, 25, HAUNTER
	db  0 ; no more evolutions
	db  1, SING_HYPNOSIS
	db  1, BITE
	db  8, MEAN_LOOK_BLOCK_SPIDER_WEB
	db 12, CURSE
	db 15, NIGHT_SHADE
	db 19, CONFUSE_RAY
	db 22, SLUDGE
	db 26, FEINT_ATTACK
	db 30, SHADOW_BALL
	db 33, DREAM_EATER
	db 36, DARK_PULSE
	db 40, DESTINY_BOND
	db  0 ; no more level-up moves

HaunterEvosAttacks:
	db EVOLVE_TRADE, -1, GENGAR
	db  0 ; no more evolutions
	db  1, SHADOW_CLAW
	db  1, SING_HYPNOSIS
	db  1, BITE
	db  1, MEAN_LOOK_BLOCK_SPIDER_WEB
	db  1, CURSE
	db  1, NIGHT_SHADE
	db  1, CONFUSE_RAY
	db  1, SLUDGE
	db 28, FEINT_ATTACK
	db 33, SHADOW_BALL
	db 37, DREAM_EATER
	db 41, DARK_PULSE
	db 45, DESTINY_BOND
	db  0 ; no more level-up moves

GengarEvosAttacks:
	db  0 ; no more evolutions
	db  1, SHADOW_CLAW
	db  1, SING_HYPNOSIS
	db  1, BITE
	db  1, MEAN_LOOK_BLOCK_SPIDER_WEB
	db  1, CURSE
	db  1, NIGHT_SHADE
	db  1, CONFUSE_RAY
	db  1, SLUDGE
	db 28, FEINT_ATTACK
	db 33, SHADOW_BALL
	db 37, DREAM_EATER
	db 41, DARK_PULSE
	db 45, DESTINY_BOND
	db  0 ; no more level-up moves

OnixEvosAttacks:
	db EVOLVE_TRADE, METAL_COAT, STEELIX
	db  0 ; no more evolutions
	db  1, THUNDER_FANG
	db  1, ICE_FANG
	db  1, FIRE_FANG
	db  1, TACKLE_SCRATCH_POUND
	db  1, DEFENSE_CURL_HARDEN_WITHDRAW
	db  1, RAGE
	db  7, ROCK_THROW
	db 12, CURSE
	db 17, AGILITY_ROCK_POLISH
	db 20, GYRO_BALL
	db 24, DRAGONBREATH
	db 28, BODY_SLAM
	db 31, SCREECH
	db 35, ROCK_SLIDE
	db 40, IRON_TAIL
	db 43, DIG
	db 47, STONE_EDGE
	db 50, DOUBLE_EDGE
	db 54, SANDSTORM
	db  0 ; no more level-up moves

VoltorbEvosAttacks:
	db EVOLVE_LEVEL, 30, ELECTRODE
	db 0 ; no more evolutions
	db 1, SONIC_BOOM
	db 1, TACKLE_SCRATCH_POUND
	db 9, SPARK
	db 11, ROLLOUT
	db 13, SCREECH
	db 16, THUNDERSHOCK
	db 20, SWIFT
	db 22, ELECTRO_BALL
	db 27, SELFDESTRUCT
	db 32, LIGHT_SCREEN
	db 37, THUNDERBOLT
	db 41, EXPLOSION
	db 46, GYRO_BALL
	db 50, MIRROR_MOVE
	db 0 ; no more level-up moves

ElectrodeEvosAttacks:
	db 0 ; no more evolutions
	db 1, SONIC_BOOM
	db 1, TACKLE_SCRATCH_POUND
	db 9, SPARK
	db 11, ROLLOUT
	db 13, SCREECH
	db 16, THUNDERSHOCK
	db 20, SWIFT
	db 22, ELECTRO_BALL
	db 27, SELFDESTRUCT
	db 35, LIGHT_SCREEN
	db 41, THUNDERBOLT
	db 46, EXPLOSION
	db 48, GYRO_BALL
	db 55, MIRROR_MOVE
	db 0 ; no more level-up moves

ExeggcuteEvosAttacks:
	db EVOLVE_ITEM, LEAF_STONE, EXEGGUTOR
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

ExeggutorEvosAttacks:
	db 0 ; no more evolutions
	db  1, STOMP
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

CuboneEvosAttacks:
	db EVOLVE_CUBONE, TR_MORNDAY, MAROWAK
	db EVOLVE_CUBONE, TR_NITE, MAROWAK_A
	db  0 ; no more evolutions
	db  1, GROWL
	db  3, TACKLE_SCRATCH_POUND
	db  6, BONE_CLUB
	db 10, HEADBUTT
	db 13, LEER_TAIL_WHIP
	db 17, FOCUS_ENERGY
	db 21, BONEMERANG
	db 23, RAGE
	db 27, FALSE_SWIPE
	db 31, THRASH
	db 35, DIG
	db 39, SLASH
	db 43, DOUBLE_EDGE
	db 50, EARTHQUAKE
	db  0 ; no more level-up moves

MarowakEvosAttacks:
	db  0 ; no more evolutions
	db  1, MUD_SLAP
	db  1, GROWL
	db  1, TACKLE_SCRATCH_POUND
	db  1, BONE_CLUB
	db  1, HEADBUTT
	db  1, LEER_TAIL_WHIP
	db  1, FOCUS_ENERGY
	db  1, BONEMERANG
	db  1, RAGE
	db  1, FALSE_SWIPE
	db 33, THRASH
	db 37, DIG
	db 43, SLASH
	db 48, DOUBLE_EDGE
	db 56, EARTHQUAKE
	db  0 ; no more level-up moves

KoffingEvosAttacks:
	db EVOLVE_LEVEL, 35, WEEZING
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 6, SMOG
	db 10, SAND_ATTACK_SMOKESCREEN
	db 15, FEINT_ATTACK
	db 19, SLUDGE
	db 24, SELFDESTRUCT
	db 28, HAZE
	db 33, GYRO_BALL
	db 37, SLUDGE_BOMB
	db 42, EXPLOSION
	db 46, TOXIC
	db 51, DESTINY_BOND
	db 0 ; no more level-up moves

WeezingEvosAttacks:
	db 0 ; no more evolutions
	db 1, DOUBLE_HIT
	db 1, TACKLE_SCRATCH_POUND
	db 1, SMOG
	db 1, SAND_ATTACK_SMOKESCREEN
	db 1, FEINT_ATTACK
	db 1, SLUDGE
	db 1, SELFDESTRUCT
	db 1, HAZE
	db 1, GYRO_BALL
	db 37, SLUDGE_BOMB
	db 42, EXPLOSION
	db 46, TOXIC
	db 51, DESTINY_BOND
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
	db 1, LEER_TAIL_WHIP
	db 7, SAND_ATTACK_SMOKESCREEN
	db 10, TWISTER
	db 16, FOCUS_ENERGY
	db 19, DRAGONBREATH
	db 25, BUBBLE_BEAM
	db 28, FLAIL
	db 34, AGILITY_ROCK_POLISH
	db 37, DRAGON_PULSE
	db 43, HYDRO_PUMP
	db 46, DRAGON_DANCE
	db 52, RAIN_DANCE
	db 0 ; no more level-up moves

SeadraEvosAttacks:
	db EVOLVE_TRADE, DRAGON_SCALE, KINGDRA
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, LEER_TAIL_WHIP
	db 7, SAND_ATTACK_SMOKESCREEN
	db 10, TWISTER
	db 16, FOCUS_ENERGY
	db 19, DRAGONBREATH
	db 25, BUBBLE_BEAM
	db 28, FLAIL
	db 34, AGILITY_ROCK_POLISH
	db 37, DRAGON_PULSE
	db 43, HYDRO_PUMP
	db 46, DRAGON_DANCE
	db 52, RAIN_DANCE
	db 0 ; no more level-up moves

StaryuEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, STARMIE
	db 0 ; no more evolutions
	db 1, MINIMIZE
	db 1, TACKLE_SCRATCH_POUND
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 4, WATER_GUN
	db 8, RAPID_SPIN
	db 13, SOFTBOILED_MILK_DRINK_RECOVER
	db 20, SWIFT
	db 24, PSYBEAM
	db 28, BUBBLE_BEAM
	db 32, LIGHT_SCREEN
	db 36, POWER_GEM
	db 40, CONFUSE_RAY
	db 42, PSYCHIC_M
	db 49, COSMIC_POWER
	db 53, HYDRO_PUMP
	db 0 ; no more level-up moves

StarmieEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 1, MINIMIZE
	db 1, SWIFT
	db 1, PSYBEAM
	db 1, BUBBLE_BEAM
	db 1, LIGHT_SCREEN
	db 1, POWER_GEM
	db 1, CONFUSE_RAY
	db 1, PSYCHIC_M
	db 1, COSMIC_POWER
	db 1, HYDRO_PUMP
	db 1, WATER_GUN
	db 1, RAPID_SPIN
	db 1, SOFTBOILED_MILK_DRINK_RECOVER
	db 40, CONFUSE_RAY
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
	db 8, HORN_ATTACK
	db 11, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 15, PURSUIT
	db 19, REST
	db 24, PURSUIT
	db 29, WORK_UP_GROWTH
	db 35, TAKE_DOWN
	db 41, ZEN_HEADBUTT
	db 48, SWAGGER
	db 55, THRASH
	db 63, DOUBLE_EDGE
	db 71, GIGA_IMPACT
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
	db 1, TACKLE_SCRATCH_POUND
	db 1, GROWL
	db 1, LEER_TAIL_WHIP
	db 5, SAND_ATTACK_SMOKESCREEN
	db 9, CHARM_FEATHER_DANCE
	db 13, QUICK_ATTACK
	db 17, BITE
	db 21, SWIFT
	db 25, TAKE_DOWN
	db 29, MEAN_LOOK_BLOCK_SPIDER_WEB
	db 33, BATON_PASS
	db 37, DOUBLE_EDGE
	db 0 ; no more level-up moves

VaporeonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, WATER_GUN
	db 1, GROWL
	db 1, LEER_TAIL_WHIP
	db 5, SAND_ATTACK_SMOKESCREEN
	db 9, CHARM_FEATHER_DANCE
	db 13, QUICK_ATTACK
	db 17, BITE
	db 21, BUBBLE_BEAM
	db 25, AURORA_BEAM
	db 29, BARRIER_IRON_DEFENSE_ACID_ARMOR
	db 33, HAZE
	db 37, SURF
	db 41, DOUBLE_EDGE
	db 45, HYDRO_PUMP
	db 0 ; no more level-up moves

JolteonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, THUNDERSHOCK
	db 1, GROWL
	db 1, LEER_TAIL_WHIP
	db 5, SAND_ATTACK_SMOKESCREEN
	db 9, CHARM_FEATHER_DANCE
	db 13, QUICK_ATTACK
	db 17, DOUBLE_KICK
	db 21, THUNDER_FANG
	db 25, PIN_MISSILE
	db 29, AGILITY_ROCK_POLISH
	db 33, THUNDER_WAVE
	db 37, THUNDERBOLT
	db 41, DOUBLE_EDGE
	db 45, THUNDER
	db 0 ; no more level-up moves

FlareonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, EMBER
	db 1, GROWL
	db 1, LEER_TAIL_WHIP
	db 5, SAND_ATTACK_SMOKESCREEN
	db 9, CHARM_FEATHER_DANCE
	db 13, QUICK_ATTACK
	db 17, BITE
	db 21, FIRE_FANG
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
	db 1, CONVERSION
	db 1, CONVERSION2
	db 1, SHARPEN_HOWL_MEDITATE
	db 7, THUNDERSHOCK
	db 12, PSYBEAM
	db 18, AGILITY_ROCK_POLISH
	db 25, CONVERSION
	db 25, CONVERSION2
	db 29, SIGNAL_BEAM
	db 34, SOFTBOILED_MILK_DRINK_RECOVER
	db 40, THUNDERBOLT
	db 45, TRI_ATTACK
	db 51, LOCK_ON_MIND_READER
	db 56, ZAP_CANNON
	db 0 ; no more level-up moves

AerodactylEvosAttacks:
	db  0 ; no more evolutions
	db  1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
SnorlaxEvosAttacks:
	db  0 ; no more evolutions
	db  1, BELLY_DRUM
	db  1, TACKLE_SCRATCH_POUND
	db  4, DEFENSE_CURL_HARDEN_WITHDRAW
	db  9, AMNESIA
	db 12, BITE
	db 20, HEADBUTT
	db 28, REST
	db 28, SNORE
	db 33, BODY_SLAM
	db 36, MEAN_LOOK_BLOCK_SPIDER_WEB
	db 41, ROLLOUT
	db 44, CRUNCH
	db 49, GIGA_IMPACT
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
	db 31, DRAGON_PULSE
	db 35, AQUA_TAIL
	db 41, DRAGONBREATH
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
	db 5, THUNDER_WAVE
	db 11, TWISTER
	db 15, DRAGON_RAGE
	db 21, BODY_SLAM
	db 25, AGILITY_ROCK_POLISH
	db 33, DRAGON_PULSE
	db 39, AQUA_TAIL
	db 47, DRAGONBREATH
	db 53, SAFEGUARD
	db 61, DRAGON_DANCE
	db 67, OUTRAGE
	db 75, HYPER_BEAM
	db 0 ; no more level-up moves

DragoniteEvosAttacks:
	db 0 ; no more evolutions
	db 1, HURRICANE
	db 1, WING_ATTACK
	db 1, ROOST
	db 1, EXTREMESPEED
	db 1, FIRE_PUNCH
	db 1, THUNDERPUNCH
	db 1, TACKLE_SCRATCH_POUND
	db 1, LEER_TAIL_WHIP
	db 5, THUNDER_WAVE
	db 11, TWISTER
	db 15, DRAGON_RAGE
	db 21, BODY_SLAM
	db 25, AGILITY_ROCK_POLISH
	db 33, DRAGON_PULSE
	db 39, AQUA_TAIL
	db 47, DRAGONBREATH
	db 53, SAFEGUARD
	db 61, DRAGON_DANCE
	db 67, OUTRAGE
	db 75, HYPER_BEAM
	db 81, HURRICANE
	db 0 ; no more level-up moves

ChikoritaEvosAttacks:
	db EVOLVE_LEVEL, 16, BAYLEEF
	db  0 ; no more evolutions
	db  1, TACKLE_SCRATCH_POUND
	db  1, GROWL
	db  7, RAZOR_LEAF
	db 10, POISONPOWDER
	db 10, STUN_SPORE
	db 13, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db 18, REFLECT
	db 22, LIGHT_SCREEN
	db 28, BODY_SLAM
	db 37, SAFEGUARD
	db 40, HEAL_BELL
	db  0 ; no more level-up moves

BayleefEvosAttacks:
	db EVOLVE_LEVEL, 32, MEGANIUM
	db  0 ; no more evolutions
	db  1, MEGA_DRAIN
	db  1, TACKLE_SCRATCH_POUND
	db  1, GROWL
	db  1, RAZOR_LEAF
	db  1, POISONPOWDER
	db  1, STUN_SPORE
	db  1, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db 20, REFLECT
	db 24, LIGHT_SCREEN
	db 30, BODY_SLAM
	db 40, SAFEGUARD
	db 44, HEAL_BELL
	db  0 ; no more level-up moves

MeganiumEvosAttacks:
	db  0 ; no more evolutions
	db  1, CALM_MIND
	db  1, TACKLE_SCRATCH_POUND
	db  1, GROWL
	db  1, RAZOR_LEAF
	db  1, POISONPOWDER
	db  1, STUN_SPORE
	db  1, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db  1, MEGA_DRAIN
	db  1, GIGA_DRAIN
	db  1, REFLECT
	db  1, LIGHT_SCREEN
	db  1, BODY_SLAM
	db  1, PSYCHIC_M
	db 43, SAFEGUARD
	db 48, HEAL_BELL
	db 54, PETAL_DANCE
	db  0 ; no more level-up moves

CyndaquilEvosAttacks:
	db EVOLVE_LEVEL, 14, QUILAVA
	db  0 ; no more evolutions
	db  1, TACKLE_SCRATCH_POUND
	db  1, LEER_TAIL_WHIP
	db  7, EMBER
	db 10, SAND_ATTACK_SMOKESCREEN
	db 13, QUICK_ATTACK
	db 17, SWIFT
	db 22, FLAME_BURST
	db 27, ROLLOUT
	db 28, DEFENSE_CURL_HARDEN_WITHDRAW
	db 36, FLAMETHROWER
	db 40, DOUBLE_EDGE
	db 45, FIRE_BLAST
	db  0 ; no more level-up moves

QuilavaEvosAttacks:
	db EVOLVE_LEVEL, 36, TYPHLOSION
	db  0 ; no more evolutions
	db  1, FLAME_CHARGE
	db  1, TACKLE_SCRATCH_POUND
	db  1, LEER_TAIL_WHIP
	db  1, SAND_ATTACK_SMOKESCREEN
	db  1, QUICK_ATTACK
	db 18, SWIFT
	db 23, FLAME_BURST
	db 29, ROLLOUT
	db 30, DEFENSE_CURL_HARDEN_WITHDRAW
	db 38, FLAMETHROWER
	db 44, DOUBLE_EDGE
	db 50, FIRE_BLAST
	db  0 ; no more level-up moves

TyphlosionEvosAttacks:
	db  0 ; no more evolutions
	db  1, WORK_UP_GROWTH
	db  1, TACKLE_SCRATCH_POUND
	db  1, LEER_TAIL_WHIP
	db  1, SAND_ATTACK_SMOKESCREEN
	db  1, QUICK_ATTACK
	db  1, FLAME_CHARGE
	db  1, SWIFT
	db  1, FLAME_BURST
	db  1, ROLLOUT
	db  1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 42, FLAMETHROWER
	db 47, DOUBLE_EDGE
	db 50, FLARE_BLITZ
	db 55, FIRE_BLAST
	db  0 ; no more level-up moves

TotodileEvosAttacks:
	db EVOLVE_LEVEL, 18, CROCONAW
	db  0 ; no more evolutions
	db  1, TACKLE_SCRATCH_POUND
	db  1, LEER_TAIL_WHIP
	db  7, WATER_GUN
	db  9, RAGE
	db 13, BITE
	db 16, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 20, ICE_FANG
	db 23, FLAIL
	db 27, SLASH
	db 32, CRUNCH
	db 38, THRASH
	db 44, HYDRO_PUMP
	db 50, SUPERPOWER
	db  0 ; no more level-up moves

CroconawEvosAttacks:
	db EVOLVE_LEVEL, 30, FERALIGATR
	db  0 ; no more evolutions
	db  1, AQUA_JET
	db  1, TACKLE_SCRATCH_POUND
	db  1, LEER_TAIL_WHIP
	db  1, WATER_GUN
	db  1, RAGE
	db  1, BITE
	db  1, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 22, ICE_FANG
	db 25, FLAIL
	db 30, SLASH
	db 33, CRUNCH
	db 40, THRASH
	db 47, HYDRO_PUMP
	db 54, SUPERPOWER
	db  0 ; no more level-up moves

FeraligatrEvosAttacks:
	db  0 ; no more evolutions
	db  1, BULK_UP
	db  1, TACKLE_SCRATCH_POUND
	db  1, LEER_TAIL_WHIP
	db  1, WATER_GUN
	db  1, RAGE
	db  1, BITE
	db  1, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db  1, AQUA_JET
	db  1, ICE_FANG
	db  1, FLAIL
	db  1, SLASH
	db 36, CRUNCH
	db 43, THRASH
	db 50, HYDRO_PUMP
	db 58, SUPERPOWER
	db  0 ; no more level-up moves

LedybaEvosAttacks:
	db EVOLVE_LEVEL, 18, LEDIAN
	db  0 ; no more evolutions
	db  1, TACKLE_SCRATCH_POUND
	db  5, SUPERSONIC
	db  8, SWIFT
	db 10, GUST
	db 12, LIGHT_SCREEN
	db 12, REFLECT
	db 15, MACH_PUNCH
	db 19, SIGNAL_BEAM
	db 22, FURY_SWIPES_FURY_ATTACK_COMET_PUNCH
	db 26, BATON_PASS
	db 29, AGILITY_ROCK_POLISH
	db 33, BUG_BUZZ
	db 36, AIR_SLASH
	db 38, DOUBLE_EDGE
	db 40, QUIVER_DANCE
	db  0 ; no more level-up moves

LedianEvosAttacks:
	db  0 ; no more evolutions
	db  1, TACKLE_SCRATCH_POUND
	db  1, SUPERSONIC
	db  1, SWIFT
	db  1, GUST
	db  1, LIGHT_SCREEN
	db  1, REFLECT
	db  1, SAFEGUARD
	db  1, MACH_PUNCH
	db 20, SIGNAL_BEAM
	db 24, FURY_SWIPES_FURY_ATTACK_COMET_PUNCH
	db 29, BATON_PASS
	db 33, AGILITY_ROCK_POLISH
	db 38, BUG_BUZZ
	db 42, AIR_SLASH
	db 47, DOUBLE_EDGE
	db 50, QUIVER_DANCE
	db  0 ; no more level-up moves

CrobatEvosAttacks:
	db  0 ; no more evolutions
	db  1, ABSORB
	db  1, SUPERSONIC
	db  1, GUST
	db  1, BITE
	db  1, WING_ATTACK
	db  1, CONFUSE_RAY
	db  1, AIR_SLASH
	db 25, ACROBATICS
	db 28, POISON_FANG
	db 32, MEAN_LOOK_BLOCK_SPIDER_WEB
	db 36, LEECH_LIFE
	db 40, HAZE
	db 45, VENOSHOCK
	db  0 ; no more level-up moves

ChinchouEvosAttacks:
	db EVOLVE_LEVEL, 27, LANTURN
	db  0 ; no more evolutions
	db  1, WATER_GUN
	db  1, SUPERSONIC
	db  6, THUNDER_WAVE
	db  9, THUNDERSHOCK
	db 17, CONFUSE_RAY
	db 20, BUBBLE_BEAM
	db 23, SPARK
	db 25, ELECTRO_BALL
	db 28, SIGNAL_BEAM
	db 31, FLAIL
	db 34, SHOCK_WAVE
	db 39, AMNESIA
	db 45, TAKE_DOWN
	db 50, HYDRO_PUMP
	db 0 ; no more level-up moves

LanturnEvosAttacks:
	db  0 ; no more evolutions
	db  1, WATER_GUN
	db  1, SUPERSONIC
	db  6, THUNDER_WAVE
	db  9, THUNDERSHOCK
	db 17, CONFUSE_RAY
	db 20, BUBBLE_BEAM
	db 23, SPARK
	db 25, ELECTRO_BALL
	db 29, SIGNAL_BEAM
	db 33, FLAIL
	db 37, SHOCK_WAVE
	db 43, AMNESIA
	db 51, TAKE_DOWN
	db 58, HYDRO_PUMP
	db 0 ; no more level-up moves

TogepiEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, TOGETIC
	db  0 ; no more evolutions
	db  1, GROWL
	db  1, CHARM_FEATHER_DANCE
	db  5, METRONOME
	db  9, SING_HYPNOSIS
	db 13, FAIRY_WIND
	db 15, ENCORE
	db 21, SAFEGUARD
	db 27, WISH
	db 33, ANCIENTPOWER
	db 37, BATON_PASS
	db 41, HYPER_VOICE
	db 47, DOUBLE_EDGE
	db  0 ; no more level-up moves

TogeticEvosAttacks:
	db EVOLVE_ITEM, SHINY_STONE, TOGEKISS
	db 0 ; no more evolutions
	db  1, ENERGY_BALL
	db  1, GROWL
	db  1, CHARM_FEATHER_DANCE
	db  5, METRONOME
	db  9, SING_HYPNOSIS
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
	db 10, TELEPORT
	db 14, REFLECT
	db 19, OMINOUS_WIND
	db 23, CONFUSE_RAY
	db 27, WISH
	db 32, PSYCHIC_M
	db 36, CALM_MIND
	db 40, FUTURE_SIGHT
	db 45, DRILL_PECK
	db 0 ; no more level-up moves

XatuEvosAttacks:
	db 0 ; no more evolutions
	db 1, AIR_SLASH
	db 1, PECK
	db 1, LEER_TAIL_WHIP
	db 1, NIGHT_SHADE
	db 1, TELEPORT
	db 6, NIGHT_SHADE
	db 10, TELEPORT
	db 14, REFLECT
	db 19, OMINOUS_WIND
	db 23, CONFUSE_RAY
	db 27, WISH
	db 32, PSYCHIC_M
	db 36, CALM_MIND
	db 40, FUTURE_SIGHT
	db 45, DRILL_PECK
	db 0 ; no more level-up moves

MareepEvosAttacks:
	db EVOLVE_LEVEL, 15, FLAAFFY
	db  0 ; no more evolutions
	db  1, TACKLE_SCRATCH_POUND
	db  1, GROWL
	db  4, THUNDER_WAVE
	db  8, THUNDERSHOCK
	db 11, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 17, TAKE_DOWN
	db 22, ELECTRO_BALL
	db 25, CONFUSE_RAY
	db 29, POWER_GEM
	db 32, ZAP_CANNON
	db 36, COTTON_GUARD
	db 39, SIGNAL_BEAM
	db 43, LIGHT_SCREEN
	db 46, THUNDER
	db  0 ; no more level-up moves

FlaaffyEvosAttacks:
	db EVOLVE_LEVEL, 30, AMPHAROS
	db  0 ; no more evolutions
	db  1, TACKLE_SCRATCH_POUND
	db  1, GROWL
	db  1, THUNDER_WAVE
	db  1, THUNDERSHOCK
	db  1, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 20, TAKE_DOWN
	db 25, ELECTRO_BALL
	db 29, CONFUSE_RAY
	db 34, POWER_GEM
	db 38, ZAP_CANNON
	db 42, COTTON_GUARD
	db 47, SIGNAL_BEAM
	db 50, LIGHT_SCREEN
	db 55, THUNDER
	db  0 ; no more level-up moves

AmpharosEvosAttacks:
	db  0 ; no more evolutions
	db  1, THUNDERPUNCH
	db  1, ZAP_CANNON
	db  1, DRAGON_PULSE
	db  1, FIRE_PUNCH
	db  1, TACKLE_SCRATCH_POUND
	db  1, GROWL
	db  1, THUNDER_WAVE
	db  1, THUNDERSHOCK
	db  1, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db  1, TAKE_DOWN
	db  1, ELECTRO_BALL
	db  1, CONFUSE_RAY
	db 35, POWER_GEM
	db 40, ZAP_CANNON
	db 44, COTTON_GUARD
	db 50, SIGNAL_BEAM
	db 52, LIGHT_SCREEN
	db 58, THUNDER
	db  0 ; no more level-up moves

BellossomEvosAttacks:
	db  0 ; no more evolutions
	db  1, MEGA_DRAIN
	db  1, SUNNY_DAY
	db  1, STUN_SPORE
	db 39, QUIVER_DANCE
	db 49, PETAL_DANCE
	db 59, SOLAR_BEAM
	db  0 ; no more level-up moves

MarillEvosAttacks:
	db EVOLVE_LEVEL, 18, AZUMARILL
	db  0 ; no more evolutions
	db  1, TACKLE_SCRATCH_POUND
	db  1, WATER_GUN
	db  2, LEER_TAIL_WHIP
	db  7, AQUA_JET
	db 10, DEFENSE_CURL_HARDEN_WITHDRAW
	db 10, ROLLOUT
	db 15, BUBBLE_BEAM
	db 20, AQUA_TAIL
	db 23, PLAY_ROUGH
	db 29, RAIN_DANCE
	db 37, DOUBLE_EDGE
	db 41, SUPERPOWER
	db 48, HYDRO_PUMP
	db  0 ; no more level-up moves

AzumarillEvosAttacks:
	db  0 ; no more evolutions
	db  1, TACKLE_SCRATCH_POUND
	db  1, WATER_GUN
	db  1, LEER_TAIL_WHIP
	db  1, AQUA_JET
	db  1, DEFENSE_CURL_HARDEN_WITHDRAW
	db  1, ROLLOUT
	db  1, BUBBLE_BEAM
	db 22, AQUA_TAIL
	db 25, PLAY_ROUGH
	db 31, RAIN_DANCE
	db 40, DOUBLE_EDGE
	db 44, SUPERPOWER
	db 53, HYDRO_PUMP
	db  0 ; no more level-up moves

SudowoodoEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, WOOD_HAMMER
	db 1, FLAIL
	db 1, LOW_KICK
	db 1, ROCK_THROW
	db 5, FLAIL
	db 8, LOW_KICK
	db 12, ROCK_THROW
	db 15, MIMIC
	db 19, FEINT_ATTACK
	db 22, BODY_SLAM
	db 25, MEAN_LOOK_BLOCK_SPIDER_WEB
	db 29, ROCK_SLIDE
	db 36, SUCKER_PUNCH
	db 43, STONE_EDGE
	db 47, WOOD_HAMMER
	db 0 ; no more level-up moves

PolitoedEvosAttacks:
	db  0 ; no more evolutions
	db  1, TACKLE_SCRATCH_POUND
	db  1, AQUA_JET
	db  1, RAIN_DANCE
	db  1, BODY_SLAM
	db  1, EARTH_POWER
	db  1, HYDRO_PUMP
	db  1, BELLY_DRUM
	db  1, DOUBLE_EDGE
	db  1, BUBBLE_BEAM
	db  1, SING_HYPNOSIS
	db  1, FURY_SWIPES_FURY_ATTACK_COMET_PUNCH
	db  1, PERISH_SONG
	db 27, SWAGGER
	db 37, ACROBATICS
	db 48, HYPER_VOICE
	db 0 ; no more level-up moves

WooperEvosAttacks:
	db EVOLVE_LEVEL, 20, QUAGSIRE
	db  0 ; no more evolutions
	db  1, WATER_GUN
	db  1, LEER_TAIL_WHIP
	db  8, MUD_SLAP
	db 16, BODY_SLAM
	db 21, AMNESIA
	db 27, RAIN_DANCE
	db 32, EARTHQUAKE
	db 36, HAZE
	db 42, HYDRO_PUMP
	db  0 ; no more level-up moves

QuagsireEvosAttacks:
	db  0 ; no more evolutions
	db  1, WATER_GUN
	db  1, LEER_TAIL_WHIP
	db  1, MUD_SLAP
	db  1, BODY_SLAM
	db  1, AMNESIA
	db 28, RAIN_DANCE
	db 34, EARTHQUAKE
	db 38, HAZE
	db 45, HYDRO_PUMP
	db  0 ; no more level-up moves

EspeonEvosAttacks:
	db 0 ; no more evolutions
	db 1, CONFUSION
	db 1, GROWL
	db 1, LEER_TAIL_WHIP
	db 5, SAND_ATTACK_SMOKESCREEN
	db 9, CHARM_FEATHER_DANCE
	db 13, QUICK_ATTACK
	db 17, CONFUSION
	db 21, SWIFT
	db 25, PSYBEAM
	db 29, FUTURE_SIGHT
	db 33, MEAN_LOOK_BLOCK_SPIDER_WEB
	db 37, PSYCHIC_M
	db 41, CALM_MIND
	db 45, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db 0 ; no more level-up moves

UmbreonEvosAttacks:
	db 0 ; no more evolutions
	db 1, PURSUIT
	db 1, GROWL
	db 1, LEER_TAIL_WHIP
	db 5, SAND_ATTACK_SMOKESCREEN
	db 9, CHARM_FEATHER_DANCE
	db 13, QUICK_ATTACK
	db 17, BITE
	db 21, CONFUSE_RAY
	db 25, FEINT_ATTACK
	db 29, SCREECH
	db 33, MEAN_LOOK_BLOCK_SPIDER_WEB
	db 37, CRUNCH
	db 41, DOUBLE_EDGE
	db 45, SYNTHESIS_MOONLIGHT_MORNING_SUN
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
	db 1, NASTY_PLOT
	db 1, CURSE
	db 1, SING_HYPNOSIS
	db 1, TACKLE_SCRATCH_POUND
	db 5, GROWL
	db 9, WATER_GUN
	db 14, CONFUSION
	db 19, DISABLE
	db 23, HEADBUTT
	db 28, BUBBLE_BEAM
	db 32, ZEN_HEADBUTT
	db 36, REST
	db 45, AMNESIA
	db 49, SNORE
	db 54, PSYCHIC_M
	db 0 ; no more level-up moves

PinecoEvosAttacks:
	db EVOLVE_LEVEL, 31, FORRETRESS
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, PROTECT
	db 8, SELFDESTRUCT
	db 12, TAKE_DOWN
	db 16, RAPID_SPIN
	db 20, ENDURE
	db 24, FLAIL
	db 28, SPIKES
	db 32, PIN_MISSILE
	db 36, EXPLOSION
	db 40, BARRIER_IRON_DEFENSE_ACID_ARMOR
	db 44, DOUBLE_EDGE
	db 0 ; no more level-up moves

ForretressEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, PROTECT
	db 8, SELFDESTRUCT
	db 12, TAKE_DOWN
	db 16, RAPID_SPIN
	db 20, ENDURE
	db 24, FLAIL
	db 28, SPIKES
	db 33, PIN_MISSILE
	db 38, EXPLOSION
	db 44, BARRIER_IRON_DEFENSE_ACID_ARMOR
	db 50, DOUBLE_EDGE
	db 56, ZAP_CANNON
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
	db  0 ; no more evolutions
	db  1, THUNDER_FANG
	db  1, ICE_FANG
	db  1, FIRE_FANG
	db  1, TACKLE_SCRATCH_POUND
	db  1, DEFENSE_CURL_HARDEN_WITHDRAW
	db  1, RAGE
	db  7, ROCK_THROW
	db 12, CURSE
	db 17, AGILITY_ROCK_POLISH
	db 20, GYRO_BALL
	db 24, DRAGONBREATH
	db 28, BODY_SLAM
	db 31, SCREECH
	db 35, ROCK_SLIDE
	db 37, CRUNCH
	db 40, IRON_TAIL
	db 43, DIG
	db 47, STONE_EDGE
	db 50, DOUBLE_EDGE
	db 54, SANDSTORM
	db  0 ; no more level-up moves

SnubbullEvosAttacks:
	db EVOLVE_LEVEL, 23, GRANBULL
	db  0 ; no more evolutions
	db  1, ICE_FANG
	db  1, FIRE_FANG
	db  1, THUNDER_FANG
	db  1, TACKLE_SCRATCH_POUND
	db  1, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db  1, LEER_TAIL_WHIP
	db  1, CHARM_FEATHER_DANCE
	db  7, BITE
	db 13, ATTRACT
	db 19, HEADBUTT
	db 25, ROAR_WHIRLWIND
	db 31, RAGE
	db 37, PLAY_ROUGH
	db 43, FEINT_ATTACK
	db 49, CRUNCH
	db  0 ; no more level-up moves

GranbullEvosAttacks:
	db  0 ; no more evolutions
	db  1, ICE_FANG
	db  1, FIRE_FANG
	db  1, THUNDER_FANG
	db  1, TACKLE_SCRATCH_POUND
	db  1, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db  1, LEER_TAIL_WHIP
	db  1, CHARM_FEATHER_DANCE
	db  7, BITE
	db 13, ATTRACT
	db 20, HEADBUTT
	db 27, ROAR_WHIRLWIND
	db 34, RAGE
	db 41, PLAY_ROUGH
	db 48, FEINT_ATTACK
	db 55, CRUNCH
	db 62, OUTRAGE
	db  0 ; no more level-up moves

ScizorEvosAttacks:
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, LEER_TAIL_WHIP
	db 1, BULLET_PUNCH
	db 6, FOCUS_ENERGY
	db 10, PURSUIT
	db 14, FALSE_SWIPE
	db 19, AGILITY_ROCK_POLISH
	db 23, METAL_CLAW
	db 27, FURY_CUTTER
	db 32, SLASH
	db 36, DOUBLE_HIT
	db 40, BARRIER_IRON_DEFENSE_ACID_ARMOR
	db 45, X_SCISSOR
	db 49, NIGHT_SLASH
	db 53, STEEL_WING
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
	db 1, FURY_SWIPES_FURY_ATTACK_COMET_PUNCH
	db 1, ENDURE
	db 9, HORN_ATTACK
	db 17, BRICK_BREAK
	db 25, PIN_MISSILE
	db 33, THRASH
	db 41, SWORDS_DANCE
	db 49, REVERSAL
	db 56, MEGAHORN
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
	db 16, FURY_SWIPES_FURY_ATTACK_COMET_PUNCH
	db 20, AGILITY_ROCK_POLISH
	db 22, METAL_CLAW
	db 25, SHARPEN_HOWL_MEDITATE
	db 28, PURSUIT
	db 32, SCREECH
	db 35, SLASH
	db 40, KNOCK_OFF
	db 44, CRUNCH
	db 47, ICE_SHARD
	db 0 ; no more level-up moves

TeddiursaEvosAttacks:
	db EVOLVE_LEVEL, 30, URSARING
	db  0 ; no more evolutions
	db  1, TACKLE_SCRATCH_POUND
	db  1, CHARM_FEATHER_DANCE
	db  1, BITE
	db  1, SCREECH
	db  8, FURY_SWIPES_FURY_ATTACK_COMET_PUNCH
	db 15, FEINT_ATTACK
	db 22, SWIFT
	db 29, SLASH
	db 36, REST
	db 40, SNORE
	db 50, THRASH
	db  0 ; no more level-up moves

UrsaringEvosAttacks:
	db  0 ; no more evolutions
	db  1, TACKLE_SCRATCH_POUND
	db  1, CHARM_FEATHER_DANCE
	db  1, BITE
	db  1, SCREECH
	db  1, FURY_SWIPES_FURY_ATTACK_COMET_PUNCH
	db  1, FEINT_ATTACK
	db  1, SWIFT
	db  1, SLASH
	db 36, REST
	db 40, SNORE
	db 50, THRASH
	db 57, CROSS_CHOP
	db  0 ; no more level-up moves

SlugmaEvosAttacks:
	db EVOLVE_LEVEL, 38, MAGCARGO
	db 0 ; no more evolutions
	db 1, SAND_ATTACK_SMOKESCREEN
	db 1, SMOG
	db 6, EMBER
	db 9, ROCK_THROW
	db 14, DEFENSE_CURL_HARDEN_WITHDRAW
	db 18, FIRE_SPIN
	db 23, CLEAR_SMOG
	db 25, ANCIENTPOWER
	db 30, FLAME_BURST
	db 33, BODY_SLAM
	db 37, SOFTBOILED_MILK_DRINK_RECOVER
	db 40, ROCK_SLIDE
	db 45, FLAMETHROWER
	db 48, EARTH_POWER
	db 0 ; no more level-up moves

MagcargoEvosAttacks:
	db 0 ; no more evolutions
	db 1, SAND_ATTACK_SMOKESCREEN
	db 1, SMOG
	db 6, EMBER
	db 9, ROCK_THROW
	db 14, DEFENSE_CURL_HARDEN_WITHDRAW
	db 18, FIRE_SPIN
	db 23, CLEAR_SMOG
	db 25, ANCIENTPOWER
	db 30, FLAME_BURST
	db 33, BODY_SLAM
	db 37, SOFTBOILED_MILK_DRINK_RECOVER
	db 42, ROCK_SLIDE
	db 49, FLAMETHROWER
	db 54, EARTH_POWER
	db 0 ; no more level-up moves

SwinubEvosAttacks:
	db EVOLVE_LEVEL, 33, PILOSWINE
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	db 5, SAND_ATTACK_SMOKESCREEN
	db 8, HAIL
	db 11, MUD_SLAP
	db 14, ENDURE
	db 18, MAGNITUDE
	db 21, ICY_WIND
	db 24, ICE_SHARD
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
	db 1, FURY_SWIPES_FURY_ATTACK_COMET_PUNCH
	db 1, ANCIENTPOWER
	db 1, FLAIL
	db 1, ICE_SHARD
	db 1, PECK
	db 1, TACKLE_SCRATCH_POUND
	db 1, FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	db 5, SAND_ATTACK_SMOKESCREEN
	db 8, HAIL
	db 11, MUD_SLAP
	db 14, ENDURE
	db 18, MAGNITUDE
	db 21, ICY_WIND
	db 24, ICE_FANG
	db 28, TAKE_DOWN
	db 37, HAZE
	db 41, THRASH
	db 46, EARTHQUAKE
	db 52, BLIZZARD
	db 58, AMNESIA
	db 0 ; no more level-up moves

CorsolaEvosAttacks:
	db 0 ; no more evolutions
	db  1, TACKLE_SCRATCH_POUND
	db  4, DEFENSE_CURL_HARDEN_WITHDRAW
	db  8, WATER_GUN
	db 10, SOFTBOILED_MILK_DRINK_RECOVER
	db 13, SAFEGUARD
	db 17, BUBBLE_BEAM
	db 20, ANCIENTPOWER
	db 23, HEAL_BELL
	db 27, FURY_SWIPES_FURY_ATTACK_COMET_PUNCH
	db 29, BARRIER_IRON_DEFENSE_ACID_ARMOR
	db 31, ROCK_BLAST
	db 35, ENDURE
	db 41, POWER_GEM
	db 47, EARTH_POWER
	db 52, FLAIL
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
	db 7, SAND_ATTACK_SMOKESCREEN
	db 10, TWISTER
	db 16, FOCUS_ENERGY
	db 19, DRAGONBREATH
	db 25, BUBBLE_BEAM
	db 28, FLAIL
	db 34, AGILITY_ROCK_POLISH
	db 37, DRAGON_PULSE
	db 43, HYDRO_PUMP
	db 46, DRAGON_DANCE
	db 52, RAIN_DANCE
	db 0 ; no more level-up moves

PhanpyEvosAttacks:
	db EVOLVE_LEVEL, 25, DONPHAN
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, GROWL
	db 6, DEFENSE_CURL_HARDEN_WITHDRAW
	db 10, FLAIL
	db 15, ROLLOUT
	db 19, RAPID_SPIN
	db 24, MAGNITUDE
	db 28, TAKE_DOWN
	db 33, ENDURE
	db 37, CHARM_FEATHER_DANCE
	db 42, DOUBLE_EDGE
	db 0 ; no more level-up moves

DonphanEvosAttacks:
	db 0 ; no more evolutions
	db 1, FIRE_FANG
	db 1, THUNDER_FANG
	db 1, FURY_SWIPES_FURY_ATTACK_COMET_PUNCH
	db 1, HORN_ATTACK
	db 1, GROWL
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 10, FLAIL
	db 15, ROLLOUT
	db 19, RAPID_SPIN
	db 24, MAGNITUDE
	db 30, TAKE_DOWN
	db 35, KNOCK_OFF
	db 41, BODY_SLAM
	db 46, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 52, EARTHQUAKE
	db 57, GIGA_IMPACT
	db 0 ; no more level-up moves

Porygon2EvosAttacks:
	db EVOLVE_HOLDING, DUBIOUS_DISC, PORYGON_Z
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, CONVERSION
	db 1, CONVERSION2
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 7, THUNDERSHOCK
	db 12, PSYBEAM
	db 18, AGILITY_ROCK_POLISH
	db 25, CONVERSION
	db 25, CONVERSION2
	db 29, SIGNAL_BEAM
	db 34, SOFTBOILED_MILK_DRINK_RECOVER
	db 40, THUNDERBOLT
	db 45, TRI_ATTACK
	db 51, LOCK_ON_MIND_READER
	db 56, ZAP_CANNON
	db 0 ; no more level-up moves

StantlerEvosAttacks:
	db EVOLVE_LOCATION, ROUTE_10, WYRDEER
	db EVOLVE_LOCATION, TWINKLE_TOWN, WYRDEER
	db EVOLVE_LOCATION, FROZEN_RUINS, WYRDEER
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
	db 1, BRICK_BREAK
	db 1, REST
	db 1, SNORE
	db 1, TACKLE_SCRATCH_POUND
	db 1, GROWL
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 1, RAGE
	db 11, SOFTBOILED_MILK_DRINK_RECOVER
	db 15, STOMP
	db 19, ROLLOUT
	db 24, BODY_SLAM
	db 29, ZEN_HEADBUTT
	db 35, ATTRACT
	db 48, HEAL_BELL
	db 50, CROSS_CHOP
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
	db 5, ROCK_THROW
	db 9, BITE
	db 13, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 17, MAGNITUDE
	db 21, ROCK_SLIDE
	db 25, SCREECH
	db 29, CRUNCH
	db 33, EARTHQUAKE
	db 37, STONE_EDGE
	db 41, THRASH
	db 45, SANDSTORM
	db 49, HYPER_BEAM
	db 0 ; no more level-up moves

PupitarEvosAttacks:
	db EVOLVE_LEVEL, 55, TYRANITAR
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, LEER_TAIL_WHIP
	db 5, ROCK_THROW
	db 9, BITE
	db 13, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 17, MAGNITUDE
	db 21, ROCK_SLIDE
	db 25, SCREECH
	db 29, CRUNCH
	db 35, EARTHQUAKE
	db 41, STONE_EDGE
	db 47, THRASH
	db 53, SANDSTORM
	db 59, HYPER_BEAM
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
	db 5, ROCK_THROW
	db 9, BITE
	db 13, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 17, MAGNITUDE
	db 21, ROCK_SLIDE
	db 25, SCREECH
	db 29, CRUNCH
	db 35, EARTHQUAKE
	db 41, STONE_EDGE
	db 47, THRASH
	db 53, SANDSTORM
	db 63, HYPER_BEAM
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
	db 24, PURSUIT
	db 29, AIR_SLASH
	db 33, ROOST
	db 36, AGILITY_ROCK_POLISH
	db 40, AIR_SLASH
	db 43, HURRICANE
	db 0 ; no more level-up moves
	
PelipperEvosAttacks:
	db 0 ; no more evolutions
	db 1, PROTECT
	db 1, HURRICANE
	db 1, HYDRO_PUMP
	db 1, GROWL
	db 1, WATER_GUN
	db 1, WING_ATTACK
	db 1, SUPERSONIC
	db 12, HAZE
	db 19, BUBBLE_BEAM
	db 26, KNOCK_OFF
	db 33, AIR_SLASH
	db 39, ROOST
	db 45, HYDRO_PUMP
	db 50, HURRICANE
	db 0 ; no more level-up moves
	
RaltsEvosAttacks:
	db EVOLVE_LEVEL, 20, KIRLIA
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, CONFUSION
	db 1, DOUBLE_TEAM
	db 1, FAIRY_WIND
	db 9, TELEPORT
	db 11, FAIRY_WIND
	db 14, SAFEGUARD
	db 19, WISH
	db 24, CALM_MIND
	db 27, PSYCHIC_M
	db 32, FUTURE_SIGHT
	db 34, CHARM_FEATHER_DANCE
	db 37, SING_HYPNOSIS
	db 39, DREAM_EATER
	db 42, MOONBLAST
	db 0 ; no more level-up moves
	
KirliaEvosAttacks:
	db EVOLVE_LEVEL, 30, GARDEVOIR
	db EVOLVE_ITEM_MALE, DAWN_STONE, GALLADE
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, CONFUSION
	db 1, DOUBLE_TEAM
	db 1, FAIRY_WIND
	db 9, TELEPORT
	db 11, FAIRY_WIND
	db 14, SAFEGUARD
	db 19, WISH
	db 27, CALM_MIND
	db 31, PSYCHIC_M
	db 35, FUTURE_SIGHT
	db 37, CHARM_FEATHER_DANCE
	db 40, SING_HYPNOSIS
	db 42, DREAM_EATER
	db 45, MOONBLAST
	db 0 ; no more level-up moves
	
GardevoirEvosAttacks:
	db 0 ; no more evolutions
	db 1, DAZZLINGLEAM
	db 1, MOONBLAST
	db 1, GROWL
	db 1, CONFUSION
	db 1, DOUBLE_TEAM
	db 1, FAIRY_WIND
	db 9, TELEPORT
	db 11, FAIRY_WIND
	db 14, SAFEGUARD
	db 19, WISH
	db 27, CALM_MIND
	db 34, PSYCHIC_M
	db 38, FUTURE_SIGHT
	db 40, CHARM_FEATHER_DANCE
	db 43, SING_HYPNOSIS
	db 46, DREAM_EATER
	db 50, MOONBLAST
	db 0 ; no more level-up moves
	
ShroomishEvosAttacks:
	db EVOLVE_LEVEL, 23, BRELOOM
	db  0 ; no more evolutions
	db  1, ABSORB
	db  1, TACKLE_SCRATCH_POUND
	db  5, STUN_SPORE
	db  8, LEECH_SEED
	db 12, MEGA_DRAIN
	db 15, HEADBUTT
	db 19, POISONPOWDER
	db 24, GIGA_DRAIN
	db 28, WORK_UP_GROWTH
	db 33, TOXIC
	db 36, BULLET_SEED
	db 40, SPORE
	db  0 ; no more level-up moves
	
BreloomEvosAttacks:
	db  0 ; no more evolutions
	db  1, ABSORB
	db  1, TACKLE_SCRATCH_POUND
	db  1, MACH_PUNCH
	db  1, STUN_SPORE
	db  1, LEECH_SEED
	db 28, REVERSAL
	db 33, LOCK_ON_MIND_READER
	db 39, DYNAMICPUNCH
	db 44, BULLET_SEED
	db 50, HI_JUMP_KICK
	db  0 ; no more level-up moves

AronEvosAttacks:
	db EVOLVE_LEVEL, 32, LAIRON
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 6, MUD_SLAP
	db 10, HEADBUTT
	db 15, METAL_CLAW
	db 19, ROCK_THROW
	db 24, PROTECT
	db 28, ROAR_WHIRLWIND
	db 33, IRON_TAIL
	db 37, ROCK_SLIDE
	db 42, DOUBLE_EDGE
	db 0 ; no more level-up moves
	
LaironEvosAttacks:
	db EVOLVE_LEVEL, 42, AGGRON
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 6, MUD_SLAP
	db 10, HEADBUTT
	db 15, METAL_CLAW
	db 19, ROCK_THROW
	db 24, PROTECT
	db 28, ROAR_WHIRLWIND
	db 36, IRON_TAIL
	db 43, ROCK_SLIDE
	db 51, DOUBLE_EDGE
	db 0 ; no more level-up moves
	
AggronEvosAttacks: 
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 6, MUD_SLAP
	db 10, HEADBUTT
	db 15, METAL_CLAW
	db 19, ROCK_THROW
	db 24, PROTECT
	db 28, ROAR_WHIRLWIND
	db 37, IRON_TAIL
	db 47, ROCK_SLIDE
	db 58, DOUBLE_EDGE
	db 0 ; no more level-up moves
	
MedititeEvosAttacks:
	db EVOLVE_LEVEL, 37, MEDICHAM
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 4, SHARPEN_HOWL_MEDITATE
	db 7, CONFUSION
	db 10, PROTECT
	db 13, ENDURE
	db 17, LOW_KICK
	db 21, FAKE_OUT
	db 25, LOCK_ON_MIND_READER
	db 28, HI_JUMP_KICK
	db 31, CALM_MIND
	db 34, FUTURE_SIGHT
	db 37, SOFTBOILED_MILK_DRINK_RECOVER
	db 40, REVERSAL
	db 43, DRAIN_PUNCH
	db 0 ; no more level-up moves
	
MedichamEvosAttacks:
	db 0 ; no more evolutions
	db 1, ZEN_HEADBUTT
	db 1, TACKLE_SCRATCH_POUND
	db 1, SHARPEN_HOWL_MEDITATE
	db 1, CONFUSION
	db 1, PROTECT
	db 13, ENDURE
	db 17, LOW_KICK
	db 21, FAKE_OUT
	db 25, LOCK_ON_MIND_READER
	db 28, HI_JUMP_KICK
	db 31, CALM_MIND
	db 34, FUTURE_SIGHT
	db 40, SOFTBOILED_MILK_DRINK_RECOVER
	db 46, REVERSAL
	db 52, DRAIN_PUNCH
	db 0 ; no more level-up moves
	
CarvanhaEvosAttacks:
	db EVOLVE_LEVEL, 30, SHARPEDO
	db  0 ; no more evolutions
	db  1, LEER_TAIL_WHIP
	db  1, PURSUIT
	db  4, RAGE
	db  8, FOCUS_ENERGY
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
	db  0 ; no more evolutions
	db  1, SLASH
	db  1, NIGHT_SLASH
	db  1, LEER_TAIL_WHIP
	db  1, PURSUIT
	db  4, RAGE
	db  8, FOCUS_ENERGY
	db 11, AQUA_JET
	db 15, BITE
	db 18, SCREECH
	db 22, SWAGGER
	db 25, ICE_FANG
	db 29, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 34, POISON_FANG
	db 40, CRUNCH
	db 45, AGILITY_ROCK_POLISH
	db 51, DOUBLE_EDGE
	db 56, TAUNT
	db 62, NIGHT_SLASH
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
	db 12, MAGNITUDE
	db 15, FIRE_SPIN
	db 19, AMNESIA
	db 22, FLAME_BURST
	db 26, EARTH_POWER
	db 29, CURSE
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
	db 7, FURY_SWIPES_FURY_ATTACK_COMET_PUNCH
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
	db 1, FURY_SWIPES_FURY_ATTACK_COMET_PUNCH
	db 10, SAFEGUARD
	db 13, FAIRY_WIND
	db 16, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 19, DRAGONBREATH
	db 22, HAZE
	db 25, TAKE_DOWN
	db 28, HEAL_BELL
	db 31, MIRROR_MOVE
	db 34, COTTON_GUARD
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
	db 23, AURORA_BEAM
	db 28, HEADBUTT
	db 34, PROTECT
	db 41, CRUNCH
	db 46, BLIZZARD
	db 50, HAIL
	db 0 ; no more level-up moves
	
GlalieEvosAttacks:
	db 0 ; no more evolutions
	db 1, ICE_FANG
	db 1, TACKLE_SCRATCH_POUND
	db 1, LEER_TAIL_WHIP
	db 5, DOUBLE_TEAM
	db 10, ICE_SHARD
	db 14, ICY_WIND
	db 19, BITE
	db 23, AURORA_BEAM
	db 28, HEADBUTT
	db 34, PROTECT
	db 41, CRUNCH
	db 48, BLIZZARD
	db 54, HAIL
	db 0 ; no more level-up moves
	
BuizelEvosAttacks:
	db EVOLVE_LEVEL, 26, FLOATZEL
	db  0 ; no more evolutions
	db  1, TACKLE_SCRATCH_POUND
	db  4, GROWL
	db  7, WATER_GUN
	db 11, QUICK_ATTACK
	db 16, BITE
	db 20, SWIFT
	db 24, AQUA_JET
	db 27, DOUBLE_HIT
	db 34, AQUA_TAIL
	db 41, CRUNCH
	db 46, AGILITY_ROCK_POLISH
	db 52, HYDRO_PUMP
	db  0 ; no more level-up moves
	
FloatzelEvosAttacks:
	db  0 ; no more evolutions
	db  1, ICE_FANG
	db  1, TACKLE_SCRATCH_POUND
	db  1, GROWL
	db  1, WATER_GUN
	db  1, QUICK_ATTACK
	db  1, BITE
	db  1, SWIFT
	db  1, AQUA_JET
	db  1, DOUBLE_HIT
	db 36, AQUA_TAIL
	db 43, CRUNCH
	db 49, AGILITY_ROCK_POLISH
	db 55, HYDRO_PUMP
	db  0 ; no more level-up moves
	
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
	db 12, QUICK_ATTACK
	db 18, DOUBLE_KICK
	db 24, BATON_PASS
	db 30, AGILITY_ROCK_POLISH
	db 36, DOUBLE_HIT
	db 42, CHARM_FEATHER_DANCE
	db 48, ATTRACT
	db 54, ACROBATICS
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
	db 14, HEX
	db 19, CURSE
	db 23, FEINT_ATTACK
	db 28, SING_HYPNOSIS
	db 32, DREAM_EATER
	db 37, SUCKER_PUNCH
	db 41, SHADOW_BALL
	db 46, NASTY_PLOT
	db 50, DARK_PULSE
	db 0 ; no more level-up moves
	
MunchlaxEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, SNORLAX
	db  0 ; no more evolutions
	db  1, METRONOME
	db  1, FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	db  1, TACKLE_SCRATCH_POUND
	db  4, DEFENSE_CURL_HARDEN_WITHDRAW
	db  9, AMNESIA
	db 12, BITE
	db 17, SWIFT
	db 20, SCREECH
	db 28, HEADBUTT
	db 33, BODY_SLAM
	db 36, KNOCK_OFF
	db 41, ROLLOUT
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
	db 47, SLUDGE_BOMB
	db 0 ; no more level-up moves
	
ToxicroakEvosAttacks:
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
	db 41, NASTY_PLOT
	db 49, POISON_JAB
	db 56, SLUDGE_BOMB
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
	db 26, AURORA_BEAM
	db 31, LEECH_SEED
	db 36, ICE_SHARD
	db 41, WOOD_HAMMER
	db 46, BLIZZARD
	db 0 ; no more level-up moves
	
AbomasnowEvosAttacks:
	db 0 ; no more evolutions
	db 1, ICE_PUNCH
	db 1, TACKLE_SCRATCH_POUND
	db 1, LEER_TAIL_WHIP
	db 5, RAZOR_LEAF
	db 9, ICY_WIND
	db 13, SING_HYPNOSIS
	db 17, SWAGGER
	db 21, HAZE
	db 26, AURORA_BEAM
	db 31, LEECH_SEED
	db 36, ICE_SHARD
	db 47, WOOD_HAMMER
	db 58, BLIZZARD
	db 0 ; no more level-up moves
	
WeavileEvosAttacks:
	db 0 ; no more evolutions
	db 1, ICE_SHARD
	db 1, SLASH
	db 1, AGILITY_ROCK_POLISH
	db 1, BRICK_BREAK
	db 1, TACKLE_SCRATCH_POUND
	db 1, LEER_TAIL_WHIP
	db 1, TAUNT
	db 8, QUICK_ATTACK
	db 10, FEINT_ATTACK
	db 14, ICY_WIND
	db 16, FURY_SWIPES_FURY_ATTACK_COMET_PUNCH
	db 20, NASTY_PLOT
	db 22, METAL_CLAW
	db 25, SHARPEN_HOWL_MEDITATE
	db 28, PURSUIT
	db 32, SCREECH
	db 35, NIGHT_SLASH
	db 40, KNOCK_OFF
	db 44, CRUNCH
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
	db 62, GIGA_IMPACT
	db 0 ; no more level-up moves
	
MagmortarEvosAttacks:
	db 0 ; no more evolutions
	db 1, THUNDERPUNCH
	db 1, SMOG
	db 1, LEER_TAIL_WHIP
	db 1, EMBER
	db 1, SAND_ATTACK_SMOKESCREEN
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
	db 1, TACKLE_SCRATCH_POUND
	db 1, RAZOR_LEAF
	db 1, GROWL
	db 1, LEER_TAIL_WHIP
	db 5, SAND_ATTACK_SMOKESCREEN
	db 9, CHARM_FEATHER_DANCE
	db 13, QUICK_ATTACK
	db 17, SING_HYPNOSIS
	db 21, RAZOR_LEAF
	db 25, GIGA_DRAIN
	db 29, SWORDS_DANCE
	db 33, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db 37, SUNNY_DAY
	db 41, DOUBLE_EDGE
	db 45, POWER_WHIP
	db 0 ; no more level-up moves
	
GlaceonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, ICY_WIND
	db 1, GROWL
	db 1, LEER_TAIL_WHIP
	db 5, SAND_ATTACK_SMOKESCREEN
	db 9, CHARM_FEATHER_DANCE
	db 13, QUICK_ATTACK
	db 17, BITE
	db 21, AURORA_BEAM
	db 25, ICE_SHARD
	db 29, BARRIER_IRON_DEFENSE_ACID_ARMOR
	db 33, HAZE
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
	db 1, FURY_SWIPES_FURY_ATTACK_COMET_PUNCH
	db 1, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 1, ANCIENTPOWER
	db 1, FLAIL
	db 1, ICE_SHARD
	db 1, PECK
	db 1, TACKLE_SCRATCH_POUND
	db 1, FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	db 5, SAND_ATTACK_SMOKESCREEN
	db 8, HAIL
	db 11, MUD_SLAP
	db 14, ENDURE
	db 18, MAGNITUDE
	db 21, ICY_WIND
	db 24, ICE_FANG
	db 28, TAKE_DOWN
	db 33, DOUBLE_HIT
	db 37, HAZE
	db 41, THRASH
	db 46, EARTHQUAKE
	db 52, BLIZZARD
	db 58, AMNESIA
	db 0 ; no more level-up moves
	
PorygonZEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, CONVERSION
	db 1, CONVERSION2
	db 1, NASTY_PLOT
	db 7, THUNDERSHOCK
	db 12, PSYBEAM
	db 18, AGILITY_ROCK_POLISH
	db 25, CONVERSION
	db 25, CONVERSION2
	db 29, SIGNAL_BEAM
	db 34, SOFTBOILED_MILK_DRINK_RECOVER
	db 40, THUNDERBOLT
	db 45, TRI_ATTACK
	db 51, LOCK_ON_MIND_READER
	db 56, ZAP_CANNON
	db 62, HYPER_BEAM
	db 0 ; no more level-up moves
	
GalladeEvosAttacks:
	db 0 ; no more evolutions
	db 1, SLASH
	db 1, SUPERPOWER
	db 1, NIGHT_SLASH
	db 1, LEER_TAIL_WHIP
	db 1, CONFUSION
	db 1, DOUBLE_TEAM
	db 1, TELEPORT
	db 4, CONFUSION
	db 6, DOUBLE_TEAM
	db 9, TELEPORT
	db 14, FURY_CUTTER
	db 17, AIR_SLASH
	db 20, WISH
	db 26, SWORDS_DANCE
	db 31, ZEN_HEADBUTT
	db 40, FEINT_ATTACK
	db 44, FALSE_SWIPE
	db 49, PROTECT
	db 53, SUPERPOWER
	db 58, MOONBLAST
	db 0 ; no more level-up moves
	
FroslassEvosAttacks:
	db 0 ; no more evolutions
	db 1, OMINOUS_WIND
	db 1, DESTINY_BOND
	db 1, TACKLE_SCRATCH_POUND
	db 1, LEER_TAIL_WHIP
	db 5, DOUBLE_TEAM
	db 10, ICE_SHARD
	db 14, ICY_WIND
	db 19, NIGHT_SHADE
	db 23, MEGA_DRAIN
	db 28, WILL_O_WISP
	db 32, CONFUSE_RAY
	db 37, BRICK_BREAK
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
	db  0 ; no more evolutions
	db  1, DEFENSE_CURL_HARDEN_WITHDRAW
	db  1, ROLLOUT
	db  5, POISON_STING
	db  8, SCREECH
	db 12, PURSUIT
	db 15, PROTECT
	db 19, POISON_FANG
	db 21, FURY_CUTTER
	db 26, VENOSHOCK
	db 29, AGILITY_ROCK_POLISH
	db 33, X_SCISSOR
	db 36, TOXIC
	db 38, VENOSHOCK
	db 43, DOUBLE_EDGE
	db  0 ; no more level-up moves

WhirlipedeEvosAttacks:
	db EVOLVE_LEVEL, 30, SCOLIPEDE
	db  0 ; no more evolutions
	db  1, BARRIER_IRON_DEFENSE_ACID_ARMOR
	db  1, DEFENSE_CURL_HARDEN_WITHDRAW
	db  1, ROLLOUT
	db  1, POISON_STING
	db  1, SCREECH
	db 12, PURSUIT
	db 15, PROTECT
	db 19, POISON_FANG
	db 21, FURY_CUTTER
	db 28, VENOSHOCK
	db 32, AGILITY_ROCK_POLISH
	db 37, X_SCISSOR
	db 41, TOXIC
	db 43, VENOSHOCK
	db 50, DOUBLE_EDGE
	db  0 ; no more level-up moves

ScolipedeEvosAttacks:
	db  0 ; no more evolutions
	db  1, BATON_PASS
	db  1, BARRIER_IRON_DEFENSE_ACID_ARMOR
	db  1, MEGAHORN
	db  1, DEFENSE_CURL_HARDEN_WITHDRAW
	db  1, ROLLOUT
	db  1, POISON_STING
	db  1, SCREECH
	db 12, PURSUIT
	db 15, PROTECT
	db 19, POISON_FANG
	db 23, FURY_CUTTER
	db 28, VENOSHOCK
	db 33, AGILITY_ROCK_POLISH
	db 39, X_SCISSOR
	db 44, TOXIC
	db 47, VENOSHOCK
	db 55, DOUBLE_EDGE
	db 65, MEGAHORN
	db  0 ; no more level-up moves
	
CottoneeEvosAttacks:
	db EVOLVE_ITEM, SUN_STONE, WHIMSICOTT
	db  0 ; no more evolutions
	db  1, ABSORB
	db  1, FAIRY_WIND
	db  4, WORK_UP_GROWTH
	db  8, LEECH_SEED
	db 10, STUN_SPORE
	db 13, MEGA_DRAIN
	db 15, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 18, RAZOR_LEAF
	db 22, POISONPOWDER
	db 26, GIGA_DRAIN
	db 28, CHARM_FEATHER_DANCE
	db 33, ENERGY_BALL
	db 37, COTTON_GUARD
	db 40, SUNNY_DAY
	db 44, SOLAR_BEAM
	db  0 ; no more level-up moves
	
WhimsicottEvosAttacks:
	db  0 ; no more evolutions
	db  1, ABSORB
	db  1, FAIRY_WIND
	db  1, WORK_UP_GROWTH
	db  1, LEECH_SEED
	db  1, STUN_SPORE
	db  1, MEGA_DRAIN
	db  1, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db  1, RAZOR_LEAF
	db  1, POISONPOWDER
	db  1, GIGA_DRAIN
	db  1, CHARM_FEATHER_DANCE
	db  1, ENERGY_BALL
	db  1, COTTON_GUARD
	db  1, SUNNY_DAY
	db  1, SOLAR_BEAM
	db 28, AIR_SLASH
	db 44, HURRICANE
	db 50, MOONBLAST
	db  0 ; no more level-up moves
	
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
	db  0 ; no more evolutions
	db  1, SAND_ATTACK_SMOKESCREEN
	db  5, ROCK_BLAST
	db  7, DEFENSE_CURL_HARDEN_WITHDRAW
	db 11, FURY_CUTTER
	db 13, FEINT_ATTACK
	db 18, AGILITY_ROCK_POLISH
	db 23, METAL_CLAW
	db 29, ROCK_SLIDE
	db 31, SLASH
	db 35, X_SCISSOR
	db 37, SHELL_SMASH
	db 41, FLAIL
	db 45, ROCK_WRECKER
	db  0 ; no more level-up moves
	
CrustleEvosAttacks:
	db  0 ; no more evolutions
	db  1, SAND_ATTACK_SMOKESCREEN
	db  1, ROCK_BLAST
	db  1, DEFENSE_CURL_HARDEN_WITHDRAW
	db  1, FURY_CUTTER
	db  1, FEINT_ATTACK
	db  1, AGILITY_ROCK_POLISH
	db  1, METAL_CLAW
	db  1, ROCK_SLIDE
	db  1, SLASH
	db 37, X_SCISSOR
	db 40, SHELL_SMASH
	db 45, FLAIL
	db 50, ROCK_WRECKER
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
	db  0 ; no more evolutions
	db  1, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db  1, ABSORB
	db  1, MEAN_LOOK_BLOCK_SPIDER_WEB
	db  4, THUNDER_WAVE
	db  7, SCREECH
	db 12, FURY_CUTTER
	db 15, THUNDERSHOCK
	db 18, PIN_MISSILE
	db 23, ACID
	db 26, SLASH
	db 29, ELECTRO_BALL
	db 34, SIGNAL_BEAM
	db 37, AGILITY_ROCK_POLISH
	db 40, SUCKER_PUNCH
	db 45, THUNDERBOLT
	db 48, BUG_BUZZ
	db  0 ; no more level-up moves
	
GalvantulaEvosAttacks:
	db  0 ; no more evolutions
	db  1, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db  1, ABSORB
	db  1, MEAN_LOOK_BLOCK_SPIDER_WEB
	db  1, THUNDER_WAVE
	db  1, SCREECH
	db  1, FURY_CUTTER
	db  1, THUNDERSHOCK
	db  1, PIN_MISSILE
	db  1, ACID
	db  1, SLASH
	db  1, ELECTRO_BALL
	db 35, SIGNAL_BEAM
	db 39, AGILITY_ROCK_POLISH
	db 44, SUCKER_PUNCH
	db 48, THUNDERBOLT
	db 54, BUG_BUZZ
	db  0 ; no more level-up moves
	
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
	db 18, GUST
	db 24, SCREECH
	db 30, LEECH_LIFE
	db 36, FLAMETHROWER
	db 42, BUG_BUZZ
	db 48, AMNESIA
	db 54, DOUBLE_EDGE
	db 62, HURRICANE
	db 70, FIRE_BLAST
	db 100, FIERY_DANCE
	db 0 ; no more level-up moves
	
SylveonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, FAIRY_WIND
	db 1, GROWL
	db 1, LEER_TAIL_WHIP
	db 5, SAND_ATTACK_SMOKESCREEN
	db 9, CHARM_FEATHER_DANCE
	db 13, QUICK_ATTACK
	db 17, SWIFT
	db 21, REFLECT
	db 25, DAZZLINGLEAM
	db 29, LIGHT_SCREEN
	db 33, HAZE
	db 37, MOONBLAST
	db 41, DOUBLE_EDGE
	db 45, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db 0 ; no more level-up moves
	
PhantumpEvosAttacks:
	db EVOLVE_TRADE, -1, TREVENANT
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, CONFUSE_RAY
	db 6, LEECH_SEED
	db 10, FEINT_ATTACK
	db 15, WORK_UP_GROWTH
	db 19, WILL_O_WISP
	db 24, HEX
	db 28, HORN_LEECH
	db 33, CURSE
	db 37, SHADOW_BALL
	db 42, DESTINY_BOND
	db 46, POWER_WHIP
	db 0 ; no more level-up moves
	
TrevenantEvosAttacks:
	db 0 ; no more evolutions
	db 1, SHADOW_CLAW
	db 1, TACKLE_SCRATCH_POUND
	db 1, CONFUSE_RAY
	db 1, LEECH_SEED
	db 1, FEINT_ATTACK
	db 15, WORK_UP_GROWTH
	db 19, WILL_O_WISP
	db 24, HEX
	db 28, HORN_LEECH
	db 33, CURSE
	db 37, SHADOW_BALL
	db 42, DESTINY_BOND
	db 46, POWER_WHIP
	db 52, DRAIN_PUNCH
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
	db 21, FURY_SWIPES_FURY_ATTACK_COMET_PUNCH
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
	db 24, FURY_SWIPES_FURY_ATTACK_COMET_PUNCH
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
	db  1, FURY_SWIPES_FURY_ATTACK_COMET_PUNCH
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
