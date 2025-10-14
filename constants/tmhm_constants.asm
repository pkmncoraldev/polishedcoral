MACRO add_tm
if !DEF(TM01)
DEF TM01 = const_value
	enum_start 1
endc
	const TM_\1
	enum \1_TMNUM
ENDM

MACRO add_hm
if !DEF(HM01)
DEF HM01 = const_value
endc
	const HM_\1
	enum \1_TMNUM
ENDM

MACRO add_mt
	enum \1_TMNUM
ENDM

	const_def

	add_tm WORK_UP_GROWTH	; $00
	add_tm DRAGON_CLAW		; $01
	add_tm CURSE			; $02
	add_tm CALM_MIND		; $03
	add_tm CHARM			; $04
	add_tm TOXIC			; $05
	add_tm HAIL				; $06
	add_tm BULK_UP			; $07
	add_tm VENOSHOCK		; $08
	add_tm MUD_SLAP			; $09
	add_tm SUNNY_DAY		; $0a
	add_tm TAUNT			; $0b
	add_tm ICE_BEAM			; $0c
	add_tm BLIZZARD			; $0d
	add_tm HYPER_BEAM		; $0e
	add_tm LIGHT_SCREEN		; $0f
	add_tm PROTECT			; $10
	add_tm RAIN_DANCE		; $11
	add_tm GIGA_DRAIN		; $12
	add_tm SAFEGUARD		; $13
	add_tm BULLDOZE			; $14
	add_tm SOLAR_BEAM		; $15
	add_tm DESTINY_BOND		; $16
	add_tm THUNDERBOLT		; $17
	add_tm THUNDER			; $18
	add_tm EARTHQUAKE		; $19
	add_tm RETURN			; $1a
	add_tm DIG				; $1b
	add_tm PSYCHIC			; $1c
	add_tm SHADOW_BALL		; $1d
	add_tm METAL_CLAW		; $1e
	add_tm DOUBLE_TEAM		; $1f
	add_tm REFLECT			; $20
	add_tm SHOCK_WAVE		; $21
	add_tm FLAMETHROWER		; $22
	add_tm SLUDGE_BOMB		; $23
	add_tm SANDSTORM		; $24
	add_tm FIRE_BLAST		; $25
	add_tm SWIFT			; $26
	add_tm FAKE_OUT			; $27
	add_tm SUBSTITUTE		; $28
	add_tm ZAP_CANNON		; $29
	add_tm BRICK_BREAK		; $2a
	add_tm REST				; $2b
	add_tm ATTRACT			; $2c
	add_tm WEATHER_BALL		; $2d
	add_tm STEEL_WING		; $2e
	add_tm SUPERPOWER		; $2f
	add_tm DAZZLINGLEAM		; $30
	add_tm THUNDERPUNCH		; $31
	add_tm FIRE_PUNCH		; $32
	add_tm ICE_PUNCH		; $33
	add_tm ENERGY_BALL		; $34
	add_tm FALSE_SWIPE		; $35
	add_tm SCALD			; $36
	add_tm ROOST			; $37
	add_tm DARK_PULSE		; $38
	add_tm ENDURE			; $39
	add_tm DRAGON_PULSE		; $3a
	add_tm DRAIN_PUNCH		; $3b
	add_tm WILL_O_WISP		; $3c
	add_tm ACROBATICS		; $3d
	add_tm TOXIC_SPIKES		; $3e
	add_tm SELFDESTRUCT		; $3f
	add_tm SHADOW_CLAW		; $40
	add_tm POISON_JAB		; $41
	add_tm RAPID_SPIN		; $42
	add_tm GIGA_IMPACT		; $43
	add_tm ANCIENTPOWER		; $44
	add_tm SAND_ATTACK_SMOKESCREEN_FLASH			; $45
	add_tm STONE_EDGE		; $46
	add_tm FIRE_FANG		; $47
	add_tm THUNDER_WAVE		; $48
	add_tm GYRO_BALL		; $49
	add_tm SWORDS_DANCE		; $4a
	add_tm LEECH_LIFE		; $4b
	add_tm X_SCISSOR		; $4c
	add_tm FOCUS_BLAST		; $4d
DEF NUM_TMS = const_value - TM01

	add_hm CUT			; $4e
	add_hm FLY			; $4f
	add_hm SURF			; $50
	add_hm STRENGTH		; $51
	add_hm DIVE			; $52
	add_hm ROCK_SMASH	; $53
	add_hm WATERFALL	; $54
	add_hm ROCK_CLIMB	; $55
	
DEF NUM_HMS = const_value - HM01

	add_mt SLOT_1	; $56
	add_mt SLOT_2	; $57
	add_mt SLOT_3	; $58
	add_mt SLOT_4	; $59
	add_mt SLOT_5	; $5a
	add_mt SLOT_6	; $5b
	add_mt SLOT_7	; $5c
	add_mt SLOT_8	; $5d
	add_mt SLOT_9	; $5e
	add_mt SLOT_10	; $5f
	add_mt SLOT_11	; $60
	add_mt SLOT_12	; $61
	add_mt SLOT_13	; $62
	add_mt SLOT_14	; $63
	add_mt SLOT_15	; $64
	add_mt SLOT_16	; $65
	add_mt SLOT_17	; $66
	add_mt SLOT_18	; $67
	add_mt SLOT_19	; $68
	add_mt SLOT_20	; $69
	add_mt SLOT_21	; $6a
	add_mt SLOT_22	; $6b
	add_mt SLOT_23	; $6c
	add_mt SLOT_24	; $6d
	add_mt SLOT_25	; $6e
	add_mt SLOT_26	; $6f

DEF NUM_TMHMS EQU __enum__ +- 1
