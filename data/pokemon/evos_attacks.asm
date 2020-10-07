INCLUDE "constants.asm"


SECTION "Evolutions and Attacks", ROMX


INCLUDE "data/pokemon/evolution_moves.asm"

INCLUDE "data/pokemon/evos_attacks_pointers.asm"

EvosAttacks::

BulbasaurEvosAttacks:
	db EVOLVE_LEVEL, 16, IVYSAUR
	db  0 ; no more evolutions
	db  1, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db  0 ; no more level-up moves
	db  1, TACKLE_SCRATCH_POUND
	db  3, GROWL
	db  7, VINE_WHIP
	db  9, LEECH_SEED
	db 13, POISONPOWDER
	db 13, SLEEP_POWDER
	db 17, TAKE_DOWN
	db 19, RAZOR_LEAF
	db 21, SWEET_SCENT
	db 25, STUN_SPORE
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
	db 23, SWEET_SCENT
	db 27, STUN_SPORE
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
	db  1, SWEET_SCENT
	db  1, STUN_SPORE
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
	db 15, SCARY_FACE_COTTON_SPORE
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
	db  1, SCARY_FACE_COTTON_SPORE
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
	db  1, SCARY_FACE_COTTON_SPORE
	db  1, DRAGON_RAGE
	db  1, WING_ATTACK
	db  1, SHADOW_CLAW
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
	db 31, SKULL_BASH
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
	db 35, SKULL_BASH
	db 37, RAIN_DANCE
	db 40, HYDRO_PUMP
	db  0 ; no more level-up moves

BlastoiseEvosAttacks:
	db  0 ; no more evolutions
	db  1, BARRIER_IRON_DEFENSE
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
	db 40, SKULL_BASH
	db 45, RAIN_DANCE
	db 50, HYDRO_PUMP
	db  0 ; no more level-up moves

WeedleEvosAttacks:
	db EVOLVE_LEVEL, 7, KAKUNA
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

KakunaEvosAttacks:
	db EVOLVE_LEVEL, 10, BEEDRILL
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 0 ; no more level-up moves

BeedrillEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

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
	db  1, SCARY_FACE_COTTON_SPORE
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

EkansEvosAttacks:
	db EVOLVE_LEVEL, 22, ARBOK
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

ArbokEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

PikachuEvosAttacks:
	db EVOLVE_ITEM, THUNDERSTONE, RAICHU
	db EVOLVE_ITEM, FIRE_STONE, RAICHU_A
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

RaichuEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
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
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

NidorinaEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, NIDOQUEEN
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

NidoqueenEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

NidoranMEvosAttacks:
	db EVOLVE_LEVEL, 16, NIDORINO
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

NidorinoEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, NIDOKING
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

NidokingEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

ClefairyEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, CLEFABLE
	db  0 ; no more evolutions
	db  1, FAIRY_WIND
	db  1, TACKLE_SCRATCH_POUND
	db  1, GROWL
	db  1, ENCORE
	db  8, SING
	db 13, DOUBLE_SLAP
	db 17, DEFENSE_CURL_HARDEN_WITHDRAW
	db 22, BODY_SLAM
	db 26, MINIMIZE
	db 32, METRONOME
;	db 36, COSMIC_POWER
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
	db  1, SING
	db  1, DOUBLE_SLAP
	db  1, DEFENSE_CURL_HARDEN_WITHDRAW
	db  1, BODY_SLAM
	db  1, MINIMIZE
	db  1, METRONOME
;	db  1, COSMIC_POWER
	db  1, CHARM_FEATHER_DANCE
	db  1, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db  1, MOONBLAST
	db  0 ; no more level-up moves

JigglypuffEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, WIGGLYTUFF
	db  0 ; no more evolutions
	db  1, SING
	db  3, DEFENSE_CURL_HARDEN_WITHDRAW
	db  5, TACKLE_SCRATCH_POUND
	db  9, FAIRY_WIND
	db 13, DISABLE
	db 17, DOUBLE_SLAP
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
	db  1, SING
	db  1, DEFENSE_CURL_HARDEN_WITHDRAW
	db  1, TACKLE_SCRATCH_POUND
	db  1, FAIRY_WIND
	db  1, DISABLE
	db  1, DOUBLE_SLAP
	db  1, ROLLOUT
	db  1, REST
	db  1, BODY_SLAM
	db  1, GYRO_BALL
	db  1, MIMIC
	db  1, MIRROR_MOVE
	db  1, HYPER_VOICE
	db  1, DOUBLE_EDGE
	db  0 ; no more level-up moves

ZubatEvosAttacks:
	db EVOLVE_LEVEL, 22, GOLBAT
	db  0 ; no more evolutions
	db  1, ABSORB
	db  5, SUPERSONIC
	db  7, LICK
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
	db  1, LICK
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
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

GloomEvosAttacks:
	db EVOLVE_ITEM, LEAF_STONE, VILEPLUME
	db EVOLVE_ITEM, SUN_STONE, BELLOSSOM
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

VileplumeEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

MeowthEvosAttacks:
	db EVOLVE_LEVEL, 28, PERSIAN
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

PersianEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

PsyduckEvosAttacks:
	db EVOLVE_LEVEL, 33, GOLDUCK
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

GolduckEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

GrowlitheEvosAttacks:
	db EVOLVE_ITEM, FIRE_STONE, ARCANINE
	db  0 ; no more evolutions
	db  1, BITE
	db  1, ROAR_WHIRLWIND
	db  6, EMBER
	db  8, LEER_TAIL_WHIP
	db 10, FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	db 16, FLAME_WHEEL
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
	db  1, ROAR_WHIRLWIND
	db  1, FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	db  1, EMBER
	db  1, LEER_TAIL_WHIP
	db  1, FLAME_WHEEL
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
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

PoliwhirlEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, POLIWRATH
	db EVOLVE_TRADE, KINGS_ROCK, POLITOED
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

PoliwrathEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

AbraEvosAttacks:
	db EVOLVE_LEVEL, 16, KADABRA
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

KadabraEvosAttacks:
	db EVOLVE_TRADE, -1, ALAKAZAM
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

AlakazamEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

MachopEvosAttacks:
	db EVOLVE_LEVEL, 28, MACHOKE
	db  0 ; no more evolutions
	db  1, KARATE_CHOP
	db  1, LEER_TAIL_WHIP
	db  5, FOCUS_ENERGY
	db  9, FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	db 13, SEISMIC_TOSS
	db 18, BULK_UP
	db 21, KNOCK_OFF
	db 25, VITAL_THROW
	db 30, SCARY_FACE_COTTON_SPORE
	db 38, CROSS_CHOP
	db 44, DYNAMICPUNCH
	db  0 ; no more level-up moves

MachokeEvosAttacks:
	db EVOLVE_TRADE, -1, MACHAMP
	db  0 ; no more evolutions
	db  1, KARATE_CHOP
	db  1, LEER_TAIL_WHIP
	db  1, FOCUS_ENERGY
	db  1, FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	db  1, SEISMIC_TOSS
	db  1, BULK_UP
	db  1, KNOCK_OFF
	db  1, VITAL_THROW
	db 32, SCARY_FACE_COTTON_SPORE
	db 41, CROSS_CHOP
	db 50, DYNAMICPUNCH
	db  0 ; no more level-up moves

MachampEvosAttacks:
	db  0 ; no more evolutions
	db  1, KARATE_CHOP
	db  1, LEER_TAIL_WHIP
	db  1, FOCUS_ENERGY
	db  1, FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	db  1, SEISMIC_TOSS
	db  1, BULK_UP
	db  1, KNOCK_OFF
	db  1, VITAL_THROW
	db 32, SCARY_FACE_COTTON_SPORE
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
	db 60, GYRO_BALL

PonytaEvosAttacks:
	db EVOLVE_LEVEL, 40, RAPIDASH
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

RapidashEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

SlowpokeEvosAttacks:
	db EVOLVE_LEVEL, 37, SLOWBRO
	db EVOLVE_TRADE, KINGS_ROCK, SLOWKING
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

SlowbroEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
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
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

DodrioEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

GastlyEvosAttacks:
	db EVOLVE_LEVEL, 25, HAUNTER
	db  0 ; no more evolutions
	db  1, HYPNOSIS
	db  1, LICK
;	db  5, SPITE
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
	db  1, HYPNOSIS
	db  1, LICK
;	db  1, SPITE
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
	db  1, HYPNOSIS
	db  1, LICK
;	db  1, SPITE
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
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

VoltorbEvosAttacks:
	db EVOLVE_LEVEL, 30, ELECTRODE
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

ElectrodeEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

ExeggcuteEvosAttacks:
	db EVOLVE_ITEM, THUNDERSTONE, EXEGGUTOR
	db EVOLVE_ITEM, FIRE_STONE, EXEGGUTOR_A
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

ExeggutorEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

CuboneEvosAttacks:
	db EVOLVE_ITEM, THUNDERSTONE, MAROWAK
	db EVOLVE_ITEM, FIRE_STONE, MAROWAK_A
	db  0 ; no more evolutions
	db  1, GROWL
	db  3, TACKLE_SCRATCH_POUND
	db  8, BONE_CLUB
	db 11, HEADBUTT
	db 13, LEER_TAIL_WHIP
	db 17, FOCUS_ENERGY
	db 21, BONEMERANG
	db 23, RAGE
	db 27, FALSE_SWIPE
	db 31, THRASH
	db 35, DIG
	db 39, SLASH
	db 43, DOUBLE_EDGE
	db 50, BONE_RUSH
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
	db 56, BONE_RUSH
	db  0 ; no more level-up moves

KoffingEvosAttacks:
	db EVOLVE_LEVEL, 35, WEEZING
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

WeezingEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

RhyhornEvosAttacks:
	db EVOLVE_LEVEL, 42, RHYDON
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

RhydonEvosAttacks:
	db EVOLVE_HOLDING, PROTECTOR, RHYPERIOR
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

HorseaEvosAttacks:
	db EVOLVE_LEVEL, 32, SEADRA
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

SeadraEvosAttacks:
	db EVOLVE_TRADE, DRAGON_SCALE, KINGDRA
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

StaryuEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, STARMIE
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

StarmieEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

ScytherEvosAttacks:
	db EVOLVE_TRADE, METAL_COAT, SCIZOR
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

ElectabuzzEvosAttacks:
	db EVOLVE_HOLDING, ELECTIRIZER, ELECTIVIRE
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

MagmarEvosAttacks:
	db EVOLVE_HOLDING, MAGMARIZER, MAGMORTAR
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

PinsirEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

TaurosEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

MagikarpEvosAttacks:
	db EVOLVE_LEVEL, 20, GYARADOS
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

GyaradosEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

LaprasEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

DittoEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

EeveeEvosAttacks:
	db EVOLVE_ITEM, THUNDERSTONE, JOLTEON
	db EVOLVE_ITEM, WATER_STONE, VAPOREON
	db EVOLVE_ITEM, FIRE_STONE, FLAREON
	db EVOLVE_HAPPINESS, TR_MORNDAY, ESPEON
	db EVOLVE_HAPPINESS, TR_NITE, UMBREON
	db EVOLVE_LOCATION, EVENTIDE_FOREST, LEAFEON
	db EVOLVE_LOCATION, SUNSET_BAY, GLACEON
	db EVOLVE_LOCATION, GLINT_GROVE, SYLVEON
	
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

VaporeonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

JolteonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

FlareonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

PorygonEvosAttacks:
	db EVOLVE_TRADE, UP_GRADE, PORYGON2
	db 0 ; no more evolutions
	db 1, ICE_FANG
	db 1, QUIVER_DANCE
	db 1, CONVERSION
	db 0 ; no more level-up moves

SnorlaxEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

DratiniEvosAttacks:
	db EVOLVE_LEVEL, 30, DRAGONAIR
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

DragonairEvosAttacks:
	db EVOLVE_LEVEL, 55, DRAGONITE
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

DragoniteEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
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
	db 33, SWEET_SCENT
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
	db 35, SWEET_SCENT
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
	db  1, PSYCHIC
	db 38, SWEET_SCENT
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
	db 22, FLAME_WHEEL
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
	db 23, FLAME_WHEEL
	db 29, ROLLOUT
	db 30, DEFENSE_CURL_HARDEN_WITHDRAW
	db 38, FLAMETHROWER
	db 44, DOUBLE_EDGE
	db 50, FIRE_BLAST
	db  0 ; no more level-up moves

TyphlosionEvosAttacks:
	db  0 ; no more evolutions
	db  1, WORK_UP
	db  1, TACKLE_SCRATCH_POUND
	db  1, LEER_TAIL_WHIP
	db  1, SAND_ATTACK_SMOKESCREEN
	db  1, QUICK_ATTACK
	db  1, FLAME_CHARGE
	db  1, SWIFT
	db  1, FLAME_WHEEL
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
	db 16, SCARY_FACE_COTTON_SPORE
	db 20, ICE_FANG
	db 23, FLAIL
	db 27, SLASH
	db 32, CRUNCH
	db 38, THRASH
	db 44, HYDRO_PUMP
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
	db  1, SCARY_FACE_COTTON_SPORE
	db 22, ICE_FANG
	db 25, FLAIL
	db 30, SLASH
	db 33, CRUNCH
	db 40, THRASH
	db 47, HYDRO_PUMP
	db  0 ; no more level-up moves

FeraligatrEvosAttacks:
	db  0 ; no more evolutions
	db  1, BULK_UP
	db  1, TACKLE_SCRATCH_POUND
	db  1, LEER_TAIL_WHIP
	db  1, WATER_GUN
	db  1, RAGE
	db  1, BITE
	db  1, SCARY_FACE_COTTON_SPORE
	db  1, AQUA_JET
	db  1, ICE_FANG
	db  1, FLAIL
	db  1, SLASH
	db 36, CRUNCH
	db 43, THRASH
	db 50, HYDRO_PUMP
	db  0 ; no more level-up moves

LedybaEvosAttacks:
	db EVOLVE_LEVEL, 18, LEDIAN
	db  0 ; no more evolutions
	db  1, TACKLE_SCRATCH_POUND
	db  5, SUPERSONIC
	db  8, SWIFT
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
	db  1, LICK
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
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

LanturnEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

TogepiEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, TOGETIC
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

TogeticEvosAttacks:
	db EVOLVE_ITEM, SHINY_STONE, TOGEKISS
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

NatuEvosAttacks:
	db EVOLVE_LEVEL, 25, XATU
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

XatuEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

MareepEvosAttacks:
	db EVOLVE_LEVEL, 15, FLAAFFY
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

FlaaffyEvosAttacks:
	db EVOLVE_LEVEL, 30, AMPHAROS
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

AmpharosEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

BellossomEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

MarillEvosAttacks:
	db EVOLVE_LEVEL, 18, AZUMARILL
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

AzumarillEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

SudowoodoEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

PolitoedEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

WooperEvosAttacks:
	db EVOLVE_LEVEL, 20, QUAGSIRE
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

QuagsireEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

EspeonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

UmbreonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

MurkrowEvosAttacks:
	db EVOLVE_ITEM, DUSK_STONE, HONCHKROW
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

SlowkingEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

PinecoEvosAttacks:
	db EVOLVE_LEVEL, 31, FORRETRESS
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

ForretressEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

GligarEvosAttacks:
	db EVOLVE_HOLDING, RAZOR_FANG, GLISCOR
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

SteelixEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

SnubbullEvosAttacks:
	db EVOLVE_LEVEL, 23, GRANBULL
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

GranbullEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

ScizorEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

ShuckleEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

HeracrossEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

SneaselEvosAttacks:
	db EVOLVE_HOLDING, RAZOR_CLAW, WEAVILE
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

TeddiursaEvosAttacks:
	db EVOLVE_LEVEL, 30, URSARING
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

UrsaringEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

