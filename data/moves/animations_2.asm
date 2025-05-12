BattleAnim_FlareBlitz:
	anim_setobjpal PAL_BATTLE_OB_YELLOW, PAL_BTLCUSTOM_FIRE
	anim_setobjpal PAL_BATTLE_OB_RED, PAL_BTLCUSTOM_FIRE
	anim_setobjpal PAL_BATTLE_OB_GRAY, PAL_BTLCUSTOM_FIRE
	anim_2gfx ANIM_GFX_FIRE, ANIM_GFX_HIT
	anim_battlergfx_2row
	anim_bgeffect ANIM_BG_CYCLE_MON_LIGHT_DARK_REPEATING, $0, $1, $20
.loop
	anim_sound 0, 1, SFX_MEGA_PUNCH
	anim_obj ANIM_OBJ_FLARE_BLITZ, 44, 108, $6
	anim_wait 2
	anim_obj ANIM_OBJ_FLARE_BLITZ, 36, 108, $6
	anim_wait 2
	anim_sound 0, 1, SFX_MEGA_PUNCH
	anim_obj ANIM_OBJ_FLARE_BLITZ, 52, 108, $8
	anim_wait 2
	anim_obj ANIM_OBJ_FLARE_BLITZ, 28, 108, $8
	anim_wait 2
	anim_sound 0, 1, SFX_MEGA_PUNCH
	anim_obj ANIM_OBJ_FLARE_BLITZ, 60, 108, $6
	anim_wait 2
	anim_obj ANIM_OBJ_FLARE_BLITZ, 20, 108, $8
	anim_wait 2
	anim_obj ANIM_OBJ_FLARE_BLITZ, 68, 108, $8
	anim_wait 2
	anim_loop 3, .loop
	anim_wait 16
	anim_incbgeffect ANIM_BG_CYCLE_MON_LIGHT_DARK_REPEATING
	anim_wait 1
	anim_bgeffect ANIM_BG_BATTLEROBJ_1ROW, $0, $0, $0
	anim_bgeffect ANIM_BG_TACKLE, $0, $1, $0
	anim_wait 8
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $0, $0
	anim_wait 1
	anim_clearobjs
	anim_bgeffect ANIM_BG_CYCLE_BGPALS_INVERTED, $0, $4, $0
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $30, $2, $0
	anim_sound 0, 0, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 56, $0
	anim_wait 4
	anim_setobjpal PAL_BATTLE_BG_TARGET, PAL_BTLCUSTOM_FIRE
	anim_sound 0, 0, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_RADIAL_FLAME, 136, 56, $0
	anim_obj ANIM_OBJ_RADIAL_FLAME, 136, 56, $28
	anim_wait 1
	anim_obj ANIM_OBJ_RADIAL_FLAME, 136, 56, $30
	anim_obj ANIM_OBJ_RADIAL_FLAME, 136, 56, $38
	anim_wait 1
	anim_obj ANIM_OBJ_RADIAL_FLAME, 136, 56, $20
	anim_obj ANIM_OBJ_RADIAL_FLAME, 136, 56, $8
	anim_wait 1
	anim_obj ANIM_OBJ_RADIAL_FLAME, 136, 56, $18
	anim_obj ANIM_OBJ_RADIAL_FLAME, 136, 56, $4
	anim_wait 1
	anim_obj ANIM_OBJ_RADIAL_FLAME, 136, 56, $2b
	anim_obj ANIM_OBJ_RADIAL_FLAME, 136, 56, $14
	anim_wait 1
	anim_obj ANIM_OBJ_RADIAL_FLAME, 136, 56, $3b
	anim_obj ANIM_OBJ_RADIAL_FLAME, 136, 56, $24
	anim_wait 1
	anim_obj ANIM_OBJ_RADIAL_FLAME, 136, 56, $b
.loop2
	anim_sound 0, 0, SFX_BURN
	anim_wait 2
	anim_loop 2, .loop2
	anim_wait 32
	anim_wait 1
	anim_clearobjs
	anim_ret


BattleAnim_DragonClaw:
	anim_setobjpal PAL_BATTLE_OB_BLUE, PAL_BTLCUSTOM_GRAY
	anim_setobjpal PAL_BATTLE_OB_YELLOW, PAL_BTLCUSTOM_DRAGONBREATH
	anim_setobjpal PAL_BATTLE_OB_GRAY, PAL_BTLCUSTOM_DRAGONBREATH
	anim_3gfx ANIM_GFX_CUT, ANIM_GFX_FIRE, ANIM_GFX_TEAR
	anim_bgeffect ANIM_BG_FADE_MON_TO_LIGHT_REPEATING, $0, $1, $40
	anim_sound 0, 1, SFX_MEGA_PUNCH
