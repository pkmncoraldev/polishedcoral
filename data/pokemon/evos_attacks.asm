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
	db 19, RAZOR_LEAF
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
	db 21, RAZOR_LEAF
	db 27, WORK_UP_GROWTH
	db 32, DOUBLE_EDGE
	db 36, TOXIC
	db 41, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db 45, SOLAR_BEAM
	db  0 ; no more level-up moves

VenusaurEvosAttacks:
	db  0 ; no more evolutions
	db 1, PETAL_BLIZZARD
	db 1, SLUDGE
	db 1, TACKLE_SCRATCH_POUND
	db 1, GROWL
	db 1, LEECH_SEED
	db 1, VINE_WHIP
	db 1, POISONPOWDER
	db 1, SLEEP_POWDER
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
	db 10, SAND_ATTACK_SMOKESCREEN_FLASH
	db 13, FIRE_SPIN
	db 19, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 21, FLAME_BURST
	db 25, DRAGON_RAGE
	db 29, SLASH
	db 34, FLAMETHROWER
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
	db 1, SAND_ATTACK_SMOKESCREEN_FLASH
	db 1, FIRE_SPIN
	db 21, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 28, FLAME_BURST
	db 32, DRAGON_RAGE
	db 39, SLASH
	db 43, FLAMETHROWER
	db 50, FIRE_BLAST
	db 0 ; no more level-up moves

CharizardEvosAttacks:
	db 0 ; no more evolutions
	db 1, AIR_SLASH
	db 1, DRAGONBREATH
	db 1, FIRE_FANG
	db 1, TACKLE_SCRATCH_POUND
	db 1, GROWL
	db 1, EMBER
	db 1, SAND_ATTACK_SMOKESCREEN_FLASH
	db 1, FIRE_SPIN
	db 1, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 1, FLAME_BURST
	db 1, DRAGON_RAGE
	db 41, SLASH
	db 47, FLAMETHROWER
	db 56, FIRE_BLAST
	db 0 ; no more level-up moves

SquirtleEvosAttacks:
	db EVOLVE_LEVEL, 16, WARTORTLE
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, LEER_TAIL_WHIP
	db 7, WATER_GUN
	db 10, DEFENSE_CURL_HARDEN_WITHDRAW
	db 13, RAPID_SPIN
	db 16, BITE
	db 22, BARRIER_IRON_DEFENSE_ACID_ARMOR
	db 25, BUBBLE_BEAM
	db 31, DOUBLE_EDGE
	db 34, AQUA_TAIL
	db 37, HYDRO_PUMP
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
	db 25, BARRIER_IRON_DEFENSE_ACID_ARMOR
	db 30, BUBBLE_BEAM
	db 37, DOUBLE_EDGE
	db 41, AQUA_TAIL
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
	db 1, BARRIER_IRON_DEFENSE_ACID_ARMOR
	db 1, BUBBLE_BEAM
	db 40, DOUBLE_EDGE
	db 47, AQUA_TAIL
	db 54, HYDRO_PUMP
	db 0 ; no more level-up moves

PidgeyEvosAttacks:
	db EVOLVE_LEVEL, 18, PIDGEOTTO
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 4, SAND_ATTACK_SMOKESCREEN_FLASH
	db 8, GUST
	db 12, QUICK_ATTACK
	db 15, ROAR_WHIRLWIND
	db 19, CHARM_FEATHER_DANCE
	db 23, WING_ATTACK
	db 26, AIR_SLASH
	db 30, ROOST
	db 39, MIRROR_MOVE
	db 48, BRAVE_BIRD
	db 0 ; no more level-up moves

PidgeottoEvosAttacks:
	db EVOLVE_LEVEL, 36, PIDGEOT
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, SAND_ATTACK_SMOKESCREEN_FLASH
	db 1, GUST
	db 1, QUICK_ATTACK
	db 1, ROAR_WHIRLWIND
	db 19, CHARM_FEATHER_DANCE
	db 23, WING_ATTACK
	db 26, AIR_SLASH
	db 30, ROOST
	db 39, MIRROR_MOVE
	db 48, BRAVE_BIRD
	db 0 ; no more level-up moves

PidgeotEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, SAND_ATTACK_SMOKESCREEN_FLASH
	db 1, GUST
	db 1, QUICK_ATTACK
	db 1, ROAR_WHIRLWIND
	db 1, CHARM_FEATHER_DANCE
	db 1, WING_ATTACK
	db 1, AIR_SLASH
	db 1, ROOST
	db 42, MIRROR_MOVE
	db 52, BRAVE_BIRD
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
	db 22, SUCKER_PUNCH
	db 25, SCREECH
	db 28, CRUNCH
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
	db 24, SUCKER_PUNCH
	db 29, SCREECH
	db 34, CRUNCH
	db 39, DOUBLE_EDGE
	db 44, REVERSAL
	db 0 ; no more level-up moves

PikachuEvosAttacks:
	db EVOLVE_ITEM, THUNDERSTONE, RAICHU
	db EVOLVE_ITEM, BIG_MALASADA, RAICHU
	db 0 ; no more evolutions
	db 1, THUNDERSHOCK
	db 1, GROWL
	db 5, LEER_TAIL_WHIP
	db 9, QUICK_ATTACK
	db 17, THUNDER_WAVE
	db 22, DOUBLE_TEAM
	db 26, SPARK
	db 30, AGILITY_ROCK_POLISH
	db 37, IRON_TAIL
	db 46, THUNDERBOLT
	db 57, THUNDER
	db 0 ; no more level-up moves

RaichuEvosAttacks:
	db 0 ; no more evolutions
	db 1, THUNDERPUNCH
	db 1, THUNDERSHOCK
	db 1, GROWL
	db 5, LEER_TAIL_WHIP
	db 9, QUICK_ATTACK
	db 17, THUNDER_WAVE
	db 22, DOUBLE_TEAM
	db 26, SPARK
	db 30, AGILITY_ROCK_POLISH
	db 37, IRON_TAIL
	db 46, THUNDERBOLT
	db 57, THUNDER
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
	db 37, CRUNCH
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
	db 36, POISON_FANG
	db 40, CRUNCH
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
	db 35, BODY_SLAM
	db 43, SCREECH
	db 60, SUPERPOWER
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
	db 37, MEGAHORN
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
	db 36, POISON_JAB
	db 40, MEGAHORN
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
	db 35, THRASH
	db 43, BULK_UP
	db 60, SUPERPOWER
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
	db 31, TRANSFORM_SKETCH_MIMIC_SPLASH_METRO
	db 34, COSMIC_POWER
	db 39, CHARM_FEATHER_DANCE
	db 42, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db 57, MOONBLAST
	db 0 ; no more level-up moves

ClefableEvosAttacks:
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
	db 31, TRANSFORM_SKETCH_MIMIC_SPLASH_METRO
	db 34, COSMIC_POWER
	db 39, CHARM_FEATHER_DANCE
	db 42, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db 57, MOONBLAST
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
	db 25, ATTRACT
	db 29, REST
	db 33, BODY_SLAM
	db 37, TRANSFORM_SKETCH_MIMIC_SPLASH_METRO
	db 41, HYPER_VOICE
	db 45, DOUBLE_EDGE
	db 0 ; no more level-up moves

WigglytuffEvosAttacks:
	db  0 ; no more evolutions
	db 1, PLAY_ROUGH
	db 1, SING_HYPNOSIS
	db 1, TACKLE_SCRATCH_POUND
	db 5, DEFENSE_CURL_HARDEN_WITHDRAW
	db 9, FAIRY_WIND
	db 13, DISABLE
	db 17, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 21, ROLLOUT
	db 25, ATTRACT
	db 29, REST
	db 33, BODY_SLAM
	db 37, TRANSFORM_SKETCH_MIMIC_SPLASH_METRO
	db 41, HYPER_VOICE
	db 45, DOUBLE_EDGE
	db 0 ; no more level-up moves

ZubatEvosAttacks:
	db EVOLVE_LEVEL, 22, GOLBAT
	db 0 ; no more evolutions
	db 1, ABSORB
	db 5, SUPERSONIC
	db 7, SWIFT
	db 11, BITE
	db 13, SCREECH
	db 17, CONFUSE_RAY
	db 20, WING_ATTACK
	db 23, AIR_SLASH
	db 25, VENOSHOCK
	db 29, MEAN_LOOK_BLOCK_SPIDER_WEB
	db 31, LEECH_LIFE
	db 35, HAZE
	db 37, POISON_FANG
	db 41, ACROBATICS
	db 0 ; no more level-up moves

GolbatEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, CROBAT
	db 0 ; no more evolutions
	db 1, CRUNCH
	db 1, ABSORB
	db 1, SUPERSONIC
	db 1, SWIFT
	db 1, BITE
	db 1, SCREECH
	db 1, CONFUSE_RAY
	db 1, WING_ATTACK
	db 24, AIR_SLASH
	db 27, VENOSHOCK
	db 32, MEAN_LOOK_BLOCK_SPIDER_WEB
	db 35, LEECH_LIFE
	db 40, HAZE
	db 43, POISON_FANG
	db 52, ACROBATICS
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
	db 31, HEAL_BELL_AROMA
	db 35, TOXIC
	db 43, PETAL_DANCE
	db 47, MOONBLAST
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
	db 34, HEAL_BELL_AROMA
	db 39, TOXIC
	db 49, PETAL_DANCE
	db 54, MOONBLAST
	db 0 ; no more level-up moves

VileplumeEvosAttacks:
	db 0 ; no more evolutions
	db 1, PETAL_BLIZZARD
	db 1, ABSORB
	db 1, WORK_UP_GROWTH
	db 1, ACID
	db 1, POISONPOWDER
	db 1, STUN_SPORE
	db 1, SLEEP_POWDER
	db 1, MEGA_DRAIN
	db 24, SAFEGUARD
	db 29, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db 34, HEAL_BELL_AROMA
	db 39, TOXIC
	db 49, PETAL_DANCE
	db 54, MOONBLAST
	db 0 ; no more level-up moves

VenonatEvosAttacks:
	db EVOLVE_LEVEL, 31, VENOMOTH
	db 0 ; no more evolutions
	db  1, TACKLE_SCRATCH_POUND
	db  1, DISABLE
	db  1, FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	db  5, SUPERSONIC
	db 11, CONFUSION
	db 13, POISONPOWDER
	db 23, STUN_SPORE
	db 25, SIGNAL_BEAM
	db 29, SLEEP_POWDER
	db 35, LEECH_LIFE
	db 37, PSYBEAM
	db 41, POISON_FANG
	db 47, PSYCHIC_M
	db 0 ; no more level-up moves

VenomothEvosAttacks:
	db 0 ; no more evolutions
	db  1, GUST
	db  1, QUIVER_DANCE
	db  1, TACKLE_SCRATCH_POUND
	db  1, DISABLE
	db  1, FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	db  5, SUPERSONIC
	db 11, CONFUSION
	db 13, POISONPOWDER
	db 23, STUN_SPORE
	db 25, SIGNAL_BEAM
	db 29, SLEEP_POWDER
	db 37, LEECH_LIFE
	db 41, PSYBEAM
	db 47, POISON_FANG
	db 55, PSYCHIC_M
	db 59, BUG_BUZZ
	db 0 ; no more level-up moves

MeowthEvosAttacks:
	db EVOLVE_LEVEL, 28, PERSIAN
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, GROWL
	db 6, BITE
	db 10, PAY_DAY
	db 15, SCREECH
	db 17, TAUNT
	db 21, FEINT_ATTACK
	db 25, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 30, NASTY_PLOT
	db 38, SWAGGER
	db 46, SLASH
	db 50, PLAY_ROUGH
	db 0 ; no more level-up moves

PersianEvosAttacks:
	db 0 ; no more evolutions
	db 1, POWER_GEM
	db 1, TACKLE_SCRATCH_POUND
	db 1, GROWL
	db 1, BITE
	db 1, PAY_DAY
	db 1, SCREECH
	db 1, TAUNT
	db 1, FEINT_ATTACK
	db 1, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 36, NASTY_PLOT
	db 42, SWAGGER
	db 53, SLASH
	db 59, PLAY_ROUGH
	db 0 ; no more level-up moves

GrowlitheEvosAttacks:
	db EVOLVE_ITEM, FIRE_STONE, ARCANINE
	db 0 ; no more evolutions
	db 1, EMBER
	db 6, SHARPEN_HOWL_MEDITATE
	db 9, BITE
	db 19, FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	db 21, FLAME_CHARGE
	db 30, TAKE_DOWN
	db 33, FIRE_FANG
	db 38, AGILITY_ROCK_POLISH
	db 41, FLAMETHROWER
	db 46, CRUNCH
	db 54, PLAY_ROUGH
	db 57, FLARE_BLITZ
	db 0 ; no more level-up moves

ArcanineEvosAttacks:
	db 0 ; no more evolutions
	db 1, EXTREMESPEED
	db 1, EMBER
	db 6, SHARPEN_HOWL_MEDITATE
	db 9, BITE
	db 19, FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	db 21, FLAME_CHARGE
	db 30, TAKE_DOWN
	db 33, FIRE_FANG
	db 38, AGILITY_ROCK_POLISH
	db 41, FLAMETHROWER
	db 46, CRUNCH
	db 54, PLAY_ROUGH
	db 57, FLARE_BLITZ
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
	db 30, LOW_KICK
	db 37, HYDRO_PUMP
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
	db 32, LOW_KICK
	db 48, HYDRO_PUMP
	db 0 ; no more level-up moves

PoliwrathEvosAttacks:
	db 0 ; no more evolutions
	db 1, DYNAMICPUNCH
	db 1, WATER_GUN
	db 1, SING_HYPNOSIS
	db 1, TACKLE_SCRATCH_POUND
	db 1, MUD_SLAP
	db 1, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 1, RAIN_DANCE
	db 1, BUBBLE_BEAM
	db 1, BODY_SLAM
	db 37, LOW_KICK
	db 49, BELLY_DRUM
	db 52, LOCK_ON_MIND_READER
	db 0 ; no more level-up moves

MachopEvosAttacks:
	db EVOLVE_LEVEL, 28, MACHOKE
	db 0 ; no more evolutions
	db 1, LOW_KICK
	db 3, FOCUS_ENERGY
	db 9, FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	db 13, HEADBUTT
	db 15, SEISMIC_TOSS
	db 21, BRICK_BREAK
	db 27, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 33, BULK_UP
	db 37, CROSS_CHOP
	db 43, DYNAMICPUNCH
	db 0 ; no more level-up moves