SlugmaEvosAttacks:
	db EVOLVE_LEVEL, 38, MAGCARGO
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

MagcargoEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

SwinubEvosAttacks:
	db EVOLVE_LEVEL, 33, PILOSWINE
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

PiloswineEvosAttacks:
	db EVOLVE_MOVE, ANCIENTPOWER, MAMOSWINE
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

CorsolaEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

SkarmoryEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

HoundourEvosAttacks:
	db EVOLVE_LEVEL, 24, HOUNDOOM
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

HoundoomEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

KingdraEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

PhanpyEvosAttacks:
	db EVOLVE_LEVEL, 25, DONPHAN
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

DonphanEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

Porygon2EvosAttacks:
	db EVOLVE_HOLDING, DUBIOUS_DISC, PORYGON_Z
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

StantlerEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

SmeargleEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

ElekidEvosAttacks:
	db EVOLVE_LEVEL, 30, ELECTABUZZ
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

MagbyEvosAttacks:
	db EVOLVE_LEVEL, 30, MAGMAR
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

MiltankEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

LarvitarEvosAttacks:
	db EVOLVE_LEVEL, 30, PUPITAR
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

PupitarEvosAttacks:
	db EVOLVE_LEVEL, 55, TYRANITAR
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

TyranitarEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
ShroomishEvosAttacks:
	db EVOLVE_LEVEL, 23, BRELOOM
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
BreloomEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves

AronEvosAttacks:
	db EVOLVE_LEVEL, 32, LAIRON
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
LaironEvosAttacks:
	db EVOLVE_LEVEL, 42, AGGRON
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
AggronEvosAttacks: 
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
MedititeEvosAttacks:
	db EVOLVE_LEVEL, 37, MEDICHAM
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
MedichamEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
NumelEvosAttacks:
	db EVOLVE_LEVEL, 33, CAMERUPT
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
CameruptEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
SwabluEvosAttacks:
	db EVOLVE_LEVEL, 35, ALTARIA
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
AltariaEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
CorphishEvosAttacks:
	db EVOLVE_LEVEL, 30, CRAWDAUNT
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
CrawdauntEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
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
	
BunearyEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, LOPUNNY
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
LopunnyEvosAttacks: 
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
HonchkrowEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
MunchlaxEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, SNORLAX
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
WeavileEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
MagnezoneEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
RhyperiorEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
ElectivireEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
MagmortarEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
TogekissEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
LeafeonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
GlaceonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
GliscorEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
MamoswineEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
PorygonZEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
CottoneeEvosAttacks:
	db EVOLVE_ITEM, SUN_STONE, WHIMSICOTT
	db  0 ; no more evolutions
	db  1, ABSORB
	db  1, FAIRY_WIND
	db  4, GROWTH
	db  8, LEECH_SEED
	db 10, STUN_SPORE
	db 13, MEGA_DRAIN
	db 15, SCARY_FACE_COTTON_SPORE
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
	db  1, GROWTH
	db  1, LEECH_SEED
	db  1, STUN_SPORE
	db  1, MEGA_DRAIN
	db  1, SCARY_FACE_COTTON_SPORE
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
	
DwebbleEvosAttacks:
	db EVOLVE_LEVEL, 34, CRUSTLE
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
CrustleEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
JoltikEvosAttacks:
	db EVOLVE_LEVEL, 36, GALVANTULA
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
GalvantulaEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
LarvestaEvosAttacks:
	db EVOLVE_LEVEL, 59, VOLCARONA
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
VolcaronaEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
SylveonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
NoibatEvosAttacks:
	db EVOLVE_LEVEL, 48, NOIVERN
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
NoivernEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
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
	db  0 ; no more level-up moves
	
Raichu_AEvosAttacks:
	db  0 ; no more evolutions
	db  1, PSYCHIC_M
	db  1, TACKLE_SCRATCH_POUND
	db  0 ; no more level-up moves
	
Exeggutor_AEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
Marowak_AEvosAttacks:
	db  0 ; no more evolutions
	db  1, FLAME_WHEEL
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
	db 56, BONE_RUSH