.loop
	anim_obj ANIM_OBJ_FLARE_BLITZ, 44, 108, $6
	anim_wait 2
	anim_obj ANIM_OBJ_FLARE_BLITZ, 36, 108, $6
	anim_wait 2
	anim_obj ANIM_OBJ_FLARE_BLITZ, 52, 108, $8
	anim_wait 2
	anim_obj ANIM_OBJ_FLARE_BLITZ, 28, 108, $8
	anim_wait 2
	anim_obj ANIM_OBJ_FLARE_BLITZ, 60, 108, $6
	anim_wait 2
	anim_obj ANIM_OBJ_FLARE_BLITZ, 20, 108, $8
	anim_wait 2
	anim_obj ANIM_OBJ_FLARE_BLITZ, 68, 108, $8
	anim_wait 2
	anim_loop 2, .loop
	anim_wait 16
	anim_incbgeffect ANIM_BG_FADE_MON_TO_LIGHT_REPEATING
	anim_wait 1
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $14, $2, $0
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $2
	anim_sound 0, 1, SFX_CUT
	anim_call BattleAnimSub_Scratch
	anim_wait 8
	anim_obj ANIM_OBJ_CLAW_TEAR, 144, 48, $0
	anim_wait 32
	anim_ret
	
BattleAnim_AuraSphere:
	anim_2gfx ANIM_GFX_VORTEX, ANIM_GFX_WIND_BG
	anim_obj ANIM_OBJ_AGILITY, 8, 24, $10
	anim_obj ANIM_OBJ_AGILITY, 8, 48, $2
	anim_wait 4
	anim_obj ANIM_OBJ_AGILITY, 8, 56, $c
	anim_obj ANIM_OBJ_AGILITY, 8, 80, $4
	anim_obj ANIM_OBJ_AGILITY, 8, 104, $e
	anim_sound 6, 2, SFX_OUTRAGE
	anim_obj ANIM_OBJ_VORTEX, 48, 96, $30
	anim_wait 63
	anim_clearobjs
	anim_wait 1
	anim_2gfx ANIM_GFX_CHARGE, ANIM_GFX_HIT
	anim_sound 0, 1, SFX_MEGA_PUNCH
	anim_obj ANIM_OBJ_AURA_SPHERE, 48, 96, $16
	anim_wait 16
	anim_bgeffect ANIM_BG_CYCLE_MID_OBPALS_GRAY_AND_YELLOW, $0, $0, $0
	anim_obj ANIM_OBJ_HIT_BIG_YFIX, 136, 56, $0
	anim_wait 32
	anim_ret
	
