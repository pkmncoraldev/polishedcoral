
	
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
	anim_2gfx ANIM_GFX_VORTEX, ANIM_GFX_WIND
	anim_call BattleAnimSub_AgilitySmall
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
	anim_3gfx ANIM_GFX_CHARGE, ANIM_GFX_SHINE, ANIM_GFX_LIGHTNING
	anim_bgeffect ANIM_BG_ALTERNATE_HUES, $0, $2, $0
	anim_sound 0, 0, SFX_SWORDS_DANCE
.loop
	anim_obj ANIM_OBJ_FLASH_CANNON, 48, 96, $38
	anim_wait 4
	anim_obj ANIM_OBJ_FLASH_CANNON, 48, 96, $20
	anim_wait 4
	anim_obj ANIM_OBJ_FLASH_CANNON, 48, 96, $8
	anim_wait 4
	anim_obj ANIM_OBJ_FLASH_CANNON, 48, 96, $10
	anim_wait 4
	anim_obj ANIM_OBJ_FLASH_CANNON, 48, 96, $28
	anim_wait 4
	anim_obj ANIM_OBJ_FLASH_CANNON, 48, 96, $0
	anim_wait 4
	anim_obj ANIM_OBJ_FLASH_CANNON, 48, 96, $18
	anim_wait 4
	anim_obj ANIM_OBJ_FLASH_CANNON, 48, 96, $30
	anim_wait 4
	anim_loop 2, .loop
	anim_wait 16
	anim_obp0 $30
	anim_bgeffect ANIM_BG_CYCLE_BGPALS_INVERTED, $0, $4, $0
	anim_sound 0, 0, SFX_CUT
	anim_obj ANIM_OBJ_ZAP_CANNON, 64, 92, $2
	anim_wait 32
	anim_obj ANIM_OBJ_GLIMMER, 132, 28, $0
	anim_wait 5
	anim_sound 0, 0, SFX_METRONOME
	anim_obj ANIM_OBJ_GLIMMER, 112, 60, $0
	anim_wait 5
	anim_obj ANIM_OBJ_GLIMMER, 144, 68, $0
	anim_wait 16
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
	anim_obj ANIM_OBJ_GREEN_HIT, 128, 40, $0
	anim_wait 4
	anim_sound 0, 1, SFX_TOXIC
	anim_obj ANIM_OBJ_GREEN_HIT, 144, 48, $0
	anim_wait 4
	anim_sound 0, 1, SFX_TOXIC
	anim_obj ANIM_OBJ_GREEN_HIT, 136, 56, $0
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
	anim_call BattleAnim_TargetObj_1Row
	anim_2gfx ANIM_GFX_HIT, ANIM_GFX_SAND
	anim_bgeffect ANIM_BG_WOBBLE_MON, $0, $1, $0
	anim_wait 16
	anim_sound 0, 1, SFX_BUBBLE_BEAM
	anim_obj ANIM_OBJ_AQUA_TAIL, 104, 60, $0
	anim_wait 1
	anim_obj ANIM_OBJ_AQUA_TAIL, 112, 60, $0
	anim_wait 1
	anim_obj ANIM_OBJ_AQUA_TAIL, 120, 60, $0
	anim_wait 1
	anim_obj ANIM_OBJ_AQUA_TAIL, 128, 60, $0
	anim_wait 1
	anim_obj ANIM_OBJ_AQUA_TAIL, 136, 60, $0
	anim_wait 1
	anim_obj ANIM_OBJ_AQUA_TAIL, 144, 60, $0
	anim_wait 1
	anim_obj ANIM_OBJ_AQUA_TAIL, 152, 60, $0
	anim_wait 1
	anim_obj ANIM_OBJ_AQUA_TAIL, 160, 60, $0
	anim_wait 8
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $2
	anim_sound 0, 1, SFX_MEGA_KICK
	anim_obj ANIM_OBJ_HIT_BIG_YFIX, 136, 48, $0
	anim_wait 16
	anim_incbgeffect ANIM_BG_WOBBLE_MON
	anim_jump BattleAnim_ShowMon_0
	
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