MachokeEvosAttacks:
	db EVOLVE_TRADE, -1, MACHAMP
	db 0 ; no more evolutions
	db 1, LOW_KICK
	db 1, FOCUS_ENERGY
	db 1, FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	db 1, HEADBUTT
	db 1, SEISMIC_TOSS
	db 1, BRICK_BREAK
	db 1, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 37, BULK_UP
	db 43, CROSS_CHOP
	db 53, DYNAMICPUNCH
	db 0 ; no more level-up moves

MachampEvosAttacks:
	db 0 ; no more evolutions
	db 1, BULLET_PUNCH
	db 1, MACH_PUNCH
	db 1, LOW_KICK
	db 1, FOCUS_ENERGY
	db 1, FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	db 1, HEADBUTT
	db 1, SEISMIC_TOSS
	db 1, BRICK_BREAK
	db 1, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 37, BULK_UP
	db 43, CROSS_CHOP
	db 53, DYNAMICPUNCH
	db 0 ; no more level-up moves

GeodudeEvosAttacks:
	db EVOLVE_LEVEL, 25, GRAVELER
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 6, AGILITY_ROCK_POLISH
	db 12, ROCK_THROW
	db 16, MAGNITUDE
	db 21, ROLLOUT
	db 24, SELFDESTRUCT
	db 28, ROCK_BLAST
	db 30, EXPLOSION
	db 34, DOUBLE_EDGE
	db 36, STONE_EDGE
	db 40, EARTHQUAKE
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
	db 1, SELFDESTRUCT
	db 30, ROCK_BLAST
	db 34, EXPLOSION
	db 40, DOUBLE_EDGE
	db 48, STONE_EDGE
	db 57, EARTHQUAKE
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
	db 1, SELFDESTRUCT
	db 30, ROCK_BLAST
	db 34, EXPLOSION
	db 40, DOUBLE_EDGE
	db 48, STONE_EDGE
	db 57, EARTHQUAKE
	db 0 ; no more level-up moves

PonytaEvosAttacks:
	db EVOLVE_LEVEL, 40, RAPIDASH
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, LEER_TAIL_WHIP
	db 5, CHARM_FEATHER_DANCE
	db 9, EMBER
	db 13, FIRE_SPIN
	db 16, DOUBLE_KICK
	db 21, STOMP
	db 25, FLAME_BURST
	db 29, TAKE_DOWN
	db 33, FLAME_CHARGE
	db 37, AGILITY_ROCK_POLISH
	db 44, FIRE_BLAST
	db 49, FLARE_BLITZ
	db  0 ; no more level-up moves

RapidashEvosAttacks:
	db  0 ; no more evolutions
	db 1, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 1, TACKLE_SCRATCH_POUND
	db 1, LEER_TAIL_WHIP
	db 1, CHARM_FEATHER_DANCE
	db 1, EMBER
	db 1, FLAME_CHARGE
	db 1, DOUBLE_KICK
	db 1, STOMP
	db 1, FIRE_SPIN
	db 1, TAKE_DOWN
	db 1, FLAME_BURST
	db 1, AGILITY_ROCK_POLISH
	db 50, FIRE_BLAST
	db 60, FLARE_BLITZ
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
	db 29, AMNESIA
	db 32, ZEN_HEADBUTT
	db 36, REST
	db 39, PSYCHIC_M
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
	db 1, AMNESIA
	db 1, ZEN_HEADBUTT
	db 1, REST
	db 41, PSYCHIC_M
	db 50, SAFEGUARD
	db 0 ; no more level-up moves

MagnemiteEvosAttacks:
	db EVOLVE_LEVEL, 30, MAGNETON
	db 0 ; no more evolutions
	db 1, SUPERSONIC
	db 1, TACKLE_SCRATCH_POUND
	db 7, THUNDERSHOCK
	db 13, THUNDER_WAVE
	db 25, SCREECH
	db 31, HYPER_VOICE
	db 38, FLASH_CANNON
	db 41, ZAP_CANNON
	db 45, LOCK_ON_MIND_READER
	db 0 ; no more level-up moves

MagnetonEvosAttacks:
	db EVOLVE_LOCATION, STARGLOW_CAVERN, MAGNEZONE
	db EVOLVE_LOCATION, STARGLOW_DEPTHS, MAGNEZONE
	db 0 ; no more evolutions
	db 1, TRI_ATTACK
	db 1, SUPERSONIC
	db 1, TACKLE_SCRATCH_POUND
	db 7, THUNDERSHOCK
	db 13, THUNDER_WAVE
	db 25, SCREECH
	db 35, HYPER_VOICE
	db 49, ZAP_CANNON
	db 53, LOCK_ON_MIND_READER
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
	db 25, MINIMIZE
	db 30, KNOCK_OFF
	db 33, SLUDGE_BOMB
	db 38, SCREECH
	db 41, BARRIER_IRON_DEFENSE_ACID_ARMOR
	db 49, GUNK_SHOT
	db 0 ; no more level-up moves
	
MukEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, SMOG
	db 6, DEFENSE_CURL_HARDEN_WITHDRAW
	db 9, MUD_SLAP
	db 14, DISABLE
	db 17, SLUDGE
	db 25, MINIMIZE
	db 30, KNOCK_OFF
	db 33, SLUDGE_BOMB
	db 38, SCREECH
	db 44, BARRIER_IRON_DEFENSE_ACID_ARMOR
	db 56, GUNK_SHOT
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
	db 26, FEINT_ATTACK
	db 29, DREAM_EATER
	db 40, DESTINY_BOND
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
	db 28, FEINT_ATTACK
	db 33, DREAM_EATER
	db 50, DESTINY_BOND
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
	db 28, FEINT_ATTACK
	db 33, DREAM_EATER
	db 50, DESTINY_BOND
	db 0 ; no more level-up moves

OnixEvosAttacks:
	db EVOLVE_TRADE, METAL_COAT, STEELIX
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 4, RAGE
	db 7, ROCK_THROW
	db 10, CURSE
	db 17, SCREECH
	db 23, BULLDOZE
	db 28, DRAGONBREATH
	db 31, BODY_SLAM
	db 34, AGILITY_ROCK_POLISH
	db 37, ROCK_SLIDE
	db 40, IRON_TAIL
	db 44, DOUBLE_EDGE
	db 47, STONE_EDGE
	db 50, SANDSTORM
	db 0 ; no more level-up moves

DrowzeeEvosAttacks:
	db EVOLVE_LEVEL, 26, HYPNO
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, SING_HYPNOSIS
	db 5, DISABLE
	db 9, CONFUSION
	db 16, HEADBUTT
	db 23, ZEN_HEADBUTT
	db 30, DREAM_EATER
	db 35, PSYCHIC_M
	db 41, NASTY_PLOT
	db 48, PSYSHOCK
	db 53, FUTURE_SIGHT
	db 0 ; no more level-up moves
	
HypnoEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, SING_HYPNOSIS
	db 1, DISABLE
	db 1, CONFUSION
	db 1, HEADBUTT
	db 1, ZEN_HEADBUTT
	db 30, DREAM_EATER
	db 35, PSYCHIC_M
	db 41, NASTY_PLOT
	db 48, PSYSHOCK
	db 53, FUTURE_SIGHT
	db 0 ; no more level-up moves

VoltorbEvosAttacks:
	db EVOLVE_LEVEL, 30, ELECTRODE
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, SELFDESTRUCT
	db 9, SPARK
	db 11, ROLLOUT
	db 16, SCREECH
	db 22, SWIFT
	db 28, SELFDESTRUCT
	db 30, LIGHT_SCREEN
	db 34, SHOCK_WAVE
	db 41, EXPLOSION
	db 46, REFLECT
	db 0 ; no more level-up moves

ElectrodeEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, SELFDESTRUCT
	db 1, SPARK
	db 1, ROLLOUT
	db 1, SCREECH
	db 1, SWIFT
	db 1, SELFDESTRUCT
	db 1, LIGHT_SCREEN
	db 36, SHOCK_WAVE
	db 45, EXPLOSION
	db 52, REFLECT
	db 0 ; no more level-up moves

ExeggcuteEvosAttacks:
	db EVOLVE_ITEM, LEAF_STONE, EXEGGUTOR
	db 0 ; no more evolutions
	db 1, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 1, SING_HYPNOSIS
	db 7, REFLECT
	db 11, LEECH_SEED
	db 19, CONFUSION
	db 22, STUN_SPORE
	db 22, POISONPOWDER
	db 22, SLEEP_POWDER
	db 29, EGG_BOMB
	db 35, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db 40, PSYSHOCK
	db 49, SOLAR_BEAM
	db 0 ; no more level-up moves

ExeggutorEvosAttacks:
	db 0 ; no more evolutions
	db 1, WOOD_HAMMER
	db 1, STOMP
	db 1, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 1, SING_HYPNOSIS
	db 7, REFLECT
	db 11, LEECH_SEED
	db 19, CONFUSION
	db 25, STUN_SPORE
	db 25, POISONPOWDER
	db 25, SLEEP_POWDER
	db 32, EGG_BOMB
	db 39, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db 44, PSYSHOCK
	db 54, SOLAR_BEAM
	db 0 ; no more level-up moves

CuboneEvosAttacks:
	db EVOLVE_MOVE, SHADOW_BONE, MAROWAK	;EVOLVE_MOVE forces mon to use form 2
	db EVOLVE_LEVEL, 28, MAROWAK
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 3, GROWL
	db 7, BONE_CLUB
	db 11, HEADBUTT
	db 13, LEER_TAIL_WHIP
	db 17, FOCUS_ENERGY
	db 21, BONEMERANG
	db 23, RAGE
	db 29, SHADOW_BONE
	db 37, DOUBLE_EDGE
	db 0 ; no more level-up moves

MarowakEvosAttacks:
	db 0 ; no more evolutions
	db 1, ROCK_THROW
	db 1, TACKLE_SCRATCH_POUND
	db 3, GROWL
	db 7, BONE_CLUB
	db 11, HEADBUTT
	db 13, LEER_TAIL_WHIP
	db 17, FOCUS_ENERGY
	db 21, BONEMERANG
	db 23, RAGE
	db 37, THRASH
	db 49, DOUBLE_EDGE
	db 0 ; no more level-up moves

KoffingEvosAttacks:
	db EVOLVE_LEVEL, 35, WEEZING
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 4, SMOG
	db 7, HAZE
	db 12, SAND_ATTACK_SMOKESCREEN_FLASH
	db 18, SLUDGE
	db 23, SELFDESTRUCT
	db 26, CLEAR_SMOG
	db 37, TOXIC
	db 40, EXPLOSION
	db 45, DESTINY_BOND
	db 0 ; no more level-up moves

WeezingEvosAttacks:
	db 0 ; no more evolutions
	db 1, DOUBLE_HIT
	db 1, TACKLE_SCRATCH_POUND
	db 1, SMOG
	db 1, HAZE
	db 1, SAND_ATTACK_SMOKESCREEN_FLASH
	db 1, SLUDGE
	db 1, SELFDESTRUCT
	db 1, CLEAR_SMOG
	db 38, TOXIC
	db 44, EXPLOSION
	db 50, DESTINY_BOND
	db 0 ; no more level-up moves
	
ChanseyEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, BLISSEY
	db  0 ; no more evolutions
	db  1, TACKLE_SCRATCH_POUND
	db  1, GROWL
	db  5, LEER_TAIL_WHIP
	db  9, HEAL_BELL_AROMA
	db 13, SOFTBOILED_MILK_DRINK_RECOVER
	db 17, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 23, MINIMIZE
	db 27, TAKE_DOWN
	db 31, SING_HYPNOSIS
	db 35, EGG_BOMB
	db 41, DEFENSE_CURL_HARDEN_WITHDRAW
	db 49, LIGHT_SCREEN
	db 57, DOUBLE_EDGE
	db 0 ; no more level-up moves

HorseaEvosAttacks:
	db EVOLVE_LEVEL, 32, SEADRA
	db 0 ; no more evolutions
	db 1, LEER_TAIL_WHIP
	db 1, WATER_GUN
	db 7, SAND_ATTACK_SMOKESCREEN_FLASH
	db 10, TWISTER
	db 16, FOCUS_ENERGY
	db 25, BUBBLE_BEAM
	db 34, AGILITY_ROCK_POLISH
	db 40, DRAGON_PULSE
	db 46, DRAGON_DANCE
	db 52, HYDRO_PUMP
	db 0 ; no more level-up moves

SeadraEvosAttacks:
	db EVOLVE_TRADE, DRAGON_SCALE, KINGDRA
	db 0 ; no more evolutions
	db 1, LEER_TAIL_WHIP
	db 1, WATER_GUN
	db 7, SAND_ATTACK_SMOKESCREEN_FLASH
	db 10, TWISTER
	db 16, FOCUS_ENERGY
	db 25, BUBBLE_BEAM
	db 34, AGILITY_ROCK_POLISH
	db 43, DRAGON_PULSE
	db 50, DRAGON_DANCE
	db 58, HYDRO_PUMP
	db 0 ; no more level-up moves

StaryuEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, STARMIE
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 4, WATER_GUN
	db 9, RAPID_SPIN
	db 13, SOFTBOILED_MILK_DRINK_RECOVER
	db 22, SWIFT
	db 27, BUBBLE_BEAM
	db 31, MINIMIZE
	db 36, LIGHT_SCREEN
	db 40, POWER_GEM
	db 45, COSMIC_POWER
	db 52, HYDRO_PUMP
	db 0 ; no more level-up moves

StarmieEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 4, WATER_GUN
	db 9, RAPID_SPIN
	db 13, SOFTBOILED_MILK_DRINK_RECOVER
	db 22, SWIFT
	db 27, BUBBLE_BEAM
	db 31, MINIMIZE
	db 39, LIGHT_SCREEN
	db 44, POWER_GEM
	db 50, COSMIC_POWER
	db 58, HYDRO_PUMP
	db 0 ; no more level-up moves

ScytherEvosAttacks:
	db EVOLVE_TRADE, METAL_COAT, SCIZOR
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, LEER_TAIL_WHIP
	db 6, FOCUS_ENERGY
	db 10, PURSUIT
	db 14, FURY_CUTTER
	db 19, AGILITY_ROCK_POLISH
	db 23, WING_ATTACK
	db 27, FALSE_SWIPE
	db 33, SLASH
	db 40, DOUBLE_TEAM
	db 45, X_SCISSOR
	db 58, SWORDS_DANCE
	db 0 ; no more level-up moves