BattleAnim_FlashCannon:
	anim_setobjpal PAL_BATTLE_OB_YELLOW, PAL_BTLCUSTOM_BRIGHT
	anim_setobjpal PAL_BATTLE_OB_GRAY, PAL_BTLCUSTOM_BRIGHT
	anim_4gfx ANIM_GFX_BIG_GLOW_CLEAR, ANIM_GFX_GLOW, ANIM_GFX_CHARGE, ANIM_GFX_SPEED
	anim_bgeffect ANIM_BG_CYCLE_OBPALS_GRAY_AND_YELLOW, $0, $6, $0
	anim_sound 0, 1, SFX_MEGA_PUNCH
	anim_obj ANIM_OBJ_BIG_GLOW_CLEAR, 48, 96, $0
	anim_wait 8
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $2
	anim_clearobjs
	anim_wait 1
	anim_bgeffect ANIM_BG_ALTERNATE_HUES, $0, $3, $0
	anim_obj ANIM_OBJ_PULSING_SPARKLE, 64, 80, $0
	anim_obj ANIM_OBJ_FLASH_CANNON_CHARGE, 48, 96, $00
	anim_wait 6
	anim_obj ANIM_OBJ_FLASH_CANNON_CHARGE, 48, 96, $30
	anim_obj ANIM_OBJ_PULSING_SPARKLE, 32, 114, $0
	anim_wait 6
	anim_sound 0, 0, SFX_UNKNOWN_66
	anim_obj ANIM_OBJ_FLASH_CANNON_CHARGE, 48, 96, $0c
	anim_obj ANIM_OBJ_PULSING_SPARKLE, 64, 114, $0
	anim_wait 6
	anim_sound 0, 0, SFX_UNKNOWN_66
	anim_obj ANIM_OBJ_FLASH_CANNON_CHARGE, 48, 96, $24
	anim_obj ANIM_OBJ_PULSING_SPARKLE, 32, 80, $0
	anim_wait 6
	anim_sound 0, 0, SFX_UNKNOWN_66
	anim_obj ANIM_OBJ_FLASH_CANNON_CHARGE, 48, 96, $18
	anim_obj ANIM_OBJ_PULSING_SPARKLE, 48, 96, $0
	anim_wait 6
	anim_sound 0, 0, SFX_UNKNOWN_66
	anim_obj ANIM_OBJ_SLOW_GROWING_GLOW, 48, 96, $0
	anim_obj ANIM_OBJ_FLASH_CANNON_CHARGE, 48, 96, $00
	anim_wait 6
	anim_sound 0, 0, SFX_UNKNOWN_66
	anim_obj ANIM_OBJ_FLASH_CANNON_CHARGE, 48, 96, $30
	anim_wait 6
	anim_sound 0, 0, SFX_UNKNOWN_66
	anim_obj ANIM_OBJ_FLASH_CANNON_CHARGE, 48, 96, $0c
	anim_wait 6
	anim_sound 0, 0, SFX_UNKNOWN_66
	anim_obj ANIM_OBJ_FLASH_CANNON_CHARGE, 48, 96, $24
	anim_wait 6
	anim_sound 0, 0, SFX_UNKNOWN_66
	anim_obj ANIM_OBJ_FLASH_CANNON_CHARGE, 48, 96, $18
	anim_wait 6
	anim_sound 0, 0, SFX_UNKNOWN_66
	anim_wait 6
	anim_sound 0, 0, SFX_UNKNOWN_66
	anim_wait 32
	anim_clearobjs
	anim_wait 1
	anim_setobjpal PAL_BATTLE_OB_YELLOW, PAL_BTLCUSTOM_SIGNAL_BEAM_RED
	anim_sound 0, 0, SFX_GIGA_DRAIN
	anim_obj ANIM_OBJ_FLASH_CANNON, 48, 96, $4
	anim_wait 24
	anim_sound 0, 0, SFX_AEROBLAST
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $14, $2, $0
	anim_obj ANIM_OBJ_SHRINKING_GLOW, 140, 44, $0
	anim_obj ANIM_OBJ_FLASH_CANNON_SPARKS_WHITE, 136, 48, $0
	anim_wait 1
	anim_obj ANIM_OBJ_FLASH_CANNON_SPARKS_RED, 136, 48, $28
	anim_wait 1
	anim_obj ANIM_OBJ_FLASH_CANNON_SPARKS_WHITE, 136, 48, $30
	anim_wait 1
	anim_sound 0, 0, SFX_METRONOME
	anim_obj ANIM_OBJ_FLASH_CANNON_SPARKS_RED, 136, 48, $38
	anim_wait 1
	anim_obj ANIM_OBJ_SHRINKING_GLOW, 124, 60, $0
	anim_obj ANIM_OBJ_FLASH_CANNON_SPARKS_WHITE, 136, 48, $20
	anim_wait 1
	anim_obj ANIM_OBJ_FLASH_CANNON_SPARKS_RED, 136, 48, $8
	anim_wait 1
	anim_obj ANIM_OBJ_FLASH_CANNON_SPARKS_WHITE, 136, 48, $18
	anim_wait 1
	anim_obj ANIM_OBJ_FLASH_CANNON_SPARKS_RED, 136, 48, $4
	anim_wait 1
	anim_obj ANIM_OBJ_SHRINKING_GLOW, 140, 60, $0
	anim_obj ANIM_OBJ_FLASH_CANNON_SPARKS_WHITE, 136, 48, $2b
	anim_wait 1
	anim_obj ANIM_OBJ_FLASH_CANNON_SPARKS_RED, 136, 48, $14
	anim_wait 1
	anim_obj ANIM_OBJ_FLASH_CANNON_SPARKS_WHITE, 136, 48, $3b
	anim_wait 1
	anim_obj ANIM_OBJ_FLASH_CANNON_SPARKS_RED, 136, 48, $24
	anim_wait 1
	anim_obj ANIM_OBJ_SHRINKING_GLOW, 124, 44, $0
	anim_obj ANIM_OBJ_FLASH_CANNON_SPARKS_WHITE, 136, 48, $b
	anim_wait 4
	anim_obj ANIM_OBJ_SHRINKING_GLOW, 132, 52, $0
	anim_wait 32
	anim_ret
	
BattleAnim_SuckerPunch:
	anim_setobjpal PAL_BATTLE_OB_BLUE, PAL_BTLCUSTOM_PAYBACK
	anim_3gfx ANIM_GFX_OBJECTS_2, ANIM_GFX_HIT, ANIM_GFX_SPEED
	anim_bgeffect ANIM_BG_HIDE_MON, $0, $1, $0
	anim_sound 0, 0, SFX_MENU
	anim_call BattleAnimSub_QuickAttack
	anim_wait 12
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_SUCKER_PUNCH_R, 182, 32, $20
	anim_wait 32
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_SUCKER_PUNCH_L, 94, 48, $0
	anim_wait 6
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $2
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_HIT_BIG_YFIX, 136, 48, $0
	anim_wait 12
	anim_call BattleAnimSub_QuickAttack
	anim_wait 8
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_wait 4
	anim_ret

