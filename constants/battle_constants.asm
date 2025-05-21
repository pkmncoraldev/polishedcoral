DEF MAX_LEVEL EQU 100
DEF MIN_LEVEL EQU 2
DEF EGG_LEVEL EQU 1
DEF NUM_MOVES EQU 4

DEF REST_TURNS EQU 2
DEF MAX_STAT_LEVEL EQU 13
DEF BASE_STAT_LEVEL EQU 7

; matchups, baseline is $10 for better doubling/halving
DEF SUPER_EFFECTIVE    EQU $20
DEF NOT_VERY_EFFECTIVE EQU $08
DEF NO_EFFECT          EQU $00

	const_def
	const ATTACK
	const DEFENSE
	const SPEED
	const SP_ATTACK
	const SP_DEFENSE
	const ACCURACY
	const EVASION
	const MULTIPLE_STATS ; used by Curse
DEF NUM_LEVEL_STATS EQU const_value

; move struct
	const_def
	const MOVE_ANIM
	const MOVE_EFFECT
	const MOVE_POWER
	const MOVE_TYPE
	const MOVE_ACC
	const MOVE_PP
	const MOVE_CHANCE
	const MOVE_CATEGORY
	const MOVE_LENGTH

; stat constants
	const_def 1
	const STAT_HP
	const STAT_ATK
	const STAT_DEF
	const STAT_SPD
	const STAT_SATK
	const STAT_SDEF
DEF NUM_STATS EQU const_value

DEF STAT_MIN_NORMAL EQU 5
DEF STAT_MIN_HP EQU 10

; $00 is used instead of $ff for DVs because $ff is the end-of-trainer marker
; ReadTrainerParty converts $00 to $ff when reading DVs

DEF PERFECT_DVS      EQUS "$ff, $ff, $ff"
DEF FAKE_PERFECT_DVS EQUS "$00, $00, $00"

; Hidden Power DVs ($00 is converted to $ff in regular trainer sets)
; Chosen for stat importance: Speed > * > Atk
if DEF(FAITHFUL)
DEF DVS_HP_FIGHTING EQUS "$00, $ee, $ee"
DEF DVS_HP_FLYING   EQUS "$ee, $ef, $ee"
DEF DVS_HP_POISON   EQUS "$00, $ef, $ee"
DEF DVS_HP_GROUND   EQUS "$00, $00, $ee"
DEF DVS_HP_ROCK     EQUS "$00, $ee, $fe"
DEF DVS_HP_BUG      EQUS "$fe, $ef, $fe"
DEF DVS_HP_GHOST    EQUS "$fe, $00, $fe"
DEF DVS_HP_STEEL    EQUS "$00, $00, $fe"
DEF DVS_HP_FIRE     EQUS "$fe, $fe, $ef"
DEF DVS_HP_WATER    EQUS "$fe, $ef, $ef"
DEF DVS_HP_GRASS    EQUS "$fe, $00, $ef"
DEF DVS_HP_ELECTRIC EQUS "$00, $00, $ef"
DEF DVS_HP_PSYCHIC  EQUS "$fe, $fe, $00"
DEF DVS_HP_ICE      EQUS "$fe, $ef, $00"
DEF DVS_HP_DRAGON   EQUS "$fe, $00, $00"
DEF DVS_HP_DARK     EQUS "$00, $00, $00"
else
DEF DVS_HP_FIGHTING EQUS "$00, $ee, $ee"
DEF DVS_HP_FLYING   EQUS "$00, $fe, $ee"
DEF DVS_HP_POISON   EQUS "$00, $ef, $ee"
DEF DVS_HP_GROUND   EQUS "$00, $00, $ee"
DEF DVS_HP_ROCK     EQUS "$00, $ee, $fe"
DEF DVS_HP_BUG      EQUS "$00, $fe, $fe"
DEF DVS_HP_GHOST    EQUS "$00, $ef, $fe"
DEF DVS_HP_STEEL    EQUS "$00, $00, $fe"
DEF DVS_HP_FIRE     EQUS "$00, $ee, $ef"
DEF DVS_HP_WATER    EQUS "$00, $fe, $ef"
DEF DVS_HP_GRASS    EQUS "$00, $ef, $ef"
DEF DVS_HP_ELECTRIC EQUS "$00, $00, $ef"
DEF DVS_HP_PSYCHIC  EQUS "$00, $ee, $00"
DEF DVS_HP_ICE      EQUS "$00, $fe, $00"
DEF DVS_HP_DRAGON   EQUS "$00, $ef, $00"
DEF DVS_HP_DARK     EQUS "$fe, $00, $00"
endc