ElectabuzzEvosAttacks:
	db EVOLVE_TRADE, ELECTIRIZER, ELECTIVIRE
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, LEER_TAIL_WHIP
	db 5, THUNDERSHOCK
	db 8, DOUBLE_TEAM
	db 15, SHOCK_WAVE
	db 19, THUNDER_WAVE
	db 25, SCREECH
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
	db 8, SAND_ATTACK_SMOKESCREEN_FLASH
	db 15, FIRE_SPIN
	db 19, CLEAR_SMOG
	db 25, CONFUSE_RAY
	db 29, FIRE_PUNCH
	db 36, LOW_KICK
	db 42, REFLECT
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
	db 20, REST
	db 26, PURSUIT
	db 32, WORK_UP_GROWTH
	db 38, TAKE_DOWN
	db 46, SWAGGER
	db 50, THRASH
	db 55, DOUBLE_EDGE
	db 59, GIGA_IMPACT
	db 0 ; no more level-up moves

MagikarpEvosAttacks:
	db EVOLVE_LEVEL, 20, GYARADOS
	db 0 ; no more evolutions
	db 1, TRANSFORM_SKETCH_MIMIC_SPLASH_METRO
	db 15, TACKLE_SCRATCH_POUND
	db 30, FLAIL
	db 0 ; no more level-up moves

GyaradosEvosAttacks:
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, GUST
	db 1, BITE
	db 1, THRASH
	db 21, LEER_TAIL_WHIP
	db 24, TWISTER
	db 27, DRAGON_RAGE
	db 33, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 39, CRUNCH
	db 42, AQUA_TAIL
	db 48, DRAGON_DANCE
	db 51, HURRICANE
	db 56, HYPER_BEAM
	db 0 ; no more level-up moves

LaprasEvosAttacks:
	db 0 ; no more evolutions
	db  1, WATER_GUN
	db  1, GROWL
	db  1, SING_HYPNOSIS
	db  7, HAZE
	db 13, BODY_SLAM
	db 19, CONFUSE_RAY
	db 25, PERISH_SONG
	db 37, ICE_BEAM
	db 43, SAFEGUARD
	db 49, HYDRO_PUMP
	db 55, BLIZZARD
	db 0 ; no more level-up moves

DittoEvosAttacks:
	db 0 ; no more evolutions
	db 1, TRANSFORM_SKETCH_MIMIC_SPLASH_METRO
	db 0 ; no more level-up moves

EeveeEvosAttacks:
	db EVOLVE_ITEM, THUNDERSTONE, JOLTEON
	db EVOLVE_ITEM, WATER_STONE, VAPOREON
	db EVOLVE_ITEM, FIRE_STONE, FLAREON
	db EVOLVE_LOCATION_SPECIFIC, HUNTERS_THICKET, LEAFEON
	db EVOLVE_LOCATION_SPECIFIC, ROUTE_10, GLACEON
	db EVOLVE_LOCATION_SPECIFIC, GLINT_GROVE, SYLVEON
	db EVOLVE_HAPPINESS, TR_MORNDAY, ESPEON
	db EVOLVE_HAPPINESS, TR_NITE, UMBREON
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, TACKLE_SCRATCH_POUND
	db 5, LEER_TAIL_WHIP
	db 9, SAND_ATTACK_SMOKESCREEN_FLASH
	db 13, QUICK_ATTACK
	db 20, TAKE_DOWN
	db 33, BATON_PASS
	db 37, DOUBLE_EDGE
	db 45, WISH
	db 0 ; no more level-up moves

VaporeonEvosAttacks:
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, TAKE_DOWN
	db 1, BATON_PASS
	db 1, GROWL
	db 1, TACKLE_SCRATCH_POUND
	db 5, LEER_TAIL_WHIP
	db 9, SAND_ATTACK_SMOKESCREEN_FLASH
	db 13, QUICK_ATTACK
	db 17, BUBBLE_BEAM
	db 20, AURORA_BEAM
	db 25, RAIN_DANCE
	db 29, BARRIER_IRON_DEFENSE_ACID_ARMOR
	db 33, HAZE
	db 37, DOUBLE_EDGE
	db 42, SCALD
	db 51, HYDRO_PUMP
	db 0 ; no more level-up moves

JolteonEvosAttacks:
	db 0 ; no more evolutions
	db 1, THUNDERSHOCK
	db 1, TAKE_DOWN
	db 1, BATON_PASS
	db 1, GROWL
	db 1, TACKLE_SCRATCH_POUND
	db 5, LEER_TAIL_WHIP
	db 9, SAND_ATTACK_SMOKESCREEN_FLASH
	db 13, QUICK_ATTACK
	db 17, DOUBLE_KICK
	db 20, THUNDER_FANG
	db 25, PIN_MISSILE
	db 29, AGILITY_ROCK_POLISH
	db 33, THUNDER_WAVE
	db 37, DOUBLE_EDGE
	db 42, THUNDERBOLT
	db 51, THUNDER
	db 0 ; no more level-up moves

FlareonEvosAttacks:
	db 0 ; no more evolutions
	db 1, EMBER
	db 1, TAKE_DOWN
	db 1, BATON_PASS
	db 1, GROWL
	db 1, TACKLE_SCRATCH_POUND
	db 5, LEER_TAIL_WHIP
	db 9, SAND_ATTACK_SMOKESCREEN_FLASH
	db 13, QUICK_ATTACK
	db 17, BITE
	db 20, FIRE_FANG
	db 25, FIRE_SPIN
	db 29, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 33, SMOG
	db 37, DOUBLE_EDGE
	db 42, FLAMETHROWER
	db 51, FLARE_BLITZ
	db 0 ; no more level-up moves

PorygonEvosAttacks:
	db EVOLVE_TRADE, UP_GRADE, PORYGON2
	db 0 ; no more evolutions
	db 1, CONVERSION
	db 1, CONVERSION2
	db 1, TRI_ATTACK
	db 1, SHARPEN_HOWL_MEDITATE
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 1, AGILITY_ROCK_POLISH
	db 16, PSYBEAM
	db 25, SWIFT
	db 37, SOFTBOILED_MILK_DRINK_RECOVER
	db 47, LOCK_ON_MIND_READER
	db 48, ZAP_CANNON
	db 0 ; no more level-up moves

AerodactylEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 0 ; no more level-up moves
	
SnorlaxEvosAttacks:
	db 0 ; no more evolutions
	db 1, TRANSFORM_SKETCH_MIMIC_SPLASH_METRO
	db 1, FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	db 1, HEADBUTT
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 1, AMNESIA
	db 20, SCREECH
	db 28, REST
	db 28, SNORE
	db 33, BODY_SLAM
	db 41, MEAN_LOOK_BLOCK_SPIDER_WEB
	db 44, BELLY_DRUM
	db 49, ROLLOUT
	db 59, GIGA_IMPACT
	db 0 ; no more level-up moves

ArticunoEvosAttacks:
	db  0 ; no more evolutions
	db  1, GUST
	db  1, ICY_WIND
	db  8, HAZE
	db 29, ANCIENTPOWER
	db 36, AGILITY_ROCK_POLISH
	db 43, ICE_BEAM
	db 50, HURRICANE
	db 65, BLIZZARD
	db 0 ; no more level-up moves
	
ZapdosEvosAttacks:
	db  0 ; no more evolutions
	db  1, PECK
	db  1, SHOCK_WAVE
	db  8, THUNDER_WAVE
	db 29, ANCIENTPOWER
	db 36, AGILITY_ROCK_POLISH
	db 43, THUNDERBOLT
	db 50, DRILL_PECK
	db 65, THUNDER
	db 0 ; no more level-up moves
	
MoltresEvosAttacks:
	db  0 ; no more evolutions
	db  1, PECK
	db  1, FLAME_BURST
	db  8, FIRE_SPIN
	db 29, ANCIENTPOWER
	db 36, AGILITY_ROCK_POLISH
	db 43, FLAMETHROWER
	db 50, AIR_SLASH
	db 65, FIRE_BLAST
	db 0 ; no more level-up moves

DratiniEvosAttacks:
	db EVOLVE_LEVEL, 30, DRAGONAIR
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, LEER_TAIL_WHIP
	db 5, THUNDER_WAVE
	db 11, TWISTER
	db 15, DRAGON_RAGE
	db 21, HEADBUTT
	db 25, AGILITY_ROCK_POLISH
	db 31, DRAGONBREATH
	db 38, SAFEGUARD
	db 46, DRAGON_DANCE
	db 51, OUTRAGE
	db 55, HYPER_BEAM
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
	db 42, SAFEGUARD
	db 53, DRAGON_DANCE
	db 56, OUTRAGE
	db 61, HYPER_BEAM
	db 0 ; no more level-up moves

DragoniteEvosAttacks:
	db 0 ; no more evolutions
	db 1, WING_ATTACK
	db 1, EXTREMESPEED
	db 1, TACKLE_SCRATCH_POUND
	db 1, LEER_TAIL_WHIP
	db 1, THUNDER_WAVE
	db 1, TWISTER
	db 1, DRAGON_RAGE
	db 1, BODY_SLAM
	db 1, AGILITY_ROCK_POLISH
	db 1, DRAGONBREATH
	db 1, SAFEGUARD
	db 1, DRAGON_DANCE
	db 62, OUTRAGE
	db 71, HYPER_BEAM
	db 0 ; no more level-up moves

ChikoritaEvosAttacks:
	db EVOLVE_LEVEL, 16, BAYLEEF
	db  0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, GROWL
	db 7, RAZOR_LEAF
	db 9, POISONPOWDER
	db 12, REFLECT
	db 16, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db 19, LIGHT_SCREEN
	db 26, BODY_SLAM
	db 36, SAFEGUARD
	db 39, HEAL_BELL_AROMA
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
	db 1, REFLECT
	db 1, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db 19, LIGHT_SCREEN
	db 30, BODY_SLAM
	db 41, SAFEGUARD
	db 49, HEAL_BELL_AROMA
	db 54, SOLAR_BEAM
	db 0 ; no more level-up moves

MeganiumEvosAttacks:
	db  0 ; no more evolutions
	db 1, CALM_MIND
	db 1, MEGA_DRAIN
	db 1, TACKLE_SCRATCH_POUND
	db 1, GROWL
	db 1, RAZOR_LEAF
	db 1, POISONPOWDER
	db 1, REFLECT
	db 1, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db 1, LIGHT_SCREEN
	db 1, STUN_SPORE
	db 1, BODY_SLAM
	db 40, PETAL_DANCE
	db 49, SAFEGUARD
	db 54, HEAL_BELL_AROMA
	db 60, SOLAR_BEAM
	db  0 ; no more level-up moves

CyndaquilEvosAttacks:
	db EVOLVE_LEVEL, 14, QUILAVA
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, LEER_TAIL_WHIP
	db 7, EMBER
	db 10, SAND_ATTACK_SMOKESCREEN_FLASH
	db 13, QUICK_ATTACK
	db 18, DEFENSE_CURL_HARDEN_WITHDRAW
	db 21, SWIFT
	db 26, FLAME_BURST
	db 31, ROLLOUT
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
	db 1, SAND_ATTACK_SMOKESCREEN_FLASH
	db 1, QUICK_ATTACK
	db 19, DEFENSE_CURL_HARDEN_WITHDRAW
	db 23, SWIFT
	db 29, FLAME_BURST
	db 34, ROLLOUT
	db 43, FLAMETHROWER
	db 49, DOUBLE_EDGE
	db 53, FIRE_BLAST
	db 0 ; no more level-up moves

TyphlosionEvosAttacks:
	db  0 ; no more evolutions
	db 1, REVERSAL
	db 1, FLAME_CHARGE
	db 1, TACKLE_SCRATCH_POUND
	db 1, LEER_TAIL_WHIP
	db 1, EMBER
	db 1, SAND_ATTACK_SMOKESCREEN_FLASH
	db 1, QUICK_ATTACK
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 1, SWIFT
	db 1, FLAME_BURST
	db 1, ROLLOUT
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
	db 19, ICE_FANG
	db 27, CRUNCH
	db 34, THRASH
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
	db 24, ICE_FANG
	db 30, CRUNCH
	db 39, THRASH
	db 42, SCREECH
	db 48, AQUA_TAIL
	db 51, SUPERPOWER
	db 57, HYDRO_PUMP
	db 0 ; no more level-up moves

FeraligatrEvosAttacks:
	db 0 ; no more evolutions
	db 1, BULK_UP
	db 1, AQUA_JET
	db 1, TACKLE_SCRATCH_POUND
	db 1, LEER_TAIL_WHIP
	db 1, WATER_GUN
	db 1, RAGE
	db 1, BITE
	db 1, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 1, ICE_FANG
	db 1, CRUNCH
	db 41, THRASH
	db 46, SCREECH
	db 52, AQUA_TAIL
	db 57, SUPERPOWER
	db 63, HYDRO_PUMP
	db 0 ; no more level-up moves

LedybaEvosAttacks:
	db EVOLVE_LEVEL, 18, LEDIAN
	db 0 ; no more evolutions
	db 1, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 1, FOCUS_ENERGY
	db 5, SUPERSONIC
	db 7, SWIFT
	db 10, GUST
	db 12, LIGHT_SCREEN
	db 12, REFLECT
	db 15, MACH_PUNCH
	db 17, CONFUSE_RAY
	db 19, SAFEGUARD
	db 22, SIGNAL_BEAM
	db 29, BATON_PASS
	db 32, AGILITY_ROCK_POLISH
	db 38, BUG_BUZZ
	db 45, DOUBLE_EDGE
	db 0 ; no more level-up moves

LedianEvosAttacks:
	db  0 ; no more evolutions
	db 1, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 1, FOCUS_ENERGY
	db 1, SUPERSONIC
	db 1, SWIFT
	db 1, GUST
	db 1, LIGHT_SCREEN
	db 1, REFLECT
	db 1, MACH_PUNCH
	db 1, CONFUSE_RAY
	db 20, SAFEGUARD
	db 24, SIGNAL_BEAM
	db 32, BATON_PASS
	db 36, AGILITY_ROCK_POLISH
	db 42, BUG_BUZZ
	db 52, DOUBLE_EDGE
	db 0 ; no more level-up moves

CrobatEvosAttacks:
	db  0 ; no more evolutions
	db 1, X_SCISSOR
	db 1, CRUNCH
	db 1, ABSORB
	db 1, SUPERSONIC
	db 1, SWIFT
	db 1, BITE
	db 1, SCREECH
	db 1, CONFUSE_RAY
	db 1, WING_ATTACK
	db 24, AIR_SLASH
	db 27, VENOSHOCK
	db 32, MEAN_LOOK_BLOCK_SPIDER_WEB
	db 35, LEECH_LIFE
	db 40, HAZE
	db 52, POISON_FANG
	db 58, ACROBATICS
	db  0 ; no more level-up moves