BattleAnim_EnergyBall:
	anim_2gfx ANIM_GFX_HIT, ANIM_GFX_CHARGE
	anim_bgeffect ANIM_BG_ALTERNATE_HUES, $0, $2, $0
	anim_obj ANIM_OBJ_ABSORB_CENTER, 44, 88, $0
	anim_obj ANIM_OBJ_CHARGE, 44, 88, $30
	anim_obj ANIM_OBJ_CHARGE, 44, 88, $31
	anim_obj ANIM_OBJ_CHARGE, 44, 88, $32
	anim_obj ANIM_OBJ_CHARGE, 44, 88, $33
	anim_obj ANIM_OBJ_CHARGE, 44, 88, $34
	anim_obj ANIM_OBJ_CHARGE, 44, 88, $35
	anim_obj ANIM_OBJ_CHARGE, 44, 88, $36
	anim_obj ANIM_OBJ_CHARGE, 44, 88, $37
.loop
	anim_sound 0, 0, SFX_WARP_TO
	anim_wait 16
	anim_loop 4, .loop
	anim_wait 32
	anim_clearobjs
	anim_sound 0, 1, SFX_SWEET_SCENT
	anim_obj ANIM_OBJ_SIGNAL_BEAM_R, 64, 92, $2
	anim_wait 32
	anim_sound 0, 1, SFX_TOXIC
	anim_obj ANIM_OBJ_HIT, 128, 40, $0
	anim_wait 4
	anim_sound 0, 1, SFX_TOXIC
	anim_obj ANIM_OBJ_HIT, 144, 48, $0
	anim_wait 4
	anim_sound 0, 1, SFX_TOXIC
	anim_obj ANIM_OBJ_HIT, 136, 56, $0
	anim_wait 16
	anim_ret
	
BattleAnim_HyperVoice:
	anim_2gfx ANIM_GFX_NOISE, ANIM_GFX_PSYCHIC
.loop
	anim_cry $0
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $2
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $30, $2, $0
	anim_obj ANIM_OBJ_SOUND, 64, 76, $0
	anim_obj ANIM_OBJ_SOUND, 64, 88, $1
	anim_obj ANIM_OBJ_SOUND, 64, 100, $2
	anim_obj ANIM_OBJ_BIG_WAVE, 64, 88, $2
	anim_wait 2
	anim_obj ANIM_OBJ_BIG_WAVE, 64, 88, $2
	anim_wait 28
	anim_obj ANIM_OBJ_SOUND, 64, 76, $0
	anim_obj ANIM_OBJ_SOUND, 64, 88, $1
	anim_obj ANIM_OBJ_SOUND, 64, 100, $2
	anim_wait 28
	anim_loop 2, .loop
	anim_wait 8
	anim_ret
	
BattleAnim_BugBuzz:
	anim_2gfx ANIM_GFX_BUG_BUZZ, ANIM_GFX_PSYCHIC
	anim_battlergfx_2row
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $4a, $1, $0
.loop
	anim_sound 6, 2, SFX_TINGLE
	anim_obj ANIM_OBJ_BUG_BUZZ_L, 32, 84, $28
	anim_obj ANIM_OBJ_BUG_BUZZ_R, 64, 84, $38
	anim_wait 2
	anim_sound 6, 2, SFX_TINGLE
	anim_wait 2
	anim_sound 6, 2, SFX_TINGLE
	anim_obj ANIM_OBJ_BUG_BUZZ_L, 32, 84, $28
	anim_obj ANIM_OBJ_BUG_BUZZ_R, 64, 84, $38
	anim_wait 2
	anim_sound 6, 2, SFX_TINGLE
	anim_wait 2
	anim_loop 6, .loop
	anim_wait 2
	anim_sound 6, 2, SFX_SUPERSONIC
	anim_wait 6
	anim_bgeffect ANIM_BG_BATTLEROBJ_1ROW, $0, $1, $0
	anim_wait 1
	anim_bgeffect ANIM_BG_VIBRATE_MON, $0, $0, $0
	anim_wait 64
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_ret
	
BattleAnim_DrainPunch:
	anim_2gfx ANIM_GFX_HIT, ANIM_GFX_CHARGE
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $8, $2, $0
	anim_sound 0, 1, SFX_MEGA_PUNCH
	anim_obj ANIM_OBJ_LONG_PUNCH, 136, 52, $0
	anim_wait 16
.loop
	anim_sound 6, 3, SFX_WATER_GUN
	anim_obj ANIM_OBJ_DREAM_EATER, 128, 48, $2
	anim_wait 3
	anim_sound 6, 3, SFX_WATER_GUN
	anim_obj ANIM_OBJ_DREAM_EATER, 136, 64, $3
	anim_wait 4
	anim_sound 6, 3, SFX_WATER_GUN
	anim_obj ANIM_OBJ_DREAM_EATER, 136, 32, $4
	anim_wait 3
	anim_loop 6, .loop
	anim_wait 32
	anim_ret
	
