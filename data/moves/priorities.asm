MovePriorities:
	db PROTECT,       4
	db ENDURE,        4
	db FAKE_OUT,	  3
	db EXTREMESPEED,  2
	db AQUA_JET,      1
	db SUCKER_PUNCH,  1
	db BULLET_PUNCH,  1
	db ICE_SHARD,     1
	db MACH_PUNCH,    1
	db QUICK_ATTACK,  1
	; everything else 0
	db ROAR_WHIRLWIND,         -6
	db TELEPORT,     -6
	db -1
	
TriageMoves:
; used by Triage
	db ABSORB
	db MEGA_DRAIN
	db GIGA_DRAIN
	db REST
	db DREAM_EATER
	db SYNTHESIS_MOONLIGHT_MORNING_SUN
	db WISH
	db SOFTBOILED_MILK_DRINK_RECOVER
	db ROOST
	db LEECH_LIFE
	db DRAIN_PUNCH
	db HORN_LEECH
	db -1