ChinchouEvosAttacks:
	db EVOLVE_LEVEL, 27, LANTURN
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, SUPERSONIC
	db 6, THUNDER_WAVE
	db 9, THUNDERSHOCK
	db 12, CONFUSE_RAY
	db 17, SPARK
	db 20, BUBBLE_BEAM
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
	db 1, SPARK
	db 1, BUBBLE_BEAM
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
	db 5, TRANSFORM_SKETCH_MIMIC_SPLASH_METRO
	db 9, ATTRACT
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
	db 1, GROWL
	db 1, CHARM_FEATHER_DANCE
	db 1, TRANSFORM_SKETCH_MIMIC_SPLASH_METRO
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
	db 1, NIGHT_SHADE
	db 1, REFLECT
	db 1, LIGHT_SCREEN
	db 1, CONFUSION
	db 20, OMINOUS_WIND
	db 23, TELEPORT
	db 29, OMINOUS_WIND
	db 34, CONFUSE_RAY
	db 38, FUTURE_SIGHT
	db 36, WISH
	db 39, CALM_MIND
	db 50, PSYCHIC_M
	db 0 ; no more level-up moves

XatuEvosAttacks:
	db 0 ; no more evolutions
	db 1, AIR_SLASH
	db 1, PECK
	db 1, LEER_TAIL_WHIP
	db 1, NIGHT_SHADE
	db 1, REFLECT
	db 1, LIGHT_SCREEN
	db 1, CONFUSION
	db 1, OMINOUS_WIND
	db 1, TELEPORT
	db 29, OMINOUS_WIND
	db 34, CONFUSE_RAY
	db 38, FUTURE_SIGHT
	db 36, WISH	
	db 43, CALM_MIND
	db 57, PSYCHIC_M
	db 0 ; no more level-up moves

MareepEvosAttacks:
	db EVOLVE_LEVEL, 15, FLAAFFY
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, GROWL
	db 4, THUNDER_WAVE
	db 8, THUNDERSHOCK
	db 15, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 18, TAKE_DOWN
	db 25, SHOCK_WAVE
	db 29, CONFUSE_RAY
	db 32, SIGNAL_BEAM
	db 36, COTTON_GUARD
	db 39, THUNDERBOLT
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
	db 1, MUD_SLAP
	db 20, TAKE_DOWN
	db 29, SHOCK_WAVE
	db 34, CONFUSE_RAY
	db 38, SIGNAL_BEAM
	db 43, COTTON_GUARD
	db 47, THUNDERBOLT
	db 52, LIGHT_SCREEN
	db 56, THUNDER
	db 0 ; no more level-up moves

AmpharosEvosAttacks:
	db 0 ; no more evolutions
	db 1, THUNDERPUNCH
	db 1, GROWL
	db 1, THUNDER_WAVE
	db 1, THUNDERSHOCK
	db 1, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 1, MUD_SLAP
	db 1, TAKE_DOWN
	db 1, SHOCK_WAVE
	db 35, CONFUSE_RAY
	db 40, SIGNAL_BEAM
	db 46, COTTON_GUARD
	db 51, THUNDERBOLT
	db 57, LIGHT_SCREEN
	db 62, THUNDER
	db 0 ; no more level-up moves

BellossomEvosAttacks:
	db 0 ; no more evolutions
	db 1, PETAL_BLIZZARD
	db 1, ABSORB
	db 1, WORK_UP_GROWTH
	db 1, ACID
	db 1, POISONPOWDER
	db 1, STUN_SPORE
	db 1, SLEEP_POWDER
	db 1, MEGA_DRAIN
	db 24, SAFEGUARD
	db 29, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db 34, HEAL_BELL_AROMA
	db 39, TOXIC
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
	db 19, CHARM_FEATHER_DANCE
	db 28, HYDRO_PUMP
	db 31, PLAY_ROUGH
	db 37, AQUA_TAIL
	db 40, DOUBLE_EDGE
	db 47, SUPERPOWER
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
	db 31, HYDRO_PUMP
	db 35, PLAY_ROUGH
	db 42, AQUA_TAIL
	db 46, DOUBLE_EDGE
	db 55, SUPERPOWER
	db 0 ; no more level-up moves

SudowoodoEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 5, FLAIL
	db 8, LOW_KICK
	db 12, ROCK_THROW
	db 15, TRANSFORM_SKETCH_MIMIC_SPLASH_METRO
	db 22, FEINT_ATTACK
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
	db 1, WATER_GUN
	db 1, SING_HYPNOSIS
	db 1, TACKLE_SCRATCH_POUND
	db 1, MUD_SLAP
	db 1, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 1, RAIN_DANCE
	db 1, BUBBLE_BEAM
	db 1, BODY_SLAM
	db 37, PERISH_SONG
	db 43, SWAGGER
	db 52, HYPER_VOICE
	db 0 ; no more level-up moves

SunkernEvosAttacks:
	db EVOLVE_ITEM, SUN_STONE, SUNFLORA
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, WORK_UP_GROWTH
	db 10, RAZOR_LEAF
	db 13, MEGA_DRAIN
	db 16, LEECH_SEED
	db 22, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db 28, SING_HYPNOSIS
	db 35, GIGA_DRAIN
	db 44, SOLAR_BEAM
	db 53, PETAL_DANCE
	db 0 ; no more level-up moves
	
SunfloraEvosAttacks:
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, WORK_UP_GROWTH
	db 10, RAZOR_LEAF
	db 13, MEGA_DRAIN
	db 16, LEECH_SEED
	db 22, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db 28, SING_HYPNOSIS
	db 35, GIGA_DRAIN
	db 44, SOLAR_BEAM
	db 53, PETAL_DANCE
	db 0 ; no more level-up moves

WooperEvosAttacks:
	db EVOLVE_LEVEL, 20, QUAGSIRE
	db EVOLVE_DUMMY, -1, CLODSIRE	; for route 8 encounter house
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, LEER_TAIL_WHIP
	db 8, MUD_SLAP
	db 12, HAZE
	db 15, BODY_SLAM
	db 21, RAIN_DANCE
	db 26, BULLDOZE
	db 30, ENCORE
	db 34, AMNESIA
	db 37, AQUA_TAIL
	db 41, HYDRO_PUMP
	db 45, EARTHQUAKE
	db 0 ; no more level-up moves

QuagsireEvosAttacks:
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, LEER_TAIL_WHIP
	db 1, MUD_SLAP
	db 1, HAZE
	db 1, BODY_SLAM
	db 24, RAIN_DANCE
	db 28, BULLDOZE
	db 33, ENCORE
	db 38, AMNESIA
	db 42, AQUA_TAIL
	db 47, HYDRO_PUMP
	db 51, EARTHQUAKE
	db 0 ; no more level-up moves

EspeonEvosAttacks:
	db 0 ; no more evolutions
	db 1, CONFUSION
	db 1, TAKE_DOWN
	db 1, BATON_PASS
	db 1, GROWL
	db 1, TACKLE_SCRATCH_POUND
	db 5, LEER_TAIL_WHIP
	db 9, SAND_ATTACK_SMOKESCREEN_FLASH
	db 13, QUICK_ATTACK
	db 17, SWIFT
	db 20, PSYBEAM
	db 25, FUTURE_SIGHT
	db 29, REFLECT
	db 33, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db 37, CALM_MIND
	db 41, DOUBLE_EDGE
	db 51, PSYCHIC_M
	db 0 ; no more level-up moves

UmbreonEvosAttacks:
	db 0 ; no more evolutions
	db 1, PURSUIT
	db 1, TAKE_DOWN
	db 1, BATON_PASS
	db 1, GROWL
	db 1, TACKLE_SCRATCH_POUND
	db 5, LEER_TAIL_WHIP
	db 9, SAND_ATTACK_SMOKESCREEN_FLASH
	db 13, QUICK_ATTACK
	db 17, BITE
	db 20, CONFUSE_RAY
	db 25, FEINT_ATTACK
	db 29, SCREECH
	db 33, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db 37, MEAN_LOOK_BLOCK_SPIDER_WEB
	db 41, DOUBLE_EDGE
	db 51, DARK_PULSE
	db 0 ; no more level-up moves

MurkrowEvosAttacks:
	db EVOLVE_ITEM, DUSK_STONE, HONCHKROW
	db 0 ; no more evolutions
	db 1, PURSUIT
	db 1, PECK
	db 11, HAZE
	db 15, MIRROR_MOVE
	db 21, NIGHT_SHADE
	db 25, FEINT_ATTACK
	db 31, TAUNT
	db 35, MEAN_LOOK_BLOCK_SPIDER_WEB
	db 41, PERISH_SONG
	db 48, NIGHT_SLASH
	db 55, DRILL_PECK
	db 0 ; no more level-up moves

SlowkingEvosAttacks:
	db 0 ; no more evolutions
	db 1, POWER_GEM
	db 1, AMNESIA
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
	db 29, NASTY_PLOT
	db 32, ZEN_HEADBUTT
	db 36, SWAGGER
	db 39, PSYCHIC_M
	db 43, RAIN_DANCE
	db 46, SAFEGUARD
	db 0 ; no more level-up moves

GirafarigEvosAttacks:
	db EVOLVE_MOVE, TWIN_BEAM, FARIGIRAF
	db 0 ; no more evolutions
	db  1, TWIN_BEAM
	db  1, TACKLE_SCRATCH_POUND
	db  1, GROWL
	db  5, CONFUSION
	db 14, STOMP
	db 19, PSYBEAM
	db 23, AGILITY_ROCK_POLISH
	db 28, DOUBLE_HIT
	db 40, CRUNCH
	db 42, BATON_PASS
	db 46, NASTY_PLOT
	db 50, PSYCHIC_M
	db 0 ; no more level-up moves

GligarEvosAttacks:
	db EVOLVE_HOLDING_NITE, RAZOR_FANG, GLISCOR
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 4, SAND_ATTACK_SMOKESCREEN_FLASH
	db 7, DEFENSE_CURL_HARDEN_WITHDRAW
	db 10, KNOCK_OFF
	db 13, QUICK_ATTACK
	db 16, FURY_CUTTER
	db 19, FEINT_ATTACK
	db 22, REVERSAL
	db 27, SLASH
	db 34, SCREECH
	db 40, ACROBATICS
	db 45, X_SCISSOR
	db 50, SWORDS_DANCE
	db 0 ; no more level-up moves

SteelixEvosAttacks:
	db 0 ; no more evolutions
	db 1, CRUNCH
	db 1, TACKLE_SCRATCH_POUND
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 4, RAGE
	db 7, ROCK_THROW
	db 10, CURSE
	db 17, SCREECH
	db 23, BULLDOZE
	db 28, DRAGONBREATH
	db 31, BODY_SLAM
	db 34, AGILITY_ROCK_POLISH
	db 37, ROCK_SLIDE
	db 40, IRON_TAIL
	db 44, DOUBLE_EDGE
	db 47, STONE_EDGE
	db 50, SANDSTORM
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
	db 23, ROAR_WHIRLWIND
	db 29, RAGE
	db 38, PLAY_ROUGH
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
	db 1, QUICK_ATTACK
	db 1, LEER_TAIL_WHIP
	db 6, FOCUS_ENERGY
	db 10, PURSUIT
	db 14, FURY_CUTTER
	db 19, AGILITY_ROCK_POLISH
	db 23, WING_ATTACK
	db 27, FALSE_SWIPE
	db 33, SLASH
	db 40, DOUBLE_TEAM
	db 45, X_SCISSOR
	db 58, SWORDS_DANCE
	db 0 ; no more level-up moves

HeracrossEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, LEER_TAIL_WHIP
	db 1, HORN_ATTACK
	db 1, ENDURE
	db 12, PECK
	db 21, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 31, PIN_MISSILE
	db 40, TAKE_DOWN
	db 49, REVERSAL
	db 57, MEGAHORN
	db 0 ; no more level-up moves

SneaselEvosAttacks:
	db EVOLVE_HOLDING_NITE, RAZOR_CLAW, WEAVILE
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, LEER_TAIL_WHIP
	db 1, TAUNT
	db 8, QUICK_ATTACK
	db 10, PURSUIT
	db 16, FEINT_ATTACK
	db 20, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 25, AGILITY_ROCK_POLISH
	db 28, SCREECH
	db 35, SLASH
	db 40, KNOCK_OFF
	db 44, ICE_SHARD
	db 47, NIGHT_SLASH
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
	db 22, CHARM_FEATHER_DANCE
	db 26, REST
	db 31, SNORE
	db 35, SLASH
	db 40, PLAY_ROUGH
	db 50, THRASH
	db 0 ; no more level-up moves

UrsaringEvosAttacks:
	db 0 ; no more evolutions
	db 1, BULK_UP
	db 1, TACKLE_SCRATCH_POUND
	db 1, GROWL
	db 1, BITE
	db 1, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 1, FEINT_ATTACK
	db 1, SWAGGER
	db 1, CHARM_FEATHER_DANCE
	db 1, REST
	db 36, SNORE
	db 42, SLASH
	db 48, PLAY_ROUGH
	db 56, THRASH
	db 0 ; no more level-up moves

SlugmaEvosAttacks:
	db EVOLVE_LEVEL, 38, MAGCARGO
	db 0 ; no more evolutions
	db 1, SAND_ATTACK_SMOKESCREEN_FLASH
	db 1, CLEAR_SMOG
	db 6, EMBER
	db 8, ROCK_THROW
	db 13, DEFENSE_CURL_HARDEN_WITHDRAW
	db 15, FLAME_BURST
	db 20, FLAMETHROWER
	db 25, ROCK_SLIDE
	db 29, AMNESIA
	db 34, BODY_SLAM
	db 38, SOFTBOILED_MILK_DRINK_RECOVER
	db 41, FIRE_BLAST
	db 45, EARTH_POWER
	db 0 ; no more level-up moves

MagcargoEvosAttacks:
	db 0 ; no more evolutions
	db 1, SHELL_SMASH
	db 1, SAND_ATTACK_SMOKESCREEN_FLASH
	db 1, CLEAR_SMOG
	db 6, EMBER
	db 8, ROCK_THROW
	db 13, DEFENSE_CURL_HARDEN_WITHDRAW
	db 15, FLAME_BURST
	db 20, FLAMETHROWER
	db 25, ROCK_SLIDE
	db 29, AMNESIA
	db 34, BODY_SLAM
	db 38, SOFTBOILED_MILK_DRINK_RECOVER
	db 44, FIRE_BLAST
	db 49, EARTH_POWER
	db 0 ; no more level-up moves

SwinubEvosAttacks:
	db EVOLVE_LEVEL, 33, PILOSWINE
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	db 5, SAND_ATTACK_SMOKESCREEN_FLASH
	db 8, ICE_SHARD
	db 11, MUD_SLAP
	db 14, ENDURE
	db 18, ICY_WIND
	db 21, MAGNITUDE
	db 26, TAKE_DOWN
	db 35, HAZE
	db 37, AMNESIA
	db 44, THRASH
	db 48, BLIZZARD
	db 0 ; no more level-up moves