BattleAnim_AquaTail:
	anim_setobjpal PAL_BATTLE_OB_BROWN, PAL_BTLCUSTOM_WATER
	anim_setobjpal PAL_BATTLE_OB_BLUE, PAL_BTLCUSTOM_BUBBLE
	anim_1gfx ANIM_GFX_BUBBLE
	anim_sound 0, 1, SFX_TOXIC
	anim_obj ANIM_OBJ_RISING_BUBBLE, 64, 104, $0
	anim_wait 16
	anim_sound 0, 1, SFX_TOXIC
	anim_obj ANIM_OBJ_RISING_BUBBLE, 32, 104, $0
	anim_wait 16
	anim_sound 0, 1, SFX_TOXIC
	anim_obj ANIM_OBJ_RISING_BUBBLE, 48, 104, $0
	anim_wait 32
	anim_clearobjs
	anim_wait 1
	anim_call BattleAnim_TargetObj_1Row_1
	anim_3gfx ANIM_GFX_BUBBLE, ANIM_GFX_HIT, ANIM_GFX_SAND
	anim_bgeffect ANIM_BG_WOBBLE_MON, $0, $1, $0
	anim_wait 16
	anim_sound 0, 1, SFX_BUBBLE_BEAM
	anim_obj ANIM_OBJ_DIG_SAND, 104, 60, $0
	anim_wait 1
	anim_obj ANIM_OBJ_DIG_SAND, 112, 60, $0
	anim_wait 1
	anim_obj ANIM_OBJ_DIG_SAND, 120, 60, $0
	anim_wait 1
	anim_obj ANIM_OBJ_DIG_SAND, 128, 60, $0
	anim_wait 1
	anim_obj ANIM_OBJ_DIG_SAND, 136, 60, $0
	anim_wait 1
	anim_obj ANIM_OBJ_DIG_SAND, 144, 60, $0
	anim_wait 1
	anim_obj ANIM_OBJ_DIG_SAND, 152, 60, $0
	anim_wait 1
	anim_obj ANIM_OBJ_DIG_SAND, 160, 60, $0
	anim_wait 8
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $2
	anim_sound 0, 1, SFX_MEGA_KICK
	anim_obj ANIM_OBJ_HIT_BIG_YFIX, 136, 48, $0
	anim_obj ANIM_OBJ_BUBBLE_SPLASH, 140, 64, $5c
	anim_obj ANIM_OBJ_BUBBLE_SPLASH, 140, 64, $e8
	anim_obj ANIM_OBJ_BUBBLE_SPLASH, 140, 64, $d0
	anim_wait 8
	anim_incbgeffect ANIM_BG_WOBBLE_MON
	anim_wait 16
	anim_jump BattleAnim_ShowMon_0_1
	
BattleAnim_StoneEdge:
	anim_2gfx ANIM_GFX_HIT, ANIM_GFX_ROCKS
	anim_sound 0, 0, SFX_SPARK
	anim_obj ANIM_OBJ_STONE_EDGE_STILL, 156, 64, $8
	anim_wait 1
	anim_obj ANIM_OBJ_STONE_EDGE_STILL, 152, 64, $8
	anim_wait 1
	anim_sound 0, 0, SFX_SPARK
	anim_obj ANIM_OBJ_STONE_EDGE_STILL, 128, 64, $8
	anim_wait 1
	anim_obj ANIM_OBJ_STONE_EDGE_STILL, 108, 64, $8
	anim_wait 1
	anim_sound 0, 0, SFX_SPARK
	anim_obj ANIM_OBJ_STONE_EDGE_STILL, 112, 64, $8
	anim_wait 1
	anim_obj ANIM_OBJ_STONE_EDGE_STILL, 148, 64, $8
	anim_wait 1
	anim_sound 0, 0, SFX_SPARK
	anim_obj ANIM_OBJ_STONE_EDGE_STILL, 118, 64, $8
	anim_wait 1
	anim_obj ANIM_OBJ_STONE_EDGE_STILL, 136, 64, $8
	anim_wait 1
	anim_sound 0, 0, SFX_SPARK
	anim_obj ANIM_OBJ_STONE_EDGE_STILL, 116, 64, $8
	anim_wait 1
	anim_obj ANIM_OBJ_STONE_EDGE_STILL, 144, 64, $8
	anim_wait 32
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_STONE_EDGE, 156, 64, $8
	anim_wait 2
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $55, $1, $0
	anim_obj ANIM_OBJ_STONE_EDGE, 152, 64, $8
	anim_wait 2
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_STONE_EDGE, 128, 64, $8
	anim_obj ANIM_OBJ_HIT_SMALL_YFIX, 120, 40, $0
	anim_wait 2
	anim_obj ANIM_OBJ_STONE_EDGE, 108, 64, $8
	anim_wait 2
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_STONE_EDGE, 112, 64, $8
	anim_wait 2
	anim_obj ANIM_OBJ_STONE_EDGE, 148, 64, $8
	anim_obj ANIM_OBJ_HIT_SMALL_YFIX, 152, 48, $0
	anim_wait 2
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_STONE_EDGE, 118, 64, $8
	anim_wait 2
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $2
	anim_obj ANIM_OBJ_STONE_EDGE, 136, 64, $8
	anim_wait 2
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_STONE_EDGE, 116, 64, $8
	anim_obj ANIM_OBJ_HIT_SMALL_YFIX, 136, 56, $0
	anim_wait 2
	anim_obj ANIM_OBJ_STONE_EDGE, 144, 64, $8
	anim_wait 32
	anim_ret

