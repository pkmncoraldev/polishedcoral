add_tm: MACRO
if !DEF(TM01)
TM01 = const_value
	enum_start 1
endc
	define _\@_1, "TM_\1"
	const _\@_1
	enum \1_TMNUM
ENDM

add_hm: MACRO
if !DEF(HM01)
HM01 = const_value
endc
	define _\@_1, "HM_\1"
	const _\@_1
	enum \1_TMNUM
ENDM

add_mt: MACRO
	enum \1_TMNUM
ENDM

	const_def

	add_tm DYNAMICPUNCH ; $00
	add_tm DRAGON_CLAW  ; $01
	add_tm CURSE        ; $02
	add_tm CALM_MIND    ; $03
	add_tm ROAR_WHIRLWIND         ; $04
	add_tm TOXIC        ; $05
	add_tm HAIL         ; $06
	add_tm CHARM	    ; $07
	add_tm VENOSHOCK    ; $08
	add_tm SUPERPOWER ; $09
	add_tm SUNNY_DAY    ; $0a
	add_tm SIGNAL_BEAM  ; $0b
	add_tm ICE_BEAM     ; $0c
	add_tm BLIZZARD     ; $0d
	add_tm HYPER_BEAM   ; $0e
	add_tm LIGHT_SCREEN ; $0f
	add_tm PROTECT      ; $10
	add_tm RAIN_DANCE   ; $11
	add_tm GIGA_DRAIN   ; $12
	add_tm SAFEGUARD    ; $13
	add_tm WORK_UP_GROWTH     ; $14
	add_tm SOLAR_BEAM   ; $15
	add_tm IRON_TAIL    ; $16
	add_tm THUNDERBOLT  ; $17
	add_tm THUNDER      ; $18
	add_tm EARTHQUAKE   ; $19
	add_tm RETURN       ; $1a
	add_tm DIG          ; $1b
	add_tm PSYCHIC      ; $1c
	add_tm SHADOW_BALL  ; $1d
	add_tm METAL_CLAW	; $1e
	add_tm DOUBLE_TEAM  ; $1f
	add_tm REFLECT      ; $20
	add_tm FLASH_CANNON ; $21
	add_tm FLAMETHROWER ; $22
	add_tm SLUDGE_BOMB  ; $23
	add_tm SANDSTORM    ; $24
	add_tm FIRE_BLAST   ; $25
	add_tm SWIFT        ; $26
	add_tm FAKE_OUT		; $27
	add_tm SUBSTITUTE   ; $28
	add_tm VITAL_THROW  ; $29
	add_tm WILD_CHARGE  ; $2a
	add_tm REST         ; $2b
	add_tm ATTRACT      ; $2c
	add_tm ACROBATICS   ; $2d
	add_tm STEEL_WING   ; $2e
	add_tm ROCK_SLIDE   ; $2f
	add_tm DAZZLINGLEAM ; $30
	add_tm LEECH_LIFE   ; $31
	add_tm ROOST        ; $32
	add_tm FOCUS_BLAST  ; $33
	add_tm ENERGY_BALL  ; $34
	add_tm FALSE_SWIPE  ; $35
	add_tm SCALD        ; $36
	add_tm X_SCISSOR    ; $37
	add_tm DARK_PULSE   ; $38
	add_tm ENDURE       ; $39
	add_tm DRAGON_PULSE ; $3a
	add_tm DRAIN_PUNCH  ; $3b
	add_tm WILL_O_WISP  ; $3c
	add_tm BULLDOZE   ; $3d
	add_tm TOXIC_SPIKES  ; $3e
	add_tm EXPLOSION    ; $3f
	add_tm SHADOW_CLAW  ; $40
	add_tm POISON_JAB   ; $41
	add_tm FAIRY_WIND    ; $42
	add_tm GIGA_IMPACT  ; $43
	add_tm FIRE_FANG       ; $44
	add_tm FLASH        ; $45
	add_tm STONE_EDGE   ; $46
	add_tm VOLT_SWITCH  ; $47
	add_tm THUNDER_WAVE ; $48
	add_tm GYRO_BALL    ; $49
	add_tm SWORDS_DANCE ; $4a
	add_tm THUNDERPUNCH ; $4b
	add_tm FIRE_PUNCH	; $4c
	add_tm ICE_PUNCH	; $4d
NUM_TMS = const_value - TM01

	add_hm CUT          ; $4e
	add_hm FLY          ; $4f
	add_hm SURF         ; $50
	add_hm STRENGTH     ; $51
	add_hm EGG_BOMB     ; $52
	add_hm WATERFALL    ; $53
	add_hm ROCK_SMASH   ; $54
	add_hm ROCK_CLIMB	;55
NUM_HMS = const_value - HM01

	add_mt DEFENSE_CURL_HARDEN_WITHDRAW ; $54

NUM_TMHMS EQU __enum__ +- 1