; battle tower hidden power dvs ($ff instead of $00)
if DEF(FAITHFUL)
DEF BTDVS_HP_FIGHTING EQUS "$ff, $ee, $ee"
DEF BTDVS_HP_FLYING   EQUS "$ee, $ef, $ee"
DEF BTDVS_HP_POISON   EQUS "$ff, $ef, $ee"
DEF BTDVS_HP_GROUND   EQUS "$ff, $ff, $ee"
DEF BTDVS_HP_ROCK     EQUS "$ff, $ee, $fe"
DEF BTDVS_HP_BUG      EQUS "$fe, $ef, $fe"
DEF BTDVS_HP_GHOST    EQUS "$fe, $ff, $fe"
DEF BTDVS_HP_STEEL    EQUS "$ff, $ff, $fe"
DEF BTDVS_HP_FIRE     EQUS "$fe, $fe, $ef"
DEF BTDVS_HP_WATER    EQUS "$fe, $ef, $ef"
DEF BTDVS_HP_GRASS    EQUS "$fe, $ff, $ef"
DEF BTDVS_HP_ELECTRIC EQUS "$ff, $ff, $ef"
DEF BTDVS_HP_PSYCHIC  EQUS "$fe, $fe, $ff"
DEF BTDVS_HP_ICE      EQUS "$fe, $ef, $ff"
DEF BTDVS_HP_DRAGON   EQUS "$fe, $ff, $ff"
DEF BTDVS_HP_DARK     EQUS "$ff, $ff, $ff"
else
DEF BTDVS_HP_FIGHTING EQUS "$ff, $ee, $ee"
DEF BTDVS_HP_FLYING   EQUS "$ff, $fe, $ee"
DEF BTDVS_HP_POISON   EQUS "$ff, $ef, $ee"
DEF BTDVS_HP_GROUND   EQUS "$ff, $ff, $ee"
DEF BTDVS_HP_ROCK     EQUS "$ff, $ee, $fe"
DEF BTDVS_HP_BUG      EQUS "$ff, $fe, $fe"
DEF BTDVS_HP_GHOST    EQUS "$ff, $ef, $fe"
DEF BTDVS_HP_STEEL    EQUS "$ff, $ff, $fe"
DEF BTDVS_HP_FIRE     EQUS "$ff, $ee, $ef"
DEF BTDVS_HP_WATER    EQUS "$ff, $fe, $ef"
DEF BTDVS_HP_GRASS    EQUS "$ff, $ef, $ef"
DEF BTDVS_HP_ELECTRIC EQUS "$ff, $ff, $ef"
DEF BTDVS_HP_PSYCHIC  EQUS "$ff, $ee, $ff"
DEF BTDVS_HP_ICE      EQUS "$ff, $fe, $ff"
DEF BTDVS_HP_DRAGON   EQUS "$ff, $ef, $ff"
DEF BTDVS_HP_DARK     EQUS "$fe, $ff, $ff"
endc

; battle classes
	const_def 1
	const WILD_BATTLE
	const TRAINER_BATTLE

; battle types
	const_def
	const BATTLETYPE_NORMAL
	const BATTLETYPE_CANLOSE
	const BATTLETYPE_TUTORIAL
	const BATTLETYPE_FISH
	const BATTLETYPE_TREE
	const BATTLETYPE_ROAMING
	const BATTLETYPE_CONTEST
	const BATTLETYPE_SAFARI
	const BATTLETYPE_GHOST
	const BATTLETYPE_GROTTO
	const BATTLETYPE_INVERSE
	const BATTLETYPE_TRAP
	const BATTLETYPE_FORCEITEM
	const BATTLETYPE_SHINY
	const BATTLETYPE_PORYGON
	const BATTLETYPE_GEN_1
	;these have to be last for exp boost
	const BATTLETYPE_LEGENDARY
	const BATTLETYPE_SHINY_LEGENDARY

; attack failure modes, higher gives priority
; TODO: complete this functionality
	const_def 1
	const ATKFAIL_MISSED  ; "<USER>'s attack missed!"
	const ATKFAIL_PROTECT ; "<TARGET> is protecting itself!"
	const ATKFAIL_ABILITY ; ability immunity, might have side effects
	const ATKFAIL_GENERIC ; "But it failed!"
	const ATKFAIL_IMMUNE  ; "It doesn't affect <TARGET>!"
	const ATKFAIL_CUSTOM  ; custom message

; battle variables
	const_def
	const BATTLE_VARS_SUBSTATUS1
	const BATTLE_VARS_SUBSTATUS2
	const BATTLE_VARS_SUBSTATUS3
	const BATTLE_VARS_SUBSTATUS4
	const BATTLE_VARS_SUBSTATUS1_OPP
	const BATTLE_VARS_SUBSTATUS2_OPP
	const BATTLE_VARS_SUBSTATUS3_OPP
	const BATTLE_VARS_SUBSTATUS4_OPP
	const BATTLE_VARS_ABILITY
	const BATTLE_VARS_ABILITY_OPP
	const BATTLE_VARS_STATUS
	const BATTLE_VARS_STATUS_OPP
	const BATTLE_VARS_MOVE_ANIM
	const BATTLE_VARS_MOVE_EFFECT
	const BATTLE_VARS_MOVE_POWER
	const BATTLE_VARS_MOVE_ACCURACY
	const BATTLE_VARS_MOVE_TYPE
	const BATTLE_VARS_MOVE_CATEGORY
	const BATTLE_VARS_MOVE
	const BATTLE_VARS_MOVE_OPP
	const BATTLE_VARS_LAST_COUNTER_MOVE
	const BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	const BATTLE_VARS_LAST_MOVE
	const BATTLE_VARS_LAST_MOVE_OPP