BattleAnim_NightSlash:
	anim_2gfx ANIM_GFX_CUT, ANIM_GFX_WIND_BG
	anim_bgp $1b
	anim_obp0 $c0
	anim_obj ANIM_OBJ_AGILITY, 8, 24, $10
	anim_obj ANIM_OBJ_AGILITY, 8, 88, $8
	anim_wait 4
	anim_obj ANIM_OBJ_AGILITY, 8, 32, $6
	anim_obj ANIM_OBJ_AGILITY, 8, 80, $4
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $08, $2, $0
	anim_sound 0, 1, SFX_CUT
	anim_obj ANIM_OBJ_CUT_LEFT, 112, 48, $0
	anim_wait 40
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $08, $2, $0
	anim_sound 0, 1, SFX_CUT
	anim_obj ANIM_OBJ_CUT_RIGHT, 152, 52, $0
	anim_wait 32
	anim_ret

BattleAnim_Minimize:
	anim_1gfx ANIM_GFX_MISC_2
.loop
	anim_sound 0, 1, SFX_SLUDGE_BOMB
	anim_bgeffect ANIM_BG_RETURN_MON, $0, $1, $0
	anim_wait 12
	anim_obj ANIM_OBJ_MINIMIZE, 48, 110, $0
	anim_wait 6
	anim_obj ANIM_OBJ_MINIMIZE, 48, 110, $0
	anim_wait 6
	anim_loop 2, .loop
	anim_sound 0, 1, SFX_SLUDGE_BOMB
	anim_bgeffect ANIM_BG_RETURN_MON, $0, $1, $0
	anim_wait 16
.mini
	anim_obj ANIM_OBJ_MINIMIZE, 48, 110, $0
	anim_wait 6
	anim_loop 8, .mini
	anim_sound 0, 1, SFX_LICK
	anim_bgeffect ANIM_BG_ENTER_MON, $0, $1, $0
	anim_wait 12
	anim_ret

BattleAnim_Haze:
	anim_1gfx ANIM_GFX_HAZE
	anim_sound 0, 1, SFX_SURF
.loop
	anim_obj ANIM_OBJ_HAZE, 48, 56, $0
	anim_obj ANIM_OBJ_HAZE, 132, 16, $0
	anim_wait 12
	anim_loop 5, .loop
	anim_wait 96
	anim_ret

BattleAnim_DragonDarts:
	anim_setobjpal PAL_BATTLE_OB_GREEN, PAL_BTLCUSTOM_DREEPY
	anim_2gfx ANIM_GFX_HIT_2, ANIM_GFX_DRAGON_DARTS
	anim_obj ANIM_OBJ_DRAGON_DARTS, 64, 92, $14
	anim_wait 12
	anim_obj ANIM_OBJ_DRAGON_DARTS, 56, 84, $14
	anim_sound 0, 1, SFX_DOUBLE_KICK
	anim_obj ANIM_OBJ_HIT_BIG, 136, 56, $0
	anim_wait 12
	anim_sound 0, 1, SFX_DOUBLE_KICK
	anim_obj ANIM_OBJ_HIT_BIG, 128, 48, $0
	anim_wait 16
	anim_ret
	anim_ret

BattleAnim_Scald:
	anim_3gfx ANIM_GFX_HIT_2, ANIM_GFX_MISC, ANIM_GFX_SMOKE_PUFF
	anim_setobjpal PAL_BATTLE_OB_BLUE, PAL_BTLCUSTOM_WATER
	anim_setobjpal PAL_BATTLE_OB_GRAY, PAL_BTLCUSTOM_WATER
	anim_setobjpal PAL_BATTLE_OB_YELLOW, PAL_BTLCUSTOM_VERY_BRIGHT
	anim_bgp $90
	anim_sound 0, 1, SFX_SURF
	anim_obj ANIM_OBJ_SCALD, 64, 88, $4
	anim_wait 4
	anim_obj ANIM_OBJ_SCALD, 64, 88, $4
	anim_wait 4
	anim_obj ANIM_OBJ_SCALD, 64, 88, $4
	anim_wait 4