PiloswineEvosAttacks:
	db EVOLVE_MOVE, ANCIENTPOWER, MAMOSWINE
	db 0 ; no more evolutions
	db 1, ANCIENTPOWER
	db 1, HORN_ATTACK
	db 1, TACKLE_SCRATCH_POUND
	db 1, FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	db 1, SAND_ATTACK_SMOKESCREEN_FLASH
	db 1, ICE_SHARD
	db 1, MUD_SLAP
	db 1, ENDURE
	db 1, ICY_WIND
	db 1, MAGNITUDE
	db 1, TAKE_DOWN
	db 37, HAZE
	db 41, AMNESIA
	db 52, THRASH
	db 58, BLIZZARD
	db 0 ; no more level-up moves

CorsolaEvosAttacks:
	db EVOLVE_DUMMY, -1, CURSOLA	; for route 8 encounter house
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 4, DEFENSE_CURL_HARDEN_WITHDRAW
	db 8, WATER_GUN
	db 10, SAFEGUARD
	db 13, PROTECT
	db 17, ANCIENTPOWER
	db 20, BUBBLE_BEAM
	db 27, SOFTBOILED_MILK_DRINK_RECOVER
	db 31, BARRIER_IRON_DEFENSE_ACID_ARMOR
	db 36, FLAIL
	db 36, ENDURE
	db 41, POWER_GEM
	db 48, EARTH_POWER
	db 0 ; no more level-up moves

SkarmoryEvosAttacks:
	db 0 ; no more evolutions
	db  1, LEER_TAIL_WHIP
	db  1, PECK
	db  6, SAND_ATTACK_SMOKESCREEN_FLASH
	db  9, METAL_CLAW
	db 12, AIR_SLASH
	db 17, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 23, SWIFT
	db 28, SPIKES
	db 31, AGILITY_ROCK_POLISH
	db 34, STEEL_WING
	db 39, SLASH
	db 44, SCREECH
	db 57, BRAVE_BIRD
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
	db 34, SWAGGER
	db 40, FLAMETHROWER
	db 44, CRUNCH
	db 49, NASTY_PLOT
	db 0 ; no more level-up moves

HoundoomEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEER_TAIL_WHIP
	db 1, EMBER
	db 1, SHARPEN_HOWL_MEDITATE
	db 1, SMOG
	db 1, ROAR_WHIRLWIND
	db 1, BITE
	db 1, FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	db 26, FIRE_FANG
	db 30, FEINT_ATTACK
	db 41, SWAGGER
	db 45, FLAMETHROWER
	db 50, CRUNCH
	db 56, NASTY_PLOT
	db 0 ; no more level-up moves

KingdraEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEER_TAIL_WHIP
	db 1, WATER_GUN
	db 7, SAND_ATTACK_SMOKESCREEN_FLASH
	db 10, TWISTER
	db 16, FOCUS_ENERGY
	db 25, BUBBLE_BEAM
	db 34, AGILITY_ROCK_POLISH
	db 43, DRAGON_PULSE
	db 50, DRAGON_DANCE
	db 58, HYDRO_PUMP
	db 0 ; no more level-up moves

PhanpyEvosAttacks:
	db EVOLVE_LEVEL, 25, DONPHAN
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, GROWL
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 6, FLAIL
	db 10, ROLLOUT
	db 15, ENDURE
	db 19, MAGNITUDE
	db 24, RAPID_SPIN
	db 28, TAKE_DOWN
	db 37, DOUBLE_EDGE
	db 48, EARTHQUAKE
	db 0 ; no more level-up moves

DonphanEvosAttacks:
	db 0 ; no more evolutions
	db 1, HORN_ATTACK
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
	db 37, TAKE_DOWN
	db 46, DOUBLE_EDGE
	db 55, EARTHQUAKE
	db 0 ; no more level-up moves

Porygon2EvosAttacks:
	db EVOLVE_TRADE, DUBIOUS_DISC, PORYGON_Z
	db 0 ; no more evolutions
	db 1, CONVERSION
	db 1, CONVERSION2
	db 1, TRI_ATTACK
	db 1, SHARPEN_HOWL_MEDITATE
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 1, AGILITY_ROCK_POLISH
	db 16, PSYBEAM
	db 25, SWIFT
	db 37, SOFTBOILED_MILK_DRINK_RECOVER
	db 47, LOCK_ON_MIND_READER
	db 48, ZAP_CANNON
	db 0 ; no more level-up moves

StantlerEvosAttacks:
	db EVOLVE_MOVE, PSYSHIELD_BASH,  WYRDEER
	db 0 ; no more evolutions
	db 1, PSYSHIELD_BASH
	db 1, TACKLE_SCRATCH_POUND
	db 3, LEER_TAIL_WHIP
	db 7, DISABLE
	db 10, SING_HYPNOSIS
	db 13, STOMP
	db 19, TAKE_DOWN
	db 23, CONFUSE_RAY
	db 28, CALM_MIND
	db 37, ZEN_HEADBUTT
	db 43, JUMP_KICK
	db 49, SWAGGER
	db 55, DOUBLE_EDGE
	db 62, MEGAHORN
	db 0 ; no more level-up moves

SmeargleEvosAttacks:
	db 0 ; no more evolutions
	db 1, TRANSFORM_SKETCH_MIMIC_SPLASH_METRO
	db 11, TRANSFORM_SKETCH_MIMIC_SPLASH_METRO
	db 21, TRANSFORM_SKETCH_MIMIC_SPLASH_METRO
	db 31, TRANSFORM_SKETCH_MIMIC_SPLASH_METRO
	db 41, TRANSFORM_SKETCH_MIMIC_SPLASH_METRO
	db 51, TRANSFORM_SKETCH_MIMIC_SPLASH_METRO
	db 61, TRANSFORM_SKETCH_MIMIC_SPLASH_METRO
	db 71, TRANSFORM_SKETCH_MIMIC_SPLASH_METRO
	db 81, TRANSFORM_SKETCH_MIMIC_SPLASH_METRO
	db 91, TRANSFORM_SKETCH_MIMIC_SPLASH_METRO
	db 0 ; no more level-up moves

ElekidEvosAttacks:
	db EVOLVE_LEVEL, 30, ELECTABUZZ
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, LEER_TAIL_WHIP
	db 5, THUNDERSHOCK
	db 8, DOUBLE_TEAM
	db 15, SHOCK_WAVE
	db 19, THUNDER_WAVE
	db 25, SCREECH
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
	db 8, SAND_ATTACK_SMOKESCREEN_FLASH
	db 15, FIRE_SPIN
	db 19, CLEAR_SMOG
	db 25, CONFUSE_RAY
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
	db 11, HEAL_BELL_AROMA
	db 15, ROLLOUT
	db 21, HEADBUTT
	db 27, SOFTBOILED_MILK_DRINK_RECOVER
	db 38, BODY_SLAM
	db 44, PLAY_ROUGH
	db 50, CHARM_FEATHER_DANCE
	db 56, REVERSAL
	db 0 ; no more level-up moves
	
BlisseyEvosAttacks:
	db 0 ; no more evolutions
	db  1, TACKLE_SCRATCH_POUND
	db  1, GROWL
	db  5, LEER_TAIL_WHIP
	db  6, HEAL_BELL_AROMA
	db 10, SOFTBOILED_MILK_DRINK_RECOVER
	db 13, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 18, MINIMIZE
	db 22, TAKE_DOWN
	db 25, SING_HYPNOSIS
	db 28, EGG_BOMB
	db 33, DEFENSE_CURL_HARDEN_WITHDRAW
	db 40, LIGHT_SCREEN
	db 47, DOUBLE_EDGE
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
	db 36, THRASH
	db 39, SANDSTORM
	db 44, HYPER_BEAM
	db 0 ; no more level-up moves

PupitarEvosAttacks:
	db EVOLVE_LEVEL, 55, TYRANITAR
	db 0 ; no more evolutions
	db 1, BARRIER_IRON_DEFENSE_ACID_ARMOR
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
	db 42, THRASH
	db 47, SANDSTORM
	db 52, HYPER_BEAM
	db 0 ; no more level-up moves

TyranitarEvosAttacks:
	db 0 ; no more evolutions
	db 1, BARRIER_IRON_DEFENSE_ACID_ARMOR
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
	db 13, WING_ATTACK
	db 17, HAZE
	db 21, BUBBLE_BEAM
	db 26, QUICK_ATTACK
	db 30, PURSUIT
	db 38, AIR_SLASH
	db 44, HURRICANE
	db 50, HYDRO_PUMP
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
	db 33, PURSUIT
	db 44, AIR_SLASH
	db 50, HURRICANE
	db 55, HYDRO_PUMP
	db 0 ; no more level-up moves
	
ShroomishEvosAttacks:
	db EVOLVE_LEVEL, 23, BRELOOM
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, TACKLE_SCRATCH_POUND
	db 5, STUN_SPORE
	db 5, POISONPOWDER
	db 8, LEECH_SEED
	db 12, HEADBUTT
	db 16, MEGA_DRAIN
	db 22, WORK_UP_GROWTH
	db 40, SPORE
	db 0 ; no more level-up moves
	
BreloomEvosAttacks:
	db 0 ; no more evolutions
	db 1, MACH_PUNCH
	db 1, ABSORB
	db 1, TACKLE_SCRATCH_POUND
	db 1, STUN_SPORE
	db 1, POISONPOWDER
	db 1, LEECH_SEED
	db 1, HEADBUTT
	db 1, MEGA_DRAIN
	db 1, WORK_UP_GROWTH
	db 28, REVERSAL
	db 35, LOCK_ON_MIND_READER
	db 41, DRAIN_PUNCH
	db 50, DYNAMICPUNCH
	db 0 ; no more level-up moves

AronEvosAttacks:
	db EVOLVE_LEVEL, 32, LAIRON
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 7, MUD_SLAP
	db 10, HEADBUTT
	db 13, METAL_CLAW
	db 16, BARRIER_IRON_DEFENSE_ACID_ARMOR
	db 20, ROAR_WHIRLWIND
	db 26, IRON_TAIL
	db 31, SCREECH
	db 36, PROTECT
	db 39, TAKE_DOWN
	db 43, AGILITY_ROCK_POLISH
	db 49, DOUBLE_EDGE
	db 0 ; no more level-up moves
	
LaironEvosAttacks:
	db EVOLVE_LEVEL, 42, AGGRON
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 7, MUD_SLAP
	db 10, HEADBUTT
	db 13, METAL_CLAW
	db 16, BARRIER_IRON_DEFENSE_ACID_ARMOR
	db 20, ROAR_WHIRLWIND
	db 26, IRON_TAIL
	db 31, SCREECH
	db 36, PROTECT
	db 39, TAKE_DOWN
	db 43, AGILITY_ROCK_POLISH
	db 49, DOUBLE_EDGE
	db 0 ; no more level-up moves
	
AggronEvosAttacks: 
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 1, MUD_SLAP
	db 1, HEADBUTT
	db 1, METAL_CLAW
	db 1, BARRIER_IRON_DEFENSE_ACID_ARMOR
	db 1, ROAR_WHIRLWIND
	db 1, IRON_TAIL
	db 1, SCREECH
	db 1, PROTECT
	db 1, TAKE_DOWN
	db 49, AGILITY_ROCK_POLISH
	db 55, DOUBLE_EDGE
	db 0 ; no more level-up moves
	
MedititeEvosAttacks:
	db EVOLVE_LEVEL, 37, MEDICHAM
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 4, SHARPEN_HOWL_MEDITATE
	db 8, CONFUSION
	db 13, ENDURE
	db 19, LOW_KICK
	db 25, LOCK_ON_MIND_READER
	db 29, JUMP_KICK
	db 32, CALM_MIND
	db 36, FUTURE_SIGHT
	db 39, SOFTBOILED_MILK_DRINK_RECOVER
	db 43, DRAIN_PUNCH
	db 46, HI_JUMP_KICK
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
	db 1, ENDURE
	db 1, LOW_KICK
	db 1, LOCK_ON_MIND_READER
	db 1, JUMP_KICK
	db 1, CALM_MIND
	db 1, FUTURE_SIGHT
	db 42, SOFTBOILED_MILK_DRINK_RECOVER
	db 49, DRAIN_PUNCH
	db 55, HI_JUMP_KICK
	db 0 ; no more level-up moves
	
CarvanhaEvosAttacks:
	db EVOLVE_LEVEL, 30, SHARPEDO
	db 0 ; no more evolutions
	db 1, LEER_TAIL_WHIP
	db 1, PURSUIT
	db 4, RAGE
	db 8, FOCUS_ENERGY
	db 11, BITE
	db 15, AQUA_JET
	db 22, SCREECH
	db 25, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 31, SWAGGER
	db 36, CRUNCH
	db 39, AGILITY_ROCK_POLISH
	db 43, TAKE_DOWN
	db 0 ; no more level-up moves
	
SharpedoEvosAttacks:
	db 0 ; no more evolutions
	db 1, SLASH
	db 1, LEER_TAIL_WHIP
	db 1, PURSUIT
	db 4, RAGE
	db 1, FOCUS_ENERGY
	db 1, BITE
	db 1, AQUA_JET
	db 1, SCREECH
	db 1, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 34, SWAGGER
	db 38, CRUNCH
	db 42, AGILITY_ROCK_POLISH
	db 47, TAKE_DOWN
	db 56, DOUBLE_EDGE
	db 0 ; no more level-up moves
	
NumelEvosAttacks:
	db EVOLVE_LEVEL, 33, CAMERUPT
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, GROWL
	db 5, FIRE_SPIN
	db 8, FOCUS_ENERGY
	db 15, MAGNITUDE
	db 19, AMNESIA
	db 22, FLAME_BURST
	db 28, TAKE_DOWN
	db 36, CURSE
	db 40, FLAMETHROWER
	db 44, DOUBLE_EDGE
	db 47, EARTH_POWER
	db 0 ; no more level-up moves
	
CameruptEvosAttacks:
	db 0 ; no more evolutions
	db 1, ROCK_SLIDE
	db 1, TACKLE_SCRATCH_POUND
	db 1, GROWL
	db 1, FIRE_SPIN
	db 1, FOCUS_ENERGY
	db 1, MAGNITUDE
	db 1, AMNESIA
	db 1, FLAME_BURST
	db 1, TAKE_DOWN
	db 41, CURSE
	db 46, FLAMETHROWER
	db 51, DOUBLE_EDGE
	db 57, EARTH_POWER
	db 0 ; no more level-up moves
	