; status
DEF SLP EQU %111 ; max 7 turns
	const_def 3
	const PSN ; 3
	const BRN ; 4
	const FRZ ; 5
	const PAR ; 6
	const TOX ; 7

DEF ALL_STATUS EQU (1 << PSN) | (1 << BRN) | (1 << FRZ) | (1 << PAR) | (1 << TOX) | SLP

; substatus
	enum_start 7, -1
	enum SUBSTATUS_IN_LOVE
	enum SUBSTATUS_ROLLOUT
	enum SUBSTATUS_ENDURE
	enum SUBSTATUS_PERISH
	enum SUBSTATUS_IDENTIFIED
	enum SUBSTATUS_PROTECT
	enum SUBSTATUS_CURSE
	enum SUBSTATUS_UNBURDEN

	enum_start 7, -1
	enum SUBSTATUS_CANT_RUN
	enum SUBSTATUS_DESTINY_BOND
	enum SUBSTATUS_LOCK_ON
	enum SUBSTATUS_ENCORED
	enum SUBSTATUS_TRANSFORMED
	enum SUBSTATUS_MAGIC_BOUNCE
	enum SUBSTATUS_TAUNT
	enum SUBSTATUS_FLASH_FIRE

	enum_start 7, -1
	enum SUBSTATUS_CONFUSED
	enum SUBSTATUS_FLYING
	enum SUBSTATUS_UNDERGROUND
	enum SUBSTATUS_UNDERWATER
	enum SUBSTATUS_CHARGED
	enum SUBSTATUS_FLINCHED
	enum SUBSTATUS_IN_LOOP
	enum SUBSTATUS_RAMPAGE

	enum_start 7, -1
	enum SUBSTATUS_LEECH_SEED
	enum SUBSTATUS_RAGE
	enum SUBSTATUS_RECHARGE
	enum SUBSTATUS_SUBSTITUTE
	enum SUBSTATUS_ROOST
	enum SUBSTATUS_FOCUS_ENERGY
	enum SUBSTATUS_MIST
	enum SUBSTATUS_CURLED ; formely in its own substatus

; environmental, things that stack are bitmasks
DEF SCREENS_REFLECT      EQU 0 ; %00000001
DEF SCREENS_LIGHT_SCREEN EQU 1 ; %00000010
DEF SCREENS_SAFEGUARD    EQU 2 ; %00000100
DEF SCREENS_WISH         EQU 3 ; %00001000
DEF SCREENS_SPIKES       EQU     %00110000
DEF SCREENS_TOXIC_SPIKES EQU     %11000000

; weather
	const_def
	const WEATHER_NONE
	const WEATHER_RAIN
	const WEATHER_SUN
	const WEATHER_SANDSTORM
	const WEATHER_HAIL
	const WEATHER_RAIN_END
	const WEATHER_SUN_END
	const WEATHER_SANDSTORM_END
	const WEATHER_HAIL_END

; Battle vars used in home/battle.asm
	const_def
	const PLAYER_SUBSTATUS_1
	const ENEMY_SUBSTATUS_1
	const PLAYER_SUBSTATUS_2
	const ENEMY_SUBSTATUS_2
	const PLAYER_SUBSTATUS_3
	const ENEMY_SUBSTATUS_3
	const PLAYER_SUBSTATUS_4
	const ENEMY_SUBSTATUS_4
	const PLAYER_ABILITY
	const ENEMY_ABILITY
	const PLAYER_STATUS
	const ENEMY_STATUS
	const PLAYER_MOVE_ANIMATION
	const ENEMY_MOVE_ANIMATION
	const PLAYER_MOVE_EFFECT
	const ENEMY_MOVE_EFFECT
	const PLAYER_MOVE_POWER
	const ENEMY_MOVE_POWER
	const PLAYER_MOVE_ACCURACY
	const ENEMY_MOVE_ACCURACY
	const PLAYER_MOVE_TYPE
	const ENEMY_MOVE_TYPE
	const PLAYER_MOVE_CATEGORY
	const ENEMY_MOVE_CATEGORY
	const PLAYER_CUR_MOVE
	const ENEMY_CUR_MOVE
	const PLAYER_COUNTER_MOVE
	const ENEMY_COUNTER_MOVE
	const PLAYER_LAST_MOVE
	const ENEMY_LAST_MOVE

; wBattleAction
	const_def
	const BATTLEACTION_MOVE1
	const BATTLEACTION_MOVE2
	const BATTLEACTION_MOVE3
	const BATTLEACTION_MOVE4
	const BATTLEACTION_SWITCH1
	const BATTLEACTION_SWITCH2
	const BATTLEACTION_SWITCH3
	const BATTLEACTION_SWITCH4
	const BATTLEACTION_SWITCH5
	const BATTLEACTION_SWITCH6
	const BATTLEACTION_A
	const BATTLEACTION_B
	const BATTLEACTION_C
	const BATTLEACTION_STRUGGLE
	const BATTLEACTION_FORFEIT

	const_def
	const WIN
	const LOSE
	const DRAW