.loop
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 52, $0
	anim_obj ANIM_OBJ_SCALD, 64, 88, $4
	anim_obj ANIM_OBJ_SCALD_STEAM, 120, 46, $30
	anim_wait 1
	anim_obj ANIM_OBJ_SCALD_STEAM, 144, 34, $30
	anim_wait 3
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 52, $0
	anim_obj ANIM_OBJ_SCALD, 64, 88, $4
	anim_wait 4
	anim_loop 7, .loop
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 52, $0
	anim_obj ANIM_OBJ_SCALD_STEAM, 120, 46, $30
	anim_wait 1
	anim_obj ANIM_OBJ_SCALD_STEAM, 144, 34, $30
	anim_wait 3
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 52, $0
	anim_wait 4
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 52, $0
	anim_wait 4
	anim_obj ANIM_OBJ_SCALD_STEAM, 120, 46, $30
	anim_wait 1
	anim_obj ANIM_OBJ_SCALD_STEAM, 144, 34, $30
	anim_wait 7
	anim_setobjpal PAL_BATTLE_BG_TARGET, PAL_BTLCUSTOM_FIRE
	anim_bgeffect ANIM_BG_FADE_MON_TO_BLACK_REPEATING, $0, $0, $40
	anim_sound 0, 1, SFX_POISON_STING
.loop2
	anim_obj ANIM_OBJ_SCALD_STEAM, 120, 46, $30
	anim_wait 1
	anim_obj ANIM_OBJ_SCALD_STEAM, 144, 34, $30
	anim_wait 8
	anim_loop 6, .loop2
	anim_wait 8
	anim_incbgeffect ANIM_BG_FADE_MON_TO_BLACK_REPEATING
	anim_ret

BattleAnim_Waterfall:
	anim_setobjpal PAL_BATTLE_OB_GRAY, PAL_BTLCUSTOM_WATER
	anim_setobjpal PAL_BATTLE_OB_BLUE, PAL_BTLCUSTOM_BUBBLE
	anim_2gfx ANIM_GFX_HIT, ANIM_GFX_BUBBLE
	anim_sound 0, 1, SFX_TOXIC
	anim_obj ANIM_OBJ_RISING_BUBBLE, 64, 104, $0
	anim_wait 16
	anim_sound 0, 1, SFX_TOXIC
	anim_obj ANIM_OBJ_RISING_BUBBLE, 32, 104, $0
	anim_wait 16
	anim_sound 0, 1, SFX_TOXIC
	anim_obj ANIM_OBJ_RISING_BUBBLE, 48, 104, $0
	anim_wait 32
	anim_clearobjs
	anim_wait 1
	anim_call BattleAnim_TargetObj_2Row
	anim_bgeffect ANIM_BG_BODY_SLAM, $0, $1, $0
	anim_wait 16
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $0, $0
	anim_wait 4
	anim_clearobjs
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $14, $2, $0
	anim_sound 0, 1, SFX_BUBBLE_BEAM
	anim_wait 8
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 64, $0
	anim_obj ANIM_OBJ_BUBBLE_SPLASH, 140, 64, $d0
	anim_obj ANIM_OBJ_BUBBLE_SPLASH, 140, 64, $50
	anim_wait 3
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 56, $0
	anim_obj ANIM_OBJ_BUBBLE_SPLASH, 140, 56, $d0
	anim_obj ANIM_OBJ_BUBBLE_SPLASH, 140, 56, $50
	anim_wait 3
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 48, $0
	anim_obj ANIM_OBJ_BUBBLE_SPLASH, 140, 48, $d0
	anim_obj ANIM_OBJ_BUBBLE_SPLASH, 140, 48, $50
	anim_wait 3
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 40, $0
	anim_obj ANIM_OBJ_BUBBLE_SPLASH, 140, 40, $d0
	anim_obj ANIM_OBJ_BUBBLE_SPLASH, 140, 40, $50
	anim_wait 3
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 32, $0
	anim_obj ANIM_OBJ_BUBBLE_SPLASH, 140, 32, $d0
	anim_obj ANIM_OBJ_BUBBLE_SPLASH, 140, 32, $50
	anim_wait 8
	anim_ret