CacneaEvosAttacks:
	db EVOLVE_LEVEL, 32, CACTURNE
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 1, LEER_TAIL_WHIP
	db 5, PURSUIT
	db 9, WORK_UP_GROWTH
	db 13, LEECH_SEED
	db 17, SAND_ATTACK_SMOKESCREEN_FLASH
	db 21, PIN_MISSILE
	db 29, FEINT_ATTACK
	db 33, SPIKES
	db 37, SUCKER_PUNCH
	db 43, HORN_LEECH
	db 49, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 53, DESTINY_BOND
	db  0 ; no more level-up moves
	
CacturneEvosAttacks:
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 1, LEER_TAIL_WHIP
	db 1, PURSUIT
	db 1, WORK_UP_GROWTH
	db 1, LEECH_SEED
	db 1, SAND_ATTACK_SMOKESCREEN_FLASH
	db 1, PIN_MISSILE
	db 1, FEINT_ATTACK
	db 37, SPIKES
	db 43, SUCKER_PUNCH
	db 49, HORN_LEECH
	db 53, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 57, DESTINY_BOND
	db 0 ; no more level-up moves
	
SwabluEvosAttacks:
	db EVOLVE_LEVEL, 35, ALTARIA
	db 0 ; no more evolutions
	db 1, PECK
	db 1, GROWL
	db 4, SING_HYPNOSIS
	db 7, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 10, SAFEGUARD
	db 16, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 22, HAZE
	db 25, TAKE_DOWN
	db 28, HEAL_BELL_AROMA
	db 31, MIRROR_MOVE
	db 34, COTTON_GUARD
	db 37, DRAGON_PULSE
	db 40, PERISH_SONG
	db 43, MOONBLAST
	db 0 ; no more level-up moves
	
AltariaEvosAttacks:
	db 0 ; no more evolutions
	db 1, DRAGONBREATH
	db 1, PECK
	db 1, GROWL
	db 1, SING_HYPNOSIS
	db 1, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 1, SAFEGUARD
	db 1, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 1, HAZE
	db 1, TAKE_DOWN
	db 1, HEAL_BELL_AROMA
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
	db 14, BITE
	db 19, ICY_WIND
	db 23, PROTECT
	db 28, HEADBUTT
	db 35, ICICLE_CRASH
	db 46, BLIZZARD
	db 0 ; no more level-up moves
	
GlalieEvosAttacks:
	db 0 ; no more evolutions
	db 1, ICE_FANG
	db 1, TACKLE_SCRATCH_POUND
	db 1, LEER_TAIL_WHIP
	db 1, DOUBLE_TEAM
	db 1, ICE_SHARD
	db 1, BITE
	db 1, ICY_WIND
	db 1, PROTECT
	db 1, HEADBUTT
	db 1, ICICLE_CRASH
	db 46, CRUNCH
	db 54, BLIZZARD
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
	db 31, AGILITY_ROCK_POLISH
	db 38, HEADBUTT
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
	db 35, AGILITY_ROCK_POLISH
	db 46, CRUNCH
	db 57, HYDRO_PUMP
	db 0 ; no more level-up moves
	
CherubiEvosAttacks:
	db EVOLVE_LEVEL, 25, CHERRIM
	db 0 ; no more evolutions
	db 1, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db 1, TACKLE_SCRATCH_POUND
	db 7, WORK_UP_GROWTH
	db 9, LEECH_SEED
	db 15, STUN_SPORE
	db 19, BULLET_SEED
	db 22, SAFEGUARD
	db 30, TAKE_DOWN
	db 37, SOLAR_BEAM
	db 47, PETAL_BLIZZARD
	db 0 ; no more level-up moves
	
CherrimEvosAttacks:
	db 0 ; no more evolutions
	db 1, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db 1, TACKLE_SCRATCH_POUND
	db 1, WORK_UP_GROWTH
	db 1, LEECH_SEED
	db 1, STUN_SPORE
	db 1, BULLET_SEED
	db 1, SAFEGUARD
	db 1, SUNNY_DAY
	db 35, TAKE_DOWN
	db 43, SOLAR_BEAM
	db 50, PETAL_BLIZZARD
	db 0 ; no more level-up moves
	
DrifloonEvosAttacks:
	db EVOLVE_LEVEL, 28, DRIFBLIM
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, WILL_O_WISP
	db 1, MINIMIZE
	db 8, GUST
	db 13, FOCUS_ENERGY
	db 16, KNOCK_OFF
	db 20, OMINOUS_WIND
	db 27, HEX
	db 33, SELFDESTRUCT
	db 40, AMNESIA
	db 44, SHADOW_BALL
	db 50, EXPLOSION
	db 0 ; no more level-up moves
	
DrifblimEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, WILL_O_WISP
	db 1, MINIMIZE
	db 8, GUST
	db 13, FOCUS_ENERGY
	db 16, KNOCK_OFF
	db 20, OMINOUS_WIND
	db 27, HEX
	db 35, SELFDESTRUCT
	db 46, AMNESIA
	db 52, SHADOW_BALL
	db 60, EXPLOSION
	db 0 ; no more level-up moves
	
BunearyEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, LOPUNNY
LopunnyEvosAttacks:
	db 0 ; no more evolutions
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 1, TRANSFORM_SKETCH_MIMIC_SPLASH_METRO
	db 1, TACKLE_SCRATCH_POUND
	db 1, FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	db 1, ENDURE
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
	db 1, PURSUIT
	db 1, PECK
	db 11, HAZE
	db 15, MIRROR_MOVE
	db 21, NIGHT_SHADE
	db 25, FEINT_ATTACK
	db 31, TAUNT
	db 35, MEAN_LOOK_BLOCK_SPIDER_WEB
	db 41, PERISH_SONG
	db 48, NIGHT_SLASH
	db 55, DRILL_PECK
	db 0 ; no more level-up moves
	
SpiritombEvosAttacks:
	db 0 ; no more evolutions
	db 1, NIGHT_SHADE
	db 1, CONFUSE_RAY
	db 5, PURSUIT
	db 10, DISABLE
	db 15, FEINT_ATTACK
	db 20, CURSE
	db 25, HEX
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
	db 1, TRANSFORM_SKETCH_MIMIC_SPLASH_METRO
	db 1, HEADBUTT
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 1, AMNESIA
	db 20, SCREECH
	db 28, REST
	db 28, SNORE
	db 33, BODY_SLAM
	db 41, MEAN_LOOK_BLOCK_SPIDER_WEB
	db 44, BELLY_DRUM
	db 49, ROLLOUT
	db 0 ; no more level-up moves
	
CroagunkEvosAttacks:
	db EVOLVE_LEVEL, 37, TOXICROAK
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 3, MUD_SLAP
	db 8, POISON_STING
	db 10, PURSUIT
	db 15, TAUNT
	db 17, FEINT_ATTACK
	db 22, REVERSAL
	db 24, SWAGGER
	db 29, SLUDGE
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
	db 1, PURSUIT
	db 1, TAUNT
	db 1, FEINT_ATTACK
	db 1, REVERSAL
	db 1, SWAGGER
	db 1, SLUDGE
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
	db 9, ICY_WIND
	db 13, SING_HYPNOSIS
	db 17, SWAGGER
	db 21, HAZE
	db 26, ICE_SHARD
	db 31, LEECH_SEED
	db 36, RAZOR_LEAF
	db 41, BLIZZARD
	db 46, WOOD_HAMMER
	db 0 ; no more level-up moves
	
AbomasnowEvosAttacks:
	db 0 ; no more evolutions
	db 1, ICE_PUNCH
	db 1, TACKLE_SCRATCH_POUND
	db 1, LEER_TAIL_WHIP
	db 1, ICY_WIND
	db 1, SING_HYPNOSIS
	db 1, SWAGGER
	db 1, HAZE
	db 1, ICE_SHARD
	db 1, LEECH_SEED
	db 1, RAZOR_LEAF
	db 47, BLIZZARD
	db 58, WOOD_HAMMER
	db 0 ; no more level-up moves
	
WeavileEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, LEER_TAIL_WHIP
	db 1, TAUNT
	db 8, QUICK_ATTACK
	db 10, PURSUIT
	db 16, FEINT_ATTACK
	db 22, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 27, AGILITY_ROCK_POLISH
	db 32, SCREECH
	db 39, SLASH
	db 45, KNOCK_OFF
	db 50, ICE_SHARD
	db 55, NIGHT_SLASH
	db 0 ; no more level-up moves
	
MagnezoneEvosAttacks:
	db 0 ; no more evolutions
	db 1, TRI_ATTACK
	db 1, SUPERSONIC
	db 1, TACKLE_SCRATCH_POUND
	db 7, THUNDERSHOCK
	db 13, THUNDER_WAVE
	db 19, SPARK
	db 25, SCREECH
	db 35, HYPER_VOICE
	db 42, FLASH_CANNON
	db 49, ZAP_CANNON
	db 59, LOCK_ON_MIND_READER
	db 0 ; no more level-up moves
	
ElectivireEvosAttacks:
	db 0 ; no more evolutions
	db 1, FIRE_PUNCH
	db 1, QUICK_ATTACK
	db 1, LEER_TAIL_WHIP
	db 1, THUNDERSHOCK
	db 1, DOUBLE_TEAM
	db 15, SHOCK_WAVE
	db 19, THUNDER_WAVE
	db 25, SCREECH
	db 29, THUNDERPUNCH
	db 36, LOW_KICK
	db 42, LIGHT_SCREEN
	db 49, THUNDERBOLT
	db 55, THUNDER
	db 64, GIGA_IMPACT
	db 0 ; no more level-up moves
	
MagmortarEvosAttacks:
	db 0 ; no more evolutions
	db 1, THUNDERPUNCH
	db 1, SMOG
	db 1, LEER_TAIL_WHIP
	db 1, EMBER
	db 1, SAND_ATTACK_SMOKESCREEN_FLASH
	db 15, FIRE_SPIN
	db 19, CLEAR_SMOG
	db 25, CONFUSE_RAY
	db 29, FIRE_PUNCH
	db 36, LOW_KICK
	db 42, SUNNY_DAY
	db 49, FLAMETHROWER
	db 55, FIRE_BLAST
	db 64, HYPER_BEAM
	db 0 ; no more level-up moves
	
TogekissEvosAttacks:
	db 0 ; no more evolutions
	db 1, EXTREMESPEED
	db 1, AURA_SPHERE
	db 1, AIR_SLASH
	db 1, GROWL
	db 1, CHARM_FEATHER_DANCE
	db 1, TRANSFORM_SKETCH_MIMIC_SPLASH_METRO
	db 13, SING_HYPNOSIS
	db 15, FAIRY_WIND
	db 21, ENCORE
	db 27, SAFEGUARD
	db 33, WISH
	db 37, ANCIENTPOWER
	db 41, BATON_PASS
	db 47, HYPER_VOICE
	db 52, DOUBLE_EDGE
	db 0 ; no more level-up moves
	
LeafeonEvosAttacks:
	db 0 ; no more evolutions
	db 1, RAZOR_LEAF
	db 1, TAKE_DOWN
	db 1, BATON_PASS
	db 1, GROWL
	db 1, TACKLE_SCRATCH_POUND
	db 5, LEER_TAIL_WHIP
	db 9, SAND_ATTACK_SMOKESCREEN_FLASH
	db 13, QUICK_ATTACK
	db 17, SING_HYPNOSIS
	db 20, BULLET_SEED
	db 25, GIGA_DRAIN
	db 29, SWORDS_DANCE
	db 33, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db 37, DOUBLE_EDGE
	db 41, ENERGY_BALL
	db 51, PETAL_BLIZZARD
	db 0 ; no more level-up moves
	
GlaceonEvosAttacks:
	db 0 ; no more evolutions
	db 1, ICY_WIND
	db 1, TAKE_DOWN
	db 1, BATON_PASS
	db 1, GROWL
	db 1, TACKLE_SCRATCH_POUND
	db 5, LEER_TAIL_WHIP
	db 9, SAND_ATTACK_SMOKESCREEN_FLASH
	db 13, QUICK_ATTACK
	db 17, BITE
	db 20, ICE_FANG
	db 25, ICE_SHARD
	db 29, BARRIER_IRON_DEFENSE_ACID_ARMOR
	db 33, SAFEGUARD
	db 37, DOUBLE_EDGE
	db 41, ICE_BEAM
	db 51, BLIZZARD
	db 0 ; no more level-up moves
	
GliscorEvosAttacks:
	db 0 ; no more evolutions
	db 1, POISON_JAB
	db 1, SLASH
	db 1, POISON_STING
	db 4, SAND_ATTACK_SMOKESCREEN_FLASH
	db 7, DEFENSE_CURL_HARDEN_WITHDRAW
	db 10, KNOCK_OFF
	db 13, QUICK_ATTACK
	db 16, FURY_CUTTER
	db 22, FEINT_ATTACK
	db 27, REVERSAL
	db 32, NIGHT_SLASH
	db 39, SCREECH
	db 45, ACROBATICS
	db 50, X_SCISSOR
	db 55, SWORDS_DANCE
	db 0 ; no more level-up moves
	
MamoswineEvosAttacks:
	db 0 ; no more evolutions
	db 1, ANCIENTPOWER
	db 1, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 1, HORN_ATTACK
	db 1, TACKLE_SCRATCH_POUND
	db 1, FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	db 1, SAND_ATTACK_SMOKESCREEN_FLASH
	db 1, ICE_SHARD
	db 1, MUD_SLAP
	db 1, ENDURE
	db 1, ICY_WIND
	db 1, MAGNITUDE
	db 1, TAKE_DOWN
	db 37, HAZE
	db 41, AMNESIA
	db 52, THRASH
	db 58, BLIZZARD
	db 58, EARTHQUAKE
	db 0 ; no more level-up moves
	
PorygonZEvosAttacks:
	db 0 ; no more evolutions
	db 1, NASTY_PLOT
	db 1, CONVERSION
	db 1, CONVERSION2
	db 1, TRI_ATTACK
	db 1, SHARPEN_HOWL_MEDITATE
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 1, AGILITY_ROCK_POLISH
	db 16, PSYBEAM
	db 25, SWIFT
	db 39, SOFTBOILED_MILK_DRINK_RECOVER
	db 52, LOCK_ON_MIND_READER
	db 57, ZAP_CANNON
	db 62, HYPER_BEAM
	db 0 ; no more level-up moves
	
FroslassEvosAttacks:
	db 0 ; no more evolutions
	db 1, HEX
	db 1, TACKLE_SCRATCH_POUND
	db 1, LEER_TAIL_WHIP
	db 5, DOUBLE_TEAM
	db 10, ICE_SHARD
	db 14, BITE
	db 19, ICY_WIND
	db 23, PROTECT
	db 30, OMINOUS_WIND
	db 37, CONFUSE_RAY
	db 40, WILL_O_WISP
	db 48, DESTINY_BOND
	db 54, BLIZZARD
	db 0 ; no more level-up moves
	