BattleAnim_FieryDance:
	anim_2gfx ANIM_GFX_CHARGE, ANIM_GFX_FIRE
	anim_call BattleAnim_TargetObj_1Row_1
	anim_setobjpal PAL_BATTLE_OB_YELLOW, PAL_BTLCUSTOM_FIRE
	anim_setbgpal PAL_BATTLE_BG_USER, PAL_BTLCUSTOM_FIRE
	anim_bgeffect ANIM_BG_CYCLE_OBPALS_GRAY_AND_YELLOW, $0, $4, $0
	anim_sound 0, 1, SFX_SWORDS_DANCE
	anim_bgeffect ANIM_BG_FADE_MON_TO_LIGHT_REPEATING, $0, $1, $40
	anim_bgeffect ANIM_BG_FLAIL, $0, $1, $0
.loop
	anim_obj ANIM_OBJ_TINY_RISING_ORB, 56, 90, $30
	anim_wait 4
	anim_obj ANIM_OBJ_TINY_RISING_ORB, 40, 90, $20
	anim_wait 4
	anim_obj ANIM_OBJ_TINY_RISING_ORB, 60, 106, $10
	anim_wait 4
	anim_obj ANIM_OBJ_TINY_RISING_ORB, 36, 106, $0
	anim_wait 4
	anim_loop 2, .loop
	anim_wait 32
	anim_incbgeffect ANIM_BG_FLAIL
	anim_call BattleAnim_ShowMon_0_1
	anim_incbgeffect ANIM_BG_FADE_MON_TO_LIGHT_REPEATING
	anim_wait 1
	anim_setobjpal PAL_BATTLE_OB_YELLOW, PAL_BTLCUSTOM_FIRE
	anim_setobjpal PAL_BATTLE_OB_RED, PAL_BTLCUSTOM_YELLOW
	anim_setbgpal PAL_BATTLE_BG_PLAYER, PAL_BTLCUSTOM_HEAT_BG
	anim_setbgpal PAL_BATTLE_BG_ENEMY, PAL_BTLCUSTOM_HEAT_BG
	anim_setbgpal PAL_BATTLE_BG_ENEMY_HP, PAL_BTLCUSTOM_HEAT_BG
	anim_setbgpal PAL_BATTLE_BG_PLAYER_HP, PAL_BTLCUSTOM_HEAT_BG
	anim_setbgpal PAL_BATTLE_BG_EXP_GENDER, PAL_BTLCUSTOM_HEAT_BG
	anim_setbgpal PAL_BATTLE_BG_STATUS, PAL_BTLCUSTOM_HEAT_BG
	anim_setbgpal PAL_BATTLE_BG_TYPE_CAT, PAL_BTLCUSTOM_HEAT_BG
	anim_setbgpal PAL_BATTLE_BG_TEXT, PAL_BTLCUSTOM_HEAT_BG
	anim_sound 0, 1, SFX_EMBER
	anim_bgeffect ANIM_BG_ALTERNATE_HUES, $0, $6, $0
	anim_obj ANIM_OBJ_GRUDGE, 132, 36, $0
	anim_wait 16
	anim_obj ANIM_OBJ_FIERY_DANCE_FLAME, 132, 62, $0
	anim_wait 16
	anim_obj ANIM_OBJ_GRUDGE, 132, 54, $0
	anim_wait 16
	anim_obj ANIM_OBJ_FIERY_DANCE_FLAME, 132, 48, $0
	anim_wait 16
	anim_obj ANIM_OBJ_GRUDGE, 132, 64, $0
	anim_wait 16
	anim_obj ANIM_OBJ_FIERY_DANCE_FLAME, 132, 36, $0
	anim_wait 16
	anim_obj ANIM_OBJ_GRUDGE, 132, 38, $0
	anim_wait 16
	anim_obj ANIM_OBJ_FIERY_DANCE_FLAME, 132, 64, $0
	anim_wait 32
	anim_ret

BattleAnim_TargetObj_1Row_1:
	anim_enemyfeetobj
	anim_bgeffect ANIM_BG_BATTLEROBJ_1ROW, $0, $0, $0
	anim_wait 6
	anim_ret

BattleAnim_TargetObj_2Row_1:
	anim_playerheadobj
	anim_bgeffect ANIM_BG_BATTLEROBJ_2ROW, $0, $0, $0
	anim_wait 6
	anim_ret

BattleAnim_ShowMon_0_1:
	anim_wait 1
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $0, $0
	anim_wait 5
	anim_incobj  1
	anim_wait 1
	anim_ret

BattleAnim_FollowEnemyFeet_1_1:
	anim_enemyfeetobj
	anim_bgeffect ANIM_BG_BATTLEROBJ_1ROW, $0, $1, $0
	anim_wait 6
	anim_ret

BattleAnim_FollowPlayerHead_1_1:
	anim_playerheadobj
	anim_bgeffect ANIM_BG_BATTLEROBJ_2ROW, $0, $1, $0
	anim_wait 4
	anim_ret

BattleAnim_ShowMon_1_1:
	anim_wait 1
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_wait 4
	anim_incobj  1
	anim_wait 1
	anim_ret