DrilburEvosAttacks:
	db EVOLVE_LEVEL, 31, EXCADRILL
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 5, RAPID_SPIN
	db 8, MUD_SLAP
	db 12, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 15, METAL_CLAW
	db 19, DIG
	db 21, SHARPEN_HOWL_MEDITATE
	db 32, ROCK_SLIDE
	db 36, SLASH
	db 40, SWORDS_DANCE
	db 47, EARTHQUAKE
	db  0 ; no more level-up moves

ExcadrillEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, RAPID_SPIN
	db 1, MUD_SLAP
	db 1, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 1, METAL_CLAW
	db 1, DIG
	db 1, SHARPEN_HOWL_MEDITATE
	db 36, ROCK_SLIDE
	db 42, SLASH
	db 49, SWORDS_DANCE
	db 55, EARTHQUAKE
	db 0 ; no more level-up moves
	
VenipedeEvosAttacks:
	db EVOLVE_LEVEL, 22, WHIRLIPEDE
	db 0 ; no more evolutions
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 1, ROLLOUT
	db 5, POISON_STING
	db 8, SCREECH
	db 12, PURSUIT
	db 15, FURY_CUTTER
	db 22, PROTECT
	db 29, AGILITY_ROCK_POLISH
	db 33, PIN_MISSILE
	db 36, TOXIC
	db 38, POISON_JAB
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
	db 1, FURY_CUTTER
	db 32, AGILITY_ROCK_POLISH
	db 37, PIN_MISSILE
	db 41, TOXIC
	db 43, POISON_JAB
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
	db 1, FURY_CUTTER
	db 33, AGILITY_ROCK_POLISH
	db 39, PIN_MISSILE
	db 44, TOXIC
	db 47, POISON_JAB
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
	db 33, ENCORE
	db 37, COTTON_GUARD
	db 40, SUNNY_DAY
	db 44, SOLAR_BEAM
	db 0 ; no more level-up moves
	
WhimsicottEvosAttacks:
	db 0 ; no more evolutions
	db 1, GUST
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
	db 33, ENCORE
	db 37, COTTON_GUARD
	db 40, SUNNY_DAY
	db 44, SOLAR_BEAM
	db 52, HURRICANE
	db 0 ; no more level-up moves
	
MaractusEvosAttacks:
	db 0 ; no more evolutions
	db  1, PECK
	db  1, ABSORB
	db  6, WORK_UP_GROWTH
	db 10, PIN_MISSILE
	db 13, MEGA_DRAIN
	db 15, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db 18, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 24, HORN_LEECH
	db 29, SHARPEN_HOWL_MEDITATE
	db 38, PETAL_DANCE
	db 42, SUCKER_PUNCH
	db 45, SUNNY_DAY
	db 50, SOLAR_BEAM
	db 55, COTTON_GUARD
	db 0 ; no more level-up moves
	
DwebbleEvosAttacks:
	db EVOLVE_LEVEL, 34, CRUSTLE
	db 0 ; no more evolutions
	db 1, SAND_ATTACK_SMOKESCREEN_FLASH
	db 7, DEFENSE_CURL_HARDEN_WITHDRAW
	db 11, FURY_CUTTER
	db 13, FEINT_ATTACK
	db 17, ROCK_BLAST
	db 19, AGILITY_ROCK_POLISH
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
	db 1, SAND_ATTACK_SMOKESCREEN_FLASH
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 1, FURY_CUTTER
	db 1, FEINT_ATTACK
	db 1, ROCK_BLAST
	db 1, AGILITY_ROCK_POLISH
	db 1, METAL_CLAW
	db 1, SPIKES
	db 1, ROCK_SLIDE
	db 1, SLASH
	db 40, X_SCISSOR
	db 45, SHELL_SMASH
	db 52, FLAIL
	db 59, ROCK_WRECKER
	db  0 ; no more level-up moves
	
ScraggyEvosAttacks:
	db EVOLVE_LEVEL, 39, SCRAFTY
	db 0 ; no more evolutions
	db 1, LEER_TAIL_WHIP
	db 1, LOW_KICK
	db 5, SAND_ATTACK_SMOKESCREEN_FLASH
	db 9, FEINT_ATTACK
	db 12, HEADBUTT
	db 16, SWAGGER
	db 20, BRICK_BREAK
	db 23, PURSUIT
	db 31, JUMP_KICK
	db 34, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 40, CRUNCH
	db 45, DOUBLE_EDGE
	db 50, SUPERPOWER
	db 0 ; no more level-up moves
	
ScraftyEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, LEER_TAIL_WHIP
	db 1, LOW_KICK
	db 1, SAND_ATTACK_SMOKESCREEN_FLASH
	db 1, FEINT_ATTACK
	db 1, HEADBUTT
	db 1, SWAGGER
	db 1, BRICK_BREAK
	db 1, PURSUIT
	db 1, JUMP_KICK
	db 1, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 43, CRUNCH
	db 49, DOUBLE_EDGE
	db 55, SUPERPOWER
	db 0 ; no more level-up moves
	
TirtougaEvosAttacks:
	db EVOLVE_LEVEL, 37, CARRACOSTA
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 5, ROLLOUT
	db 8, BITE
	db 11, PROTECT
	db 15, AQUA_JET
	db 18, ANCIENTPOWER
	db 28, CRUNCH
	db 31, BODY_SLAM
	db 35, CURSE
	db 38, SHELL_SMASH
	db 41, ROCK_SLIDE
	db 46, AQUA_TAIL
	db 50, HYDRO_PUMP
	db 0 ; no more level-up moves
	
CarracostaEvosAttacks:
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 1, ROLLOUT
	db 1, BITE
	db 1, PROTECT
	db 1, AQUA_JET
	db 1, ANCIENTPOWER
	db 1, CRUNCH
	db 1, BODY_SLAM
	db 1, CURSE
	db 40, SHELL_SMASH
	db 45, ROCK_SLIDE
	db 51, AQUA_TAIL
	db 61, HYDRO_PUMP
	db 0 ; no more level-up moves
	
ArchenEvosAttacks:
	db EVOLVE_LEVEL, 37, ARCHEOPS
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, LEER_TAIL_WHIP
	db 5, ROCK_THROW
	db 8, DOUBLE_TEAM
	db 11, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 15, WING_ATTACK
	db 18, ANCIENTPOWER
	db 21, AGILITY_ROCK_POLISH
	db 28, SCREECH
	db 31, DRAGONBREATH
	db 35, CRUNCH
	db 38, SLASH
	db 41, ROCK_SLIDE
	db 46, ACROBATICS
	db 50, BODY_SLAM
	db 0 ; no more level-up moves
	
ArcheopsEvosAttacks:
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, LEER_TAIL_WHIP
	db 1, ROCK_THROW
	db 1, DOUBLE_TEAM
	db 1, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 1, WING_ATTACK
	db 1, ANCIENTPOWER
	db 1, AGILITY_ROCK_POLISH
	db 1, SCREECH
	db 1, DRAGONBREATH
	db 1, CRUNCH
	db 40, SLASH
	db 45, ROCK_SLIDE
	db 51, ACROBATICS
	db 61, BODY_SLAM
	db 0 ; no more level-up moves
	
MinccinoEvosAttacks:
	db EVOLVE_ITEM, SHINY_STONE, CINCCINO
	db  0 ; no more evolutions
	db  1, TACKLE_SCRATCH_POUND
	db  3, GROWL
	db 13, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 15, ENCORE
	db 19, SWIFT
	db 21, SING_HYPNOSIS
	db 25, DOUBLE_HIT
	db 30, CHARM_FEATHER_DANCE
	db 37, BODY_SLAM
	db 43, HYPER_VOICE
	db 49, DOUBLE_EDGE
	db  0 ; no more level-up moves

CinccinoEvosAttacks:
	db  0 ; no more evolutions
	db  1, BULLET_SEED
	db  1, ROCK_BLAST
	db  1, TACKLE_SCRATCH_POUND
	db  3, GROWL
	db 13, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 15, ENCORE
	db 19, SWIFT
	db 21, SING_HYPNOSIS
	db 25, DOUBLE_HIT
	db 30, CHARM_FEATHER_DANCE
	db 37, BODY_SLAM
	db 43, HYPER_VOICE
	db 49, DOUBLE_EDGE
	db  0 ; no more level-up moves
	
JoltikEvosAttacks:
	db EVOLVE_LEVEL, 36, GALVANTULA
	db 0 ; no more evolutions
	db 1, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 1, MEAN_LOOK_BLOCK_SPIDER_WEB
	db 4, THUNDER_WAVE
	db 7, SCREECH
	db 10, FURY_CUTTER
	db 14, THUNDER_FANG
	db 18, PIN_MISSILE
	db 23, DISABLE
	db 26, SLASH
	db 32, SIGNAL_BEAM
	db 37, AGILITY_ROCK_POLISH
	db 40, SUCKER_PUNCH
	db 45, THUNDERBOLT
	db 48, BUG_BUZZ
	db 0 ; no more level-up moves
	
GalvantulaEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 1, MEAN_LOOK_BLOCK_SPIDER_WEB
	db 1, THUNDER_WAVE
	db 1, SCREECH
	db 1, FURY_CUTTER
	db 1, THUNDER_FANG
	db 1, PIN_MISSILE
	db 1, DISABLE
	db 1, SLASH
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
	db 8, CONFUSE_RAY
	db 12, FIRE_SPIN
	db 20, WILL_O_WISP
	db 24, FLAME_BURST
	db 28, HAZE
	db 32, HEX
	db 36, ENDURE
	db 42, FLAMETHROWER
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
	db 1, CONFUSE_RAY
	db 1, FIRE_SPIN
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
	db 1, EMBER
	db 1, SMOG
	db 1, MINIMIZE
	db 1, CONFUSE_RAY
	db 1, FIRE_SPIN
	db 1, WILL_O_WISP
	db 1, FLAME_BURST
	db 1, HAZE
	db 1, HEX
	db 1, ENDURE
	db 1, FLAMETHROWER
	db 52, CURSE
	db 58, SHADOW_BALL
	db 65, FIRE_BLAST
	db 0 ; no more level-up moves
	
MienfooEvosAttacks:
	db EVOLVE_LEVEL, 50, MIENSHAO
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 5, SHARPEN_HOWL_MEDITATE
	db 9, PROTECT
	db 13, FAKE_OUT
	db 17, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 21, SWIFT
	db 25, CALM_MIND
	db 29, REVERSAL
	db 33, DRAIN_PUNCH
	db 37, JUMP_KICK
	db 45, AURA_SPHERE
	db 53, CROSS_CHOP
	db 57, ACROBATICS
	db 61, HI_JUMP_KICK
	db 0 ; no more level-up moves
	
MienshaoEvosAttacks:
	db 0 ; no more evolutions
	db 1, AURA_SPHERE
	db 1, TACKLE_SCRATCH_POUND
	db 1, SHARPEN_HOWL_MEDITATE
	db 1, PROTECT
	db 1, FAKE_OUT
	db 1, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 1, SWIFT
	db 1, CALM_MIND
	db 1, REVERSAL
	db 1, DRAIN_PUNCH
	db 1, JUMP_KICK
	db 1, AURA_SPHERE
	db 57, CROSS_CHOP
	db 61, ACROBATICS
	db 67, HI_JUMP_KICK
	db 0 ; no more level-up moves
	
LarvestaEvosAttacks:
	db EVOLVE_LEVEL, 59, VOLCARONA
	db 0 ; no more evolutions
	db 1, EMBER
	db 1, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 6, ABSORB
	db 9, FIRE_SPIN
	db 12, FLAME_CHARGE
	db 18, BITE
	db 24, SCREECH
	db 30, LEECH_LIFE
	db 36, TAKE_DOWN
	db 42, BUG_BUZZ
	db 48, AMNESIA
	db 54, DOUBLE_EDGE
	db 59, QUIVER_DANCE
	db 61, FLARE_BLITZ
	db 0 ; no more level-up moves
	
VolcaronaEvosAttacks:
	db EVOLVE_ONLY_CHANGE_FORM, VOLCARONA
	db 0 ; no more evolutions
	db 1, FIERY_DANCE
	db 1, GUST
	db 1, EMBER
	db 1, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 6, ABSORB
	db 1, FIRE_SPIN
	db 12, FLAME_CHARGE
	db 18, BITE
	db 24, SCREECH
	db 30, LEECH_LIFE
	db 36, TAKE_DOWN
	db 42, BUG_BUZZ
	db 48, AMNESIA
	db 54, DOUBLE_EDGE
	db 59, QUIVER_DANCE
	db 70, FLARE_BLITZ
	db 0 ; no more level-up moves
	
SylveonEvosAttacks:
	db 0 ; no more evolutions
	db 1, FAIRY_WIND
	db 1, TAKE_DOWN
	db 1, BATON_PASS
	db 1, GROWL
	db 1, TACKLE_SCRATCH_POUND
	db 5, LEER_TAIL_WHIP
	db 9, SAND_ATTACK_SMOKESCREEN_FLASH
	db 13, QUICK_ATTACK
	db 17, SWIFT
	db 20, TRANSFORM_SKETCH_MIMIC_SPLASH_METRO
	db 25, DAZZLINGLEAM
	db 29, LIGHT_SCREEN
	db 33, ATTRACT
	db 37, DOUBLE_EDGE
	db 41, WISH
	db 45, MOONBLAST

PhantumpEvosAttacks:
	db EVOLVE_TRADE, -1, TREVENANT
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, CONFUSE_RAY
	db 10, FEINT_ATTACK
	db 19, HEX
	db 24, LEECH_SEED
	db 28, SHADOW_BALL
	db 33, WORK_UP_GROWTH
	db 37, CURSE
	db 42, HORN_LEECH
	db 46, DESTINY_BOND
	db 51, WOOD_HAMMER
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
	db 28, SHADOW_BALL
	db 33, WORK_UP_GROWTH
	db 37, CURSE
	db 42, HORN_LEECH
	db 46, DESTINY_BOND
	db 51, WOOD_HAMMER
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
	db 20, AGILITY_ROCK_POLISH
	db 25, HYPER_VOICE
	db 36, AIR_SLASH
	db 39, ROAR_WHIRLWIND
	db 43, CRUNCH
	db 57, HURRICANE
	db 0 ; no more level-up moves
	
NoivernEvosAttacks:
	db 0 ; no more evolutions
	db 1, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db 1, DRAGON_PULSE
	db 1, SCREECH
	db 1, SUPERSONIC
	db 1, TACKLE_SCRATCH_POUND
	db 1, ABSORB
	db 1, GUST
	db 1, BITE
	db 1, AGILITY_ROCK_POLISH
	db 1, HYPER_VOICE
	db 1, AIR_SLASH
	db 1, ROAR_WHIRLWIND
	db 49, CRUNCH
	db 62, HURRICANE
	db 0 ; no more level-up moves
	
PikipekEvosAttacks:
	db EVOLVE_LEVEL, 14, TRUMBEAK
	db 0 ; no more evolutions
	db 1, PECK
	db 4, GROWL
	db 18, SUPERSONIC
	db 23, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 26, SCREECH
	db 48, DRILL_PECK
	db 0 ; no more level-up moves
	
TrumbeakEvosAttacks:
	db EVOLVE_LEVEL, 28, TOUCANNON
	db 0 ; no more evolutions
	db 1, ROCK_BLAST
	db 1, PECK
	db 4, GROWL
	db 18, SUPERSONIC
	db 23, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 26, SCREECH
	db 48, DRILL_PECK
	db 0 ; no more level-up moves

ToucannonEvosAttacks:
	db 0 ; no more evolutions
	db 1, ACROBATICS ;TODO BEAK_BLAST?
	db 1, ROCK_BLAST
	db 1, PECK
	db 1, GROWL
	db 1, SUPERSONIC
	db 1, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 1, SCREECH
	db 55, DRILL_PECK
	db  0 ; no more level-up moves
	
MareanieEvosAttacks:
	db EVOLVE_LEVEL, 38, TOXAPEX
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 1, PECK
	db 10, BITE
	db 15, VENOSHOCK
	db 20, SOFTBOILED_MILK_DRINK_RECOVER
	db 25, PIN_MISSILE
	db 30, TOXIC_SPIKES
	db 35, CRUNCH
	db 40, NASTY_PLOT
	db 45, POISON_JAB
	db 50, TOXIC
	db 0 ; no more level-up moves
	
ToxapexEvosAttacks:
	db 0 ; no more evolutions
	db 1, PROTECT ;TODO BANEFUL_BUNKER?
	db 1, POISON_STING
	db 1, PECK
	db 10, BITE
	db 15, VENOSHOCK
	db 20, SOFTBOILED_MILK_DRINK_RECOVER
	db 25, PIN_MISSILE
	db 30, TOXIC_SPIKES
	db 35, CRUNCH
	db 42, NASTY_PLOT
	db 49, POISON_JAB
	db 56, TOXIC
	db 0 ; no more level-up moves
	
ComfeyEvosAttacks:
	db 0 ; no more evolutions
	db  1, VINE_WHIP
	db  4, LEECH_SEED
	db  7, MEGA_DRAIN
	db 13, WORK_UP_GROWTH
	db 19, PETAL_BLIZZARD
	db 28, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db 31, SAFEGUARD
	db 38, HEAL_BELL_AROMA
	db 44, SPORE
	db 49, PLAY_ROUGH
	db 54, PETAL_DANCE
	db 0 ; no more level-up moves
	
MimikyuEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 8, CHARM_FEATHER_DANCE
	db 15, TRANSFORM_SKETCH_MIMIC_SPLASH_METRO
	db 26, SLASH
	db 37, SHADOW_CLAW
	db 41, SWORDS_DANCE
	db 46, PLAY_ROUGH
	db 50, PERISH_SONG
	db 0 ; no more level-up moves
	
CursolaEvosAttacks:
	db 0 ; no more evolutions
	db 1, PERISH_SONG
	db 1, TACKLE_SCRATCH_POUND
	db 1, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 1, DEFENSE_CURL_HARDEN_WITHDRAW
	db 1, WATER_GUN
	db 1, SAFEGUARD
	db 1, PROTECT
	db 1, ANCIENTPOWER
	db 1, NIGHT_SHADE
	db 1, CURSE
	db 1, SOFTBOILED_MILK_DRINK_RECOVER
	db 1, BARRIER_IRON_DEFENSE_ACID_ARMOR
	db 1, HEX
	db 47, POWER_GEM
	db 57, EARTH_POWER
	db 0 ; no more level-up moves
	
DreepyEvosAttacks:
	db EVOLVE_LEVEL, 50, DRAKLOAK
	db 0 ; no more evolutions
	db  1, OMINOUS_WIND
	db  1, QUICK_ATTACK
	db  1, BITE
	db 0 ; no more level-up moves
	
DrakloakEvosAttacks:
	db EVOLVE_LEVEL, 60, DRAGAPULT
	db 0 ; no more evolutions
	db  1, DRAGON_PULSE
	db  1, OMINOUS_WIND
	db  1, QUICK_ATTACK
	db  1, BITE
	db  6, LOCK_ON_MIND_READER
	db 12, PURSUIT
	db 18, HEX
	db 24, AGILITY_ROCK_POLISH
	db 36, FURY_CUTTER
	db 42, DRAGON_DANCE
	db 56, DRAGON_CLAW
	db 61, DOUBLE_EDGE
	db 0 ; no more level-up moves
	
DragapultEvosAttacks:
	db 0 ; no more evolutions
	db  1, DRAGON_DARTS
	db  1, DRAGON_PULSE
	db  1, OMINOUS_WIND
	db  1, QUICK_ATTACK
	db  1, BITE
	db  6, LOCK_ON_MIND_READER
	db 12, PURSUIT
	db 18, HEX
	db 24, AGILITY_ROCK_POLISH
	db 36, FURY_CUTTER
	db 42, DRAGON_DANCE
	db 56, DRAGON_CLAW
	db 61, DOUBLE_EDGE
	db 0 ; no more level-up moves
	
WyrdeerEvosAttacks:
	db 0 ; no more evolutions
	db 1, PSYSHIELD_BASH
	db 1, TACKLE_SCRATCH_POUND
	db 3, LEER_TAIL_WHIP
	db 7, DISABLE
	db 10, SING_HYPNOSIS
	db 13, STOMP
	db 19, TAKE_DOWN
	db 23, CONFUSE_RAY
	db 28, CALM_MIND
	db 37, ZEN_HEADBUTT
	db 43, JUMP_KICK
	db 49, SWAGGER
	db 55, DOUBLE_EDGE
	db 62, MEGAHORN
	db 0 ; no more level-up moves
	
FlittleEvosAttacks:
	db EVOLVE_LEVEL, 35, ESPATHRA
	db 0 ; no more evolutions
	db 1, PECK
	db 1, GROWL
	db 5, CONFUSION
	db 8, CHARM_FEATHER_DANCE
	db 11, FAIRY_WIND
	db 15, QUICK_ATTACK
	db 19, PSYBEAM
	db 29, AGILITY_ROCK_POLISH
	db 34, HYPER_VOICE
	db 0 ; no more level-up moves
	
EspathraEvosAttacks:
	db 0 ; no more evolutions
	db 1, DRILL_PECK
	db 1, CHARM_FEATHER_DANCE
	db 1, PECK
	db 1, GROWL
	db 1, LUMINA_CRASH
	db 5, CONFUSION
	db 8, CHARM_FEATHER_DANCE
	db 11, FAIRY_WIND
	db 15, QUICK_ATTACK
	db 19, PSYBEAM
	db 29, AGILITY_ROCK_POLISH
	db 34, HYPER_VOICE
	db 43, DAZZLINGLEAM
	db 49, PSYCHIC_M
	db 54, DOUBLE_EDGE
	db 0 ; no more level-up moves
	
ClodsireEvosAttacks:
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 1, LEER_TAIL_WHIP
	db 1, MUD_SLAP
	db 1, TOXIC_SPIKES
	db 1, BODY_SLAM
	db 28, SLUDGE_BOMB
	db 33, ENCORE
	db 38, AMNESIA
	db 46, POISON_JAB
	db 51, MEGAHORN
	db 58, EARTHQUAKE
	db 0 ; no more level-up moves
	
FarigirafEvosAttacks:
	db 0 ; no more evolutions
	db  1, TWIN_BEAM
	db  1, TACKLE_SCRATCH_POUND
	db  1, GROWL
	db  5, CONFUSION
	db 14, STOMP
	db 19, PSYBEAM
	db 23, AGILITY_ROCK_POLISH
	db 28, DOUBLE_HIT
	db 40, CRUNCH
	db 42, BATON_PASS
	db 46, NASTY_PLOT
	db 50, PSYCHIC_M
	db 0 ; no more level-up moves
	
EggEvosAttacks::
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
Raichu_AEvosAttacks:
	db  0 ; no more evolutions
	db 1, PSYBEAM
	db 1, THUNDERSHOCK
	db 1, GROWL
	db 5, LEER_TAIL_WHIP
	db 9, QUICK_ATTACK
	db 17, THUNDER_WAVE
	db 22, DOUBLE_TEAM
	db 26, SPARK
	db 30, AGILITY_ROCK_POLISH
	db 37, IRON_TAIL
	db 46, PSYCHIC_M
	db 57, THUNDERBOLT
	db 0 ; no more level-up moves
	
Meowth_AEvosAttacks:
	db EVOLVE_LEVEL, 28, PERSIAN
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, GROWL
	db 6, BITE
	db 10, PAY_DAY
	db 15, SCREECH
	db 17, TAUNT
	db 21, FEINT_ATTACK
	db 25, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 30, NASTY_PLOT
	db 38, SWAGGER
	db 46, NIGHT_SLASH
	db 50, PLAY_ROUGH
	db 0 ; no more level-up moves

Persian_AEvosAttacks:
	db 0 ; no more evolutions
	db 1, POWER_GEM
	db 1, TACKLE_SCRATCH_POUND
	db 1, GROWL
	db 1, BITE
	db 1, PAY_DAY
	db 1, SCREECH
	db 1, TAUNT
	db 1, FEINT_ATTACK
	db 1, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 36, NASTY_PLOT
	db 42, SWAGGER
	db 53, NIGHT_SLASH
	db 59, PLAY_ROUGH
	db 0 ; no more level-up moves
	
Grimer_AEvosAttacks:
	db EVOLVE_LEVEL, 38, MUK
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, SMOG
	db 6, DEFENSE_CURL_HARDEN_WITHDRAW
	db 9, BITE
	db 14, DISABLE
	db 17, ACID
	db 25, MINIMIZE
	db 30, POISON_FANG
	db 33, CRUNCH
	db 38, SCREECH
	db 41, BARRIER_IRON_DEFENSE_ACID_ARMOR
	db 49, ROCK_BLAST
	db 0 ; no more level-up moves
	
Muk_AEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, SMOG
	db 6, DEFENSE_CURL_HARDEN_WITHDRAW
	db 9, BITE
	db 14, DISABLE
	db 17, ACID
	db 25, MINIMIZE
	db 30, POISON_FANG
	db 33, CRUNCH
	db 38, SCREECH
	db 44, BARRIER_IRON_DEFENSE_ACID_ARMOR
	db 56, ROCK_BLAST
	db 0 ; no more level-up moves
	
Exeggutor_AEvosAttacks:
	db 0 ; no more evolutions
	db 1, WOOD_HAMMER
	db 1, DRAGONHAMMER
	db 1, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 1, SING_HYPNOSIS
	db 7, REFLECT
	db 11, LEECH_SEED
	db 19, CONFUSION
	db 25, STUN_SPORE
	db 25, POISONPOWDER
	db 25, SLEEP_POWDER
	db 32, EGG_BOMB
	db 39, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db 44, PSYSHOCK
	db 54, SOLAR_BEAM
	db 0 ; no more level-up moves
	
Marowak_AEvosAttacks:
	db  0 ; no more evolutions
	db 1, FLAME_CHARGE
	db 1, TACKLE_SCRATCH_POUND
	db 3, GROWL
	db 7, BONE_CLUB
	db 11, HEADBUTT
	db 13, LEER_TAIL_WHIP
	db 17, FOCUS_ENERGY
	db 21, BONEMERANG
	db 23, RAGE
	db 29, SHADOW_BONE
	db 37, HEX
	db 53, FLARE_BLITZ
	db 0 ; no more level-up moves
	
Wooper_PEvosAttacks:
	db EVOLVE_LEVEL, 20, CLODSIRE
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 1, LEER_TAIL_WHIP
	db 8, MUD_SLAP
	db 12, TOXIC_SPIKES
	db 15, BODY_SLAM
	db 26, SLUDGE_BOMB
	db 30, ENCORE
	db 34, AMNESIA
	db 42, POISON_JAB
	db 46, MEGAHORN
	db 51, EARTHQUAKE
	db 0 ; no more level-up moves
	
Corsola_GEvosAttacks:
	db EVOLVE_LEVEL, 38, CURSOLA
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 4, DEFENSE_CURL_HARDEN_WITHDRAW
	db 8, WATER_GUN
	db 10, SAFEGUARD
	db 13, PROTECT
	db 17, ANCIENTPOWER
	db 20, NIGHT_SHADE
	db 23, CURSE
	db 27, SOFTBOILED_MILK_DRINK_RECOVER
	db 31, BARRIER_IRON_DEFENSE_ACID_ARMOR
	db 36, HEX
	db 41, POWER_GEM
	db 48, EARTH_POWER
	db 0 ; no more level-up moves
	
SlitherWingEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db 1, ABSORB
	db 1, GUST
	db 1, SCREECH
	db 1, BUG_BUZZ
	db 1, AMNESIA
	db 1, DOUBLE_EDGE
	db 7, STUN_SPORE
	db 21, STOMP
	db 28, LOW_KICK
	db 32, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db 39, LEECH_LIFE
	db 46, BULK_UP
	db 57, SUPERPOWER
	db 0 ; no more level-up moves
	
Rattata_RGEvosAttacks:
Raticate_RGEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE_SCRATCH_POUND
	db 1, LEER_TAIL_WHIP
	db 7, QUICK_ATTACK
	db 0 ; no more level-up moves

Pidgey_RGEvosAttacks:
	db 0 ; no more evolutions
	db 1, GUST
	db 5, SAND_ATTACK_SMOKESCREEN_FLASH
	db 0 ; no more level-up moves
	
Raichu_RGEvosAttacks:
	db 0 ; no more evolutions
	db 1, THUNDERSHOCK
	db 1, GROWL
	db 1, THUNDER_WAVE
	db 0 ; no more level-up moves
	
Exeggutor_RGEvosAttacks:
	db 0 ; no more evolutions
	db 1, MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db 1, SING_HYPNOSIS
	db 28, STOMP
	db 0 ; no more level-up moves
	
Gyarados_RGEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEER_TAIL_WHIP
	db 1, DRAGON_RAGE
	db 1, BITE
	db 0 ; no more level-up moves
