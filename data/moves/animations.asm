BattleAnim_MirrorMove:
BattleAnim_0:
BattleAnim_GyroBall:
BattleAnim_ElectroBall:
	anim_ret

BattleAnim_HeldItemTrigger:
	anim_1gfx ANIM_GFX_BUBBLE
	anim_sound 0, 0, SFX_FULL_HEAL
	anim_bgeffect ANIM_BG_FADE_MON_TO_LIGHT_REPEATING, $0, $1, $40
	anim_call BattleAnim_Recover_branch
	anim_incbgeffect ANIM_BG_FADE_MON_TO_LIGHT_REPEATING
	anim_ret

BattleAnim_Block:
	anim_1gfx ANIM_GFX_OBJECTS
	anim_sound 0, 1, SFX_MEGA_PUNCH
	anim_obj ANIM_OBJ_BLOCK, 132, 48, $20
	anim_wait 48
	anim_sound 0, 1, SFX_WRONG
	anim_wait 20
	anim_ret

BattleAnim_ClearSmog:
	anim_3gfx ANIM_GFX_SMOKE_PUFF, ANIM_GFX_HAZE, ANIM_GFX_SPEED
	anim_setobjpal PAL_BATTLE_OB_YELLOW, PAL_BTLCUSTOM_GRAY
	anim_obp0 $54
	anim_sound 0, 1, SFX_MEGA_PUNCH
.loop
	anim_obj ANIM_OBJ_CLEAR_SMOG, 64, 92, $0
	anim_wait 2
	anim_loop 3, .loop
	anim_wait 24
	anim_bgeffect ANIM_BG_CYCLE_OBPALS_GRAY_AND_YELLOW, $0, $4, $0
	anim_sound 0, 1, SFX_SWORDS_DANCE
.loop2
	anim_obj ANIM_OBJ_CLEAR_SMOG_RISE, 132, 60, $20
	anim_wait 8
	anim_loop 5, .loop2
	anim_obj ANIM_OBJ_PULSING_SPARKLE_YFIX, 148, 32, $0
	anim_wait 8
	anim_obj ANIM_OBJ_PULSING_SPARKLE_YFIX, 116, 64, $0
	anim_wait 8
	anim_obj ANIM_OBJ_PULSING_SPARKLE_YFIX, 148, 64, $0
	anim_wait 8
	anim_obj ANIM_OBJ_PULSING_SPARKLE_YFIX, 116, 32, $0
	anim_wait 8
	anim_obj ANIM_OBJ_PULSING_SPARKLE_YFIX, 132, 48, $0
	anim_wait 24
	anim_ret

BattleAnim_CosmicPower:
	anim_setobjpal PAL_BATTLE_OB_GREEN, PAL_BTLCUSTOM_COSMIC
	anim_2gfx ANIM_GFX_STARS, ANIM_GFX_COSMIC_POWER
	anim_clearenemyhud
	anim_bgp $1b
	anim_bgeffect ANIM_BG_HIDE_MON, $0, $0, $0
	anim_bgeffect ANIM_BG_CYCLE_OBPALS_GRAY_AND_YELLOW, $0, $2, $0
	anim_bgeffect ANIM_BG_CYCLE_BGPALS_INVERTED, $0, $4, $0
	anim_sound 0, 0, SFX_GAME_FREAK_LOGO_GS
	anim_obj ANIM_OBJ_COSMIC_POWER_BG, 61, 79, $30
	anim_wait 64
	anim_sound 0, 0, SFX_METRONOME
.loop
	anim_obj ANIM_OBJ_COSMIC_POWER, 56, 88, $32
	anim_wait 4
	anim_obj ANIM_OBJ_COSMIC_POWER, 40, 88, $2c
	anim_wait 4
	anim_obj ANIM_OBJ_COSMIC_POWER, 60, 104, $34
	anim_wait 4
	anim_obj ANIM_OBJ_COSMIC_POWER, 36, 104, $2e
	anim_wait 4
	anim_loop 3, .loop
	anim_wait 32
	anim_clearobjs
	anim_wait 1
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $0, $0
	anim_ret

BattleAnim_RockWrecker:
	anim_3gfx ANIM_GFX_ROCKS, ANIM_GFX_HUGE_ROCK, ANIM_GFX_WIND_BG
	anim_setobjpal PAL_BATTLE_OB_BLUE, PAL_BTLCUSTOM_YELLOW
	anim_call BattleAnimSub_AgilityMinor
	anim_obj ANIM_OBJ_ROCK_WRECKER_GROW, 48, 96, $0
.loop
	anim_sound 0, 0, SFX_OUTRAGE
	anim_obj ANIM_OBJ_ROCK_WRECKER_CHARGE, 48, 96, $38
	anim_wait 4
	anim_sound 0, 0, SFX_OUTRAGE
	anim_obj ANIM_OBJ_ROCK_WRECKER_CHARGE, 48, 96, $20
	anim_wait 4
	anim_sound 0, 0, SFX_OUTRAGE
	anim_obj ANIM_OBJ_ROCK_WRECKER_CHARGE, 48, 96, $8
	anim_wait 4
	anim_sound 0, 0, SFX_OUTRAGE
	anim_obj ANIM_OBJ_ROCK_WRECKER_CHARGE, 48, 96, $10
	anim_wait 4
	anim_sound 0, 0, SFX_OUTRAGE
	anim_obj ANIM_OBJ_ROCK_WRECKER_CHARGE, 48, 96, $28
	anim_wait 4
	anim_sound 0, 0, SFX_OUTRAGE
	anim_obj ANIM_OBJ_ROCK_WRECKER_CHARGE, 48, 96, $0
	anim_wait 4
	anim_sound 0, 0, SFX_OUTRAGE
	anim_obj ANIM_OBJ_ROCK_WRECKER_CHARGE, 48, 96, $18
	anim_wait 4
	anim_sound 0, 0, SFX_OUTRAGE
	anim_obj ANIM_OBJ_ROCK_WRECKER_CHARGE, 48, 96, $30
	anim_wait 4
	anim_loop 4, .loop
	anim_sound 0, 0, SFX_OUTRAGE
	anim_obj ANIM_OBJ_ROCK_WRECKER, 48, 90, $1
	anim_wait 80
	anim_sound 0, 0, SFX_OUTRAGE
	anim_incobj 39
	anim_sound 0, 1, SFX_RAZOR_WIND
	anim_wait 10
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $3
	anim_clearobjs
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $60, $4, $10
	anim_sound 0, 1, SFX_EGG_BOMB
	anim_obj ANIM_OBJ_ROCK_SMASH, 128, 64, $28
	anim_obj ANIM_OBJ_ROCK_SMASH, 128, 64, $5c
	anim_obj ANIM_OBJ_ROCK_SMASH, 128, 64, $10
	anim_obj ANIM_OBJ_ROCK_SMASH, 128, 64, $e8
	anim_obj ANIM_OBJ_ROCK_SMASH, 128, 64, $9c
	anim_obj ANIM_OBJ_ROCK_SMASH, 128, 64, $d0
	anim_wait 6
	anim_obj ANIM_OBJ_ROCK_SMASH, 128, 64, $1c
	anim_obj ANIM_OBJ_ROCK_SMASH, 128, 64, $50
	anim_obj ANIM_OBJ_ROCK_SMASH, 128, 64, $dc
	anim_obj ANIM_OBJ_ROCK_SMASH, 128, 64, $90
	anim_wait 32
	anim_ret

BattleAnim_OminousWind:
	anim_setobjpal PAL_BATTLE_OB_YELLOW, PAL_BTLCUSTOM_PURPLE
	anim_1gfx ANIM_GFX_HAZE
	anim_bgp $1b
	anim_bgeffect ANIM_BG_WHIRLPOOL, $0, $0, $0
	anim_sound 0, 0, SFX_SPITE
	anim_obj ANIM_OBJ_OMINOUS_WIND, 8, 24, $10
	anim_obj ANIM_OBJ_OMINOUS_WIND, 8, 48, $2
	anim_obj ANIM_OBJ_OMINOUS_WIND, 8, 88, $8
	anim_wait 4
	anim_obj ANIM_OBJ_OMINOUS_WIND, 8, 32, $6
	anim_obj ANIM_OBJ_OMINOUS_WIND, 8, 56, $c
	anim_obj ANIM_OBJ_OMINOUS_WIND, 8, 80, $4
	anim_obj ANIM_OBJ_OMINOUS_WIND, 8, 104, $e
	anim_wait 120
	anim_incbgeffect ANIM_BG_WHIRLPOOL
	anim_ret

BattleAnim_Wish:
	anim_setobjpal PAL_BATTLE_OB_GREEN, PAL_BTLCUSTOM_COSMIC
	anim_2gfx ANIM_GFX_STARS, ANIM_GFX_COSMIC_POWER
	anim_clearenemyhud
	anim_bgp $1b
	anim_obj ANIM_OBJ_COSMIC_POWER_BG, 61, 79, $30
	anim_bgeffect ANIM_BG_CYCLE_OBPALS_GRAY_AND_YELLOW, $0, $2, $0
	anim_bgeffect ANIM_BG_HIDE_MON, $0, $0, $0
	anim_wait 16
	anim_sound 0, 1, SFX_GAME_FREAK_LOGO_GS
	anim_obj ANIM_OBJ_WISH_1, 30, 46, $42
	anim_wait 16
	anim_obj ANIM_OBJ_WISH_2, 50, 50, $0
	anim_wait 16
	anim_obj ANIM_OBJ_WISH_2, 70, 52, $0
	anim_wait 16
	anim_obj ANIM_OBJ_WISH_2, 90, 56, $0
	anim_wait 16
	anim_obj ANIM_OBJ_WISH_2, 110, 60, $0
	anim_wait 16
	anim_obj ANIM_OBJ_WISH_2, 130, 64, $0
	anim_wait 80
	anim_setobj 3, 3
	anim_setobj 4, 3
	anim_setobj 5, 3
	anim_setobj 6, 3
	anim_setobj 7, 3
	anim_incbgeffect ANIM_BG_CYCLE_OBPALS_GRAY_AND_YELLOW
	anim_bgeffect ANIM_BG_CYCLE_BGPALS_INVERTED, $0, $0, $0
	anim_sound 0, 0, SFX_MOONLIGHT
	anim_wait 42
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $0, $0
	anim_ret

BattleAnim_CalmMind:
	anim_3gfx ANIM_GFX_BIG_RINGS, ANIM_GFX_RINGS, ANIM_GFX_GLOW
	anim_setobjpal PAL_BATTLE_OB_YELLOW, PAL_BTLCUSTOM_GLOW_LUSTER
	anim_bgp $1b
	anim_bgeffect ANIM_BG_CYCLE_OBPALS_GRAY_AND_YELLOW, $0, $2, $0
	anim_sound 0, 0, SFX_ATTRACT
	anim_obj ANIM_OBJ_SMALL_GLOW, 48, 96, $0
	anim_wait 32
	anim_clearobjs
	anim_sound 0, 1, SFX_GAME_FREAK_LOGO_GS
.loop
	anim_obj ANIM_OBJ_SHRINKING_RING_BIG, 48, 96, $0
	anim_wait 4
	anim_obj ANIM_OBJ_SHRINKING_RING_SMALL, 48, 96, $0
	anim_wait 16
	anim_loop 4, .loop
	anim_wait 16
	anim_ret
	
BattleAnim_AquaJet:
	anim_setobjpal PAL_BATTLE_OB_BLUE, PAL_BTLCUSTOM_BUBBLE
	anim_4gfx ANIM_GFX_HIT_2, ANIM_GFX_AQUA_JET, ANIM_GFX_BUBBLE, ANIM_GFX_SPEED
	anim_sound 0, 0, SFX_MENU
	anim_bgeffect ANIM_BG_HIDE_MON, $0, $1, $0
	anim_call BattleAnimSub_QuickAttack
	anim_wait 6
	anim_setobjpal PAL_BATTLE_OB_GRAY, PAL_BTLCUSTOM_BUBBLE
	anim_sound 0, 1, SFX_BUBBLE_BEAM
	anim_wait 1
	anim_obj ANIM_OBJ_AQUA_JET, 72, 89, $0
	anim_obj ANIM_OBJ_AQUA_JET_BUBBLE, 72, 89, $d0
	anim_obj ANIM_OBJ_AQUA_JET_BUBBLE, 72, 89, $50
	anim_wait 6
	anim_obj ANIM_OBJ_AQUA_JET, 92, 78, $0
	anim_obj ANIM_OBJ_AQUA_JET_BUBBLE, 92, 78, $d0
	anim_obj ANIM_OBJ_AQUA_JET_BUBBLE, 92, 78, $50
	anim_wait 6
	anim_obj ANIM_OBJ_AQUA_JET, 112, 67, $0
	anim_obj ANIM_OBJ_AQUA_JET_BUBBLE, 112, 67, $d0
	anim_obj ANIM_OBJ_AQUA_JET_BUBBLE, 112, 67, $50
	anim_wait 6
	anim_obj ANIM_OBJ_AQUA_JET, 132, 56, $0
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 56, $0
	anim_obj ANIM_OBJ_BUBBLE_SPLASH, 140, 56, $d0
	anim_obj ANIM_OBJ_BUBBLE_SPLASH, 140, 56, $50
	anim_wait 3
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 48, $0
	anim_wait 3
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 40, $0
	anim_obj ANIM_OBJ_BUBBLE_SPLASH, 140, 40, $d0
	anim_obj ANIM_OBJ_BUBBLE_SPLASH, 140, 40, $50
	anim_wait 3
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 32, $0
	anim_wait 3
	anim_sound 0, 1, SFX_WATER_GUN
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 24, $0
	anim_obj ANIM_OBJ_BUBBLE_SPLASH, 140, 24, $d0
	anim_obj ANIM_OBJ_BUBBLE_SPLASH, 140, 24, $50
	anim_wait 8
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_wait 16
	anim_ret

BattleAnim_ShadowClaw:
	anim_2gfx ANIM_GFX_CUT, ANIM_GFX_SPEED
	anim_obp0 $ef
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $14, $2, $0
	anim_bgeffect ANIM_BG_BLACK_HUES, $0, $8, $0
	anim_sound 0, 1, SFX_CUT
	anim_call BattleAnimSub_Scratch
	anim_wait 4
	anim_obj ANIM_OBJ_RED_STAR, 136, 56, $5c
	anim_obj ANIM_OBJ_RED_STAR, 136, 56, $e8
	anim_obj ANIM_OBJ_RED_STAR, 136, 56, $d0
	anim_obj ANIM_OBJ_RED_STAR, 136, 56, $50
	anim_wait 32
	anim_ret

BattleAnim_Shockwave:
	anim_2gfx ANIM_GFX_LIGHTNING, ANIM_GFX_CHARGE
	anim_bgeffect ANIM_BG_CYCLE_OBPALS_GRAY_AND_YELLOW, $0, $2, $0
	anim_sound 0, 0, SFX_WARP_TO
	anim_obj ANIM_OBJ_ENERGY_ORB, 48, 88, $38
	anim_wait 4
	anim_obj ANIM_OBJ_ENERGY_ORB, 48, 88, $20
	anim_wait 4
	anim_obj ANIM_OBJ_ENERGY_ORB, 48, 88, $8
	anim_wait 4
	anim_obj ANIM_OBJ_ENERGY_ORB, 48, 88, $10
	anim_wait 4
	anim_obj ANIM_OBJ_ENERGY_ORB, 48, 88, $28
	anim_wait 4
	anim_obj ANIM_OBJ_ENERGY_ORB, 48, 88, $0
	anim_wait 4
	anim_obj ANIM_OBJ_ENERGY_ORB, 48, 88, $18
	anim_wait 4
	anim_obj ANIM_OBJ_ENERGY_ORB, 48, 88, $30
	anim_wait 4
.loop
	anim_sound 0, 0, SFX_ZAP_CANNON
	anim_obj ANIM_OBJ_SHOCK_WAVE_UP, 48, 88, $30
	anim_wait 2
	anim_loop 5, .loop
	anim_wait 2
.loop2
	anim_sound 0, 0, SFX_ZAP_CANNON
	anim_obj ANIM_OBJ_SHOCK_WAVE_DOWN, 64, 0, $10
	anim_wait 2
	anim_loop 5, .loop2
	anim_wait 2
.loop3
	anim_sound 0, 0, SFX_ZAP_CANNON
	anim_obj ANIM_OBJ_SHOCK_WAVE_UP, 80, 72, $30
	anim_wait 2
	anim_loop 5, .loop3
	anim_wait 2
.loop4
	anim_sound 0, 0, SFX_ZAP_CANNON
	anim_obj ANIM_OBJ_SHOCK_WAVE_DOWN, 96, 0, $10
	anim_wait 2
	anim_loop 5, .loop4
	anim_wait 2
.loop5
	anim_sound 0, 0, SFX_ZAP_CANNON
	anim_obj ANIM_OBJ_SHOCK_WAVE_UP, 112, 72, $30
	anim_wait 2
	anim_loop 5, .loop5
	anim_wait 8
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $2
	anim_sound 0, 1, SFX_THUNDER
	anim_obj ANIM_OBJ_SHOCK_WAVE_STRIKE, 136, 0, $0
	anim_wait 6
	anim_obj ANIM_OBJ_THUNDER_CENTER, 136, 68, $0
	anim_wait 48
	anim_ret

BattleAnim_ToxicSpikes:
	anim_2gfx ANIM_GFX_MISC, ANIM_GFX_POISON
	anim_sound 6, 2, SFX_MENU
	anim_obj ANIM_OBJ_SPIKES, 48, 88, $20
	anim_wait 8
	anim_sound 6, 2, SFX_MENU
	anim_obj ANIM_OBJ_SPIKES, 48, 88, $30
	anim_wait 8
	anim_sound 6, 2, SFX_MENU
	anim_obj ANIM_OBJ_SPIKES, 48, 88, $28
	anim_wait 40
	anim_setobjpal PAL_BATTLE_OB_GRAY, PAL_BTLCUSTOM_PURPLE
	anim_jump BattleAnim_PoisonFang.loop

BattleAnim_GunkShot:
	anim_setobjpal PAL_BATTLE_OB_BLUE, PAL_BTLCUSTOM_PURPLE
	anim_setobjpal PAL_BATTLE_OB_GRAY, PAL_BTLCUSTOM_PURPLE
	anim_setobjpal PAL_BATTLE_OB_BROWN, PAL_BTLCUSTOM_PURPLE
	anim_2gfx ANIM_GFX_WIND_BG, ANIM_GFX_POISON
	anim_bgeffect ANIM_BG_BLACK_HUES, $0, $8, $0
	anim_obj ANIM_OBJ_GUNK_SHOT, 48, 96, $0
	anim_call BattleAnimSub_AgilityMinor
.loop
	anim_sound 0, 1, SFX_TOXIC
	anim_obj ANIM_OBJ_GUNK_SHOT_BUBBLES, 48, 88, $5c
	anim_wait 2
	anim_obj ANIM_OBJ_GUNK_SHOT_BUBBLES, 48, 88, $e8
	anim_wait 2
	anim_obj ANIM_OBJ_GUNK_SHOT_BUBBLES, 48, 88, $d0
	anim_wait 2
	anim_obj ANIM_OBJ_GUNK_SHOT_BUBBLES, 48, 88, $50
	anim_wait 2
	anim_loop 6, .loop
	anim_wait 16
	anim_clearobjs
	anim_bgp $1b
	anim_setobjpal PAL_BATTLE_OB_GRAY, PAL_BTLCUSTOM_PSYCHO_BOOST_2
	anim_setobjpal PAL_BATTLE_OB_BROWN, PAL_BTLCUSTOM_PSYCHO_BOOST_2
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $60, $4, $10
.loop2
	anim_sound 6, 2, SFX_BUBBLE_BEAM
	anim_obj ANIM_OBJ_MUD_SHOT, 64, 92, $4
	anim_wait 4
	anim_obj ANIM_OBJ_MUD_SHOT, 64, 92, $4
	anim_wait 4
	anim_sound 6, 2, SFX_BUBBLE_BEAM
	anim_obj ANIM_OBJ_MUD_SPLASH, 136, 56, $5c
	anim_obj ANIM_OBJ_MUD_SPLASH, 136, 56, $e8
	anim_obj ANIM_OBJ_MUD_SPLASH, 136, 56, $d0
	anim_obj ANIM_OBJ_MUD_SPLASH, 136, 56, $50
	anim_obj ANIM_OBJ_MUD_SHOT, 64, 92, $4
	anim_wait 4
	anim_obj ANIM_OBJ_MUD_SHOT, 64, 92, $4
	anim_wait 4
	anim_loop 4, .loop2
	anim_wait 4
	anim_obj ANIM_OBJ_MUD_SPLASH, 136, 56, $5c
	anim_obj ANIM_OBJ_MUD_SPLASH, 136, 56, $e8
	anim_obj ANIM_OBJ_MUD_SPLASH, 136, 56, $d0
	anim_obj ANIM_OBJ_MUD_SPLASH, 136, 56, $50
	anim_wait 32
	anim_ret

BattleAnim_Venoshock:
	anim_setobjpal PAL_BATTLE_OB_GRAY, PAL_BTLCUSTOM_PSYCHO_BOOST_2
	anim_1gfx ANIM_GFX_POISON
	anim_call BattleAnim_FollowEnemyFeet_1
	anim_bgeffect ANIM_BG_BLACK_HUES, $0, $8, $0
	anim_sound 6, 2, SFX_SLUDGE_BOMB
	anim_obj ANIM_OBJ_ACID, 64, 92, $10
	anim_wait 36
	anim_sound 0, 1, SFX_CUT
	anim_wait 8
	anim_bgp $1b
.loop
	anim_bgeffect ANIM_BG_VIBRATE_MON, $0, $0, $0
	anim_sound 0, 1, SFX_TOXIC
	anim_obj ANIM_OBJ_SLUDGE, 132, 72, $0
	anim_wait 8
	anim_sound 0, 1, SFX_TOXIC
	anim_obj ANIM_OBJ_SLUDGE, 116, 72, $0
	anim_wait 8
	anim_sound 0, 1, SFX_TOXIC
	anim_obj ANIM_OBJ_SLUDGE, 148, 72, $0
	anim_wait 8
	anim_loop 4, .loop
	anim_wait 24
	anim_call BattleAnim_ShowMon_1
	anim_ret


BattleAnim_GigaImpact:
	anim_2gfx ANIM_GFX_HIT, ANIM_GFX_CHARGE
	anim_bgeffect ANIM_BG_WHITE_HUES, $0, $8, $0
	anim_sound 0, 0, SFX_OUTRAGE
.loop
	anim_obj ANIM_OBJ_GROWTH, 48, 108, $0
	anim_obj ANIM_OBJ_GROWTH, 48, 108, $20
	anim_wait 4
	anim_loop 4, .loop
	anim_wait 48
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $40
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_TACKLE, $0, $1, $0
	anim_sound 0, 0, SFX_SPARK
	anim_wait 8
	anim_call BattleAnim_ShowMon_0
	anim_sound 0, 1, SFX_THUNDER
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $60, $4, $10
.loop2
	anim_obj ANIM_OBJ_HIT_BIG_YFIX, 136, 48, $0
	anim_wait 20
	anim_loop 3, .loop2
	anim_wait 16
	anim_ret

BattleAnim_Bulldoze:
	anim_1gfx ANIM_GFX_HIT
	anim_call BattleAnim_TargetObj_2Row
	anim_bgeffect ANIM_BG_SHAKE_MON_Y, $0, $11, $4
.loop
	anim_sound 0, 1, SFX_SPARK
	anim_wait 8
	anim_loop 6, .loop
	anim_incbgeffect ANIM_BG_SHAKE_MON_Y
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $0, $0
	anim_clearobjs
	anim_wait 1
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_Y, $40, $3, $0
.loop2
	anim_sound 0, 1, SFX_SPARK
	anim_wait 4
	anim_loop 12, .loop2
	anim_incbgeffect ANIM_BG_SHAKE_SCREEN_Y
	anim_wait 16
	anim_ret
	
BattleAnim_WoodHammer:
	anim_3gfx ANIM_GFX_WOOD, ANIM_GFX_PLANT, ANIM_GFX_HIT
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $2
	anim_sound 0, 1, SFX_EGG_BOMB
	anim_obj ANIM_OBJ_HIT_BIG_YFIX, 136, 48, $0
	anim_wait 1
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $40, $4, $10
	anim_obj ANIM_OBJ_RAZOR_LEAF, 136, 40, $1c
	anim_obj ANIM_OBJ_WOOD_HAMMER, 136, 56, $5c
	anim_wait 1
	anim_obj ANIM_OBJ_RAZOR_LEAF, 136, 40, $50
	anim_obj ANIM_OBJ_WOOD_HAMMER, 136, 56, $e8
	anim_wait 1
	anim_obj ANIM_OBJ_RAZOR_LEAF, 136, 40, $dc
	anim_obj ANIM_OBJ_WOOD_HAMMER, 136, 56, $d0
	anim_wait 1
	anim_obj ANIM_OBJ_RAZOR_LEAF, 136, 40, $90
	anim_obj ANIM_OBJ_WOOD_HAMMER, 136, 56, $50
	anim_wait 4
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $2
	anim_wait 60
	anim_ret

BattleAnim_DragonHammer:
	anim_2gfx ANIM_GFX_HIT, ANIM_GFX_SMOKE_PUFF
	anim_call BattleAnim_TargetObj_2Row
	anim_bgeffect ANIM_BG_TACKLE, $0, $1, $0
	anim_wait 4
	anim_sound 0, 1, SFX_TACKLE
	anim_wait 8
	anim_call BattleAnim_ShowMon_0
	anim_clearobjs
	anim_setobjpal PAL_BATTLE_OB_GRAY, PAL_BTLCUSTOM_DRAGONBREATH
	anim_setobjpal PAL_BATTLE_OB_YELLOW, PAL_BTLCUSTOM_BRIGHT
	anim_sound 0, 0, SFX_RAZOR_WIND
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 08, $0
	anim_wait 1
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 16, $0
	anim_wait 1
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 24, $0
	anim_wait 1
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 32, $0
	anim_wait 1
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 40, $0
	anim_wait 1
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 48, $0
	anim_wait 1
	anim_sound 0, 1, SFX_EGG_BOMB
	anim_obj ANIM_OBJ_HIT_BIG_YFIX, 136, 60, $0
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $2
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_Y, $60, $2, $20
	anim_obj ANIM_OBJ_IMPACT_SMOKE, 116, 62, $28
	anim_obj ANIM_OBJ_IMPACT_SMOKE, 156, 62, $38
	anim_wait 1
	anim_obj ANIM_OBJ_IMPACT_SMOKE, 116, 62, $28
	anim_obj ANIM_OBJ_IMPACT_SMOKE, 156, 62, $38
	anim_wait 1
	anim_obj ANIM_OBJ_IMPACT_SMOKE, 116, 62, $28
	anim_obj ANIM_OBJ_IMPACT_SMOKE, 156, 62, $38
	anim_wait 44
	anim_ret
	
BattleAnim_Taunt:
	anim_2gfx ANIM_GFX_MISC, ANIM_GFX_TAUNT
	anim_obj ANIM_OBJ_TAUNT, 72, 84, $0
	anim_wait 16
.loop
	anim_sound 0, 0, SFX_SQUEAK
	anim_wait 32
	anim_loop 3, .loop
	anim_clearobjs
	anim_sound 0, 1, SFX_KINESIS_2
	anim_obj ANIM_OBJ_ANGER, 112, 50, $0
	anim_wait 16
	anim_sound 0, 1, SFX_KINESIS_2
	anim_obj ANIM_OBJ_ANGER, 148, 32, $0
	anim_wait 32
	anim_ret

BattleAnim_BrickBreak:
	anim_2gfx ANIM_GFX_HIT_2, ANIM_GFX_CHOP
	anim_sound 6, 2, SFX_SHINE
	anim_obj ANIM_OBJ_VERTICAL_CHOP_STILL, 136, 24, $30
	anim_wait 16
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $55, $2, $0
	anim_wait 64
	anim_clearobjs
	anim_obj ANIM_OBJ_VERTICAL_CHOP, 136, 82, $30
	anim_wait 8
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $3
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 56, $0
	anim_wait 34
	anim_ret

BattleAnim_HornLeech:
	anim_setobjpal PAL_BATTLE_OB_YELLOW, PAL_BTLCUSTOM_LIME
	anim_call BattleAnimSub_BGCycleOBPalsGrayAndYellow_6
	anim_3gfx ANIM_GFX_HORN_LEECH, ANIM_GFX_HIT, ANIM_GFX_CHARGE
	anim_obj ANIM_OBJ_HORN_LEECH, 72, 80, $4
	anim_wait 16
	anim_sound 0, 1, SFX_HORN_ATTACK
	anim_obj ANIM_OBJ_HIT_BIG_YFIX, 136, 48, $0
	anim_wait 16
	anim_setvar $0
.loop
	anim_sound 6, 3, SFX_WATER_GUN
	anim_obj ANIM_OBJ_ABSORB, 128, 48, $2
	anim_wait 3
	anim_sound 6, 3, SFX_WATER_GUN
	anim_obj ANIM_OBJ_ABSORB, 136, 64, $3
	anim_wait 4
	anim_sound 6, 3, SFX_WATER_GUN
	anim_obj ANIM_OBJ_ABSORB, 136, 32, $4
	anim_wait 3
	anim_loop 6, .loop
	anim_wait 32
	anim_ret

BattleAnim_PowerGem:
	anim_1gfx ANIM_GFX_SHINE
	anim_bgp $1b
	anim_bgeffect ANIM_BG_CYCLE_OBPALS_GRAY_AND_YELLOW, $0, $2, $0
	anim_sound 0, 0, SFX_METRONOME
	anim_obj ANIM_OBJ_POWER_GEM, 46, 88, $0
	anim_wait 1
	anim_obj ANIM_OBJ_POWER_GEM, 24, 90, $0
	anim_wait 1
	anim_obj ANIM_OBJ_POWER_GEM, 36, 72, $0
	anim_wait 1
	anim_obj ANIM_OBJ_POWER_GEM, 44, 112, $0
	anim_wait 1
	anim_obj ANIM_OBJ_POWER_GEM, 30, 106, $0
	anim_wait 1
	anim_obj ANIM_OBJ_POWER_GEM, 64, 104, $0
	anim_wait 1
	anim_obj ANIM_OBJ_POWER_GEM, 54, 68, $0
	anim_wait 1
	anim_obj ANIM_OBJ_POWER_GEM, 72, 82, $0
	anim_wait 80
	anim_sound 0, 1, SFX_SHINE
	anim_incobj  8
	anim_wait 2
	anim_incobj  7
	anim_wait 2
	anim_sound 0, 1, SFX_SHINE
	anim_incobj  6
	anim_wait 4
	anim_sound 0, 1, SFX_SHINE
	anim_incobj  4
	anim_wait 2
	anim_incobj  1
	anim_wait 2
	anim_sound 0, 1, SFX_SHINE
	anim_incobj  3
	anim_wait 2
	anim_incobj  5
	anim_wait 2
	anim_sound 0, 1, SFX_SHINE
	anim_incobj  2
	anim_wait 2
	anim_wait 32
	anim_ret

BattleAnim_EarthPower:
	anim_setobjpal PAL_BATTLE_OB_RED, PAL_BTLCUSTOM_FIRE
	anim_2gfx ANIM_GFX_FIRE, ANIM_GFX_ROCKS
	anim_sound 0, 0, SFX_EGG_BOMB
	anim_bgp $1b
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $28, $2, $0
	anim_obj ANIM_OBJ_ROCK_SMASH, 120, 68, $5c
	anim_obj ANIM_OBJ_ROCK_SMASH, 120, 68, $e8
	anim_obj ANIM_OBJ_ROCK_SMASH, 120, 68, $9c
	anim_obj ANIM_OBJ_ROCK_SMASH, 120, 68, $50
	anim_obj ANIM_OBJ_EMBER, 120, 68, $30
	anim_wait 40
	anim_clearobjs
	anim_wait 8
	anim_sound 0, 0, SFX_EGG_BOMB
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $28, $2, $0
	anim_obj ANIM_OBJ_ROCK_SMASH, 144, 68, $5c
	anim_obj ANIM_OBJ_ROCK_SMASH, 144, 68, $e8
	anim_obj ANIM_OBJ_ROCK_SMASH, 144, 68, $d0
	anim_obj ANIM_OBJ_ROCK_SMASH, 144, 68, $10
	anim_obj ANIM_OBJ_EMBER, 144, 68, $30
	anim_wait 40
	anim_clearobjs
	anim_wait 8
	anim_sound 0, 0, SFX_EGG_BOMB
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $28, $2, $0
	anim_obj ANIM_OBJ_ROCK_SMASH, 132, 68, $28
	anim_obj ANIM_OBJ_ROCK_SMASH, 132, 68, $e8
	anim_obj ANIM_OBJ_ROCK_SMASH, 132, 68, $d0
	anim_obj ANIM_OBJ_ROCK_SMASH, 132, 68, $50
	anim_obj ANIM_OBJ_EMBER, 132, 68, $30
	anim_wait 48
	anim_ret
	
BattleAnim_DragonDance:
	anim_setobjpal PAL_BATTLE_OB_GRAY, PAL_BTLCUSTOM_DRAGONBREATH
	anim_1gfx ANIM_GFX_CHARGE
	anim_bgeffect ANIM_BG_FADE_MON_TO_LIGHT_REPEATING, $0, $1, $40
.loop
	anim_sound 0, 0, SFX_OUTRAGE
	anim_obj ANIM_OBJ_DRAGON_DANCE, 48, 104, $0
	anim_wait 8
	anim_loop 8, .loop
	anim_wait 40
	anim_incbgeffect ANIM_BG_FADE_MON_TO_LIGHT_REPEATING
	anim_wait 1
	anim_jump BattleAnimSub_FocusEnergy
	
BattleAnim_DarkPulse:
	anim_setobjpal PAL_BATTLE_OB_YELLOW, PAL_BTLCUSTOM_DARK_PULSE
	anim_1gfx ANIM_GFX_OBJECTS_2
	anim_bgeffect ANIM_BG_CYCLE_OBPALS_GRAY_AND_YELLOW, $0, $2, $0
	anim_bgeffect ANIM_BG_WHIRLPOOL, $0, $0, $0
	anim_bgp $1b
	anim_sound 0, 1, SFX_SPITE
	anim_obj ANIM_OBJ_DARK_PULSE_E,  52, 92, $0
	anim_obj ANIM_OBJ_DARK_PULSE_SE, 48, 96, $8
	anim_obj ANIM_OBJ_DARK_PULSE_S,  44, 96, $10
	anim_obj ANIM_OBJ_DARK_PULSE_SW, 40, 96, $18
	anim_obj ANIM_OBJ_DARK_PULSE_W,  36, 92, $20
	anim_obj ANIM_OBJ_DARK_PULSE_NW, 40, 88, $28
	anim_obj ANIM_OBJ_DARK_PULSE_N,  44, 88, $30
	anim_obj ANIM_OBJ_DARK_PULSE_NE, 48, 88, $38
	anim_wait 96
	anim_incbgeffect ANIM_BG_WHIRLPOOL
	anim_ret
	
BattleAnim_BraveBird:
	anim_1gfx ANIM_GFX_SKY_ATTACK
	anim_bgeffect ANIM_BG_HIDE_MON, $0, $1, $0
	anim_bgeffect ANIM_BG_REMOVE_MON, $0, $1, $0
	anim_wait 8
	anim_bgeffect ANIM_BG_CYCLE_BGPALS_INVERTED, $0, $4, $0
	anim_obp0 $30
	anim_sound 0, 0, SFX_RAZOR_WIND
	anim_obj ANIM_OBJ_BRAVE_BIRD, 48, 88, $0
	anim_wait 16
	anim_clearobjs
	anim_sound 0, 1, SFX_HYPER_BEAM
	anim_obj ANIM_OBJ_BRAVE_BIRD, 48, 88, $18
	anim_wait 16
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $10
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $14, $2, $0
	anim_wait 32
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_ret
	
BattleAnim_Hurricane:
	anim_setobjpal PAL_BATTLE_OB_GRAY, PAL_BTLCUSTOM_BRIGHT
	anim_setobjpal PAL_BATTLE_OB_BLUE, PAL_BTLCUSTOM_BUBBLE
	anim_2gfx ANIM_GFX_HURRICANE, ANIM_GFX_WIND_BG
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $90, $4, $10
	anim_bgeffect ANIM_BG_ALTERNATE_HUES, $0, $4, $0
	anim_bgeffect ANIM_BG_CYCLE_OBPALS_GRAY_AND_YELLOW, $0, $4, $0
	anim_obj ANIM_OBJ_HURRICANE, 132, 56, $38
	anim_obj ANIM_OBJ_AGILITY, 8, 24, $10
	anim_obj ANIM_OBJ_AGILITY, 8, 48, $2
	anim_wait 4
	anim_obj ANIM_OBJ_AGILITY, 8, 56, $c
	anim_obj ANIM_OBJ_AGILITY, 8, 80, $4
	anim_obj ANIM_OBJ_AGILITY, 8, 104, $e
.loop
	anim_sound 0, 1, SFX_THUNDER
	anim_wait 4
	anim_loop 18, .loop
	anim_wait 24
	anim_ret
	
BattleAnim_PsyshieldBash:
	anim_setobjpal PAL_BATTLE_OB_YELLOW, PAL_BTLCUSTOM_AURORA
	anim_bgeffect ANIM_BG_CYCLE_OBPALS_GRAY_AND_YELLOW_FULL_SHIFT, $0, $2, $0
	anim_call BattleAnim_TargetObj_1Row
	anim_bgp $1b
	anim_2gfx ANIM_GFX_HIT_2, ANIM_GFX_STARS
	anim_obj ANIM_OBJ_PROTECT, 80, 80, $0
	anim_obj ANIM_OBJ_PROTECT, 80, 80, $d
	anim_obj ANIM_OBJ_PROTECT, 80, 80, $1a
	anim_obj ANIM_OBJ_PROTECT, 80, 80, $27
	anim_obj ANIM_OBJ_PROTECT, 80, 80, $34
	anim_sound 0, 0, SFX_PROTECT
	anim_wait 64
	anim_clearobjs
	anim_jump BattleAnim_ZenHeadbutt.hit

BattleAnim_ZenHeadbutt:
	anim_setobjpal PAL_BATTLE_OB_GRAY, PAL_BTLCUSTOM_SIGNAL_BEAM_BLUE
	anim_setobjpal PAL_BATTLE_OB_YELLOW, PAL_BTLCUSTOM_SIGNAL_BEAM_BLUE
	anim_call BattleAnim_TargetObj_1Row
	anim_4gfx ANIM_GFX_HIT_2, ANIM_GFX_GLOW, ANIM_GFX_SHINE, ANIM_GFX_STARS
	anim_bgeffect ANIM_BG_CYCLE_OBPALS_GRAY_AND_YELLOW, $0, $6, $0
	anim_bgp $1b
	anim_sound 0, 0, SFX_PSYBEAM
	anim_obj ANIM_OBJ_ZEN_HEADBUTT, 44, 104, $30
	anim_wait 8
.loop
	anim_obj ANIM_OBJ_ZEN_HEADBUTT_PARTICLE,  44, 96, $5c
	anim_wait 8
	anim_obj ANIM_OBJ_ZEN_HEADBUTT_PARTICLE,  44, 96, $e8
	anim_wait 8
	anim_obj ANIM_OBJ_ZEN_HEADBUTT_PARTICLE,  44, 96, $d0
	anim_wait 8
	anim_obj ANIM_OBJ_ZEN_HEADBUTT_PARTICLE,  44, 96, $50
	anim_wait 8
	anim_loop 2, .loop
	anim_incobj 2
	anim_wait 1
	anim_wait 6
.hit
	anim_bgeffect ANIM_BG_TACKLE, $0, $1, $0
	anim_wait 12
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $0, $0
	anim_wait 1
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_clearobjs
	anim_wait 1
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $14, $2, $0
	anim_sound 0, 0, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 56, $0
.loop2
	anim_obj ANIM_OBJ_STAR_BURST, 136, 56, $5c
	anim_wait 2
	anim_obj ANIM_OBJ_STAR_BURST, 136, 56, $e8
	anim_wait 2
	anim_obj ANIM_OBJ_STAR_BURST, 136, 56, $d0
	anim_wait 2
	anim_obj ANIM_OBJ_STAR_BURST, 136, 56, $50
	anim_wait 2
	anim_loop 2, .loop2
	anim_wait 32
	anim_ret
	
BattleAnim_BulletPunch:
	anim_1gfx ANIM_GFX_HIT
	anim_call BattleAnim_FollowEnemyFeet_1
	anim_resetobp0
	anim_bgeffect ANIM_BG_VIBRATE_MON, $0, $0, $0
	anim_obj ANIM_OBJ_BULLET_PUNCH, 140, 44, $0
	anim_sound 0, 1, SFX_TACKLE
	anim_wait 3
	anim_obj ANIM_OBJ_BULLET_PUNCH, 112, 46, $0
	anim_sound 0, 1, SFX_TACKLE
	anim_wait 3
	anim_obj ANIM_OBJ_BULLET_PUNCH, 148, 60, $0
	anim_sound 0, 1, SFX_TACKLE
	anim_wait 3
	anim_obj ANIM_OBJ_BULLET_PUNCH, 120, 30, $0
	anim_sound 0, 1, SFX_TACKLE
	anim_wait 3
	anim_obj ANIM_OBJ_BULLET_PUNCH, 116, 64, $0
	anim_sound 0, 1, SFX_TACKLE
	anim_wait 3
	anim_obj ANIM_OBJ_BULLET_PUNCH, 132, 68, $0
	anim_sound 0, 1, SFX_TACKLE
	anim_wait 34
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_ret
	
BattleAnim_Roost:
	anim_2gfx ANIM_GFX_MISC, ANIM_GFX_SHINE
	anim_bgeffect ANIM_BG_FADE_MON_TO_LIGHT_REPEATING, $0, $1, $40
	anim_wait 16
	anim_sound 0, 0, SFX_MORNING_SUN 
	anim_obj ANIM_OBJ_ROOST, 48, 80, $00
	anim_obj ANIM_OBJ_ROOST, 48, 80, $0d
	anim_obj ANIM_OBJ_ROOST, 48, 80, $1a
	anim_obj ANIM_OBJ_ROOST, 48, 80, $27
	anim_obj ANIM_OBJ_ROOST, 48, 80, $34
	anim_wait 130
	anim_incbgeffect ANIM_BG_FADE_MON_TO_LIGHT_REPEATING
	anim_bgeffect ANIM_BG_CYCLE_MID_OBPALS_GRAY_AND_YELLOW, $0, $0, $0
	anim_jump BattleAnim_Sub_Glimmer

BattleAnim_XScissor:
	anim_1gfx ANIM_GFX_CUT
	anim_sound 0, 1, SFX_CUT
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $08, $2, $0
	anim_obj ANIM_OBJ_CUT_LONG_DOWN_LEFT, 150, 40, $0
	anim_obj ANIM_OBJ_CUT_LONG_DOWN_RIGHT, 118, 40, $0
	anim_wait 32
	anim_ret
	
BattleAnim_DragonPulse:
	anim_setobjpal PAL_BATTLE_OB_BLUE, PAL_BTLCUSTOM_DRAGON_PULSE
	anim_setobjpal PAL_BATTLE_OB_YELLOW, PAL_BTLCUSTOM_DRAGON_PULSE
	anim_bgeffect ANIM_BG_CYCLE_MID_OBPALS_GRAY_AND_YELLOW, $0, $2, $0
	anim_2gfx ANIM_GFX_GLOW, ANIM_GFX_CHARGE,
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $55, $1, $0
	anim_bgeffect ANIM_BG_ALTERNATE_HUES, $0, $2, $0
	anim_obj ANIM_OBJ_SMALL_GLOW, 48, 96, $0
.loop
	anim_sound 0, 0, SFX_AEROBLAST
	anim_obj ANIM_OBJ_DRAGON_PULSE, 64, 88, $4
	anim_wait 4
	anim_loop 16, .loop
	anim_incobj 1
	anim_wait 16
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_wait 4
	anim_ret
	
BattleAnim_RockBlast:
	anim_2gfx ANIM_GFX_ROCKS, ANIM_GFX_HIT
	anim_sound 6, 2, SFX_SPARK
	anim_obj ANIM_OBJ_ROCK_BLAST, 64, 92, $4
	anim_wait 16
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 56, $0
	anim_obj ANIM_OBJ_ROCK_SMASH, 136, 56, $5c
	anim_obj ANIM_OBJ_ROCK_SMASH, 136, 56, $e8
	anim_obj ANIM_OBJ_ROCK_SMASH, 136, 56, $d0
	anim_obj ANIM_OBJ_ROCK_SMASH, 136, 56, $50
	anim_wait 32
	anim_ret
	
BattleAnim_NastyPlot:
	anim_1gfx ANIM_GFX_STATUS
	anim_sound 0, 0, SFX_LICK
	anim_obj ANIM_OBJ_NASTY_PLOT, 64, 88, $2
	anim_wait 16
	anim_sound 0, 0, SFX_LICK
	anim_obj ANIM_OBJ_NASTY_PLOT, 68, 88, $1
	anim_obj ANIM_OBJ_NASTY_PLOT, 28, 88, $2
	anim_wait 16
	anim_sound 0, 0, SFX_LICK
	anim_obj ANIM_OBJ_NASTY_PLOT, 72, 88, $0
	anim_obj ANIM_OBJ_NASTY_PLOT, 24, 88, $1
	anim_obj ANIM_OBJ_NASTY_PLOT_2, 46, 80, $2
	anim_wait 16
	anim_obj ANIM_OBJ_NASTY_PLOT, 20, 88, $0
	anim_obj ANIM_OBJ_NASTY_PLOT_2, 46, 80, $1
	anim_wait 16
	anim_obj ANIM_OBJ_NASTY_PLOT_2, 46, 80, $0
	anim_wait 32
	anim_clearobjs
	anim_wait 1
	anim_2gfx ANIM_GFX_SHINE, ANIM_GFX_MISC
	anim_obj ANIM_OBJ_FINGER_POINT, 48, 72, $0
	anim_sound 0, 1, SFX_FORESIGHT
	anim_obj ANIM_OBJ_GLIMMER_Y_SET, 48, 68, $0
	anim_wait 24
	anim_ret

BattleAnim_DazzlinGleam:
	anim_1gfx ANIM_GFX_SPEED
	anim_setobjpal PAL_BATTLE_OB_YELLOW, PAL_BTLCUSTOM_AURORA
	anim_setobjpal PAL_BATTLE_OB_GRAY, PAL_BTLCUSTOM_AURORA
	anim_sound 0, 1, SFX_MOONLIGHT
	anim_bgeffect ANIM_BG_CYCLE_OBPALS_GRAY_AND_YELLOW, $0, $2, $0
	anim_bgeffect ANIM_BG_ALTERNATE_HUES, $0, $2, $0
	anim_obj ANIM_OBJ_DAZZLE, 44, 88, $0
	anim_obj ANIM_OBJ_DAZZLE, 44, 88, $8
	anim_obj ANIM_OBJ_DAZZLE, 44, 88, $10
	anim_obj ANIM_OBJ_DAZZLE, 44, 88, $18
	anim_obj ANIM_OBJ_DAZZLE, 44, 88, $20
	anim_obj ANIM_OBJ_DAZZLE, 44, 88, $28
	anim_obj ANIM_OBJ_DAZZLE, 44, 88, $30
	anim_obj ANIM_OBJ_DAZZLE, 44, 88, $38
	anim_wait 48
	anim_2gfx ANIM_GFX_HIT, ANIM_GFX_SHINE, 
	anim_setbgpal PAL_BATTLE_BG_PLAYER, PAL_BTLCUSTOM_VERY_BRIGHT_PINK
	anim_setbgpal PAL_BATTLE_BG_ENEMY, PAL_BTLCUSTOM_VERY_BRIGHT_PINK
	anim_setbgpal PAL_BATTLE_BG_ENEMY_HP, PAL_BTLCUSTOM_VERY_BRIGHT_PINK
	anim_setbgpal PAL_BATTLE_BG_PLAYER_HP, PAL_BTLCUSTOM_VERY_BRIGHT_PINK
	anim_setbgpal PAL_BATTLE_BG_EXP_GENDER, PAL_BTLCUSTOM_VERY_BRIGHT_PINK
	anim_setbgpal PAL_BATTLE_BG_STATUS, PAL_BTLCUSTOM_VERY_BRIGHT_PINK
	anim_setbgpal PAL_BATTLE_BG_TYPE_CAT, PAL_BTLCUSTOM_VERY_BRIGHT_PINK
	anim_setbgpal PAL_BATTLE_BG_TEXT, PAL_BTLCUSTOM_VERY_BRIGHT_PINK
	anim_incbgeffect ANIM_BG_ALTERNATE_HUES
	anim_sound 0, 1, SFX_FLASH
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $6, $20
	anim_wait 4
	anim_bgeffect ANIM_BG_CYCLE_MON_LIGHT_DARK_REPEATING, $0, $1, $20
	anim_obj ANIM_OBJ_GLIMMER, 24, 64, $0
	anim_wait 5
	anim_obj ANIM_OBJ_GLIMMER, 56, 104, $0
	anim_wait 5
	anim_obj ANIM_OBJ_HIT_BIG_YFIX, 136, 56, $0
	anim_obj ANIM_OBJ_GLIMMER, 24, 104, $0
	anim_wait 5
	anim_obj ANIM_OBJ_GLIMMER, 56, 64, $0
	anim_wait 5
	anim_obj ANIM_OBJ_GLIMMER, 40, 84, $0
	anim_wait 5
	anim_wait 32
	anim_ret

BattleAnim_RockPolish:
	anim_setobjpal PAL_BATTLE_OB_YELLOW, PAL_BTLCUSTOM_GRAY
	anim_2gfx ANIM_GFX_ROCK_POLISH, ANIM_GFX_SPEED
	anim_bgeffect ANIM_BG_CYCLE_OBPALS_GRAY_AND_YELLOW, $0, $2, $0
	anim_bgeffect ANIM_BG_FADE_MON_TO_BLACK, $0, $1, $40
	anim_sound 0, 1, SFX_SHINE
	anim_obj ANIM_OBJ_ROCK_POLISH_85DEG_R_YFLIP, 52, 88, $0
	anim_wait 6
	anim_sound 0, 1, SFX_SHINE
	anim_obj ANIM_OBJ_ROCK_POLISH_85DEG_L_YFLIP, 40, 100, $0
	anim_wait 6
	anim_sound 0, 1, SFX_SHINE
	anim_obj ANIM_OBJ_ROCK_POLISH_85DEG_R, 48, 96, $0
	anim_wait 6
	anim_sound 0, 1, SFX_SHINE
	anim_obj ANIM_OBJ_ROCK_POLISH_85DEG_L, 56, 96, $0
	anim_wait 6
	anim_sound 0, 1, SFX_SHINE
	anim_obj ANIM_OBJ_ROCK_POLISH_85DEG_L_YFLIP, 36, 84, $0
	anim_wait 6
	anim_sound 0, 1, SFX_SHINE
	anim_obj ANIM_OBJ_ROCK_POLISH_85DEG_R_YFLIP, 60, 96, $0
	anim_wait 6
	anim_sound 0, 1, SFX_SHINE
	anim_obj ANIM_OBJ_ROCK_POLISH_85DEG_R, 52, 88, $0
	anim_wait 6
	anim_sound 0, 1, SFX_SHINE
	anim_obj ANIM_OBJ_ROCK_POLISH_85DEG_R, 40, 100, $0
	anim_wait 6
	anim_sound 0, 1, SFX_SHINE
	anim_obj ANIM_OBJ_ROCK_POLISH_85DEG_L, 48, 96, $0
	anim_wait 6
	anim_sound 0, 1, SFX_SHINE
	anim_obj ANIM_OBJ_ROCK_POLISH_85DEG_L, 56, 96, $0
	anim_wait 6
	anim_sound 0, 1, SFX_SHINE
	anim_obj ANIM_OBJ_ROCK_POLISH_85DEG_R_YFLIP, 36, 84, $0
	anim_wait 6
	anim_sound 0, 1, SFX_SHINE
	anim_obj ANIM_OBJ_ROCK_POLISH_85DEG_L_YFLIP, 60, 96, $0
	anim_wait 8
	anim_sound 0, 0, SFX_METRONOME
	anim_obj ANIM_OBJ_PULSING_SPARKLE_YFIX, 32, 72, $0
	anim_wait 5
	anim_obj ANIM_OBJ_PULSING_SPARKLE_YFIX, 64, 104, $0
	anim_wait 5
	anim_obj ANIM_OBJ_PULSING_SPARKLE_YFIX, 32, 104, $0
	anim_wait 5
	anim_obj ANIM_OBJ_PULSING_SPARKLE_YFIX, 64, 72, $0
	anim_wait 5
	anim_obj ANIM_OBJ_PULSING_SPARKLE_YFIX, 48, 88, $0
	anim_wait 24
	anim_ret

BattleAnim_KnockOff:
	anim_1gfx ANIM_GFX_HIT
	anim_sound 3, 0, SFX_RAZOR_WIND
	anim_obj ANIM_OBJ_PALM, 136, 08, $0
	anim_wait 1
	anim_obj ANIM_OBJ_PALM, 136, 16, $0
	anim_wait 1
	anim_obj ANIM_OBJ_PALM, 136, 24, $0
	anim_wait 1
	anim_obj ANIM_OBJ_PALM, 136, 32, $0
	anim_wait 1
	anim_obj ANIM_OBJ_PALM, 136, 40, $0
	anim_wait 1
	anim_obj ANIM_OBJ_PALM, 136, 48, $0
	anim_wait 1
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_Y, $10, $1, $20
	anim_sound 0, 1, SFX_TACKLE
	anim_obj ANIM_OBJ_HIT_BIG_YFIX, 136, 48, $0
	anim_obj ANIM_OBJ_PALM, 136, 56, $0
	anim_wait 1
	anim_obj ANIM_OBJ_PALM, 136, 64, $0
	anim_wait 1
	anim_obj ANIM_OBJ_PALM, 136, 72, $0
	anim_wait 8
	anim_ret

BattleAnim_PoisonFang:
	anim_3gfx ANIM_GFX_CUT, ANIM_GFX_HIT, ANIM_GFX_POISON
	anim_obj ANIM_OBJ_BITE, 136, 56, $98
	anim_obj ANIM_OBJ_BITE, 136, 56, $18
	anim_wait 8
	anim_sound 0, 1, SFX_BITE
	anim_obj ANIM_OBJ_HIT_YFIX, 144, 48, $18
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $14, $2, $0
	anim_wait 4
	anim_clearobjs
	anim_wait 8
	anim_setobjpal PAL_BATTLE_OB_GRAY, PAL_BTLCUSTOM_PURPLE
.loop
	anim_sound 0, 1, SFX_TOXIC
	anim_obj ANIM_OBJ_SLUDGE, 132, 72, $0
	anim_wait 8
	anim_sound 0, 1, SFX_TOXIC
	anim_obj ANIM_OBJ_SLUDGE, 116, 72, $0
	anim_wait 8
	anim_sound 0, 1, SFX_TOXIC
	anim_obj ANIM_OBJ_SLUDGE, 148, 72, $0
	anim_wait 8
	anim_loop 2, .loop
	anim_wait 48
	anim_ret

BattleAnim_WorkUp:
	anim_jumpif $1, BattleAnim_Growth
	anim_1gfx ANIM_GFX_WIND
	anim_call BattleAnim_TargetObj_2Row
	anim_bgeffect ANIM_BG_SHAKE_MON_Y, $0, $11, $4
.loop
	anim_sound 0, 1, SFX_AEROBLAST
	anim_wait 8
	anim_loop 6, .loop
	anim_wait 16
	anim_incbgeffect ANIM_BG_SHAKE_MON_Y
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $0, $0
	anim_bgeffect ANIM_BG_CYCLE_MON_LIGHT_DARK_REPEATING, $0, $1, $20
	anim_sound 0, 0, SFX_MENU
	anim_obj ANIM_OBJ_SWAGGER, 72, 88, $44
	anim_wait 64
	anim_ret

BattleAnim_RazorWind_branch_c9fb5:
	anim_1gfx ANIM_GFX_SPEED
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_FADE_MON_TO_LIGHT, $0, $1, $40
	anim_bgeffect ANIM_BG_CYCLE_OBPALS_GRAY_AND_YELLOW, $0, $2, $0
.loop
	anim_sound 0, 0, SFX_SWORDS_DANCE
	anim_obj ANIM_OBJ_FOCUS, 44, 108, $6
	anim_wait 2
	anim_obj ANIM_OBJ_FOCUS, 36, 108, $6
	anim_wait 2
	anim_obj ANIM_OBJ_FOCUS, 52, 108, $8
	anim_wait 2
	anim_obj ANIM_OBJ_FOCUS, 28, 108, $8
	anim_wait 2
	anim_obj ANIM_OBJ_FOCUS, 60, 108, $6
	anim_wait 2
	anim_obj ANIM_OBJ_FOCUS, 20, 108, $8
	anim_wait 2
	anim_obj ANIM_OBJ_FOCUS, 68, 108, $8
	anim_wait 2
	anim_loop 3, .loop
	anim_wait 8
	anim_incbgeffect ANIM_BG_FADE_MON_TO_LIGHT
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_Hex:
	anim_2gfx ANIM_GFX_FIRE, ANIM_GFX_SPEED
	anim_battlergfx_2row
	anim_bgp $f8
	anim_bgeffect ANIM_BG_BATTLEROBJ_1ROW, $0, $1, $0
	anim_wait 8
	anim_sound 6, 2, SFX_SLUDGE_BOMB
	anim_bgeffect ANIM_BG_VIBRATE_MON, $0, $0, $0
	anim_wait 40
	anim_bgp $1b
	anim_setobjpal PAL_BATTLE_OB_YELLOW, PAL_BTLCUSTOM_PURPLE
	anim_setobjpal PAL_BATTLE_OB_RED, PAL_BTLCUSTOM_WILL_O_WISP
	anim_sound 0, 0, SFX_SPITE
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_obj ANIM_OBJ_BURNED, 116, 52, $10
	anim_obj ANIM_OBJ_BURNED, 148, 52, $90
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $55, $1, $0
.loop
	anim_obj ANIM_OBJ_FOCUS, 136, 72, $6
	anim_wait 2
	anim_obj ANIM_OBJ_FOCUS, 128, 72, $6
	anim_wait 2
	anim_obj ANIM_OBJ_FOCUS, 144, 72, $8
	anim_wait 2
	anim_obj ANIM_OBJ_FOCUS, 120, 72, $8
	anim_wait 2
	anim_obj ANIM_OBJ_FOCUS, 152, 72, $6
	anim_wait 2
	anim_obj ANIM_OBJ_FOCUS, 112, 72, $8
	anim_wait 2
	anim_obj ANIM_OBJ_FOCUS, 160, 72, $8
	anim_wait 2
	anim_loop 3, .loop
	anim_wait 8
	anim_wait 16
	anim_ret

BattleAnim_ShadowBone:
	anim_3gfx ANIM_GFX_HIT_2, ANIM_GFX_MISC, ANIM_GFX_FIRE
	anim_setobjpal PAL_BATTLE_OB_RED, PAL_BTLCUSTOM_WILL_O_WISP
	anim_bgp $1b
	anim_sound 6, 2, SFX_HYDRO_PUMP
	anim_obj ANIM_OBJ_SHADOW_BONE, 64, 88, $2
	anim_wait 32
	anim_sound 0, 1, SFX_CURSE
	anim_obj ANIM_OBJ_HIT_YFIX, 120, 48, $0
.loop
	anim_obj ANIM_OBJ_BURNED, 116, 52, $10
	anim_obj ANIM_OBJ_BURNED, 148, 52, $90
	anim_wait 6
	anim_loop 6, .loop
	anim_sound 0, 1, SFX_STOMP
	anim_obj ANIM_OBJ_HIT_YFIX, 144, 64, $0
	anim_wait 32
	anim_ret

BattleAnim_RockClimb:
	anim_2gfx ANIM_GFX_ROCKS, ANIM_GFX_HIT
	anim_call BattleAnim_TargetObj_2Row
	anim_bgeffect ANIM_BG_BOUNCE_DOWN, $0, $1, $0
	anim_wait 8
.loop
	anim_obj ANIM_OBJ_ROCK_CLIMB, 56, 108, $5c
	anim_obj ANIM_OBJ_ROCK_CLIMB, 40, 108, $e8
	anim_sound 6, 2, SFX_SPARK
	anim_wait 28
	anim_loop 2, .loop
	anim_incbgeffect ANIM_BG_BOUNCE_DOWN
	anim_wait 8
	anim_bgeffect ANIM_BG_BODY_SLAM, $0, $1, $0
	anim_wait 16
	anim_call BattleAnim_ShowMon_0
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 62, $0
	anim_obj ANIM_OBJ_ROCK_SMASH, 136, 62, $5c
	anim_obj ANIM_OBJ_ROCK_SMASH, 136, 62, $e8
	anim_wait 3
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 54, $0
	anim_obj ANIM_OBJ_ROCK_SMASH, 136, 54, $5c
	anim_obj ANIM_OBJ_ROCK_SMASH, 136, 54, $e8
	anim_wait 3
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 46, $0
	anim_obj ANIM_OBJ_ROCK_SMASH, 136, 46, $5c
	anim_obj ANIM_OBJ_ROCK_SMASH, 136, 46, $e8
	anim_wait 3
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 38, $0
	anim_obj ANIM_OBJ_ROCK_SMASH, 136, 38, $5c
	anim_obj ANIM_OBJ_ROCK_SMASH, 136, 38, $e8
	anim_wait 3
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 30, $0
	anim_obj ANIM_OBJ_ROCK_SMASH, 136, 30, $5c
	anim_obj ANIM_OBJ_ROCK_SMASH, 136, 30, $e8
	anim_wait 8
	anim_ret
	
BattleAnim_MiracleEye:
	anim_2gfx ANIM_GFX_PSYCHIC, ANIM_GFX_SPEED
	anim_setobjpal PAL_BATTLE_OB_YELLOW, PAL_BTLCUSTOM_AURORA
	anim_setobjpal PAL_BATTLE_OB_GRAY, PAL_BTLCUSTOM_AURORA
	anim_bgeffect ANIM_BG_CYCLE_OBPALS_GRAY_AND_YELLOW_FULL_SHIFT, $0, $2, $0
	anim_sound 0, 1, SFX_GAME_FREAK_LOGO_GS
	anim_obj ANIM_OBJ_MIRACLE_EYE, 48, 96, $0
	anim_obj ANIM_OBJ_WIND_SPARKLE, 48, 96, $0
	anim_wait 8
	anim_obj ANIM_OBJ_WIND_SPARKLE, 48, 96, $28
	anim_wait 8
	anim_obj ANIM_OBJ_WIND_SPARKLE, 48, 96, $30
	anim_wait 8
	anim_obj ANIM_OBJ_WIND_SPARKLE, 48, 96, $38
	anim_wait 8
	anim_obj ANIM_OBJ_WIND_SPARKLE, 48, 96, $20
	anim_wait 8
	anim_obj ANIM_OBJ_WIND_SPARKLE, 48, 96, $8
	anim_wait 8
	anim_obj ANIM_OBJ_WIND_SPARKLE, 48, 96, $18
	anim_wait 8
	anim_obj ANIM_OBJ_WIND_SPARKLE, 48, 96, $4
	anim_wait 8
	anim_bgeffect ANIM_BG_FADE_MON_TO_LIGHT_REPEATING, $0, $0, $40
	anim_wait 64
	anim_ret
	
BattleAnim_OdorSleuth:
	anim_1gfx ANIM_GFX_SHINE
	anim_call BattleAnim_FollowEnemyFeet_1
	anim_sound 0, 0, SFX_TAIL_WHIP
	anim_bgeffect ANIM_BG_WOBBLE_MON, $0, $0, $0
.loop
	anim_sound 0, 0, SFX_RAZOR_WIND
	anim_wait 8
	anim_loop 4, .loop
	anim_wait 64
	anim_incbgeffect ANIM_BG_WOBBLE_MON
	anim_call BattleAnim_ShowMon_1
	anim_wait 24
	anim_sound 0, 0, SFX_FORESIGHT
	anim_obj ANIM_OBJ_FORESIGHT, 64, 88, $0
	anim_wait 24
	anim_ret
	
BattleAnim_DoubleHit:
	anim_1gfx ANIM_GFX_HIT
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $6, $1, $0
	anim_obj ANIM_OBJ_HIT_BIG_YFIX, 148, 48, $0
	anim_wait 24
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $6, $1, $0
	anim_obj ANIM_OBJ_HIT_BIG_YFIX, 116, 48, $0
	anim_wait 32
	anim_ret

BattleAnim_CottonGuard:
	anim_setobjpal PAL_BATTLE_OB_GRAY, PAL_BTLCUSTOM_COTTON_GUARD
	anim_1gfx ANIM_GFX_COTTON
	anim_sound 0, 1, SFX_SWEET_SCENT
	anim_obj ANIM_OBJ_COTTON_GUARD, 52, 84, $38
	anim_wait 12
	anim_sound 0, 1, SFX_JUMP_OVER_LEDGE
	anim_obj ANIM_OBJ_COTTON_GUARD, 36, 92, $20
	anim_wait 12
	anim_sound 0, 1, SFX_JUMP_OVER_LEDGE
	anim_obj ANIM_OBJ_COTTON_GUARD, 60, 98, $8
	anim_wait 12
	anim_sound 0, 1, SFX_JUMP_OVER_LEDGE
	anim_obj ANIM_OBJ_COTTON_GUARD, 52, 104, $10
	anim_wait 12
	anim_sound 0, 1, SFX_JUMP_OVER_LEDGE
	anim_obj ANIM_OBJ_COTTON_GUARD, 38, 80, $28
	anim_wait 12
	anim_sound 0, 1, SFX_JUMP_OVER_LEDGE
	anim_obj ANIM_OBJ_COTTON_GUARD, 64, 82, $0
	anim_wait 12
	anim_sound 0, 1, SFX_JUMP_OVER_LEDGE
	anim_obj ANIM_OBJ_COTTON_GUARD, 44, 102, $18
	anim_wait 12
	anim_sound 0, 1, SFX_JUMP_OVER_LEDGE
	anim_obj ANIM_OBJ_COTTON_GUARD, 54, 72, $30
	anim_wait 12
	anim_sound 0, 1, SFX_JUMP_OVER_LEDGE
	anim_wait 48
	anim_ret

BattleAnim_SignalBeam:
	anim_1gfx ANIM_GFX_GLOW
	anim_setobjpal PAL_BATTLE_OB_GRAY, PAL_BTLCUSTOM_SIGNAL_BEAM_RED
	anim_setobjpal PAL_BATTLE_OB_YELLOW, PAL_BTLCUSTOM_SIGNAL_BEAM_BLUE
	anim_bgeffect ANIM_BG_ALTERNATE_HUES, $0, $2, $0
	anim_bgeffect ANIM_BG_CYCLE_OBPALS_GRAY_AND_YELLOW, $0, $2, $0
.loop
	anim_sound 0, 0, SFX_SPITE
	anim_obj ANIM_OBJ_SIGNAL_BEAM_R, 64, 92, $0
	anim_wait 4
	anim_sound 0, 0, SFX_SPITE
	anim_obj ANIM_OBJ_SIGNAL_BEAM_B, 64, 92, $0
	anim_wait 4
	anim_sound 0, 0, SFX_SPITE
	anim_obj ANIM_OBJ_SIGNAL_BEAM_R, 64, 92, $0
	anim_wait 4
	anim_sound 0, 0, SFX_SPITE
	anim_obj ANIM_OBJ_SIGNAL_BEAM_B, 64, 92, $0
	anim_wait 4
	anim_loop 4, .loop
	anim_wait 64
	anim_ret

BattleAnim_BulletSeed:
	anim_2gfx ANIM_GFX_PLANT, ANIM_GFX_HIT    
	anim_sound 0, 1, SFX_BONE_CLUB
.loop
	anim_obj ANIM_OBJ_BULLET_SEED, 64, 90, $6
	anim_wait 7
	anim_obj ANIM_OBJ_BULLET_SEED, 64, 90, $6
	anim_sound 0, 1, SFX_HORN_ATTACK
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 56, $0
	anim_wait 7
	anim_obj ANIM_OBJ_BULLET_SEED, 64, 90, $6
	anim_sound 0, 1, SFX_HORN_ATTACK
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 56, $0
	anim_wait 7
	anim_sound 0, 1, SFX_HORN_ATTACK
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 56, $0
	anim_loop 2, .loop
	anim_wait 16
	anim_ret

BattleAnim_FeatherDance:
	anim_1gfx ANIM_GFX_MISC
	anim_sound 0, 0, SFX_MORNING_SUN 
.loop
	anim_obj ANIM_OBJ_FEATHER_DANCE, 132, 36, $0
	anim_wait 16
	anim_loop 5, .loop
	anim_bgeffect ANIM_BG_FADE_MON_TO_BLACK_REPEATING, $0, $0, $40
	anim_wait 96
	anim_incbgeffect ANIM_BG_FADE_MON_TO_BLACK_REPEATING
	anim_call BattleAnim_ShowMon_1
	anim_ret
	
BattleAnim_Psyshock:
	anim_setobjpal PAL_BATTLE_OB_YELLOW, PAL_BTLCUSTOM_PSYCHO_BOOST_2
	anim_2gfx ANIM_GFX_SHINE, ANIM_GFX_CHARGE
	anim_call BattleAnim_FollowEnemyFeet_1
	anim_sound 0, 0, SFX_RAGE
	anim_obj ANIM_OBJ_GLIMMER, 44, 88, $0
	anim_wait 32
	anim_bgeffect ANIM_BG_ALTERNATE_HUES, $0, $2, $0
	anim_sound 0, 1, SFX_PSYCHIC
	anim_bgeffect ANIM_BG_TELEPORT, $0, $0, $0
.loop
	anim_obj ANIM_OBJ_ENERGY_ORB, 136, 48, $38
	anim_wait 4
	anim_obj ANIM_OBJ_ENERGY_ORB, 136, 48, $20
	anim_wait 4
	anim_obj ANIM_OBJ_ENERGY_ORB, 136, 48, $8
	anim_wait 4
	anim_obj ANIM_OBJ_ENERGY_ORB, 136, 48, $10
	anim_wait 4
	anim_obj ANIM_OBJ_ENERGY_ORB, 136, 48, $28
	anim_wait 4
	anim_obj ANIM_OBJ_ENERGY_ORB, 136, 48, $0
	anim_wait 4
	anim_obj ANIM_OBJ_ENERGY_ORB, 136, 48, $18
	anim_wait 4
	anim_obj ANIM_OBJ_ENERGY_ORB, 136, 48, $30
	anim_wait 4
	anim_loop 2, .loop
	anim_wait 1
	anim_1gfx ANIM_GFX_GLOW
.loop2
	anim_obj ANIM_OBJ_SHRINKING_GLOW, 148, 36, $0
	anim_wait 4
	anim_obj ANIM_OBJ_SHRINKING_GLOW, 116, 48, $0
	anim_wait 4
	anim_obj ANIM_OBJ_SHRINKING_GLOW, 132, 60, $0
	anim_wait 4
	anim_loop 2, .loop2
	anim_wait 28
	anim_incbgeffect ANIM_BG_TELEPORT
	anim_wait 1
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_wait 1
	anim_clearobjs
	anim_ret
	
BattleAnim_FairyWind:
	anim_setobjpal PAL_BATTLE_OB_YELLOW, PAL_BTLCUSTOM_BRIGHT
	anim_setobjpal PAL_BATTLE_OB_GRAY, PAL_BTLCUSTOM_BRIGHTER_PINK
	anim_2gfx ANIM_GFX_SPEED, ANIM_GFX_HAZE
	anim_bgeffect ANIM_BG_CYCLE_MID_OBPALS_GRAY_AND_YELLOW, $0, $2, $0
	anim_sound 0, 1, SFX_GAME_FREAK_LOGO_GS
.loop
	anim_obj ANIM_OBJ_SHOOTING_MIST, 64, 80, $4
	anim_wait 4
	anim_obj ANIM_OBJ_SHOOTING_SPARKLE, 64, 88, $4
	anim_wait 4
	anim_obj ANIM_OBJ_SHOOTING_MIST, 64, 96, $4
	anim_wait 4
	anim_obj ANIM_OBJ_SHOOTING_SPARKLE, 64, 80, $4
	anim_wait 4
	anim_obj ANIM_OBJ_SHOOTING_MIST, 64, 88, $4
	anim_wait 4
	anim_obj ANIM_OBJ_SHOOTING_SPARKLE, 64, 96, $4
	anim_wait 4
	anim_loop 2, .loop
	anim_bgeffect ANIM_BG_FADE_MON_TO_BLACK_REPEATING, $0, $0, $40
	anim_wait 64
	anim_ret
	
BattleAnim_QuiverDance:
	anim_1gfx ANIM_GFX_CHARGE
	anim_call BattleAnim_TargetObj_1Row_1
	anim_setobjpal PAL_BATTLE_OB_YELLOW, PAL_BTLCUSTOM_AURORA
	anim_bgeffect ANIM_BG_CYCLE_OBPALS_GRAY_AND_YELLOW_FULL_SHIFT, $0, $2, $0
	anim_sound 0, 1, SFX_GAME_FREAK_LOGO_GS
	anim_bgeffect ANIM_BG_FADE_MON_TO_LIGHT_REPEATING, $0, $1, $40
	anim_bgeffect ANIM_BG_WOBBLE_MON, $0, $1, $0
.loop
	anim_obj ANIM_OBJ_TINY_RISING_ORB, 56, 90, $30
	anim_wait 4
	anim_obj ANIM_OBJ_TINY_RISING_ORB, 40, 90, $20
	anim_wait 4
	anim_obj ANIM_OBJ_TINY_RISING_ORB, 60, 106, $10
	anim_wait 4
	anim_obj ANIM_OBJ_TINY_RISING_ORB, 36, 106, $0
	anim_wait 4
	anim_loop 4, .loop
	anim_wait 18
	anim_incbgeffect ANIM_BG_WOBBLE_MON
	anim_call BattleAnim_ShowMon_0_1
	anim_wait 16
	anim_clearobjs
	anim_wait 1
	anim_ret

BattleAnim_ShellSmash:
	anim_3gfx ANIM_GFX_REFLECT, ANIM_GFX_HIT, ANIM_GFX_ROCKS
	anim_bgeffect ANIM_BG_RETURN_MON, $0, $1, $0
	anim_wait 6
	anim_sound 0, 0, SFX_SHINE
	anim_obj ANIM_OBJ_SHELL_SMASH_SHELL, 48, 106, $0
	anim_wait 16
	anim_bgeffect ANIM_BG_CYCLE_MID_OBPALS_GRAY_AND_YELLOW, $0, $0, $0
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $58, $2, $0
	anim_sound 0, 0, SFX_OUTRAGE
	anim_wait 72
	anim_clearobjs
	anim_bgeffect ANIM_BG_CYCLE_MID_OBPALS_GRAY_AND_YELLOW, $0, $6, $0
	anim_incbgeffect ANIM_BG_SHAKE_SCREEN_X
	anim_wait 1
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $2
	anim_bgeffect ANIM_BG_ENTER_MON, $0, $1, $0
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_SHELL_SMASH_HIT, 48, 106, $0
	anim_obj ANIM_OBJ_SHELL_SMASH, 48, 106, $5c
	anim_obj ANIM_OBJ_SHELL_SMASH, 48, 106, $e8
	anim_obj ANIM_OBJ_SHELL_SMASH, 48, 106, $d0
	anim_obj ANIM_OBJ_SHELL_SMASH, 48, 106, $50
	anim_wait 12
	anim_bgeffect ANIM_BG_FADE_MON_TO_BLACK_REPEATING, $0, $1, $40
	anim_call BattleAnim_ShowMon_0
	anim_ret
	
BattleAnim_FlameCharge:
	anim_1gfx ANIM_GFX_FIRE
	anim_setobjpal PAL_BATTLE_OB_RED, PAL_BTLCUSTOM_FIRE
	anim_bgeffect ANIM_BG_FADE_MON_TO_LIGHT_REPEATING, $0, $1, $40
.loop
	anim_sound 6, 2, SFX_EMBER
	anim_obj ANIM_OBJ_BURNED, 40, 86, $10
	anim_wait 6
	anim_sound 6, 2, SFX_EMBER
	anim_obj ANIM_OBJ_BURNED, 56, 86, $90
	anim_wait 6
	anim_loop 5, .loop
	anim_wait 80
	anim_incbgeffect ANIM_BG_FADE_MON_TO_LIGHT_REPEATING
	anim_wait 1
	anim_clearobjs
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_TACKLE, $0, $1, $0
	anim_wait 4
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $3
	anim_sound 0, 1, SFX_EMBER
	anim_obj ANIM_OBJ_FIRE_BLAST, 136, 48, $1
	anim_obj ANIM_OBJ_FIRE_BLAST, 136, 48, $4
	anim_obj ANIM_OBJ_FIRE_BLAST, 136, 48, $5
	anim_wait 8
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $0, $0
	anim_wait 4
	anim_incobj 11
	anim_wait 8
	anim_ret
	
BattleAnim_FireFang:
	anim_setobjpal PAL_BATTLE_OB_RED, PAL_BTLCUSTOM_FIRE
	anim_3gfx ANIM_GFX_CUT, ANIM_GFX_HIT, ANIM_GFX_FIRE
	anim_obj ANIM_OBJ_BITE, 136, 56, $98
	anim_obj ANIM_OBJ_BITE, 136, 56, $18
	anim_wait 8
	anim_sound 0, 1, SFX_BITE
	anim_obj ANIM_OBJ_HIT_YFIX, 144, 48, $18
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $14, $2, $0
	anim_wait 4
	anim_clearobjs
	anim_sound 0, 1, SFX_EMBER
.loop
	anim_obj ANIM_OBJ_BURNED, 136, 56, $10
	anim_obj ANIM_OBJ_BURNED, 136, 56, $90
	anim_wait 4
	anim_loop 3, .loop
	anim_wait 16
	anim_ret
	
BattleAnim_IceFang:
	anim_setobjpal PAL_BATTLE_OB_BLUE, PAL_BTLCUSTOM_ICE
	anim_3gfx ANIM_GFX_CUT, ANIM_GFX_HIT, ANIM_GFX_ICE
	anim_obj ANIM_OBJ_BITE, 136, 56, $98
	anim_obj ANIM_OBJ_BITE, 136, 56, $18
	anim_wait 8
	anim_sound 0, 1, SFX_BITE
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 56, $0
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $14, $2, $0
	anim_wait 4
	anim_clearobjs
	anim_sound 0, 1, SFX_SHINE
	anim_obj ANIM_OBJ_ICE, 128, 42, $0
	anim_wait 6
	anim_sound 0, 1, SFX_SHINE
	anim_obj ANIM_OBJ_ICE, 144, 70, $0
	anim_wait 6
	anim_sound 0, 1, SFX_SHINE
	anim_obj ANIM_OBJ_ICE, 120, 56, $0
	anim_wait 6
	anim_sound 0, 1, SFX_SHINE
	anim_obj ANIM_OBJ_ICE, 152, 56, $0
	anim_wait 6
	anim_sound 0, 1, SFX_SHINE
	anim_obj ANIM_OBJ_ICE, 144, 42, $0
	anim_wait 6
	anim_sound 0, 1, SFX_SHINE
	anim_obj ANIM_OBJ_ICE, 128, 70, $0
	anim_ret
	
BattleAnim_ThunderFang:
	anim_3gfx ANIM_GFX_CUT, ANIM_GFX_HIT, ANIM_GFX_LIGHTNING
	anim_obj ANIM_OBJ_BITE, 136, 56, $98
	anim_obj ANIM_OBJ_BITE, 136, 56, $18
	anim_wait 8
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 56, $0
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $14, $2, $0
	anim_wait 4
	anim_clearobjs
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $2
	anim_bgeffect ANIM_BG_CYCLE_OBPALS_GRAY_AND_YELLOW, $0, $2, $0
	anim_sound 0, 1, SFX_THUNDER
	anim_obj ANIM_OBJ_THUNDER_RIGHT, 152, 68, $0
	anim_wait 32
	anim_ret

BattleAnim_PlayRough:
	anim_1gfx ANIM_GFX_SPEED
	anim_sound 6, 2, SFX_THROW_BALL
	anim_bgeffect ANIM_BG_HIDE_MON, $0, $1, $0
	anim_call BattleAnimSub_QuickAttack
	anim_wait 12
	anim_3gfx ANIM_GFX_STARS, ANIM_GFX_HIT, ANIM_GFX_HEARTS
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $55, $2, $0
.loop
	anim_sound 0, 1, SFX_BONE_CLUB
	anim_obj ANIM_OBJ_STAR_BURST, 128, 48, $28
	anim_obj ANIM_OBJ_HIT_YFIX, 128, 48, $0
	anim_wait 3
	anim_obj ANIM_OBJ_HEART_BURST, 144, 64, $5c
	anim_wait 3
	anim_obj ANIM_OBJ_STAR_BURST, 144, 64, $10
	anim_obj ANIM_OBJ_HIT_YFIX, 144, 64, $0
	anim_wait 3
	anim_sound 0, 1, SFX_DOUBLE_SLAP
	anim_obj ANIM_OBJ_HEART_BURST, 120, 52, $e8
	anim_wait 3
	anim_obj ANIM_OBJ_STAR_BURST, 120, 52, $9c
	anim_obj ANIM_OBJ_HIT_YFIX, 120, 52, $0
	anim_wait 3
	anim_obj ANIM_OBJ_STAR_BURST, 152, 48, $d0
	anim_wait 3
	anim_sound 6, 2, SFX_SLUDGE_BOMB
	anim_obj ANIM_OBJ_HEART_BURST, 152, 48, $1c
	anim_obj ANIM_OBJ_HIT_YFIX, 152, 48, $0
	anim_wait 3
	anim_obj ANIM_OBJ_STAR_BURST, 136, 56, $50
	anim_wait 3
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_HEART_BURST, 136, 56, $dc
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 56, $0
	anim_wait 3
	anim_obj ANIM_OBJ_STAR_BURST, 128, 48, $90
	anim_loop 2, .loop
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_ret

BattleAnim_ThrowPokeBall:
	anim_jumpif NO_ITEM, .TheTrainerBlockedTheBall
	anim_4gfx ANIM_GFX_POKE_BALL, ANIM_GFX_SMOKE, ANIM_GFX_SPEED, ANIM_GFX_STARS
	anim_jumpif DIVE_BALL, .LoadBallGfx2
	anim_jumpif LUXURY_BALL, .LoadBallGfx2
	anim_jumpif HEAL_BALL, .LoadBallGfx3
	anim_jumpif QUICK_BALL, .LoadBallGfx2
	anim_jumpif DUSK_BALL, .LoadBallGfx2
	anim_jumpif PREMIER_BALL, .LoadBallGfx3
	anim_jumpif CHERISH_BALL, .LoadBallGfx3
.return
	anim_sound 6, 2, SFX_THROW_BALL
	anim_obj ANIM_OBJ_POKE_BALL, 68, 92, $40
	anim_wait 36
	anim_jumpif BLOSSOM_TEA, .porygon
	anim_obj ANIM_OBJ_POKE_BALL, 136, 65, $0
	anim_setobj $2, $7
	anim_wait 16
	anim_sound 0, 1, SFX_BALL_POOF
	anim_obj ANIM_OBJ_BALL_POOF, 136, 64, $10
	anim_jumpif MASTER_BALL, .MasterBall
	; any other ball
	anim_wait 16
	anim_jump .Shake
.LoadBallGfx2:
	anim_1gfx ANIM_GFX_POKE_BALL_2
	anim_jump .return
.LoadBallGfx3:
	anim_1gfx ANIM_GFX_POKE_BALL_3
	anim_jump .return
.TheTrainerBlockedTheBall:
	anim_2gfx ANIM_GFX_POKE_BALL, ANIM_GFX_HIT
	anim_sound 6, 2, SFX_THROW_BALL
	anim_obj ANIM_OBJ_POKE_BALL_BLOCKED, 64, 92, $20
	anim_wait 20
	anim_obj ANIM_OBJ_HIT_YFIX, 112, 40, $0
.end
	anim_wait 32
	anim_ret
	
.porygon
	anim_clearobjs
	anim_jump .end

.MasterBall:
	anim_wait 24
	anim_sound 0, 1, SFX_MASTER_BALL
	anim_obj ANIM_OBJ_MASTER_BALL_SPARKLE, 136, 56, $30
	anim_obj ANIM_OBJ_MASTER_BALL_SPARKLE, 136, 56, $31
	anim_obj ANIM_OBJ_MASTER_BALL_SPARKLE, 136, 56, $32
	anim_obj ANIM_OBJ_MASTER_BALL_SPARKLE, 136, 56, $33
	anim_obj ANIM_OBJ_MASTER_BALL_SPARKLE, 136, 56, $34
	anim_obj ANIM_OBJ_MASTER_BALL_SPARKLE, 136, 56, $35
	anim_obj ANIM_OBJ_MASTER_BALL_SPARKLE, 136, 56, $36
	anim_obj ANIM_OBJ_MASTER_BALL_SPARKLE, 136, 56, $37
	anim_wait 64
.Shake:
	anim_bgeffect ANIM_BG_RETURN_MON, $0, $0, $0
	anim_wait 8
	anim_incobj  2
	anim_wait 16
	anim_sound 0, 1, SFX_CHANGE_DEX_MODE
	anim_incobj  1
	anim_wait 32
	anim_sound 0, 1, SFX_BALL_BOUNCE
;	anim_wait 32
;	anim_wait 32
;	anim_wait 32
;	anim_wait 8
	anim_wait 104
	anim_setvar $0
.Loop:
	anim_wait 48
	anim_checkpokeball
	anim_jumpvar $1, .Click
	anim_jumpvar $2, .BreakFree
	anim_incobj  1
	anim_sound 0, 1, SFX_BALL_WIGGLE
	anim_jump .Loop

.Click:
	anim_wait 20
	anim_sound 0, 1, SFX_GRASS_RUSTLE
	anim_wait 5
	anim_clearobjs
	anim_obj ANIM_OBJ_CAUGHT_BALL, 136, 64, $00
	anim_obj ANIM_OBJ_STAR_BURST, 140, 64, $50
	anim_obj ANIM_OBJ_STAR_BURST, 140, 64, $48
	anim_obj ANIM_OBJ_STAR_BURST, 140, 64, $cf
	anim_obj ANIM_OBJ_STAR_BURST, 140, 64, $dc
	anim_wait 24
	anim_clearsprites
	anim_ret

.BreakFree:
	anim_setobj $1, $b
	anim_sound 0, 1, SFX_BALL_POOF
	anim_obj ANIM_OBJ_BALL_POOF, 136, 64, $10
	anim_wait 2
	anim_bgeffect ANIM_BG_ENTER_MON, $0, $0, $0
	anim_wait 32
	anim_ret

BattleAnim_SendOutMon:
	anim_jumpif $1, .Shiny
	anim_1gfx ANIM_GFX_SMOKE
	anim_sound 0, 0, SFX_BALL_POOF
	anim_obj ANIM_OBJ_BALL_POOF, 44, 96, $0
	anim_wait 4
	anim_bgeffect ANIM_BG_ENTER_MON, $0, $1, $0
	anim_wait 32
	anim_ret

.Shiny:
	anim_1gfx ANIM_GFX_SPEED
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $3
	anim_call BattleAnimSub_BGCycleOBPalsGrayAndYellow_2
	anim_sound 0, 0, SFX_SHINE
	anim_obj ANIM_OBJ_SHINY, 48, 96, $0
	anim_wait 4
	anim_sound 0, 0, SFX_SHINE
	anim_obj ANIM_OBJ_SHINY, 48, 96, $8
	anim_wait 4
	anim_sound 0, 0, SFX_SHINE
	anim_obj ANIM_OBJ_SHINY, 48, 96, $10
	anim_wait 4
	anim_sound 0, 0, SFX_SHINE
	anim_obj ANIM_OBJ_SHINY, 48, 96, $18
	anim_wait 4
	anim_sound 0, 0, SFX_SHINE
	anim_obj ANIM_OBJ_SHINY, 48, 96, $20
	anim_wait 4
	anim_sound 0, 0, SFX_SHINE
	anim_obj ANIM_OBJ_SHINY, 48, 96, $28
	anim_wait 4
	anim_sound 0, 0, SFX_SHINE
	anim_obj ANIM_OBJ_SHINY, 48, 96, $30
	anim_wait 4
	anim_sound 0, 0, SFX_SHINE
	anim_obj ANIM_OBJ_SHINY, 48, 96, $38
	anim_wait 32
	anim_ret

BattleAnim_ReturnMon:
	anim_sound 0, 0, SFX_BALL_POOF
BattleAnim_BatonPass_branch_c9486:
	anim_bgeffect ANIM_BG_RETURN_MON, $0, $1, $0
	anim_wait 32
	anim_ret

BattleAnim_Confused:
	anim_1gfx ANIM_GFX_STATUS
	anim_sound 0, 0, SFX_KINESIS
	anim_obj ANIM_OBJ_CHICK, 44, 56, $15
	anim_obj ANIM_OBJ_CHICK, 44, 56, $aa
	anim_obj ANIM_OBJ_CHICK, 44, 56, $bf
	anim_wait 96
	anim_ret

BattleAnim_Brn:
	anim_1gfx ANIM_GFX_FIRE
.loop
	anim_sound 0, 0, SFX_BURN
	anim_obj ANIM_OBJ_BURNED, 56, 88, $10
	anim_wait 4
	anim_loop 3, .loop
	anim_wait 6
	anim_ret

BattleAnim_Psn:
	anim_1gfx ANIM_GFX_POISON
	anim_sound 0, 0, SFX_POISON
	anim_obj ANIM_OBJ_SKULL_CROSSBONE, 64, 56, $0
	anim_wait 8
	anim_sound 0, 0, SFX_POISON
	anim_obj ANIM_OBJ_SKULL_CROSSBONE, 48, 56, $0
	anim_wait 8
	anim_ret

BattleAnim_Sap:
	anim_setobjpal PAL_BATTLE_OB_YELLOW, PAL_BTLCUSTOM_LIME
	anim_call BattleAnimSub_BGCycleOBPalsGrayAndYellow_6
	anim_1gfx ANIM_GFX_CHARGE
	anim_sound 6, 3, SFX_WATER_GUN
	anim_obj ANIM_OBJ_ABSORB, 128, 48, $2
	anim_wait 6
	anim_sound 6, 3, SFX_WATER_GUN
	anim_obj ANIM_OBJ_ABSORB, 136, 64, $3
	anim_wait 6
	anim_sound 6, 3, SFX_WATER_GUN
	anim_obj ANIM_OBJ_ABSORB, 136, 32, $4
	anim_wait 16
	anim_ret

BattleAnim_Frz:
	anim_1gfx ANIM_GFX_ICE
	anim_obj ANIM_OBJ_FROZEN, 44, 110, $0
	anim_sound 0, 0, SFX_SHINE
	anim_wait 16
	anim_sound 0, 0, SFX_SHINE
	anim_wait 16
	anim_ret

BattleAnim_Par:
	anim_1gfx ANIM_GFX_STATUS
	anim_call BattleAnimSub_BGCycleOBPalsGrayAndYellow_2
	anim_sound 0, 0, SFX_THUNDERSHOCK
	anim_obj ANIM_OBJ_PARALYZED, 20, 88, $42
	anim_obj ANIM_OBJ_PARALYZED, 76, 88, $c2
	anim_wait 128
	anim_ret

BattleAnim_InLove:
	anim_1gfx ANIM_GFX_OBJECTS
	anim_sound 0, 0, SFX_LICK
	anim_obj ANIM_OBJ_HEART, 64, 76, $0
	anim_wait 32
	anim_sound 0, 0, SFX_LICK
	anim_obj ANIM_OBJ_HEART, 36, 72, $0
	anim_wait 32
	anim_ret

BattleAnim_UnderCurse:
	anim_1gfx ANIM_GFX_ANGELS
	anim_sound 0, 0, SFX_BUBBLE_BEAM
	anim_obj ANIM_OBJ_IN_NIGHTMARE, 68, 80, $0
	anim_wait 40
	anim_ret

BattleAnim_HitConfusion:
	anim_1gfx ANIM_GFX_HIT
	anim_sound 0, 0, SFX_POUND
	anim_obj ANIM_OBJ_HIT, 44, 96, $0
	anim_wait 16
	anim_ret

BattleAnim_Miss:
	anim_ret

BattleAnim_EnemyDamage:
.loop
	anim_bgeffect ANIM_BG_HIDE_MON, $0, $0, $0
	anim_wait 5
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $0, $0
	anim_wait 5
	anim_loop 3, .loop
	anim_ret

BattleAnim_EnemyStatDown:
	anim_call BattleAnim_FollowEnemyFeet_1
	anim_bgeffect ANIM_BG_VIBRATE_MON, $0, $0, $0
	anim_wait 40
	anim_call BattleAnim_ShowMon_1
	anim_wait 1
	anim_ret

BattleAnim_PlayerStatDown:
	anim_call BattleAnim_FollowEnemyFeet_1
	anim_bgeffect ANIM_BG_WOBBLE_PLAYER, $0, $0, $0
	anim_wait 40
	anim_call BattleAnim_ShowMon_1
	anim_wait 1
	anim_ret

BattleAnim_PlayerDamage:
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_Y, $20, $2, $20
	anim_wait 40
	anim_ret

BattleAnim_Wobble:
	anim_bgeffect ANIM_BG_WOBBLE_SCREEN, $0, $0, $0
	anim_wait 40
	anim_ret

BattleAnim_Shake:
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $20, $2, $40
	anim_wait 40
	anim_ret

BattleAnim_Acrobatics:
	anim_2gfx ANIM_GFX_SPEED, ANIM_GFX_HIT
	anim_battlergfx_1row
	anim_bgeffect ANIM_BG_BATTLEROBJ_2ROW, $0, $0, $0
	anim_wait 1
	anim_bgeffect ANIM_BG_SHAKE_MON_X, $0, $11, $4
.loop
	anim_sound 0, 0, SFX_SQUEAK
	anim_wait 8
	anim_loop 3, .loop
	anim_sound 0, 0, SFX_RAZOR_WIND
	anim_bgeffect ANIM_BG_HIDE_MON, $0, $1, $0
	anim_incbgeffect ANIM_BG_SHAKE_MON_X
	anim_obj ANIM_OBJ_SPEED_LINE, 24, 88, $2
	anim_obj ANIM_OBJ_SPEED_LINE, 32, 88, $1
	anim_obj ANIM_OBJ_SPEED_LINE, 40, 88, $0
	anim_obj ANIM_OBJ_SPEED_LINE, 48, 88, $80
	anim_obj ANIM_OBJ_SPEED_LINE, 56, 88, $81
	anim_obj ANIM_OBJ_SPEED_LINE, 64, 88, $82
	anim_wait 12
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $0, $0
	anim_wait 12
	anim_clearobjs
	anim_bgeffect ANIM_BG_CYCLE_MID_OBPALS_GRAY_AND_YELLOW, $0, $0, $0
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_HIT_YFIX, 140, 44, $0
	anim_wait 4
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_HIT_YFIX, 124, 60, $0
	anim_wait 4
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_HIT_YFIX, 140, 60, $0
	anim_wait 4
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_HIT_YFIX, 124, 44, $0
	anim_wait 4
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_HIT_YFIX, 132, 52, $0
	anim_wait 8
	anim_bgeffect ANIM_BG_CYCLE_MID_OBPALS_GRAY_AND_YELLOW, $0, $a, $0
	anim_wait 8
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_wait 16
	anim_ret

BattleAnim_DoubleSlap:
	anim_1gfx ANIM_GFX_HIT
	anim_sound 0, 1, SFX_DOUBLE_SLAP
	anim_jumpif2 $1, .alternate
	anim_obj ANIM_OBJ_PALM, 144, 48, $0
	anim_wait 6
	anim_obj ANIM_OBJ_HIT_YFIX, 144, 48, $0
	anim_wait 8
	anim_ret

.alternate
	anim_obj ANIM_OBJ_PALM, 120, 48, $0
	anim_wait 6
	anim_obj ANIM_OBJ_HIT_YFIX, 120, 48, $0
	anim_wait 8
	anim_ret

BattleAnim_Stomp:
	anim_1gfx ANIM_GFX_HIT
	anim_sound 0, 1, SFX_STOMP
	anim_obj ANIM_OBJ_KICK, 136, 40, $0
	anim_wait 6
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 40, $0
	anim_wait 6
	anim_sound 0, 1, SFX_STOMP
	anim_obj ANIM_OBJ_KICK, 136, 44, $0
	anim_wait 6
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 44, $0
	anim_wait 6
	anim_sound 0, 1, SFX_STOMP
	anim_obj ANIM_OBJ_KICK, 136, 48, $0
	anim_wait 6
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 48, $0
	anim_wait 16
	anim_ret

BattleAnim_DoubleKick: ; c96a7
	anim_1gfx ANIM_GFX_HIT
	anim_jumpif $1, BattleAnim_DoubleKick_branch_c96bd
	anim_sound 0, 1, SFX_DOUBLE_KICK
	anim_obj ANIM_OBJ_KICK, 144, 48, $0
	anim_wait 6
	anim_obj ANIM_OBJ_HIT_YFIX, 144, 48, $0
	anim_wait 8
	anim_ret
; c96bd

BattleAnim_DoubleKick_branch_c96bd: ; c96bd
	anim_sound 0, 1, SFX_DOUBLE_KICK
	anim_obj ANIM_OBJ_KICK, 120, 64, $0
	anim_wait 6
	anim_obj ANIM_OBJ_HIT_YFIX, 120, 64, $0
	anim_wait 8
	anim_ret

BattleAnim_HiJumpKick:
	anim_1gfx ANIM_GFX_HIT
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $40, $2, $0
	anim_jumpif $1, BattleAnim_HiJumpKick_branch_c971e
	anim_wait 32
	anim_sound 0, 1, SFX_JUMP_KICK
	anim_obj ANIM_OBJ_KICK, 112, 72, $0
	anim_setobj $1, $2
	anim_wait 16
	anim_sound 0, 1, SFX_DOUBLE_KICK
	anim_obj ANIM_OBJ_HIT, 136, 48, $0
	anim_wait 16
	anim_ret

BattleAnim_HiJumpKick_branch_c971e:
	anim_wait 16
	anim_sound 0, 0, SFX_DOUBLE_KICK
	anim_obj ANIM_OBJ_HIT, 44, 88, $0
	anim_wait 16
	anim_ret

BattleAnimSub_FocusBlast:
	anim_setobjpal PAL_BATTLE_OB_GRAY, PAL_BTLCUSTOM_GLOW_YELLOW
	anim_setobjpal PAL_BATTLE_OB_BLUE, PAL_BTLCUSTOM_RED
	anim_setobjpal PAL_BATTLE_OB_YELLOW, PAL_BTLCUSTOM_GLOW_YELLOW
	anim_setobjpal PAL_BATTLE_OB_RED, PAL_BTLCUSTOM_GLOW_YELLOW
	anim_3gfx ANIM_GFX_VORTEX, ANIM_GFX_WIND_BG, ANIM_GFX_SWIRL
	anim_bgeffect ANIM_BG_CYCLE_OBPALS_GRAY_AND_YELLOW, $0, $2, $0
	anim_call BattleAnimSub_AgilityMinor
	anim_sound 6, 2, SFX_OUTRAGE
.loop
	anim_obj ANIM_OBJ_SWIRL_SHORT, 44, 96, $0
	anim_wait 8
	anim_loop 4, .loop
	anim_obj ANIM_OBJ_VORTEX, 44, 96, $0
	anim_wait 64
	anim_clearobjs
	anim_wait 1
	anim_2gfx ANIM_GFX_BIG_GLOW_CLEAR, ANIM_GFX_FOCUS_BLAST
	anim_sound 0, 1, SFX_MEGA_PUNCH
.loop2
	anim_obj ANIM_OBJ_FOCUS_BLAST, 64, 88, $12
	anim_wait 32
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $10
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $60, $2, $0
	anim_sound 0, 1, SFX_EGG_BOMB
	anim_obj ANIM_OBJ_BIG_GLOW_CLEAR, 136, 48, $0
	anim_wait 40
	anim_ret

BattleAnim_Ember:
	anim_setobjpal PAL_BATTLE_OB_RED, PAL_BTLCUSTOM_FIRE
	anim_1gfx ANIM_GFX_FIRE
	anim_sound 6, 2, SFX_EMBER
	anim_obj ANIM_OBJ_EMBER, 64, 96, $12
	anim_wait 4
	anim_sound 6, 2, SFX_EMBER
	anim_obj ANIM_OBJ_EMBER, 64, 100, $14
	anim_wait 4
	anim_sound 6, 2, SFX_EMBER
	anim_obj ANIM_OBJ_EMBER, 64, 84, $13
	anim_wait 16
	anim_incobj 1
	anim_incobj 2
	anim_incobj 3
	anim_sound 0, 1, SFX_EMBER
	anim_obj ANIM_OBJ_EMBER, 120, 68, $30
	anim_obj ANIM_OBJ_EMBER, 132, 68, $30
	anim_obj ANIM_OBJ_EMBER, 144, 68, $30
	anim_wait 32
	anim_ret

BattleAnim_WillOWisp:
	anim_setobjpal PAL_BATTLE_OB_YELLOW, PAL_BTLCUSTOM_WILL_O_WISP
	anim_1gfx ANIM_GFX_FIRE
	anim_bgp $1b
	anim_sound 6, 2, SFX_SLUDGE_BOMB
	anim_obj ANIM_OBJ_DRAGON_RAGE, 64, 92, $0
	anim_wait 40
	anim_sound 0, 0, SFX_CURSE
.loop
	anim_obj ANIM_OBJ_SACRED_FIRE, 132, 68, $0
	anim_wait 8
	anim_loop 4, .loop
	anim_wait 48
	anim_ret

BattleAnim_FirePunch:
	anim_2gfx ANIM_GFX_HIT, ANIM_GFX_FIRE
	anim_call BattleAnimSub_Punch
	anim_call BattleAnimSub_Fire
	anim_wait 16
	anim_ret

BattleAnim_FireSpin:
	anim_setobjpal PAL_BATTLE_OB_RED, PAL_BTLCUSTOM_FIRE
	anim_1gfx ANIM_GFX_FIRE
.loop
	anim_sound 6, 2, SFX_EMBER
	anim_obj ANIM_OBJ_FIRE_SPIN, 64, 88, $4
	anim_wait 2
	anim_sound 6, 2, SFX_EMBER
	anim_obj ANIM_OBJ_FIRE_SPIN, 64, 96, $3
	anim_wait 2
	anim_sound 6, 2, SFX_EMBER
	anim_obj ANIM_OBJ_FIRE_SPIN, 64, 88, $3
	anim_wait 2
	anim_sound 6, 2, SFX_EMBER
	anim_obj ANIM_OBJ_FIRE_SPIN, 64, 96, $4
	anim_wait 2
	anim_loop 2, .loop
	anim_wait 96
	anim_ret

BattleAnim_DragonRage:
	anim_setobjpal PAL_BATTLE_OB_YELLOW, PAL_BTLCUSTOM_DRAGON_RAGE
	anim_1gfx ANIM_GFX_FIRE
.loop
	anim_sound 6, 2, SFX_EMBER
	anim_obj ANIM_OBJ_DRAGON_RAGE, 64, 92, $0
	anim_wait 3
	anim_loop 16, .loop
	anim_wait 64
	anim_ret

BattleAnim_Flamethrower:
	anim_setobjpal PAL_BATTLE_OB_RED, PAL_BTLCUSTOM_FIRE
	anim_1gfx ANIM_GFX_FIRE
	anim_sound 6, 2, SFX_EMBER
	anim_obj ANIM_OBJ_FLAMETHROWER, 64, 92, $3
	anim_wait 2
	anim_obj ANIM_OBJ_FLAMETHROWER, 75, 86, $5
	anim_wait 2
	anim_obj ANIM_OBJ_FLAMETHROWER, 85, 81, $7
	anim_wait 2
	anim_obj ANIM_OBJ_FLAMETHROWER, 96, 76, $9
	anim_wait 2
	anim_obj ANIM_OBJ_FLAMETHROWER, 106, 71, $b
	anim_wait 2
	anim_obj ANIM_OBJ_FLAMETHROWER, 116, 66, $c
	anim_wait 2
	anim_obj ANIM_OBJ_FLAMETHROWER, 126, 61, $a
	anim_wait 2
	anim_obj ANIM_OBJ_FLAMETHROWER, 136, 56, $8
	anim_wait 16
.loop
	anim_sound 0, 1, SFX_EMBER
	anim_wait 16
	anim_loop 6, .loop
	anim_wait 16
	anim_ret

BattleAnim_FireBlast:
	anim_setobjpal PAL_BATTLE_OB_RED, PAL_BTLCUSTOM_FIRE
	anim_1gfx ANIM_GFX_FIRE
.loop1
	anim_sound 6, 2, SFX_EMBER
	anim_obj ANIM_OBJ_FIRE_BLAST, 64, 92, $7
	anim_wait 6
	anim_loop 10, .loop1
.loop2
	anim_sound 0, 1, SFX_EMBER
	anim_wait 8
	anim_loop 10, .loop2
	anim_call BattleAnim_IncObj1to9
	anim_incobj 10
	anim_wait 2
.loop3
	anim_sound 0, 1, SFX_EMBER
	anim_obj ANIM_OBJ_FIRE_BLAST, 136, 56, $1
	anim_obj ANIM_OBJ_FIRE_BLAST, 136, 56, $2
	anim_obj ANIM_OBJ_FIRE_BLAST, 136, 56, $3
	anim_obj ANIM_OBJ_FIRE_BLAST, 136, 56, $4
	anim_obj ANIM_OBJ_FIRE_BLAST, 136, 56, $5
	anim_wait 16
	anim_loop 2, .loop3
	anim_wait 32
	anim_ret

BattleAnim_IcePunch:
	anim_2gfx ANIM_GFX_HIT, ANIM_GFX_ICE
	anim_call BattleAnimSub_Punch
	anim_call BattleAnimSub_Ice
	anim_wait 32
	anim_ret

BattleAnim_IceBeam:
	anim_setobjpal PAL_BATTLE_OB_BLUE, PAL_BTLCUSTOM_ICE
	anim_1gfx ANIM_GFX_ICE
.loop
	anim_sound 6, 2, SFX_SHINE
	anim_obj ANIM_OBJ_ICE_BEAM, 64, 92, $4
	anim_wait 4
	anim_loop 5, .loop
	anim_obj ANIM_OBJ_ICE_BUILDUP, 136, 74, $10
.loop2
	anim_sound 6, 2, SFX_SHINE
	anim_obj ANIM_OBJ_ICE_BEAM, 64, 92, $4
	anim_wait 4
	anim_loop 15, .loop2
	anim_wait 48
	anim_sound 0, 1, SFX_SHINE
	anim_wait 8
	anim_sound 0, 1, SFX_SHINE
	anim_wait 8
	anim_ret

BattleAnim_Blizzard:
	anim_setobjpal PAL_BATTLE_OB_BLUE, PAL_BTLCUSTOM_ICE
	anim_1gfx ANIM_GFX_ICE
.loop
	anim_sound 6, 2, SFX_SHINE
	anim_obj ANIM_OBJ_BLIZZARD, 64, 88, $63
	anim_wait 2
	anim_sound 6, 2, SFX_SHINE
	anim_obj ANIM_OBJ_BLIZZARD, 64, 80, $64
	anim_wait 2
	anim_sound 6, 2, SFX_SHINE
	anim_obj ANIM_OBJ_BLIZZARD, 64, 96, $63
	anim_wait 2
	anim_loop 3, .loop
	anim_bgeffect ANIM_BG_WHITE_HUES, $0, $8, $0
	anim_wait 32
	anim_obj ANIM_OBJ_ICE_BUILDUP, 136, 74, $10
	anim_wait 128
	anim_sound 0, 1, SFX_SHINE
	anim_wait 8
	anim_sound 0, 1, SFX_SHINE
	anim_wait 24
	anim_ret

BattleAnim_BubbleBeam:
	anim_setobjpal PAL_BATTLE_OB_BLUE, PAL_BTLCUSTOM_BUBBLE
	anim_1gfx ANIM_GFX_BUBBLE
.loop
	anim_sound 16, 2, SFX_BUBBLE_BEAM
	anim_obj ANIM_OBJ_BUBBLE, 64, 92, $92
	anim_wait 6
	anim_sound 16, 2, SFX_BUBBLE_BEAM
	anim_obj ANIM_OBJ_BUBBLE, 64, 92, $b3
	anim_wait 6
	anim_sound 16, 2, SFX_BUBBLE_BEAM
	anim_obj ANIM_OBJ_BUBBLE, 64, 92, $f4
	anim_wait 8
	anim_loop 3, .loop
	anim_wait 64
	anim_clearobjs
	anim_bgeffect ANIM_BG_START_WATER, $0, $0, $0
	anim_wait 1
	anim_call BattleAnim_FollowPlayerHead_1
	anim_bgeffect ANIM_BG_WATER, $1c, $0, $0
	anim_wait 19
	anim_call BattleAnim_ShowMon_1
	anim_bgeffect ANIM_BG_END_WATER, $0, $0, $0
	anim_wait 8
	anim_ret

BattleAnim_WaterGun:
	anim_setobjpal PAL_BATTLE_OB_BLUE, PAL_BTLCUSTOM_WATER
	anim_bgeffect ANIM_BG_START_WATER, $0, $0, $0
	anim_1gfx ANIM_GFX_WATER
	anim_call BattleAnim_FollowPlayerHead_1
	anim_sound 16, 2, SFX_WATER_GUN
	anim_obj ANIM_OBJ_WATER_GUN, 64, 88, $0
	anim_wait 8
	anim_obj ANIM_OBJ_WATER_GUN, 64, 76, $0
	anim_wait 8
	anim_obj ANIM_OBJ_WATER_GUN, 64, 82, $0
	anim_wait 24
	anim_bgeffect ANIM_BG_WATER, $1c, $0, $0
	anim_wait 8
	anim_bgeffect ANIM_BG_WATER, $8, $0, $0
	anim_wait 8
	anim_bgeffect ANIM_BG_WATER, $30, $0, $0
	anim_wait 32
	anim_call BattleAnim_ShowMon_1
	anim_bgeffect ANIM_BG_END_WATER, $0, $0, $0
	anim_wait 16
	anim_ret

BattleAnim_HydroPump:
	anim_setobjpal PAL_BATTLE_OB_BLUE, PAL_BTLCUSTOM_WATER
	anim_2gfx ANIM_GFX_WATER, ANIM_GFX_WATER_BALL
	anim_battlergfx_1row
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $40, $2, $0
.loop
	anim_sound 0, 1, SFX_AEROBLAST
	anim_obj ANIM_OBJ_HYDRO_PUMP_SHOT, 64, 88, $6
	anim_wait 1
	anim_obj ANIM_OBJ_HYDRO_PUMP_SHOT, 64, 88, $6
	anim_wait 1
	anim_loop 14, .loop
	anim_wait 6
	anim_bgeffect ANIM_BG_BATTLEROBJ_2ROW, $0, $1, $0
	anim_wait 2
	anim_bgeffect ANIM_BG_NIGHT_SHADE, $0, $0, $8
	anim_sound 0, 1, SFX_HYDRO_PUMP
	anim_obj ANIM_OBJ_HYDRO_PUMP, 132, 72, $3a
	anim_wait 8
	anim_obj ANIM_OBJ_HYDRO_PUMP, 124, 72, $3a
	anim_wait 8
	anim_obj ANIM_OBJ_HYDRO_PUMP, 140, 72, $3a
	anim_wait 8
	anim_obj ANIM_OBJ_HYDRO_PUMP, 116, 72, $3a
	anim_wait 8
	anim_obj ANIM_OBJ_HYDRO_PUMP, 148, 72, $3a
	anim_wait 8
	anim_obj ANIM_OBJ_HYDRO_PUMP, 108, 72, $3a
	anim_wait 8
	anim_obj ANIM_OBJ_HYDRO_PUMP, 156, 72, $3a
	anim_wait 32
	anim_incbgeffect ANIM_BG_NIGHT_SHADE
	anim_call BattleAnim_ShowMon_1
	anim_wait 16
	anim_ret

BattleAnim_Surf:
	anim_setobjpal PAL_BATTLE_OB_BLUE, PAL_BTLCUSTOM_WATER
	anim_1gfx ANIM_GFX_BUBBLE
	anim_bgeffect ANIM_BG_SURF, $0, $0, $0
	anim_obj ANIM_OBJ_SURF, 88, 104, $8
.loop
	anim_sound 0, 1, SFX_SURF
	anim_wait 112
	anim_loop 1, .loop
	anim_incobj  1
	anim_wait 56
	anim_ret

BattleAnim_VineWhip:
	anim_2gfx ANIM_GFX_WHIP, ANIM_GFX_HIT
	anim_sound 0, 1, SFX_VINE_WHIP
	anim_obj ANIM_OBJ_VINE_WHIP2, 116, 48, $80
	anim_wait 4
	anim_sound 0, 1, SFX_VINE_WHIP
	anim_obj ANIM_OBJ_VINE_WHIP1, 128, 54, $0
	anim_wait 8
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 56, $0
	anim_incobj  1
	anim_wait 16
	anim_ret

BattleAnim_LeechSeed:
	anim_1gfx ANIM_GFX_PLANT
	anim_sound 16, 2, SFX_VINE_WHIP
	anim_obj ANIM_OBJ_LEECH_SEED, 48, 80, $20
	anim_wait 8
	anim_sound 16, 2, SFX_VINE_WHIP
	anim_obj ANIM_OBJ_LEECH_SEED, 48, 80, $30
	anim_wait 8
	anim_sound 16, 2, SFX_VINE_WHIP
	anim_obj ANIM_OBJ_LEECH_SEED, 48, 80, $28
	anim_wait 32
	anim_sound 0, 1, SFX_CHARGE
	anim_wait 128
	anim_ret

BattleAnim_RazorLeaf:
	anim_1gfx ANIM_GFX_PLANT
	anim_sound 0, 0, SFX_VINE_WHIP
	anim_obj ANIM_OBJ_RAZOR_LEAF, 48, 80, $28
	anim_obj ANIM_OBJ_RAZOR_LEAF, 48, 80, $5c
	anim_obj ANIM_OBJ_RAZOR_LEAF, 48, 80, $10
	anim_obj ANIM_OBJ_RAZOR_LEAF, 48, 80, $e8
	anim_obj ANIM_OBJ_RAZOR_LEAF, 48, 80, $9c
	anim_obj ANIM_OBJ_RAZOR_LEAF, 48, 80, $d0
	anim_wait 6
	anim_obj ANIM_OBJ_RAZOR_LEAF, 48, 80, $1c
	anim_obj ANIM_OBJ_RAZOR_LEAF, 48, 80, $50
	anim_obj ANIM_OBJ_RAZOR_LEAF, 48, 80, $dc
	anim_obj ANIM_OBJ_RAZOR_LEAF, 48, 80, $90
	anim_wait 80
	anim_sound 16, 2, SFX_VINE_WHIP
	anim_incobj  3
	anim_wait 2
	anim_sound 16, 2, SFX_VINE_WHIP
	anim_incobj  5
	anim_wait 2
	anim_sound 16, 2, SFX_VINE_WHIP
	anim_incobj  7
	anim_wait 2
	anim_sound 16, 2, SFX_VINE_WHIP
	anim_incobj  9
	anim_wait 2
	anim_sound 16, 2, SFX_VINE_WHIP
	anim_incobj  1
	anim_wait 2
	anim_sound 16, 2, SFX_VINE_WHIP
	anim_incobj  2
	anim_wait 2
	anim_sound 16, 2, SFX_VINE_WHIP
	anim_incobj  4
	anim_wait 2
	anim_sound 16, 2, SFX_VINE_WHIP
	anim_incobj  6
	anim_wait 2
	anim_sound 16, 2, SFX_VINE_WHIP
	anim_incobj  8
	anim_wait 2
	anim_sound 16, 2, SFX_VINE_WHIP
	anim_incobj 10
	anim_wait 64
	anim_ret

BattleAnim_SolarBeam:
	anim_jumpif $0, .FireSolarBeam
	anim_call BattleAnimSub_BGCycleOBPalsGrayAndYellow_2
	anim_1gfx ANIM_GFX_CHARGE
	anim_sound 0, 0, SFX_CHARGE
	anim_obj ANIM_OBJ_ABSORB_CENTER, 48, 84, $0
	anim_obj ANIM_OBJ_SOLAR_BEAM_CHARGE, 48, 84, $0
	anim_obj ANIM_OBJ_SOLAR_BEAM_CHARGE, 48, 84, $8
	anim_obj ANIM_OBJ_SOLAR_BEAM_CHARGE, 48, 84, $10
	anim_obj ANIM_OBJ_SOLAR_BEAM_CHARGE, 48, 84, $18
	anim_obj ANIM_OBJ_SOLAR_BEAM_CHARGE, 48, 84, $20
	anim_obj ANIM_OBJ_SOLAR_BEAM_CHARGE, 48, 84, $28
	anim_obj ANIM_OBJ_SOLAR_BEAM_CHARGE, 48, 84, $30
	anim_obj ANIM_OBJ_SOLAR_BEAM_CHARGE, 48, 84, $38
	anim_wait 104
	anim_bgeffect ANIM_BG_FLASH_WHITE, $0, $4, $2
	anim_wait 64
	anim_ret

.FireSolarBeam:
	anim_setobjpal PAL_BATTLE_OB_YELLOW, PAL_BTLCUSTOM_LIME
	anim_1gfx ANIM_GFX_BEAM_SOLAR
	anim_call BattleAnimSub_BGCycleOBPalsGrayAndYellow_2
	anim_bgeffect ANIM_BG_ALTERNATE_HUES, $0, $2, $0
	anim_call BattleAnim_Beam_Branch
	anim_wait 48
	anim_ret

BattleAnim_Thunderpunch:
	anim_2gfx ANIM_GFX_HIT, ANIM_GFX_LIGHTNING
	anim_call BattleAnimSub_Punch
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $2
	anim_call BattleAnimSub_BGCycleOBPalsGrayAndYellow_2
	anim_sound 0, 1, SFX_THUNDER
	anim_obj ANIM_OBJ_THUNDER_RIGHT, 152, 68, $0
	anim_wait 64
	anim_ret

BattleAnim_Thundershock:
	anim_2gfx ANIM_GFX_LIGHTNING, ANIM_GFX_EXPLOSION
	anim_call BattleAnimSub_BGCycleOBPalsGrayAndYellow_2
	anim_obj ANIM_OBJ_THUNDERSHOCK_CORE, 132, 52, $2
	anim_wait 16
	anim_sound 0, 1, SFX_THUNDERSHOCK
	anim_obj ANIM_OBJ_THUNDERSHOCK_SPARKS, 132, 52, $0
	anim_wait 96
	anim_ret

BattleAnim_Thunderbolt:
	anim_2gfx ANIM_GFX_LIGHTNING, ANIM_GFX_EXPLOSION
	anim_call BattleAnimSub_BGCycleOBPalsGrayAndYellow_2
	anim_obj ANIM_OBJ_THUNDERBOLT_CORE, 132, 52, $2
	anim_wait 16
	anim_obj ANIM_OBJ_THUNDERBOLT_SPARKS, 132, 52, $0
.loop
		anim_sound 0, 1, SFX_THUNDERBOLT
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $7, $6
	anim_wait 66
	anim_loop 2, .loop
	anim_ret

BattleAnim_ThunderWave:
	anim_1gfx ANIM_GFX_LIGHTNING
	anim_call BattleAnimSub_BGCycleOBPalsGrayAndYellow_2
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $3
	anim_sound 0, 1, SFX_THUNDERSHOCK
	anim_obj ANIM_OBJ_THUNDER_WAVE, 136, 50, $0
	anim_wait 20
	anim_bgp $1b
	anim_incobj  1
	anim_wait 96
	anim_bgp $e4
	anim_ret

BattleAnim_Thunder:
	anim_1gfx ANIM_GFX_LIGHTNING
	anim_call BattleAnimSub_BGCycleOBPalsGrayAndYellow_2
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $6, $20
	anim_sound 0, 1, SFX_THUNDER
	anim_obj ANIM_OBJ_THUNDER_LEFT, 120, 68, $0
	anim_wait 16
	anim_sound 0, 1, SFX_THUNDER
	anim_obj ANIM_OBJ_THUNDER_RIGHT, 152, 68, $0
	anim_wait 16
	anim_sound 0, 1, SFX_THUNDER
	anim_obj ANIM_OBJ_THUNDER_CENTER, 136, 68, $0
	anim_wait 48
	anim_ret

BattleAnim_AirSlash:
	anim_2gfx ANIM_GFX_CUT, ANIM_GFX_WHIP
	anim_bgeffect ANIM_BG_CYCLE_MID_OBPALS_GRAY_AND_YELLOW, $0, $2, $0
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $0a, $2, $0
	anim_sound 0, 1, SFX_CUT
	anim_obj ANIM_OBJ_CUT_LONG_DOWN_LEFT, 152, 40, $0
	anim_obj ANIM_OBJ_RAZOR_WIND2, 144, 40, $3
	anim_obj ANIM_OBJ_RAZOR_WIND2, 152, 48, $3
	anim_wait 4
	anim_obj ANIM_OBJ_RAZOR_WIND2, 136, 48, $3
	anim_obj ANIM_OBJ_RAZOR_WIND2, 144, 56, $3
	anim_wait 4
	anim_obj ANIM_OBJ_RAZOR_WIND2, 128, 56, $3
	anim_obj ANIM_OBJ_RAZOR_WIND2, 136, 64, $3
	anim_wait 4
	anim_obj ANIM_OBJ_RAZOR_WIND2, 120, 64, $3
	anim_obj ANIM_OBJ_RAZOR_WIND2, 128, 72, $3
	anim_wait 32
	anim_ret

BattleAnim_Gust:
	anim_2gfx ANIM_GFX_WIND, ANIM_GFX_HIT
.loop
	anim_sound 0, 1, SFX_RAZOR_WIND
	anim_obj ANIM_OBJ_GUST, 136, 72, $0
	anim_wait 6
	anim_loop 9, .loop
	anim_obj ANIM_OBJ_HIT_YFIX, 144, 64, $18
	anim_wait 8
	anim_obj ANIM_OBJ_HIT_YFIX, 128, 32, $18
	anim_wait 16
	anim_ret

BattleAnim_Selfdestruct:
	anim_1gfx ANIM_GFX_EXPLOSION
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $24
	anim_jumpif $1, .loop
	anim_call BattleAnim_Explosion_2_Branch
	anim_wait 16
	anim_ret

.loop
	anim_call BattleAnim_Explosion_1_Branch
	anim_wait 5
	anim_bgeffect ANIM_BG_HIDE_MON, $0, $1, $0
	anim_loop 2, .loop
	anim_wait 16
	anim_ret

BattleAnim_Explosion:
	anim_1gfx ANIM_GFX_EXPLOSION
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $60, $4, $10
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $24
	anim_jumpif $1, .loop
	anim_call BattleAnim_Explosion_2_Branch
	anim_wait 16
	anim_ret

.loop
	anim_call BattleAnim_Explosion_1_Branch
	anim_wait 5
	anim_bgeffect ANIM_BG_HIDE_MON, $0, $1, $0
	anim_loop 2, .loop
	anim_wait 16
	anim_ret

BattleAnim_Acid:
	anim_setobjpal PAL_BATTLE_OB_GRAY, PAL_BTLCUSTOM_ACID
	anim_1gfx ANIM_GFX_POISON
	anim_call BattleAnimSub_Acid
	anim_obj ANIM_OBJ_POISON_DROPLET, 128, 36, $11
	anim_wait 4
	anim_obj ANIM_OBJ_POISON_DROPLET, 144, 36, $0f
	anim_wait 4
	anim_obj ANIM_OBJ_POISON_DROPLET, 124, 36, $11
	anim_wait 4
	anim_obj ANIM_OBJ_POISON_DROPLET, 148, 36, $0f
	anim_wait 4
	anim_obj ANIM_OBJ_POISON_DROPLET, 120, 36, $11
	anim_wait 48
	anim_ret

BattleAnim_RockThrow:
	anim_1gfx ANIM_GFX_ROCKS
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $60, $1, $0
	anim_sound 0, 1, SFX_STRENGTH
	anim_obj ANIM_OBJ_SMALL_ROCK, 128, 64, $40
	anim_wait 2
	anim_sound 0, 1, SFX_STRENGTH
	anim_obj ANIM_OBJ_BIG_ROCK, 120, 68, $30
	anim_wait 2
	anim_sound 0, 1, SFX_STRENGTH
	anim_obj ANIM_OBJ_SMALL_ROCK, 152, 68, $30
	anim_wait 2
	anim_sound 0, 1, SFX_STRENGTH
	anim_obj ANIM_OBJ_BIG_ROCK, 144, 64, $40
	anim_wait 2
	anim_sound 0, 1, SFX_STRENGTH
	anim_obj ANIM_OBJ_SMALL_ROCK, 136, 68, $30
	anim_wait 96
	anim_ret

BattleAnim_RockSlide:
	anim_1gfx ANIM_GFX_ROCKS
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $c0, $1, $0
.loop
	anim_sound 0, 1, SFX_STRENGTH
	anim_obj ANIM_OBJ_SMALL_ROCK, 128, 64, $40
	anim_wait 4
	anim_sound 0, 1, SFX_STRENGTH
	anim_obj ANIM_OBJ_BIG_ROCK, 120, 68, $30
	anim_wait 4
	anim_sound 0, 1, SFX_STRENGTH
	anim_obj ANIM_OBJ_SMALL_ROCK, 152, 68, $30
	anim_wait 4
	anim_sound 0, 1, SFX_STRENGTH
	anim_obj ANIM_OBJ_BIG_ROCK, 144, 64, $40
	anim_wait 4
	anim_sound 0, 1, SFX_STRENGTH
	anim_obj ANIM_OBJ_SMALL_ROCK, 136, 68, $30
	anim_wait 16
	anim_loop 4, .loop
	anim_wait 96
	anim_ret

BattleAnim_Sing:
	anim_jumpif $1, BattleAnim_Hypnosis
	anim_1gfx ANIM_GFX_NOISE
	anim_sound 16, 2, SFX_SING
.loop
	anim_obj ANIM_OBJ_SING, 64, 92, $0
	anim_wait 8
	anim_obj ANIM_OBJ_SING, 64, 92, $1
	anim_wait 8
	anim_obj ANIM_OBJ_SING, 64, 92, $2
	anim_wait 8
	anim_obj ANIM_OBJ_SING, 64, 92, $0
	anim_wait 8
	anim_obj ANIM_OBJ_SING, 64, 92, $2
	anim_wait 8
	anim_loop 4, .loop
	anim_wait 64
	anim_ret

BattleAnim_Poisonpowder:
	anim_setobjpal PAL_BATTLE_OB_GRAY, PAL_BTLCUSTOM_PURPLE
	anim_jump BattleAnim_StunSpore.start
BattleAnim_SleepPowder:
	anim_setobjpal PAL_BATTLE_OB_GRAY, PAL_BTLCUSTOM_GREEN
	anim_jump BattleAnim_StunSpore.start
BattleAnim_StunSpore:
	anim_setobjpal PAL_BATTLE_OB_GRAY, PAL_BTLCUSTOM_YELLOW
.start
	anim_1gfx ANIM_GFX_POWDER
.loop
	anim_sound 0, 1, SFX_POWDER
	anim_obj ANIM_OBJ_POWDER, 104, 16, $0
	anim_wait 4
	anim_sound 0, 1, SFX_POWDER
	anim_obj ANIM_OBJ_POWDER, 136, 16, $0
	anim_wait 4
	anim_sound 0, 1, SFX_POWDER
	anim_obj ANIM_OBJ_POWDER, 112, 16, $0
	anim_wait 4
	anim_sound 0, 1, SFX_POWDER
	anim_obj ANIM_OBJ_POWDER, 128, 16, $0
	anim_wait 4
	anim_sound 0, 1, SFX_POWDER
	anim_obj ANIM_OBJ_POWDER, 120, 16, $0
	anim_wait 4
	anim_loop 2, .loop
	anim_wait 96
	anim_ret

BattleAnim_Spore:
	anim_setobjpal PAL_BATTLE_OB_RED, PAL_BTLCUSTOM_DRAGONBREATH
	anim_3gfx ANIM_GFX_MUSHROOM, ANIM_GFX_POWDER, ANIM_GFX_SMOKE
	anim_sound 0, 1, SFX_JUMP_OVER_LEDGE
	anim_obj ANIM_OBJ_BALL_POOF_YFIX, 48, 88, $0
	anim_wait 12
	anim_obj ANIM_OBJ_MUSHROOM, 48, 88, $0
	anim_wait 32
	anim_setobjpal PAL_BATTLE_OB_GRAY, PAL_BTLCUSTOM_SPORE
	anim_sound 0, 1, SFX_SWEET_SCENT_2
	anim_obj ANIM_OBJ_POWDER_SHOOT, 48, 88, $35
	anim_obj ANIM_OBJ_POWDER_SHOOT, 48, 88, $2b
	anim_obj ANIM_OBJ_POWDER_SHOOT, 48, 88, $39
	anim_obj ANIM_OBJ_POWDER_SHOOT, 48, 88, $27
	anim_bgeffect ANIM_BG_ALTERNATE_HUES, $0, $2, $0
	anim_call BattleAnimSub_BGCycleOBPalsGrayAndYellow_2
	anim_wait 16
	anim_jump BattleAnim_StunSpore.loop

BattleAnim_HyperBeam:
	anim_1gfx ANIM_GFX_BEAM
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $30, $4, $10
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $40
	anim_call BattleAnimSub_BGCycleOBPalsGrayAndYellow_2
	anim_call BattleAnim_Beam_Branch
	anim_wait 48
	anim_ret

BattleAnim_AuroraBeam:
	anim_setobjpal PAL_BATTLE_OB_YELLOW, PAL_BTLCUSTOM_AURORA
	anim_1gfx ANIM_GFX_BEAM_AURORA
	anim_bgeffect ANIM_BG_CYCLE_OBPALS_GRAY_AND_YELLOW_FULL_SHIFT, $0, $2, $0
	anim_bgeffect ANIM_BG_ALTERNATE_HUES, $0, $2, $0
	anim_wait 64
	anim_call BattleAnim_Beam_Branch
	anim_wait 48
	anim_incobj  5
	anim_wait 64
	anim_ret

BattleAnim_Scratch:
	anim_1gfx ANIM_GFX_CUT
.hit
	anim_sound 0, 1, SFX_SCRATCH
	anim_call BattleAnimSub_Scratch
	anim_wait 32
	anim_ret

BattleAnim_FuryStrikes:
	anim_jumpif $6, BattleAnim_SpikeCannon
	anim_jumpif $5, BattleAnim_Barrage
	anim_jumpif $4, BattleAnim_DoubleSlap
	anim_jumpif $3, BattleAnim_CometPunch
	anim_jumpif $2, BattleAnim_FuryAttack
BattleAnim_FurySwipes:
	anim_1gfx ANIM_GFX_CUT
	anim_jumpif2 $1, .alternate
	anim_jump BattleAnim_Scratch.hit
	anim_ret

.alternate
	anim_sound 0, 1, SFX_SCRATCH
	anim_obj ANIM_OBJ_CUT_DOWN_RIGHT, 120, 48, $0
	anim_obj ANIM_OBJ_CUT_DOWN_RIGHT, 124, 44, $0
	anim_obj ANIM_OBJ_CUT_DOWN_RIGHT, 128, 40, $0
	anim_wait 32
	anim_ret

BattleAnimSub_Scratch:
	anim_obj ANIM_OBJ_CUT_DOWN_LEFT, 144, 48, $0
	anim_obj ANIM_OBJ_CUT_DOWN_LEFT, 140, 44, $0
	anim_obj ANIM_OBJ_CUT_DOWN_LEFT, 136, 40, $0
	anim_ret
	
BattleAnim_Barrage:
	anim_2gfx ANIM_GFX_EGG, ANIM_GFX_EXPLOSION
	anim_sound 6, 2, SFX_THROW_BALL
	anim_obj ANIM_OBJ_SLUDGE_BOMB, 64, 92, $10
	anim_wait 36
	anim_sound 0, 1, SFX_EGG_BOMB
	anim_obj ANIM_OBJ_EXPLOSION2, 136, 56, $0
	anim_wait 16
	anim_ret

BattleAnim_WeatherBall:
	anim_2gfx ANIM_GFX_WEATHER_BALL, ANIM_GFX_HIT
	anim_bgeffect ANIM_BG_CYCLE_OBPALS_GRAY_AND_YELLOW, $0, $2, $0
	anim_sound 0, 0, SFX_ATTRACT
	anim_obj ANIM_OBJ_WEATHER_BALL_RISE, 48, 88, $32
	anim_wait 64
	anim_clearobjs

	; default to NORMAL
	anim_jumpif $1, .water
	anim_jumpif $2, .fire
	anim_jumpif $3, .rock
	anim_jumpif $4, .ice

	; NORMAL
	anim_sound 0, 0, SFX_METRONOME
	anim_obj ANIM_OBJ_WEATHER_BALL_FALL, 112, 188, $0e
	anim_wait 80
	anim_sound 0, 1, SFX_HEADBUTT
	anim_obj ANIM_OBJ_HIT_BIG_YFIX, 136, 48, $0
	anim_wait 16
	anim_ret

.water
	anim_3gfx ANIM_GFX_WEATHER_BALL, ANIM_GFX_HIT, ANIM_GFX_BUBBLE
	anim_bgeffect ANIM_BG_FLASH_WHITE, $0, $4, $2
	anim_setobjpal PAL_BATTLE_OB_GRAY, PAL_BTLCUSTOM_WATER
	anim_setobjpal PAL_BATTLE_OB_BLUE, PAL_BTLCUSTOM_BUBBLE
	anim_sound 0, 0, SFX_SWEET_KISS
	anim_obj ANIM_OBJ_WEATHER_BALL_FALL, 112, 188, $0e
	anim_wait 16
	anim_sound 0, 0, SFX_METRONOME
	anim_wait 64
	anim_sound 0, 0, SFX_TOXIC
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 48, $0
	anim_obj ANIM_OBJ_BUBBLE_SPLASH, 136, 56, $28
	anim_obj ANIM_OBJ_BUBBLE_SPLASH, 136, 56, $5c
	anim_obj ANIM_OBJ_BUBBLE_SPLASH, 136, 56, $10
	anim_obj ANIM_OBJ_BUBBLE_SPLASH, 136, 56, $e8
	anim_obj ANIM_OBJ_BUBBLE_SPLASH, 136, 56, $9c
	anim_obj ANIM_OBJ_BUBBLE_SPLASH, 136, 56, $d0
	anim_wait 6
	anim_sound 0, 0, SFX_TOXIC
	anim_obj ANIM_OBJ_BUBBLE_SPLASH, 136, 56, $1c
	anim_obj ANIM_OBJ_BUBBLE_SPLASH, 136, 56, $50
	anim_obj ANIM_OBJ_BUBBLE_SPLASH, 136, 56, $dc
	anim_obj ANIM_OBJ_BUBBLE_SPLASH, 136, 56, $90
	anim_wait 16
	anim_ret

.fire
	anim_3gfx ANIM_GFX_WEATHER_BALL, ANIM_GFX_HIT, ANIM_GFX_FIRE
	anim_bgeffect ANIM_BG_FLASH_WHITE, $0, $4, $2
	anim_setobjpal PAL_BATTLE_OB_GRAY, PAL_BTLCUSTOM_FIRE
	anim_setobjpal PAL_BATTLE_OB_RED, PAL_BTLCUSTOM_FIRE
	anim_sound 0, 0, SFX_SWEET_KISS
	anim_obj ANIM_OBJ_WEATHER_BALL_FALL, 112, 188, $0e
	anim_wait 16
	anim_sound 0, 0, SFX_METRONOME
	anim_wait 64
	anim_sound 0, 0, SFX_BURN
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 48, $0
	anim_obj ANIM_OBJ_RADIAL_FLAME_SLOW, 136, 48, $6
	anim_obj ANIM_OBJ_RADIAL_FLAME_SLOW, 136, 48, $16
	anim_obj ANIM_OBJ_RADIAL_FLAME_SLOW, 136, 48, $26
	anim_obj ANIM_OBJ_RADIAL_FLAME_SLOW, 136, 48, $36
	anim_wait 6
	anim_sound 0, 0, SFX_BURN
	anim_obj ANIM_OBJ_RADIAL_FLAME_SLOW, 136, 48, $e
	anim_obj ANIM_OBJ_RADIAL_FLAME_SLOW, 136, 48, $1e
	anim_obj ANIM_OBJ_RADIAL_FLAME_SLOW, 136, 48, $2e
	anim_obj ANIM_OBJ_RADIAL_FLAME_SLOW, 136, 48, $3e
	anim_wait 16
	anim_ret

.rock
	anim_3gfx ANIM_GFX_WEATHER_BALL, ANIM_GFX_HIT, ANIM_GFX_ROCKS
	anim_bgeffect ANIM_BG_FLASH_WHITE, $0, $4, $2
	anim_setobjpal PAL_BATTLE_OB_GRAY, PAL_BTLCUSTOM_BROWN
	anim_sound 0, 0, SFX_SWEET_KISS
	anim_obj ANIM_OBJ_WEATHER_BALL_FALL, 112, 188, $0e
	anim_wait 16
	anim_sound 0, 0, SFX_METRONOME
	anim_wait 64
	anim_jump BattleAnim_RockSmash.hit

.ice
	anim_3gfx ANIM_GFX_WEATHER_BALL, ANIM_GFX_HIT, ANIM_GFX_ICE
	anim_bgeffect ANIM_BG_FLASH_WHITE, $0, $4, $2
	anim_setobjpal PAL_BATTLE_OB_GRAY, PAL_BTLCUSTOM_ICE
	anim_setobjpal PAL_BATTLE_OB_BLUE, PAL_BTLCUSTOM_ICE
	anim_sound 0, 0, SFX_SWEET_KISS
	anim_obj ANIM_OBJ_WEATHER_BALL_FALL, 112, 188, $0e
	anim_wait 16
	anim_sound 0, 0, SFX_METRONOME
	anim_wait 64
	anim_sound 0, 1, SFX_SHINE
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 48, $0
	anim_obj ANIM_OBJ_ICE_SPLASH, 136, 56, $28
	anim_obj ANIM_OBJ_ICE_SPLASH, 136, 56, $5c
	anim_obj ANIM_OBJ_ICE_SPLASH, 136, 56, $10
	anim_obj ANIM_OBJ_ICE_SPLASH, 136, 56, $e8
	anim_obj ANIM_OBJ_ICE_SPLASH, 136, 56, $9c
	anim_obj ANIM_OBJ_ICE_SPLASH, 136, 56, $d0
	anim_wait 6
	anim_sound 0, 1, SFX_SHINE
	anim_obj ANIM_OBJ_ICE_SPLASH, 136, 56, $1c
	anim_obj ANIM_OBJ_ICE_SPLASH, 136, 56, $50
	anim_obj ANIM_OBJ_ICE_SPLASH, 136, 56, $dc
	anim_obj ANIM_OBJ_ICE_SPLASH, 136, 56, $90
	anim_wait 16
	anim_ret

BattleAnim_FuryAttack:
	anim_2gfx ANIM_GFX_HORN, ANIM_GFX_HIT
	anim_obj ANIM_OBJ_HORN, 72, 72, $2
	anim_wait 8
	anim_sound 0, 1, SFX_HORN_ATTACK
	anim_obj ANIM_OBJ_HIT, 128, 40, $0
	anim_wait 8
	anim_obj ANIM_OBJ_HORN, 80, 88, $2
	anim_wait 8
	anim_sound 0, 1, SFX_HORN_ATTACK
	anim_obj ANIM_OBJ_HIT, 136, 56, $0
	anim_wait 8
	anim_obj ANIM_OBJ_HORN, 76, 80, $2
	anim_wait 8
	anim_sound 0, 1, SFX_HORN_ATTACK
	anim_obj ANIM_OBJ_HIT, 132, 48, $0
	anim_wait 8
	anim_ret

BattleAnim_Cut:
	anim_1gfx ANIM_GFX_CUT
	anim_sound 0, 1, SFX_CUT
	anim_obj ANIM_OBJ_CUT_LONG_DOWN_LEFT, 152, 40, $0
	anim_wait 32
	anim_ret

BattleAnim_Slash:
	anim_1gfx ANIM_GFX_CUT
	anim_sound 0, 1, SFX_CUT
	anim_obj ANIM_OBJ_CUT_LONG_DOWN_LEFT, 152, 40, $0
	anim_obj ANIM_OBJ_CUT_LONG_DOWN_LEFT, 148, 36, $0
	anim_wait 32
	anim_ret

BattleAnim_Bite:
	anim_2gfx ANIM_GFX_CUT, ANIM_GFX_HIT
	anim_obj ANIM_OBJ_BITE, 136, 56, $98
	anim_obj ANIM_OBJ_BITE, 136, 56, $18
	anim_wait 8
	anim_sound 0, 1, SFX_BITE
	anim_obj ANIM_OBJ_HIT_YFIX, 144, 48, $18
	anim_wait 16
	anim_sound 0, 1, SFX_BITE
	anim_obj ANIM_OBJ_HIT_YFIX, 128, 64, $18
	anim_wait 8
	anim_ret

BattleAnim_Teleport:
	anim_1gfx ANIM_GFX_SPEED
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_TELEPORT, $0, $1, $0
	anim_wait 32
	anim_bgeffect ANIM_BG_HIDE_MON, $0, $1, $0
	anim_wait 3
	anim_incbgeffect ANIM_BG_TELEPORT
	anim_call BattleAnim_ShowMon_0
	anim_bgeffect ANIM_BG_CYCLE_OBPALS_GRAY_AND_YELLOW, $0, $1, $0
	anim_call BattleAnim_Warp_Branch
	anim_wait 64
	anim_ret

BattleAnim_Fly:
	anim_jumpif $1, BattleAnim_Fly_branch_c9e89
	anim_jumpif $2, BattleAnim_Fly_branch_c9e82
	anim_1gfx ANIM_GFX_HIT
	anim_sound 0, 1, SFX_WING_ATTACK
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 56, $0
	anim_wait 32
BattleAnim_Fly_branch_c9e82:
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_wait 32
	anim_ret

BattleAnim_Fly_branch_c9e89:
	anim_1gfx ANIM_GFX_SPEED
	anim_bgeffect ANIM_BG_CYCLE_OBPALS_GRAY_AND_YELLOW, $0, $1, $0
	anim_bgeffect ANIM_BG_HIDE_MON, $0, $1, $0
	anim_call BattleAnim_Warp_Branch
	anim_wait 64
	anim_ret

BattleAnim_DoubleTeam:
	anim_call BattleAnim_TargetObj_2Row
	anim_sound 0, 0, SFX_PSYBEAM
	anim_bgeffect ANIM_BG_DOUBLE_TEAM, $0, $1, $0
	anim_wait 96
	anim_incbgeffect ANIM_BG_DOUBLE_TEAM
	anim_wait 24
	anim_incbgeffect ANIM_BG_DOUBLE_TEAM
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_Recover:
	anim_jumpif $1, BattleAnim_MilkDrink
	anim_jumpif $2, BattleAnim_Softboiled
	anim_2gfx ANIM_GFX_BUBBLE, ANIM_GFX_SHINE
	anim_sound 0, 0, SFX_SHARPEN
	anim_bgeffect ANIM_BG_FADE_MON_TO_LIGHT_REPEATING, $0, $1, $40
	anim_call BattleAnim_Recover_branch
	anim_wait 32
	anim_incbgeffect ANIM_BG_FADE_MON_TO_LIGHT_REPEATING
	anim_bgeffect ANIM_BG_CYCLE_MID_OBPALS_GRAY_AND_YELLOW, $0, $0, $0
	anim_call BattleAnim_Sub_Glimmer
	anim_ret

BattleAnim_Recover_branch:
	anim_obj ANIM_OBJ_RECOVER, 44, 88, $30
	anim_obj ANIM_OBJ_RECOVER, 44, 88, $31
	anim_obj ANIM_OBJ_RECOVER, 44, 88, $32
	anim_obj ANIM_OBJ_RECOVER, 44, 88, $33
	anim_obj ANIM_OBJ_RECOVER, 44, 88, $34
	anim_obj ANIM_OBJ_RECOVER, 44, 88, $35
	anim_obj ANIM_OBJ_RECOVER, 44, 88, $36
	anim_obj ANIM_OBJ_RECOVER, 44, 88, $37
	anim_wait 64
	anim_ret

BattleAnim_Absorb:
	anim_setobjpal PAL_BATTLE_OB_YELLOW, PAL_BTLCUSTOM_LIME
	anim_call BattleAnimSub_BGCycleOBPalsGrayAndYellow_6
	anim_1gfx ANIM_GFX_CHARGE
	anim_obj ANIM_OBJ_ABSORB_CENTER, 44, 88, $0
.loop
	anim_call BattleAnimSub_Drain
	anim_loop 5, .loop
	anim_wait 32
	anim_ret

BattleAnim_MegaDrain:
	anim_setobjpal PAL_BATTLE_OB_YELLOW, PAL_BTLCUSTOM_LIME
	anim_call BattleAnimSub_BGCycleOBPalsGrayAndYellow_6
	anim_1gfx ANIM_GFX_CHARGE
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_FADE_MONS_TO_BLACK_REPEATING, $0, $0, $10
	anim_setvar $0
.loop
	anim_call BattleAnimSub_Drain
	anim_incvar
	anim_jumpvar $7, .done
	anim_jumpvar $2, .spawn
	anim_jump .loop

.spawn
	anim_obj ANIM_OBJ_ABSORB_CENTER, 44, 88, $0
	anim_jump .loop

.done
	anim_wait 32
	anim_incbgeffect ANIM_BG_FADE_MONS_TO_BLACK_REPEATING
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnimSub_Drain:
	anim_sound 6, 3, SFX_WATER_GUN
	anim_obj ANIM_OBJ_ABSORB, 128, 48, $2
	anim_wait 6
	anim_sound 6, 3, SFX_WATER_GUN
	anim_obj ANIM_OBJ_ABSORB, 136, 64, $3
	anim_wait 6
	anim_sound 6, 3, SFX_WATER_GUN
	anim_obj ANIM_OBJ_ABSORB, 136, 32, $4
	anim_wait 6
	anim_ret

BattleAnim_Amnesia:
	anim_1gfx ANIM_GFX_STATUS
	anim_sound 0, 0, SFX_LICK
	anim_obj ANIM_OBJ_AMNESIA, 64, 80, $2
	anim_wait 16
	anim_obj ANIM_OBJ_AMNESIA, 68, 80, $1
	anim_wait 16
	anim_obj ANIM_OBJ_AMNESIA, 72, 80, $0
	anim_wait 64
	anim_ret

BattleAnim_Softboiled:
	anim_2gfx ANIM_GFX_EGG, ANIM_GFX_BUBBLE
	anim_call BattleAnim_TargetObj_1Row
	anim_sound 0, 0, SFX_SWITCH_POKEMON
	anim_obj ANIM_OBJ_EGG, 44, 104, $6
	anim_wait 128
	anim_incobj 2
	anim_obj ANIM_OBJ_EGG, 76, 104, $b
	anim_wait 16
	anim_bgeffect ANIM_BG_FADE_MON_TO_LIGHT_REPEATING, $0, $1, $40
	anim_sound 0, 0, SFX_METRONOME
.loop
	anim_obj ANIM_OBJ_RECOVER, 44, 88, $20
	anim_wait 8
	anim_loop 8, .loop
	anim_wait 128
	anim_incbgeffect ANIM_BG_FADE_MON_TO_LIGHT_REPEATING
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnimSub_FocusEnergy:
	anim_1gfx ANIM_GFX_SPEED
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_FADE_MON_TO_LIGHT, $0, $1, $40
	anim_call BattleAnimSub_BGCycleOBPalsGrayAndYellow_2
.loop
	anim_sound 0, 0, SFX_SWORDS_DANCE
	anim_call BattleAnimSub_Focus
	anim_wait 2
	anim_loop 3, .loop
	anim_wait 8
	anim_incbgeffect ANIM_BG_FADE_MON_TO_LIGHT
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_Wrap:
	anim_1gfx ANIM_GFX_ROPE
	anim_sound 0, 1, SFX_BIND
	anim_obj ANIM_OBJ_BIND1, 132, 64, $0
	anim_wait 8
	anim_obj ANIM_OBJ_BIND1, 132, 56, $0
	anim_wait 8
	anim_obj ANIM_OBJ_BIND1, 132, 48, $0
	anim_wait 64
	anim_sound 0, 1, SFX_BIND
	anim_incobj  1
	anim_incobj  2
	anim_incobj  3
	anim_wait 96
	anim_ret

BattleAnim_Confusion:
	anim_1gfx ANIM_GFX_HIT
	anim_call BattleAnim_FollowPlayerHead_1
	anim_sound 0, 1, SFX_PSYCHIC
	anim_bgeffect ANIM_BG_NIGHT_SHADE, $0, $0, $8
	anim_wait 128
	anim_incbgeffect ANIM_BG_NIGHT_SHADE
	anim_call BattleAnim_ShowMon_1
	anim_ret

BattleAnim_Earthquake:
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $60, $4, $10
.loop
	anim_sound 0, 1, SFX_EMBER
	anim_wait 24
	anim_loop 4, .loop
	anim_ret

BattleAnim_Growl:
	anim_1gfx ANIM_GFX_NOISE
	anim_battlergfx_2row
	anim_call BattleAnimSub_BGCycleOBPalsGrayAndYellow_2
	anim_cry $0
.loop
	anim_call BattleAnimSub_Sound
	anim_wait 16
	anim_loop 3, .loop
	anim_wait 9
	anim_bgeffect ANIM_BG_BATTLEROBJ_1ROW, $0, $1, $0
	anim_wait 8
	anim_bgeffect ANIM_BG_FADE_MON_TO_BLACK_REPEATING, $0, $0, $40
	anim_wait 64
	anim_incbgeffect ANIM_BG_FADE_MON_TO_BLACK_REPEATING
	anim_wait 1
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_wait 5
	anim_incobj 10
	anim_wait 8
	anim_ret

BattleAnim_Howl:
	anim_1gfx ANIM_GFX_NOISE
	anim_battlergfx_2row
	anim_call BattleAnim_TargetObj_1Row
	anim_wait 1
	anim_bgeffect ANIM_BG_VIBRATE_MON, $0, $1, $0
	anim_call BattleAnimSub_BGCycleOBPalsGrayAndYellow_2
	anim_bgeffect ANIM_BG_FADE_MON_TO_LIGHT_REPEATING, $0, $1, $40
	anim_cry $0
.loop
	anim_call BattleAnimSub_Sound
	anim_wait 16
	anim_loop 3, .loop
	anim_wait 16
	anim_jump BattleAnim_ShowMon_0

BattleAnim_Roar:
	anim_jumpif $2, BattleAnim_Whirlwind
	anim_1gfx ANIM_GFX_NOISE
	anim_call BattleAnimSub_BGCycleOBPalsGrayAndYellow_2
	anim_cry $0
.loop
	anim_call BattleAnimSub_Sound
	anim_wait 16
	anim_loop 3, .loop
	anim_wait 16
	anim_jumpif $0, .done
	anim_bgeffect ANIM_BG_REMOVE_MON, $0, $0, $0
	anim_wait 64
.done
	anim_ret

BattleAnim_Supersonic:
	anim_1gfx ANIM_GFX_PSYCHIC
.loop
	anim_sound 6, 2, SFX_SUPERSONIC
	anim_obj ANIM_OBJ_WAVE, 64, 88, $2
	anim_wait 4
	anim_loop 10, .loop
	anim_wait 64
	anim_ret

BattleAnim_Screech:
	anim_1gfx ANIM_GFX_PSYCHIC
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $8, $1, $20
	anim_sound 6, 2, SFX_SCREECH
.loop
	anim_obj ANIM_OBJ_WAVE, 64, 88, $2
	anim_wait 2
	anim_loop 2, .loop
	anim_wait 64
	anim_ret

BattleAnim_ConfuseRay:
	anim_1gfx ANIM_GFX_SPEED
	anim_call BattleAnimSub_BGCycleOBPalsGrayAndYellow_2
	anim_bgeffect ANIM_BG_CYCLE_BGPALS_INVERTED, $0, $4, $0
	anim_obj ANIM_OBJ_CONFUSE_RAY, 64, 88, $0
	anim_obj ANIM_OBJ_CONFUSE_RAY, 64, 88, $80
	anim_obj ANIM_OBJ_CONFUSE_RAY, 64, 88, $88
	anim_obj ANIM_OBJ_CONFUSE_RAY, 64, 88, $90
	anim_obj ANIM_OBJ_CONFUSE_RAY, 64, 88, $98
	anim_obj ANIM_OBJ_CONFUSE_RAY, 64, 88, $a0
	anim_obj ANIM_OBJ_CONFUSE_RAY, 64, 88, $a8
	anim_obj ANIM_OBJ_CONFUSE_RAY, 64, 88, $b0
	anim_obj ANIM_OBJ_CONFUSE_RAY, 64, 88, $b8
.loop
	anim_sound 6, 2, SFX_WHIRLWIND
	anim_wait 16
	anim_loop 8, .loop
	anim_wait 32
	anim_ret

BattleAnim_Leer:
	anim_jumpif $1, BattleAnim_TailWhip
	anim_1gfx ANIM_GFX_BEAM
	anim_call BattleAnimSub_BGCycleOBPalsGrayAndYellow_2
	anim_call BattleAnimSub_EyeBeams
	anim_wait 16
	anim_ret

BattleAnim_Reflect:
	anim_2gfx ANIM_GFX_SPEED, ANIM_GFX_REFLECT
	anim_setobjpal PAL_BATTLE_OB_GRAY, PAL_BTLCUSTOM_REFLECT
	anim_bgeffect ANIM_BG_CYCLE_OBPALS_GRAY_AND_YELLOW, $0, $6, $0
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $2
	anim_sound 0, 0, SFX_SHINE
	anim_obj ANIM_OBJ_SCREEN, 72, 80, $0
	anim_wait 4
	anim_obj ANIM_OBJ_DAZZLE, 72, 80, $0
	anim_obj ANIM_OBJ_DAZZLE, 72, 80, $8
	anim_obj ANIM_OBJ_DAZZLE, 72, 80, $10
	anim_obj ANIM_OBJ_DAZZLE, 72, 80, $18
	anim_obj ANIM_OBJ_DAZZLE, 72, 80, $20
	anim_obj ANIM_OBJ_DAZZLE, 72, 80, $28
	anim_obj ANIM_OBJ_DAZZLE, 72, 80, $30
	anim_obj ANIM_OBJ_DAZZLE, 72, 80, $38
	anim_wait 20
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $2
	anim_sound 0, 0, SFX_SHINE
	anim_obj ANIM_OBJ_SCREEN, 72, 80, $0
	anim_wait 64
	anim_ret

BattleAnim_LightScreen:
	anim_2gfx ANIM_GFX_SPEED, ANIM_GFX_REFLECT
	anim_setobjpal PAL_BATTLE_OB_GRAY, PAL_BTLCUSTOM_LIGHT_SCREEN
	anim_bgeffect ANIM_BG_CYCLE_OBPALS_GRAY_AND_YELLOW, $0, $2, $0
	anim_sound 0, 0, SFX_FLASH
	anim_obj ANIM_OBJ_SCREEN, 72, 80, $0
	anim_wait 4
	anim_obj ANIM_OBJ_SHINY, 72, 80, $0
	anim_wait 4
	anim_obj ANIM_OBJ_SHINY, 72, 80, $8
	anim_wait 4
	anim_obj ANIM_OBJ_SHINY, 72, 80, $10
	anim_wait 4
	anim_obj ANIM_OBJ_SHINY, 72, 80, $18
	anim_wait 4
	anim_obj ANIM_OBJ_SCREEN, 72, 80, $0
	anim_obj ANIM_OBJ_SHINY, 72, 80, $20
	anim_wait 4
	anim_obj ANIM_OBJ_SHINY, 72, 80, $28
	anim_wait 4
	anim_obj ANIM_OBJ_SHINY, 72, 80, $30
	anim_wait 4
	anim_obj ANIM_OBJ_SHINY, 72, 80, $38
	anim_wait 64
	anim_ret


BattleAnim_MindReader:
	anim_1gfx ANIM_GFX_MISC
	anim_sound 6, 1, SFX_MIND_READER
.loop
	anim_obj ANIM_OBJ_MIND_READER, 132, 48, $3
	anim_obj ANIM_OBJ_MIND_READER, 132, 48, $12
	anim_obj ANIM_OBJ_MIND_READER, 132, 48, $20
	anim_obj ANIM_OBJ_MIND_READER, 132, 48, $31
	anim_wait 16
	anim_loop 2, .loop
	anim_wait 32
	anim_ret

BattleAnim_Rest:
BattleAnim_Slp:
	anim_1gfx ANIM_GFX_STATUS
	anim_sound 0, 0, SFX_TAIL_WHIP
.loop
	anim_obj ANIM_OBJ_ASLEEP, 64, 80, $0
	anim_wait 40
	anim_loop 3, .loop
	anim_wait 32
	anim_ret

BattleAnim_Splash:
	anim_1gfx ANIM_GFX_HIT
	anim_sound 0, 0, SFX_VICEGRIP
	anim_call BattleAnim_TargetObj_2Row
	anim_bgeffect ANIM_BG_BOUNCE_DOWN, $0, $1, $0
	anim_wait 96
	anim_incbgeffect ANIM_BG_BOUNCE_DOWN
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_Dig:
	anim_2gfx ANIM_GFX_SAND, ANIM_GFX_HIT
	anim_jumpif $0, .hit
	anim_jumpif $2, .fail
	anim_call BattleAnim_TargetObj_2Row
	anim_bgeffect ANIM_BG_DIG, $0, $1, $1
	anim_obj ANIM_OBJ_DIG_PILE, 72, 104, $0
.loop
	anim_sound 0, 0, SFX_RAZOR_WIND
	anim_obj ANIM_OBJ_DIG_SAND, 56, 104, $0
	anim_wait 16
	anim_loop 6, .loop
	anim_wait 32
	anim_bgeffect ANIM_BG_HIDE_MON, $0, $1, $0
	anim_wait 8
	anim_incbgeffect ANIM_BG_DIG
	anim_call BattleAnim_ShowMon_0
	anim_ret

.hit
	anim_sound 0, 1, SFX_MEGA_PUNCH
	anim_bgeffect ANIM_BG_ENTER_MON, $0, $1, $0
	anim_wait 24
	anim_sound 0, 1, SFX_HORN_ATTACK
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 56, $0
	anim_wait 32
	anim_ret
.fail
	anim_bgeffect ANIM_BG_ENTER_MON, $0, $1, $0
	anim_wait 32
	anim_ret

BattleAnim_StringShot:
	anim_1gfx ANIM_GFX_WEB
	anim_bgeffect ANIM_BG_CYCLE_MID_OBPALS_GRAY_AND_YELLOW, $0, $2, $0
	anim_sound 6, 2, SFX_MENU
	anim_obj ANIM_OBJ_STRING_SHOT, 64, 80, $0
	anim_wait 4
	anim_sound 0, 1, SFX_MENU
	anim_obj ANIM_OBJ_STRING_SHOT, 132, 48, $1
	anim_wait 4
	anim_sound 6, 2, SFX_MENU
	anim_obj ANIM_OBJ_STRING_SHOT, 64, 88, $0
	anim_wait 4
	anim_sound 0, 1, SFX_MENU
	anim_obj ANIM_OBJ_STRING_SHOT, 132, 64, $1
	anim_wait 4
	anim_sound 6, 2, SFX_MENU
	anim_obj ANIM_OBJ_STRING_SHOT, 64, 84, $0
	anim_wait 4
	anim_sound 0, 1, SFX_MENU
	anim_obj ANIM_OBJ_STRING_SHOT, 132, 56, $2
	anim_wait 64
	anim_ret

BattleAnim_Headbutt:
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $14, $2, $0
	anim_wait 32
	anim_clearobjs
	anim_call BattleAnim_TargetObj_1Row
	anim_1gfx ANIM_GFX_HIT
	anim_bgeffect ANIM_BG_TACKLE, $0, $1, $0
	anim_wait 4
	anim_sound 0, 1, SFX_HEADBUTT
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 56, $0
	anim_wait 8
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_Tackle:
	anim_jumpif $2, BattleAnim_Pound
	anim_jumpif $3, BattleAnim_Scratch
	anim_1gfx ANIM_GFX_HIT
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_TACKLE, $0, $1, $0
	anim_wait 4
	anim_sound 0, 1, SFX_TACKLE
	anim_obj ANIM_OBJ_HIT_BIG_YFIX, 136, 48, $0
	anim_wait 8
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_BodySlam:
	anim_1gfx ANIM_GFX_HIT
	anim_call BattleAnim_TargetObj_2Row
	anim_bgeffect ANIM_BG_BOUNCE_DOWN, $0, $1, $0
	anim_wait 32
	anim_incbgeffect ANIM_BG_BOUNCE_DOWN
	anim_wait 4
	anim_bgeffect ANIM_BG_BODY_SLAM, $0, $1, $0
	anim_wait 3
	anim_sound 0, 1, SFX_TACKLE
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 48, $0
	anim_wait 6
	anim_sound 0, 1, SFX_TACKLE
	anim_obj ANIM_OBJ_HIT_YFIX, 144, 48, $0
	anim_wait 3
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_TakeDown:
	anim_1gfx ANIM_GFX_HIT
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_TACKLE, $0, $1, $0
	anim_wait 3
	anim_sound 0, 1, SFX_TACKLE
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $2
	anim_obj ANIM_OBJ_HIT_YFIX, 128, 56, $0
	anim_wait 6
	anim_sound 0, 1, SFX_TACKLE
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $2
	anim_obj ANIM_OBJ_HIT_YFIX, 144, 48, $0
	anim_wait 3
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_DoubleEdge:
	anim_1gfx ANIM_GFX_HIT
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $10
	anim_bgeffect ANIM_BG_TACKLE, $0, $1, $0
	anim_wait 3
	anim_sound 0, 1, SFX_TACKLE
	anim_obj ANIM_OBJ_HIT_BIG_YFIX, 128, 48, $0
	anim_wait 6
	anim_sound 0, 1, SFX_TACKLE
	anim_obj ANIM_OBJ_HIT_BIG_YFIX, 144, 48, $0
	anim_wait 3
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_Whirlwind:
	anim_1gfx ANIM_GFX_WIND
.loop
	anim_sound 0, 0, SFX_RAZOR_WIND
	anim_obj ANIM_OBJ_GUST, 64, 112, $0
	anim_wait 6
	anim_loop 9, .loop
	anim_call BattleAnim_IncObj1to9
	anim_sound 16, 2, SFX_WHIRLWIND
	anim_wait 128
	anim_jumpif $0, .done
	anim_bgeffect ANIM_BG_REMOVE_MON, $0, $0, $0
	anim_wait 64
.done
	anim_ret

BattleAnim_Hypnosis:
	anim_1gfx ANIM_GFX_PSYCHIC
.loop
	anim_sound 6, 2, SFX_SUPERSONIC
	anim_obj ANIM_OBJ_WAVE, 64, 88, $2
	anim_obj ANIM_OBJ_WAVE, 56, 80, $2
	anim_wait 8
	anim_loop 3, .loop
	anim_wait 56
	anim_ret

BattleAnim_Mist:
	anim_obp0 $54
	anim_1gfx ANIM_GFX_HAZE
	anim_sound 0, 0, SFX_SURF
.loop
	anim_obj ANIM_OBJ_MIST, 48, 56, $0
	anim_wait 8
	anim_loop 10, .loop
	anim_wait 96
	anim_ret

BattleAnim_HornAttack:
	anim_2gfx ANIM_GFX_HORN, ANIM_GFX_HIT
	anim_obj ANIM_OBJ_HORN, 72, 80, $1
	anim_wait 16
	anim_sound 0, 1, SFX_HORN_ATTACK
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 56, $0
	anim_wait 16
	anim_ret

BattleAnim_IcicleCrash:
	anim_setobjpal PAL_BATTLE_OB_BLUE, PAL_BTLCUSTOM_ICE
	anim_3gfx ANIM_GFX_HIT_2, ANIM_GFX_ICICLE_CRASH, ANIM_GFX_ICE
	anim_sound 0, 1, SFX_MEGA_PUNCH
	anim_obj ANIM_OBJ_ICICLE_CRASH,  128, 250, $10
	anim_wait 6
	anim_obj ANIM_OBJ_ICICLE_CRASH,  120, 250, $10
	anim_wait 2
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_HIT_YFIX, 128, 66, $0
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $30, $2, $0
	anim_obj ANIM_OBJ_ICE_SPLASH, 128, 66, $28
	anim_obj ANIM_OBJ_ICE_SPLASH, 128, 66, $9c
	anim_wait 4
	anim_obj ANIM_OBJ_ICICLE_CRASH,  152, 250, $10
	anim_wait 2
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_HIT_YFIX, 120, 66, $0
	anim_obj ANIM_OBJ_ICE_SPLASH, 120, 66, $28
	anim_obj ANIM_OBJ_ICE_SPLASH, 120, 66, $9c
	anim_wait 4
	anim_obj ANIM_OBJ_ICICLE_CRASH,  144, 250, $10
	anim_wait 2
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_HIT_YFIX, 152, 66, $0
	anim_obj ANIM_OBJ_ICE_SPLASH, 152, 66, $28
	anim_obj ANIM_OBJ_ICE_SPLASH, 152, 66, $9c
	anim_wait 4
	anim_obj ANIM_OBJ_ICICLE_CRASH,  136, 250, $10
	anim_wait 2
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_HIT_YFIX, 144, 66, $0
	anim_obj ANIM_OBJ_ICE_SPLASH, 144, 66, $28
	anim_obj ANIM_OBJ_ICE_SPLASH, 136, 56, $9c
	anim_wait 6
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 66, $0
	anim_obj ANIM_OBJ_ICE_SPLASH, 136, 66, $28
	anim_obj ANIM_OBJ_ICE_SPLASH, 136, 66, $9c
	anim_wait 32
	anim_ret

BattleAnim_PoisonSting:
	anim_setobjpal PAL_BATTLE_OB_BLUE, PAL_BTLCUSTOM_PURPLE
	anim_2gfx ANIM_GFX_HORN, ANIM_GFX_HIT
.hit
	anim_obj ANIM_OBJ_NEEDLE, 64, 92, $14
	anim_wait 16
	anim_sound 0, 1, SFX_POISON_STING
	anim_obj ANIM_OBJ_HIT_SMALL, 136, 56, $0
	anim_wait 16
	anim_ret

BattleAnim_PoisonJab:
	anim_setobjpal PAL_BATTLE_OB_GRAY, PAL_BTLCUSTOM_PURPLE
	anim_setobjpal PAL_BATTLE_OB_BLUE, PAL_BTLCUSTOM_PURPLE
	anim_3gfx ANIM_GFX_OBJECTS_2, ANIM_GFX_HIT, ANIM_GFX_POISON
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $60, $2, $0
.loop
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_POISON_JAB_SW, 132, 56, $38
	anim_wait 4
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_HIT_YFIX, 140, 44, $0
	anim_obj ANIM_OBJ_POISON_JAB_E, 132, 56, $20
	anim_wait 4
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_POISON_JAB_NW, 132, 56, $8
	anim_wait 4
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_HIT_YFIX, 124, 60, $0
	anim_obj ANIM_OBJ_POISON_JAB_N, 132, 56, $10
	anim_wait 4
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_POISON_JAB_SE, 132, 56, $28
	anim_wait 4
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_HIT_YFIX, 140, 60, $0
	anim_obj ANIM_OBJ_POISON_JAB_W, 132, 56, $0
	anim_wait 4
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_POISON_JAB_NE, 132, 56, $18
	anim_wait 4
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_HIT_YFIX, 124, 44, $0
	anim_obj ANIM_OBJ_POISON_JAB_S, 132, 56, $30
	anim_wait 4
	anim_loop 2, .loop
	anim_jump BattleAnim_PoisonFang.loop

BattleAnim_PinMissile:
	anim_2gfx ANIM_GFX_HORN, ANIM_GFX_HIT
	anim_sound 0, 0, SFX_RAZOR_WIND
	anim_obj ANIM_OBJ_MEDIUM_HORN, 64, 92, $28
	anim_wait 12
	anim_obj ANIM_OBJ_MEDIUM_HORN, 56, 84, $28
	anim_sound 0, 1, SFX_POISON_STING
	anim_obj ANIM_OBJ_HIT, 136, 56, $0
	anim_wait 12
	anim_obj ANIM_OBJ_MEDIUM_HORN, 52, 88, $28
	anim_sound 0, 1, SFX_POISON_STING
	anim_obj ANIM_OBJ_HIT, 128, 48, $0
	anim_wait 12
	anim_sound 0, 1, SFX_POISON_STING
	anim_obj ANIM_OBJ_HIT, 132, 52, $0
	anim_wait 16
	anim_ret

BattleAnim_SpikeCannon:
	anim_2gfx ANIM_GFX_HORN, ANIM_GFX_HIT
	anim_sound 0, 1, SFX_MEGA_PUNCH
.loop
	anim_obj ANIM_OBJ_MEDIUM_HORN, 52, 88, $18
	anim_wait 12
	anim_obj ANIM_OBJ_MEDIUM_HORN, 64, 92, $18
	anim_sound 0, 1, SFX_DOUBLE_KICK
	anim_obj ANIM_OBJ_HIT, 130, 50, $0
	anim_wait 12
	anim_obj ANIM_OBJ_MEDIUM_HORN, 56, 84, $18
	anim_sound 0, 1, SFX_DOUBLE_KICK
	anim_obj ANIM_OBJ_HIT, 136, 56, $0
	anim_wait 12
	anim_obj ANIM_OBJ_MEDIUM_HORN, 60, 96, $18
	anim_sound 0, 1, SFX_DOUBLE_KICK
	anim_obj ANIM_OBJ_HIT, 128, 48, $0
	anim_wait 12
	anim_sound 0, 1, SFX_DOUBLE_KICK
	anim_obj ANIM_OBJ_HIT, 137, 57, $0
	anim_wait 16
	anim_ret

BattleAnim_Transform:
	anim_jumpif $2, BattleAnim_Sketch
	anim_jumpif $3, BattleAnim_Mimic
	anim_jumpif $6, BattleAnim_Disguise
	anim_jumpif $9, BattleAnim_Splash
	anim_jumpif $12, BattleAnim_FormChange1
	anim_jumpif $13, BattleAnim_FormChange2
	anim_jumpif $14, BattleAnim_Metronome
	anim_1gfx ANIM_GFX_HIT
	anim_call BattleAnim_TargetObj_2Row
	anim_transform
	anim_sound 0, 0, SFX_PSYBEAM
	anim_bgeffect ANIM_BG_WAVE_DEFORM_USER, $0, $1, $0
	anim_wait 48
	anim_updateactorpic
	anim_incbgeffect ANIM_BG_WAVE_DEFORM_USER
	anim_wait 48
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_FormChange1:
	anim_sound 0, 0, SFX_FORESIGHT
	anim_bgeffect ANIM_BG_FADE_MON_TO_LIGHT, $0, $1, $80
	anim_wait 24
	anim_wait 1
	anim_bgeffect ANIM_BG_HIDE_MON, $0, $1, $0
	anim_wait 4
	anim_incobj  1
	anim_wait 1
	anim_incbgeffect ANIM_BG_FADE_MON_TO_WHITE_WAIT_FADE_BACK
	anim_ret
	
BattleAnim_FormChange2:
	anim_bgeffect ANIM_BG_FADE_MON_TO_WHITE_WAIT_FADE_BACK, $0, $1, $20
	anim_wait 32
	anim_updateactorpic
	anim_call BattleAnim_ShowMon_1
	anim_sound 0, 0, SFX_MORNING_SUN
	anim_wait 48
	anim_incbgeffect ANIM_BG_FADE_MON_TO_WHITE_WAIT_FADE_BACK
	anim_wait 4
	anim_ret
	
BattleAnim_Disguise:
	anim_wait 48
	anim_sound 0, 0, SFX_RAZOR_WIND
	anim_updateactorpic
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_PetalDance:
	anim_setobjpal PAL_BATTLE_OB_RED, PAL_BTLCUSTOM_PINK
	anim_3gfx ANIM_GFX_PETALS, ANIM_GFX_FLOWER, ANIM_GFX_HIT
	anim_sound 0, 1, SFX_GAME_FREAK_LOGO_GS
	anim_battlergfx_2row
	anim_bgeffect ANIM_BG_CYCLE_MON_LIGHT_DARK_REPEATING, $0, $1, $20
.loop
	anim_obj ANIM_OBJ_PETAL_DANCE, 48, 56, $1
	anim_wait 11
	anim_loop 8, .loop
	anim_wait 88
	anim_incbgeffect ANIM_BG_CYCLE_MON_LIGHT_DARK_REPEATING
	anim_bgeffect ANIM_BG_BATTLEROBJ_1ROW, $0, $0, $0
	anim_bgeffect ANIM_BG_TACKLE, $0, $1, $0
	anim_call BattleAnim_Pursuit.hit
	anim_sound 0, 1, SFX_SWEET_SCENT
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $0, $0
	anim_clearobjs
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_obj ANIM_OBJ_PETAL_DANCE_IMPACT, 136, 56, $28
	anim_obj ANIM_OBJ_PETAL_DANCE_IMPACT, 136, 56, $5c
	anim_obj ANIM_OBJ_PETAL_DANCE_IMPACT, 136, 56, $10
	anim_obj ANIM_OBJ_PETAL_DANCE_IMPACT, 136, 56, $e8
	anim_obj ANIM_OBJ_PETAL_DANCE_IMPACT, 136, 56, $9c
	anim_obj ANIM_OBJ_PETAL_DANCE_IMPACT, 136, 56, $d0
	anim_wait 6
	anim_obj ANIM_OBJ_PETAL_DANCE_IMPACT, 136, 56, $1c
	anim_obj ANIM_OBJ_PETAL_DANCE_IMPACT, 136, 56, $50
	anim_obj ANIM_OBJ_PETAL_DANCE_IMPACT, 136, 56, $dc
	anim_obj ANIM_OBJ_PETAL_DANCE_IMPACT, 136, 56, $90
	anim_wait 64
	anim_ret

BattleAnim_PayDay:
	anim_2gfx ANIM_GFX_HIT, ANIM_GFX_STATUS
	anim_sound 0, 1, SFX_POUND
	anim_obj ANIM_OBJ_HIT_YFIX, 128, 56, $0
	anim_wait 16
	anim_sound 0, 1, SFX_PAY_DAY
	anim_obj ANIM_OBJ_PAY_DAY, 120, 76, $1
	anim_wait 64
	anim_ret

BattleAnim_Bonemerang:
	anim_2gfx ANIM_GFX_MISC, ANIM_GFX_HIT
	anim_sound 6, 2, SFX_HYDRO_PUMP
	anim_obj ANIM_OBJ_BONEMERANG, 88, 56, $1c
	anim_wait 24
	anim_sound 0, 1, SFX_MOVE_PUZZLE_PIECE
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 56, $0
	anim_wait 24
	anim_ret

BattleAnim_Swift:
	anim_1gfx ANIM_GFX_STARS
	anim_sound 6, 2, SFX_METRONOME
	anim_obj ANIM_OBJ_SWIFT, 64, 88, $4
	anim_wait 4
	anim_obj ANIM_OBJ_SWIFT, 64, 72, $4
	anim_wait 4
	anim_obj ANIM_OBJ_SWIFT, 64, 76, $4
	anim_wait 64
	anim_ret

BattleAnim_Peck:
	anim_1gfx ANIM_GFX_HIT
	anim_sound 0, 1, SFX_PECK
	anim_obj ANIM_OBJ_HIT_SMALL_YFIX, 128, 48, $0
	anim_wait 8
	anim_sound 0, 1, SFX_PECK
	anim_obj ANIM_OBJ_HIT_SMALL_YFIX, 136, 56, $0
	anim_wait 16
	anim_ret

BattleAnim_DrillPeck:
	anim_1gfx ANIM_GFX_HIT
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $64, $1, $0
.loop
	anim_sound 0, 1, SFX_PECK
	anim_obj ANIM_OBJ_HIT_SMALL_YFIX, 132, 32, $0
	anim_wait 2
	anim_sound 0, 1, SFX_PECK
	anim_obj ANIM_OBJ_HIT_SMALL_YFIX, 143, 37, $0
	anim_wait 2
	anim_sound 0, 1, SFX_PECK
	anim_obj ANIM_OBJ_HIT_SMALL_YFIX, 148, 48, $0
	anim_wait 2
	anim_sound 0, 1, SFX_PECK
	anim_obj ANIM_OBJ_HIT_SMALL_YFIX, 143, 59, $0
	anim_wait 2
	anim_sound 0, 1, SFX_PECK
	anim_obj ANIM_OBJ_HIT_SMALL_YFIX, 132, 64, $0
	anim_wait 2
	anim_sound 0, 1, SFX_PECK
	anim_obj ANIM_OBJ_HIT_SMALL_YFIX, 121, 59, $0
	anim_wait 2
	anim_sound 0, 1, SFX_PECK
	anim_obj ANIM_OBJ_HIT_SMALL_YFIX, 116, 48, $0
	anim_wait 2
	anim_sound 0, 1, SFX_PECK
	anim_obj ANIM_OBJ_HIT_SMALL_YFIX, 121, 37, $0
	anim_wait 2
	anim_loop 3, .loop
	anim_wait 16
	anim_ret

BattleAnim_Flash:
	anim_1gfx ANIM_GFX_SPEED
	anim_sound 0, 1, SFX_FLASH
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $6, $20
	anim_wait 4
	anim_obj ANIM_OBJ_FLASH, 136, 56, $0
	anim_wait 4
	anim_obj ANIM_OBJ_FLASH, 136, 56, $8
	anim_wait 4
	anim_obj ANIM_OBJ_FLASH, 136, 56, $10
	anim_wait 4
	anim_obj ANIM_OBJ_FLASH, 136, 56, $18
	anim_wait 4
	anim_obj ANIM_OBJ_FLASH, 136, 56, $20
	anim_wait 4
	anim_obj ANIM_OBJ_FLASH, 136, 56, $28
	anim_wait 4
	anim_obj ANIM_OBJ_FLASH, 136, 56, $30
	anim_wait 4
	anim_obj ANIM_OBJ_FLASH, 136, 56, $38
	anim_wait 32
	anim_bgp $e4
	anim_ret

BattleAnim_Substitute:
	anim_sound 0, 0, SFX_SHARPEN
	anim_jumpif $3, .dropsub2
	anim_jumpif $2, .raisesub
	anim_jumpif $1, .dropsub
	anim_1gfx ANIM_GFX_SMOKE
	anim_bgeffect ANIM_BG_REMOVE_MON, $0, $1, $0
	anim_wait 32
	anim_raisesub
	anim_sound 0, 0, SFX_THROW_BALL
	anim_obj ANIM_OBJ_BALL_POOF, 50, 96, $0
	anim_bgeffect ANIM_BG_ENTER_MON, $0, $1, $0
	anim_wait 32
	anim_ret

.dropsub:
	anim_bgeffect ANIM_BG_REMOVE_MON, $0, $1, $0
	anim_wait 32
	anim_dropsub
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_ret

.raisesub:
	anim_bgeffect ANIM_BG_REMOVE_MON, $0, $1, $0
	anim_wait 32
	anim_raisesub
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_ret

.dropsub2:
	anim_bgeffect ANIM_BG_HIDE_MON, $0, $1, $0
	anim_wait 32
	anim_dropsub
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_ret

BattleAnim_NightShade:
	anim_1gfx ANIM_GFX_HIT
	anim_bgp $1b
	anim_obp1 $1b
	anim_wait 32
	anim_call BattleAnim_FollowPlayerHead_1
	anim_bgeffect ANIM_BG_NIGHT_SHADE, $0, $0, $8
	anim_sound 0, 1, SFX_PSYCHIC
	anim_wait 96
	anim_incbgeffect ANIM_BG_NIGHT_SHADE
	anim_call BattleAnim_ShowMon_1
	anim_bgp $e4
	anim_ret

BattleAnim_Psybeam:
	anim_1gfx ANIM_GFX_PSYCHIC
	anim_call BattleAnimSub_BGCycleOBPalsGrayAndYellow_2
	anim_bgeffect ANIM_BG_CYCLE_BGPALS_INVERTED, $0, $4, $0
.loop
	anim_sound 6, 2, SFX_PSYBEAM
	anim_obj ANIM_OBJ_WAVE, 64, 88, $4
	anim_wait 4
	anim_loop 10, .loop
	anim_wait 48
	anim_ret

BattleAnim_DreamEater:
	anim_setobjpal PAL_BATTLE_OB_YELLOW, PAL_BTLCUSTOM_PINK
	anim_1gfx ANIM_GFX_CHARGE
	anim_bgp $1b
	anim_bgeffect ANIM_BG_CYCLE_OBPALS_GRAY_AND_YELLOW, $0, $6, $0
.loop
	anim_sound 6, 3, SFX_WARP_TO
	anim_obj ANIM_OBJ_ABSORB, 128, 48, $2
	anim_wait 5
	anim_sound 6, 3, SFX_WARP_TO
	anim_obj ANIM_OBJ_ABSORB, 136, 64, $3
	anim_wait 5
	anim_sound 6, 3, SFX_WARP_TO
	anim_obj ANIM_OBJ_ABSORB, 136, 32, $4
	anim_wait 5
	anim_loop 7, .loop
	anim_wait 32
	anim_ret

BattleAnim_LeechLife:
	anim_setobjpal PAL_BATTLE_OB_BLUE, PAL_BTLCUSTOM_GRAY
	anim_setobjpal PAL_BATTLE_OB_YELLOW, PAL_BTLCUSTOM_RED
	anim_3gfx ANIM_GFX_HORN, ANIM_GFX_HIT, ANIM_GFX_CHARGE
	anim_call BattleAnim_PoisonSting.hit
.loop
	anim_call BattleAnimSub_Drain
	anim_loop 4, .loop
	anim_wait 28
	anim_ret

BattleAnim_Psywave:
	anim_1gfx ANIM_GFX_PSYCHIC
	anim_bgeffect ANIM_BG_PSYCHIC, $0, $0, $0
.loop
	anim_sound 6, 2, SFX_PSYCHIC
	anim_obj ANIM_OBJ_WAVE, 64, 80, $2
	anim_wait 8
	anim_sound 6, 2, SFX_PSYCHIC
	anim_obj ANIM_OBJ_WAVE, 64, 88, $3
	anim_wait 8
	anim_sound 6, 2, SFX_PSYCHIC
	anim_obj ANIM_OBJ_WAVE, 64, 96, $4
	anim_wait 8
	anim_loop 3, .loop
	anim_wait 32
	anim_incbgeffect ANIM_BG_PSYCHIC
	anim_wait 4
	anim_ret

BattleAnim_Thrash:
	anim_1gfx ANIM_GFX_HIT
	anim_sound 0, 1, SFX_POUND
	anim_obj ANIM_OBJ_PALM, 120, 72, $0
	anim_obj ANIM_OBJ_HIT_BIG_YFIX, 120, 72, $0
	anim_wait 6
	anim_sound 0, 1, SFX_MOVE_PUZZLE_PIECE
	anim_obj ANIM_OBJ_PUNCH, 136, 56, $0
	anim_obj ANIM_OBJ_HIT_BIG_YFIX, 136, 56, $0
	anim_wait 6
	anim_sound 0, 1, SFX_DOUBLE_KICK
	anim_obj ANIM_OBJ_KICK, 152, 40, $0
	anim_obj ANIM_OBJ_HIT_BIG_YFIX, 152, 40, $0
	anim_wait 16
	anim_ret

BattleAnim_Growth:
	anim_bgeffect ANIM_BG_WHITE_HUES, $0, $8, $0
	anim_1gfx ANIM_GFX_CHARGE
	anim_sound 0, 0, SFX_SWORDS_DANCE
	anim_obj ANIM_OBJ_GROWTH, 48, 108, $0
	anim_obj ANIM_OBJ_GROWTH, 48, 108, $8
	anim_obj ANIM_OBJ_GROWTH, 48, 108, $10
	anim_obj ANIM_OBJ_GROWTH, 48, 108, $18
	anim_obj ANIM_OBJ_GROWTH, 48, 108, $20
	anim_obj ANIM_OBJ_GROWTH, 48, 108, $28
	anim_obj ANIM_OBJ_GROWTH, 48, 108, $30
	anim_obj ANIM_OBJ_GROWTH, 48, 108, $38
	anim_wait 64
	anim_ret

BattleAnim_Smokescreen:
	anim_3gfx ANIM_GFX_HAZE, ANIM_GFX_EGG, ANIM_GFX_SMOKE
	anim_sound 6, 2, SFX_THROW_BALL
	anim_obj ANIM_OBJ_BALL_POOF, 108, 70, $10
	anim_wait 24
	anim_incobj  1
	anim_sound 0, 1, SFX_BALL_POOF
	anim_obj ANIM_OBJ_BALL_POOF, 108, 70, $10
	anim_wait 8
.loop
	anim_sound 0, 1, SFX_MENU
	anim_obj ANIM_OBJ_STRENGTH, 64, 104, $1
	anim_wait 8
	anim_loop 5, .loop
	anim_wait 128
	anim_ret

BattleAnim_Strength:
	anim_2gfx ANIM_GFX_ROCKS, ANIM_GFX_HIT
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_Y, $10, $1, $20
	anim_sound 0, 0, SFX_STRENGTH
	anim_obj ANIM_OBJ_STRENGTH, 64, 104, $1
.hit
	anim_wait 128
	anim_incobj  1
	anim_wait 20
	anim_sound 0, 1, SFX_MEGA_PUNCH
	anim_obj ANIM_OBJ_HIT_BIG_YFIX, 132, 40, $0
	anim_wait 16
	anim_ret

BattleAnim_SwordsDance:
	anim_1gfx ANIM_GFX_WHIP
	anim_sound 0, 0, SFX_SWORDS_DANCE
	anim_obj ANIM_OBJ_SWORDS_DANCE, 48, 108, $0
	anim_obj ANIM_OBJ_SWORDS_DANCE, 48, 108, $d
	anim_obj ANIM_OBJ_SWORDS_DANCE, 48, 108, $1a
	anim_obj ANIM_OBJ_SWORDS_DANCE, 48, 108, $27
	anim_obj ANIM_OBJ_SWORDS_DANCE, 48, 108, $34
	anim_wait 56
	anim_ret

BattleAnim_QuickAttack:
	anim_2gfx ANIM_GFX_SPEED, ANIM_GFX_HIT
	anim_sound 0, 0, SFX_MENU
	anim_bgeffect ANIM_BG_HIDE_MON, $0, $1, $0
	anim_call BattleAnimSub_QuickAttack
	anim_wait 12
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 56, $0
	anim_wait 8
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_wait 16
	anim_ret

BattleAnimSub_QuickAttack:
	anim_obj ANIM_OBJ_SPEED_LINE, 24, 88, $2
	anim_obj ANIM_OBJ_SPEED_LINE, 32, 88, $1
	anim_obj ANIM_OBJ_SPEED_LINE, 40, 88, $0
	anim_obj ANIM_OBJ_SPEED_LINE, 48, 88, $80
	anim_obj ANIM_OBJ_SPEED_LINE, 56, 88, $81
	anim_obj ANIM_OBJ_SPEED_LINE, 64, 88, $82
	anim_ret

BattleAnim_BulkUp:
	anim_2gfx ANIM_GFX_BULK_UP, ANIM_GFX_WIND
	anim_sound 0, 0, SFX_SQUEAK
	anim_obj ANIM_OBJ_BULK_UP, 48, 88, $0
	anim_wait 32
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $08, $2, $0
	anim_setobjpal PAL_BATTLE_OB_GRAY, PAL_BTLCUSTOM_BULK_UP
	anim_sound 0, 0, SFX_HORN_ATTACK
	anim_wait 16
	anim_setobjpal PAL_BATTLE_OB_GRAY, PAL_BTLCUSTOM_GRAY
	anim_wait 8
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $08, $2, $0
	anim_setobjpal PAL_BATTLE_OB_GRAY, PAL_BTLCUSTOM_BULK_UP
	anim_sound 0, 0, SFX_HORN_ATTACK
	anim_wait 24
	anim_clearobjs
	anim_setobjpal PAL_BATTLE_OB_GRAY, PAL_BTLCUSTOM_GRAY
	anim_sound 0, 0, SFX_MENU
	anim_obj ANIM_OBJ_SWAGGER, 72, 88, $44
	anim_wait 32
	anim_ret

BattleAnim_DefenseCurl:
	anim_jumpif $1, BattleAnim_Withdraw
	anim_jumpif $2, BattleAnim_Harden
	anim_1gfx ANIM_GFX_SHAPES
	anim_obp0 $e4
	anim_call BattleAnim_TargetObj_1Row
	anim_sound 0, 0, SFX_SHARPEN
	anim_bgeffect ANIM_BG_FADE_MON_TO_LIGHT_REPEATING, $0, $1, $40
	anim_obj ANIM_OBJ_DEFENSE_CURL, 48, 88, $0
	anim_wait 96
	anim_incobj  2
	anim_incbgeffect ANIM_BG_FADE_MON_TO_LIGHT_REPEATING
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_Withdraw:
	anim_1gfx ANIM_GFX_REFLECT
	anim_call BattleAnim_TargetObj_2Row
	anim_bgeffect ANIM_BG_WITHDRAW, $0, $1, $50
	anim_wait 48
	anim_sound 0, 0, SFX_SHINE
	anim_obj ANIM_OBJ_WITHDRAW, 48, 88, $0
	anim_wait 64
	anim_incobj  2
	anim_wait 1
	anim_incbgeffect ANIM_BG_WITHDRAW
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_Harden:
	anim_1gfx ANIM_GFX_REFLECT
	anim_obp0 $0
	anim_call BattleAnim_TargetObj_1Row
	anim_call BattleAnimSub_Metallic
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_SeismicToss:
	anim_setobjpal PAL_BATTLE_OB_BLUE, PAL_BTLCUSTOM_GLOBE
	anim_2gfx ANIM_GFX_GLOBE, ANIM_GFX_HIT
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_Y, $10, $1, $20
	anim_sound 0, 0, SFX_STRENGTH
	anim_obj ANIM_OBJ_SEISMIC_TOSS, 64, 104, $1
	anim_jump BattleAnim_Strength.hit

BattleAnim_Rage:
	anim_1gfx ANIM_GFX_HIT
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_CYCLE_MON_LIGHT_DARK_REPEATING, $0, $1, $20
	anim_sound 0, 0, SFX_RAGE
	anim_wait 72
	anim_incbgeffect ANIM_BG_CYCLE_MON_LIGHT_DARK_REPEATING
	anim_call BattleAnim_ShowMon_0
	anim_sound 0, 1, SFX_MOVE_PUZZLE_PIECE
	anim_obj ANIM_OBJ_HIT_BIG_YFIX, 120, 72, $0
	anim_wait 6
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_HIT_BIG_YFIX, 136, 56, $0
	anim_wait 6
	anim_sound 0, 1, SFX_MEGA_PUNCH
	anim_obj ANIM_OBJ_HIT_BIG_YFIX, 152, 40, $0
	anim_wait 16
	anim_ret

BattleAnim_Agility:
	anim_jumpif $1, BattleAnim_RockPolish
	anim_1gfx ANIM_GFX_WIND_BG
	anim_obp0 $fc
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_FADE_MON_TO_LIGHT_REPEATING, $0, $1, $40
	anim_call BattleAnimSub_Agility
.loop
	anim_sound 0, 0, SFX_RAZOR_WIND
	anim_wait 4
	anim_loop 18, .loop
	anim_incbgeffect ANIM_BG_FADE_MON_TO_LIGHT_REPEATING
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_Barrier:
	anim_jumpif $1, BattleAnim_IronDefense
	anim_jumpif $2, BattleAnim_AcidArmor
	anim_1gfx ANIM_GFX_REFLECT
	anim_battlergfx_2row
	anim_bgeffect ANIM_BG_CYCLE_OBPALS_GRAY_AND_YELLOW, $0, $2, $0
	anim_wait 8
.loop
	anim_sound 0, 0, SFX_SHINE
	anim_obj ANIM_OBJ_SCREEN, 72, 80, $0
	anim_wait 32
	anim_loop 2, .loop
	anim_ret

BattleAnim_IronDefense:
	anim_1gfx ANIM_GFX_REFLECT
	anim_obp0 $0
	anim_call BattleAnim_TargetObj_1Row
.loop
	anim_bgp $90
	anim_sound 0, 0, SFX_FORESIGHT
	anim_obj ANIM_OBJ_HARDEN, 48, 84, $0
	anim_wait 6
	anim_bgp $f8
	anim_wait 6
	anim_loop 5, .loop
	anim_wait 6
	anim_jump BattleAnim_ShowMon_0

BattleAnim_PsychicM:
	anim_1gfx ANIM_GFX_PSYCHIC
	anim_bgeffect ANIM_BG_ALTERNATE_HUES, $0, $2, $0
	anim_bgeffect ANIM_BG_PSYCHIC, $0, $0, $0
.loop
	anim_sound 6, 2, SFX_PSYCHIC
	anim_obj ANIM_OBJ_WAVE, 64, 88, $2
	anim_wait 8
	anim_loop 8, .loop
	anim_wait 96
	anim_incbgeffect ANIM_BG_PSYCHIC
	anim_wait 4
	anim_ret

BattleAnim_Sludge:
	anim_setobjpal PAL_BATTLE_OB_GRAY, PAL_BTLCUSTOM_PURPLE
	anim_1gfx ANIM_GFX_POISON
	anim_jump BattleAnimSub_Sludge

BattleAnim_Toxic:
	anim_setobjpal PAL_BATTLE_OB_GRAY, PAL_BTLCUSTOM_PURPLE
	anim_1gfx ANIM_GFX_POISON
	anim_obp0 $fc
	anim_bgeffect ANIM_BG_BLACK_HUES, $0, $8, $0
	anim_call BattleAnimSub_Acid
	anim_wait 32
	anim_obp0 $e4
	anim_jump BattleAnimSub_Sludge

BattleAnim_Metronome:
	anim_2gfx ANIM_GFX_MISC, ANIM_GFX_SPEED
	anim_sound 0, 0, SFX_METRONOME
	anim_obj ANIM_OBJ_METRONOME_HAND, 72, 88, $0
.loop
	anim_obj ANIM_OBJ_METRONOME_SPARKLE, 72, 80, $0
	anim_wait 8
	anim_loop 5, .loop
	anim_wait 48
	anim_ret

BattleAnim_LowKick:
	anim_1gfx ANIM_GFX_HIT
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $2
	anim_sound 0, 1, SFX_DOUBLE_KICK
	anim_obj ANIM_OBJ_KICK, 124, 64, $0
	anim_obj ANIM_OBJ_HIT_BIG_YFIX, 124, 64, $0
	anim_wait 6
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $2
	anim_sound 0, 1, SFX_DOUBLE_KICK
	anim_obj ANIM_OBJ_KICK, 132, 64, $0
	anim_obj ANIM_OBJ_HIT_BIG_YFIX, 132, 64, $0
	anim_wait 6
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $2
	anim_sound 0, 1, SFX_DOUBLE_KICK
	anim_obj ANIM_OBJ_KICK, 140, 64, $0
	anim_obj ANIM_OBJ_HIT_BIG_YFIX, 140, 64, $0
	anim_wait 16
	anim_ret

BattleAnim_WingAttack:
	anim_1gfx ANIM_GFX_HIT
.hit
	anim_sound 0, 1, SFX_WING_ATTACK
	anim_obj ANIM_OBJ_HIT_YFIX, 148, 56, $0
	anim_obj ANIM_OBJ_HIT_YFIX, 116, 56, $0
	anim_wait 6
	anim_sound 0, 1, SFX_WING_ATTACK
	anim_obj ANIM_OBJ_HIT_YFIX, 144, 56, $0
	anim_obj ANIM_OBJ_HIT_YFIX, 120, 56, $0
	anim_wait 6
	anim_sound 0, 1, SFX_WING_ATTACK
	anim_obj ANIM_OBJ_HIT_YFIX, 140, 56, $0
	anim_obj ANIM_OBJ_HIT_YFIX, 124, 56, $0
	anim_wait 16
	anim_ret

BattleAnim_Disable:
	anim_2gfx ANIM_GFX_LIGHTNING, ANIM_GFX_STATUS
	anim_call BattleAnimSub_BGCycleOBPalsGrayAndYellow_2
	anim_obj ANIM_OBJ_DISABLE, 132, 56, $0
	anim_wait 16
	anim_sound 0, 1, SFX_BIND
	anim_obj ANIM_OBJ_PARALYZED, 104, 56, $42
	anim_obj ANIM_OBJ_PARALYZED, 160, 56, $c2
	anim_wait 96
	anim_ret

BattleAnim_Struggle:
	anim_1gfx ANIM_GFX_HIT
	anim_sound 0, 1, SFX_POUND
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 56, $0
	anim_wait 16
	anim_ret

BattleAnim_Sketch:
	anim_1gfx ANIM_GFX_OBJECTS
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_CYCLE_MON_LIGHT_DARK_REPEATING, $0, $1, $20
	anim_sound 0, 0, SFX_SKETCH
	anim_obj ANIM_OBJ_SKETCH, 72, 80, $0
	anim_wait 80
	anim_incbgeffect ANIM_BG_CYCLE_MON_LIGHT_DARK_REPEATING
	anim_call BattleAnim_ShowMon_0
	anim_wait 1
	anim_ret

BattleAnim_Curse:
	anim_jumpif $1, .NotGhost
	anim_2gfx ANIM_GFX_HIT, ANIM_GFX_OBJECTS
	anim_obj ANIM_OBJ_CURSE, 68, 72, $0
	anim_sound 0, 0, SFX_CURSE
	anim_wait 32
	anim_incobj  1
	anim_wait 12
	anim_sound 0, 0, SFX_POISON_STING
	anim_obj ANIM_OBJ_HIT, 44, 96, $0
	anim_wait 16
	anim_ret

.NotGhost:
	anim_1gfx ANIM_GFX_SPEED
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_FADE_MON_TO_BLACK_REPEATING, $0, $1, $40
	anim_sound 0, 0, SFX_SHARPEN
	anim_wait 64
	anim_incbgeffect ANIM_BG_FADE_MON_TO_BLACK_REPEATING
	anim_wait 1
	anim_bgeffect ANIM_BG_FADE_MON_TO_LIGHT, $0, $1, $40
.loop
	anim_sound 0, 0, SFX_SWORDS_DANCE
	anim_call BattleAnimSub_Focus
	anim_wait 2
	anim_loop 3, .loop
	anim_wait 8
	anim_incbgeffect ANIM_BG_FADE_MON_TO_LIGHT
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_Flail:
	anim_1gfx ANIM_GFX_HIT
	anim_call BattleAnim_TargetObj_1Row
	anim_sound 0, 0, SFX_SUBMISSION
	anim_bgeffect ANIM_BG_FLAIL, $0, $1, $0
	anim_wait 8
	anim_obj ANIM_OBJ_HIT_YFIX, 120, 48, $0
	anim_wait 8
	anim_obj ANIM_OBJ_HIT_YFIX, 152, 48, $0
	anim_wait 8
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 48, $0
	anim_wait 8
	anim_incbgeffect ANIM_BG_FLAIL
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_Conversion:
	anim_1gfx ANIM_GFX_EXPLOSION
	anim_bgeffect ANIM_BG_ALTERNATE_HUES, $0, $2, $0
	anim_sound 63, 3, SFX_SHARPEN
	anim_obj ANIM_OBJ_CONVERSION, 48, 88, $0
	anim_obj ANIM_OBJ_CONVERSION, 48, 88, $8
	anim_obj ANIM_OBJ_CONVERSION, 48, 88, $10
	anim_obj ANIM_OBJ_CONVERSION, 48, 88, $18
	anim_obj ANIM_OBJ_CONVERSION, 48, 88, $20
	anim_obj ANIM_OBJ_CONVERSION, 48, 88, $28
	anim_obj ANIM_OBJ_CONVERSION, 48, 88, $30
	anim_obj ANIM_OBJ_CONVERSION, 48, 88, $38
	anim_wait 128
	anim_ret

BattleAnim_Reversal:
	anim_2gfx ANIM_GFX_SHINE, ANIM_GFX_HIT
	anim_bgeffect ANIM_BG_CYCLE_MID_OBPALS_GRAY_AND_YELLOW, $0, $0, $0
	anim_sound 0, 1, SFX_MEGA_PUNCH
	anim_obj ANIM_OBJ_HIT, 112, 64, $0
	anim_wait 2
	anim_sound 0, 1, SFX_SHINE
	anim_obj ANIM_OBJ_FORESIGHT, 120, 56, $0
	anim_wait 2
	anim_sound 0, 1, SFX_MEGA_PUNCH
	anim_obj ANIM_OBJ_HIT, 128, 56, $0
	anim_wait 2
	anim_sound 0, 1, SFX_SHINE
	anim_obj ANIM_OBJ_FORESIGHT, 136, 48, $0
	anim_wait 2
	anim_sound 0, 1, SFX_MEGA_PUNCH
	anim_obj ANIM_OBJ_HIT, 144, 48, $0
	anim_wait 2
	anim_sound 0, 1, SFX_SHINE
	anim_obj ANIM_OBJ_FORESIGHT, 152, 40, $0
	anim_wait 24
	anim_ret

BattleAnim_IceShard:
	anim_4gfx ANIM_GFX_ICE, ANIM_GFX_HAZE, ANIM_GFX_SPEED, ANIM_GFX_HIT
	anim_setobjpal PAL_BATTLE_OB_BLUE, PAL_BTLCUSTOM_ICE
	anim_setobjpal PAL_BATTLE_OB_YELLOW, PAL_BTLCUSTOM_ICE
	anim_bgeffect ANIM_BG_WHITE_HUES, $0, $8, $0
	anim_sound 0, 0, SFX_SWORDS_DANCE
	anim_obp0 $54
.loop
	anim_obj ANIM_OBJ_ICE_SHARD_MIST, 48, 80, $0
	anim_wait 8
	anim_loop 4, .loop
	anim_obj ANIM_OBJ_ICE, 40, 78, $0
	anim_wait 6
	anim_obj ANIM_OBJ_ICE, 56, 106, $0
	anim_wait 6
	anim_obj ANIM_OBJ_ICE, 32, 92, $0
	anim_wait 6
	anim_obj ANIM_OBJ_ICE, 64, 92, $0
	anim_wait 6
	anim_obj ANIM_OBJ_ICE, 56, 78, $0
	anim_wait 6
	anim_obj ANIM_OBJ_ICE, 40, 106, $0
	anim_wait 6
	anim_resetobp0
	anim_setobjpal PAL_BATTLE_OB_GRAY, PAL_BTLCUSTOM_ICE
	anim_sound 0, 0, SFX_MEGA_PUNCH
	anim_obj ANIM_OBJ_ICE_SHARD, 48, 84, $18
	anim_wait 6
	anim_obj ANIM_OBJ_ICE_SHARD, 48, 116, $18
	anim_wait 6
	anim_obj ANIM_OBJ_HIT_YFIX, 140, 44, $0
	anim_sound 6, 2, SFX_SHINE
	anim_obj ANIM_OBJ_ICE_SHARD, 48, 108, $18
	anim_wait 4
	anim_obj ANIM_OBJ_HIT_YFIX, 124, 60, $0
	anim_sound 6, 2, SFX_SHINE
	anim_wait 2
	anim_obj ANIM_OBJ_ICE_SHARD, 48, 92, $18
	anim_wait 2
	anim_obj ANIM_OBJ_HIT_YFIX, 140, 60, $0
	anim_sound 6, 2, SFX_SHINE
	anim_wait 4
	anim_obj ANIM_OBJ_HIT_YFIX, 124, 44, $0
	anim_sound 6, 2, SFX_SHINE
	anim_wait 4
	anim_obj ANIM_OBJ_HIT_YFIX, 132, 52, $0
	anim_sound 6, 2, SFX_SHINE
	anim_obj ANIM_OBJ_PULSING_SPARKLE_YFIX, 148, 32, $0
	anim_wait 6
	anim_obj ANIM_OBJ_PULSING_SPARKLE_YFIX, 116, 64, $0
	anim_wait 6
	anim_obj ANIM_OBJ_PULSING_SPARKLE_YFIX, 148, 64, $0
	anim_wait 6
	anim_obj ANIM_OBJ_PULSING_SPARKLE_YFIX, 116, 32, $0
	anim_wait 6
	anim_obj ANIM_OBJ_PULSING_SPARKLE_YFIX, 132, 48, $0
	anim_wait 32
	anim_ret

BattleAnim_Protect:
	anim_1gfx ANIM_GFX_STARS
	anim_bgeffect ANIM_BG_CYCLE_MID_OBPALS_GRAY_AND_YELLOW, $0, $2, $0
	anim_obj ANIM_OBJ_PROTECT, 80, 80, $0
	anim_obj ANIM_OBJ_PROTECT, 80, 80, $d
	anim_obj ANIM_OBJ_PROTECT, 80, 80, $1a
	anim_obj ANIM_OBJ_PROTECT, 80, 80, $27
	anim_obj ANIM_OBJ_PROTECT, 80, 80, $34
	anim_sound 0, 0, SFX_PROTECT
	anim_wait 96
	anim_ret

BattleAnim_MachPunch:
	anim_2gfx ANIM_GFX_SPEED, ANIM_GFX_HIT
	anim_bgeffect ANIM_BG_HIDE_MON, $0, $1, $0
	anim_sound 0, 0, SFX_MENU
	anim_call BattleAnimSub_QuickAttack
	anim_wait 12
	anim_sound 0, 1, SFX_MEGA_PUNCH
	anim_obj ANIM_OBJ_PUNCH, 136, 56, $0
	anim_wait 6
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 56, $0
	anim_wait 8
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_wait 16
	anim_ret

BattleAnim_ScaryFace:
	anim_jumpif $1, BattleAnim_CottonSpore
	anim_jumpif $2, BattleAnim_StringShot
	anim_1gfx ANIM_GFX_BEAM
	anim_bgeffect ANIM_BG_ALTERNATE_HUES, $0, $2, $0
	anim_call BattleAnimSub_BGCycleOBPalsGrayAndYellow_2
	anim_call BattleAnimSub_EyeBeams
	anim_wait 64
	anim_ret

BattleAnim_FeintAttack:
	anim_1gfx ANIM_GFX_HIT
	anim_sound 0, 0, SFX_CURSE
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_FADE_MON_TO_WHITE_WAIT_FADE_BACK, $0, $1, $80
	anim_wait 96
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_HIT, 120, 40, $0
	anim_wait 8
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_HIT, 152, 48, $0
	anim_wait 8
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_HIT, 136, 56, $0
	anim_wait 32
	anim_incbgeffect ANIM_BG_FADE_MON_TO_WHITE_WAIT_FADE_BACK
	anim_call BattleAnim_ShowMon_0
	anim_wait 4
	anim_ret

BattleAnim_BellyDrum:
	anim_2gfx ANIM_GFX_HIT, ANIM_GFX_NOISE
	anim_sound 0, 0, SFX_BELLY_DRUM
	anim_obj ANIM_OBJ_BELLY_DRUM_HAND, 64, 104, $0
	anim_obj ANIM_OBJ_BELLY_DRUM_NOTE, 64, 92, $f8
	anim_wait 24
	anim_sound 0, 0, SFX_BELLY_DRUM
	anim_obj ANIM_OBJ_BELLY_DRUM_HAND, 64, 104, $0
	anim_obj ANIM_OBJ_BELLY_DRUM_NOTE, 64, 92, $f8
	anim_wait 24
	anim_sound 0, 0, SFX_BELLY_DRUM
	anim_obj ANIM_OBJ_BELLY_DRUM_HAND, 64, 104, $0
	anim_obj ANIM_OBJ_BELLY_DRUM_NOTE, 64, 92, $f8
	anim_wait 12
	anim_sound 0, 0, SFX_BELLY_DRUM
	anim_obj ANIM_OBJ_BELLY_DRUM_HAND, 64, 104, $0
	anim_obj ANIM_OBJ_BELLY_DRUM_NOTE, 64, 92, $f8
	anim_wait 12
	anim_sound 0, 0, SFX_BELLY_DRUM
	anim_obj ANIM_OBJ_BELLY_DRUM_HAND, 64, 104, $0
	anim_obj ANIM_OBJ_BELLY_DRUM_NOTE, 64, 92, $f8
	anim_wait 24
	anim_sound 0, 0, SFX_BELLY_DRUM
	anim_obj ANIM_OBJ_BELLY_DRUM_HAND, 64, 104, $0
	anim_obj ANIM_OBJ_BELLY_DRUM_NOTE, 64, 92, $f8
	anim_wait 12
	anim_sound 0, 0, SFX_BELLY_DRUM
	anim_obj ANIM_OBJ_BELLY_DRUM_HAND, 64, 104, $0
	anim_obj ANIM_OBJ_BELLY_DRUM_NOTE, 64, 92, $f8
	anim_wait 12
	anim_sound 0, 0, SFX_BELLY_DRUM
	anim_obj ANIM_OBJ_BELLY_DRUM_HAND, 64, 104, $0
	anim_obj ANIM_OBJ_BELLY_DRUM_NOTE, 64, 92, $f8
	anim_wait 12
	anim_sound 0, 0, SFX_BELLY_DRUM
	anim_obj ANIM_OBJ_BELLY_DRUM_HAND, 64, 104, $0
	anim_obj ANIM_OBJ_BELLY_DRUM_NOTE, 64, 92, $f8
	anim_wait 12
	anim_ret

BattleAnim_SludgeBomb:
	anim_setobjpal PAL_BATTLE_OB_GRAY, PAL_BTLCUSTOM_PURPLE
	anim_2gfx ANIM_GFX_EGG, ANIM_GFX_POISON
	anim_bgeffect ANIM_BG_BLACK_HUES, $0, $8, $0
	anim_sound 6, 2, SFX_SLUDGE_BOMB
	anim_obj ANIM_OBJ_SLUDGE_BOMB, 64, 92, $10
	anim_wait 36
	anim_jump BattleAnimSub_Sludge

BattleAnim_SandAttack:
	anim_jumpif $1, BattleAnim_Flash
	anim_jumpif $2, BattleAnim_Smokescreen
	anim_1gfx ANIM_GFX_SAND
	anim_call BattleAnim_Sand_Branch
	anim_ret
	
BattleAnim_MudSlap:
	anim_1gfx ANIM_GFX_SAND
	anim_obp0 $fc
	anim_jump BattleAnim_Sand_Branch

BattleAnim_Spikes:
	anim_1gfx ANIM_GFX_MISC
	anim_sound 6, 2, SFX_MENU
	anim_obj ANIM_OBJ_SPIKES, 48, 88, $20
	anim_wait 8
	anim_sound 6, 2, SFX_MENU
	anim_obj ANIM_OBJ_SPIKES, 48, 88, $30
	anim_wait 8
	anim_sound 6, 2, SFX_MENU
	anim_obj ANIM_OBJ_SPIKES, 48, 88, $28
	anim_wait 64
	anim_ret

BattleAnim_ZapCannon:
	anim_2gfx ANIM_GFX_LIGHTNING, ANIM_GFX_EXPLOSION
	anim_setobjpal PAL_BATTLE_OB_GRAY, PAL_BTLCUSTOM_LIGHT_SCREEN
	anim_setobjpal PAL_BATTLE_OB_YELLOW, PAL_BTLCUSTOM_ZAP_CANNON
	anim_bgp $1b
	anim_sound 6, 2, SFX_ZAP_CANNON
	anim_obj ANIM_OBJ_ZAP_CANNON, 64, 92, $2
	anim_wait 40
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $60, $2, $0
	anim_bgeffect ANIM_BG_CYCLE_OBPALS_GRAY_AND_YELLOW, $0, $2, $0
	anim_sound 0, 1, SFX_THUNDERBOLT
	anim_obj ANIM_OBJ_THUNDERBOLT_CORE, 132, 52, $2
	anim_wait 16
	anim_obj ANIM_OBJ_THUNDERBOLT_SPARKS, 132, 52, $0
	anim_wait 80
	anim_ret

BattleAnim_Foresight:
	anim_jumpif $1, BattleAnim_OdorSleuth
	anim_jumpif $2, BattleAnim_MiracleEye
	anim_1gfx ANIM_GFX_SHINE
	anim_call BattleAnim_FollowEnemyFeet_1
	anim_bgeffect ANIM_BG_CYCLE_MID_OBPALS_GRAY_AND_YELLOW, $0, $0, $0
	anim_sound 0, 1, SFX_FORESIGHT
	anim_obj ANIM_OBJ_FORESIGHT, 132, 40, $0
	anim_wait 24
	anim_bgeffect ANIM_BG_FADE_MON_TO_BLACK_REPEATING, $0, $0, $40
	anim_wait 64
	anim_incbgeffect ANIM_BG_FADE_MON_TO_BLACK_REPEATING
	anim_call BattleAnim_ShowMon_1
	anim_wait 8
	anim_ret

BattleAnim_DestinyBond:
	anim_1gfx ANIM_GFX_ANGELS
	anim_bgp $1b
	anim_obp0 $0
	anim_jumpif $1, BattleAnim_DestinyBond_branch_cb104
	anim_sound 6, 2, SFX_WHIRLWIND
	anim_obj ANIM_OBJ_DESTINY_BOND, 44, 120, $2
	anim_wait 128
	anim_bgp $e4
	anim_ret

BattleAnim_DestinyBond_branch_cb104:
	anim_obj ANIM_OBJ_DESTINY_BOND, 132, 76, $0
	anim_sound 0, 1, SFX_KINESIS
	anim_bgeffect ANIM_BG_RETURN_MON, $0, $0, $0
	anim_wait 32
	anim_bgp $e4
	anim_ret

BattleAnim_PerishSong:
	anim_1gfx ANIM_GFX_NOISE
	anim_call BattleAnimSub_BGCycleOBPalsGrayAndYellow_2
	anim_bgeffect ANIM_BG_ALTERNATE_HUES, $0, $2, $0
	anim_sound 0, 2, SFX_PERISH_SONG
	anim_obj ANIM_OBJ_PERISH_SONG, 88, 0, $0
	anim_obj ANIM_OBJ_PERISH_SONG, 88, 0, $8
	anim_obj ANIM_OBJ_PERISH_SONG, 88, 0, $10
	anim_obj ANIM_OBJ_PERISH_SONG, 88, 0, $18
	anim_obj ANIM_OBJ_PERISH_SONG, 88, 0, $20
	anim_obj ANIM_OBJ_PERISH_SONG, 88, 0, $28
	anim_obj ANIM_OBJ_PERISH_SONG, 88, 0, $30
	anim_obj ANIM_OBJ_PERISH_SONG, 88, 0, $38
	anim_wait 112
	anim_ret

BattleAnim_IcyWind:
	anim_setobjpal PAL_BATTLE_OB_YELLOW, PAL_BTLCUSTOM_ICE
	anim_setobjpal PAL_BATTLE_OB_GRAY, PAL_BTLCUSTOM_ICE
	anim_2gfx ANIM_GFX_SPEED, ANIM_GFX_HAZE
	anim_bgeffect ANIM_BG_CYCLE_OBPALS_GRAY_AND_YELLOW, $0, $2, $0
	anim_bgeffect ANIM_BG_ALTERNATE_HUES, $0, $2, $0
	anim_battlergfx_1row
	anim_sound 0, 0, SFX_PSYCHIC
.loop
	anim_obj ANIM_OBJ_SHOOTING_MIST, 64, 80, $4
	anim_wait 4
	anim_obj ANIM_OBJ_SHOOTING_SPARKLE, 64, 88, $4
	anim_wait 4
	anim_obj ANIM_OBJ_SHOOTING_MIST, 64, 96, $4
	anim_wait 4
	anim_obj ANIM_OBJ_SHOOTING_SPARKLE, 64, 80, $4
	anim_wait 4
	anim_obj ANIM_OBJ_SHOOTING_MIST, 64, 88, $4
	anim_wait 4
	anim_obj ANIM_OBJ_SHOOTING_SPARKLE, 64, 96, $4
	anim_wait 4
	anim_loop 2, .loop
	anim_wait 16
	anim_bgeffect ANIM_BG_BATTLEROBJ_2ROW, $0, $1, $0
	anim_wait 6
	anim_bgeffect ANIM_BG_NIGHT_SHADE, $0, $0, $8
	anim_wait 64
	anim_incbgeffect ANIM_BG_NIGHT_SHADE
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_wait 4
	anim_incobj 7
	anim_wait 1
	anim_ret

;BattleAnim_MudShot:
;	anim_1gfx ANIM_GFX_POISON
;.loop
;	anim_sound 6, 2, SFX_BUBBLE_BEAM
;	anim_obj ANIM_OBJ_GUNKSHOT, 64, 92, $4
;	anim_wait 4
;	anim_obj ANIM_OBJ_GUNKSHOT, 64, 92, $4
;	anim_wait 4
;	anim_obj ANIM_OBJ_MUD_SPLASH, 136, 56, $5c
;	anim_obj ANIM_OBJ_MUD_SPLASH, 136, 56, $e8
;	anim_obj ANIM_OBJ_MUD_SPLASH, 136, 56, $d0
;	anim_obj ANIM_OBJ_MUD_SPLASH, 136, 56, $50
;	anim_loop 8, .loop
;	anim_wait 16
;	anim_ret

BattleAnim_Outrage:
	anim_3gfx ANIM_GFX_SWIRL, ANIM_GFX_VORTEX, ANIM_GFX_FIRE
	anim_setobjpal PAL_BATTLE_OB_GRAY, PAL_BTLCUSTOM_OUTRAGE
	anim_setobjpal PAL_BATTLE_OB_RED, PAL_BTLCUSTOM_OUTRAGE
	anim_bgeffect ANIM_BG_CYCLE_OBPALS_GRAY_AND_YELLOW, $0, $8, $0
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_Y, $88, $1, $8
	anim_bgeffect ANIM_BG_CYCLE_MON_LIGHT_DARK_REPEATING, $0, $1, $20
	anim_sound 0, 1, SFX_OUTRAGE
.loop
	anim_obj ANIM_OBJ_SWIRL_SHORT, 44, 96, $0
	anim_wait 8
	anim_loop 7, .loop
	anim_incbgeffect ANIM_BG_CYCLE_MON_LIGHT_DARK_REPEATING
	anim_obj ANIM_OBJ_VORTEX, 44, 96, $0
	anim_bgeffect ANIM_BG_CYCLE_BGPALS_INVERTED, $0, $4, $0
.loop2
	anim_sound 0, 0, SFX_RAZOR_WIND
	anim_obj ANIM_OBJ_RADIAL_FLAME, 44, 96, $38
	anim_obj ANIM_OBJ_RADIAL_FLAME, 44, 96, $10
	anim_wait 6
	anim_sound 0, 0, SFX_RAZOR_WIND
	anim_obj ANIM_OBJ_RADIAL_FLAME, 44, 96, $2a
	anim_obj ANIM_OBJ_RADIAL_FLAME, 44, 96, $4
	anim_wait 6
	anim_sound 0, 0, SFX_RAZOR_WIND
	anim_obj ANIM_OBJ_RADIAL_FLAME, 44, 96, $18
	anim_obj ANIM_OBJ_RADIAL_FLAME, 44, 96, $3b
	anim_wait 6
	anim_sound 0, 0, SFX_RAZOR_WIND
	anim_obj ANIM_OBJ_RADIAL_FLAME, 44, 96, $1a
	anim_obj ANIM_OBJ_RADIAL_FLAME, 44, 96, $0a
	anim_wait 6
	anim_sound 0, 0, SFX_RAZOR_WIND
	anim_obj ANIM_OBJ_RADIAL_FLAME, 44, 96, $1e
	anim_obj ANIM_OBJ_RADIAL_FLAME, 44, 96, $30
	anim_wait 6
	anim_loop 2, .loop2
	anim_wait 16
	anim_ret

BattleAnim_InSandstorm:
BattleAnim_Sandstorm:
	anim_1gfx ANIM_GFX_POWDER
	anim_obj ANIM_OBJ_SANDSTORM, 88, 0, $0
	anim_wait 8
	anim_obj ANIM_OBJ_SANDSTORM, 72, 0, $1
	anim_wait 8
	anim_obj ANIM_OBJ_SANDSTORM, 56, 0, $2
.loop
	anim_sound 0, 1, SFX_MENU
	anim_wait 8
	anim_loop 16, .loop
	anim_wait 8
	anim_ret

BattleAnim_InHail:
BattleAnim_Hail:
	anim_setobjpal PAL_BATTLE_OB_BLUE, PAL_BTLCUSTOM_ICE
	anim_1gfx ANIM_GFX_ICE
	anim_bgeffect ANIM_BG_WHITE_HUES, $0, $8, $0
.loop
	anim_sound 0, 1, SFX_SHINE
	anim_obj ANIM_OBJ_HAIL, 88, 0, $0
	anim_obj ANIM_OBJ_HAIL, 68, 0, $1
	anim_wait 8
	anim_sound 0, 1, SFX_SHINE
	anim_obj ANIM_OBJ_HAIL, 188, 0, $2
	anim_obj ANIM_OBJ_HAIL, 168, 0, $0
	anim_wait 8
	anim_sound 0, 1, SFX_SHINE
	anim_obj ANIM_OBJ_HAIL, 28, 0, $1
	anim_obj ANIM_OBJ_HAIL, 8, 0, $2
	anim_wait 8
	anim_sound 0, 1, SFX_SHINE
	anim_obj ANIM_OBJ_HAIL, 238, 0, $0
	anim_obj ANIM_OBJ_HAIL, 218, 0, $1
	anim_wait 8
	anim_sound 0, 1, SFX_SHINE
	anim_obj ANIM_OBJ_HAIL, 138, 0, $2
	anim_obj ANIM_OBJ_HAIL, 118, 0, $1
	anim_wait 8
	anim_loop 3, .loop
	anim_ret

BattleAnim_GigaDrain:
	anim_setobjpal PAL_BATTLE_OB_YELLOW, PAL_BTLCUSTOM_LIME
	anim_call BattleAnimSub_BGCycleOBPalsGrayAndYellow_6
	anim_2gfx ANIM_GFX_CHARGE, ANIM_GFX_SHINE
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_FADE_MONS_TO_BLACK_REPEATING, $0, $0, $10
	anim_setvar $0
	anim_sound 6, 3, SFX_GIGA_DRAIN
.loop
	anim_obj ANIM_OBJ_ABSORB, 128, 48, $2
	anim_wait 3
	anim_obj ANIM_OBJ_ABSORB, 136, 64, $3
	anim_wait 4
	anim_obj ANIM_OBJ_ABSORB, 136, 32, $4
	anim_wait 3
	anim_incvar
	anim_jumpvar $d, .done
	anim_jumpvar $4, .spawn
	anim_jump .loop
.spawn
	anim_obj ANIM_OBJ_ABSORB_CENTER, 44, 88, $0
	anim_jump .loop
.done
	anim_wait 32
	anim_incbgeffect ANIM_BG_FADE_MONS_TO_BLACK_REPEATING
	anim_call BattleAnim_ShowMon_0
	anim_bgeffect ANIM_BG_CYCLE_MID_OBPALS_GRAY_AND_YELLOW, $0, $0, $0
.loop2
	anim_sound 0, 0, SFX_METRONOME
	anim_obj ANIM_OBJ_GLIMMER, 24, 64, $0
	anim_wait 5
	anim_obj ANIM_OBJ_GLIMMER, 56, 104, $0
	anim_wait 5
	anim_obj ANIM_OBJ_GLIMMER, 24, 104, $0
	anim_wait 5
	anim_obj ANIM_OBJ_GLIMMER, 56, 64, $0
	anim_wait 5
	anim_obj ANIM_OBJ_GLIMMER, 40, 84, $0
	anim_wait 5
	anim_loop 2, .loop2
	anim_wait 32
	anim_ret

BattleAnim_Endure:
	anim_1gfx ANIM_GFX_SPEED
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_CYCLE_MON_LIGHT_DARK_REPEATING, $0, $1, $20
	anim_bgeffect ANIM_BG_CYCLE_MID_OBPALS_GRAY_AND_YELLOW, $0, $2, $0
.loop
	anim_sound 0, 0, SFX_SWORDS_DANCE
	anim_call BattleAnimSub_Focus
	anim_wait 2
	anim_loop 5, .loop
	anim_wait 8
	anim_incbgeffect ANIM_BG_CYCLE_MON_LIGHT_DARK_REPEATING
	anim_jump BattleAnim_ShowMon_0

BattleAnim_Charm:
	anim_jumpif $1, BattleAnim_FeatherDance
	anim_1gfx ANIM_GFX_OBJECTS
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_WOBBLE_MON, $0, $1, $0
	anim_sound 0, 0, SFX_ATTRACT
	anim_obj ANIM_OBJ_HEART, 64, 80, $0
	anim_wait 32
	anim_incbgeffect ANIM_BG_WOBBLE_MON
	anim_call BattleAnim_ShowMon_0
	anim_wait 4
	anim_ret

BattleAnim_Rollout:
	anim_1gfx ANIM_GFX_HIT
	anim_sound 0, 0, SFX_SPARK
	anim_call BattleAnim_TargetObj_2Row
	anim_bgeffect ANIM_BG_ROLLOUT, $60, $1, $1
	anim_bgeffect ANIM_BG_BODY_SLAM, $0, $1, $0
	anim_wait 4
	anim_sound 0, 1, SFX_MEGA_PUNCH
	anim_obj ANIM_OBJ_HIT_BIG, 136, 40, $0
	anim_wait 8
	anim_jump BattleAnim_ShowMon_0

BattleAnim_FalseSwipe:
	anim_2gfx ANIM_GFX_SHINE, ANIM_GFX_CUT
	anim_bgeffect ANIM_BG_CYCLE_MID_OBPALS_GRAY_AND_YELLOW, $0, $0, $0
	anim_sound 0, 1, SFX_CUT
	anim_obj ANIM_OBJ_CUT_LONG_DOWN_LEFT, 152, 40, $0
	anim_wait 4
	anim_obj ANIM_OBJ_GLIMMER, 136, 40, $0
	anim_wait 32
	anim_ret

BattleAnim_Swagger:
	anim_2gfx ANIM_GFX_MISC, ANIM_GFX_WIND
.loop
	anim_sound 0, 0, SFX_MENU
	anim_obj ANIM_OBJ_SWAGGER, 72, 88, $44
	anim_wait 32
	anim_loop 2, .loop
	anim_wait 32
	anim_sound 0, 1, SFX_KINESIS_2
	anim_obj ANIM_OBJ_ANGER, 104, 40, $0
	anim_wait 40
	anim_ret

BattleAnim_MilkDrink:
	anim_2gfx ANIM_GFX_MISC, ANIM_GFX_BUBBLE
	anim_call BattleAnim_TargetObj_1Row
	anim_obj ANIM_OBJ_MILK_DRINK, 74, 104, $0
	anim_wait 16
	anim_bgeffect ANIM_BG_FADE_MON_TO_LIGHT_REPEATING, $0, $1, $40
	anim_sound 0, 0, SFX_MILK_DRINK
.loop
	anim_obj ANIM_OBJ_RECOVER, 44, 88, $20
	anim_wait 8
	anim_loop 8, .loop
	anim_wait 128
	anim_incbgeffect ANIM_BG_FADE_MON_TO_LIGHT_REPEATING
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_Spark:
	anim_2gfx ANIM_GFX_LIGHTNING, ANIM_GFX_EXPLOSION
	anim_bgeffect ANIM_BG_CYCLE_OBPALS_GRAY_AND_YELLOW, $0, $2, $0
	anim_sound 0, 0, SFX_ZAP_CANNON
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $3
	anim_obj ANIM_OBJ_THUNDER_WAVE, 48, 92, $0
	anim_wait 24
	anim_setobj $1, $3
	anim_wait 1
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_TACKLE, $0, $1, $0
	anim_sound 0, 0, SFX_SPARK
	anim_wait 16
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $0, $0
	anim_wait 4
	anim_clearobjs
	anim_bgeffect ANIM_BG_CYCLE_OBPALS_GRAY_AND_YELLOW, $0, $2, $0
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_wait 1
	anim_sound 0, 1, SFX_THUNDERSHOCK
	anim_obj ANIM_OBJ_THUNDERBOLT_CORE, 132, 52, $2
	anim_obj ANIM_OBJ_THUNDERSHOCK_SPARKS, 132, 52, $0
	anim_wait 32
	anim_ret

BattleAnim_FuryCutter:
	anim_1gfx ANIM_GFX_CUT
.loop
	anim_sound 0, 1, SFX_CUT
	anim_jumpand $1, .obj1
	anim_obj ANIM_OBJ_CUT_LONG_DOWN_LEFT, 152, 40, $0
	anim_jump .okay

.obj1
	anim_obj ANIM_OBJ_CUT_LONG_DOWN_RIGHT, 112, 40, $0
.okay
	anim_wait 16
	anim_jumpuntil .loop
	anim_ret

BattleAnim_SteelWing:
	anim_1gfx ANIM_GFX_REFLECT
	anim_obp0 $0
	anim_sound 0, 0, SFX_RAGE
	anim_call BattleAnim_TargetObj_1Row
	anim_call BattleAnimSub_Metallic
	anim_call BattleAnim_ShowMon_0
	anim_1gfx ANIM_GFX_HIT
	anim_resetobp0
	anim_jump BattleAnim_WingAttack.hit

BattleAnim_MeanLook:
	anim_jumpif $1, BattleAnim_Block
	anim_jumpif $2, BattleAnim_SpiderWeb
	anim_1gfx ANIM_GFX_PSYCHIC
	anim_obp0 $e0
	anim_sound 0, 1, SFX_MEAN_LOOK
	anim_obj ANIM_OBJ_MEAN_LOOK, 148, 32, $0
	anim_wait 5
	anim_obj ANIM_OBJ_MEAN_LOOK, 116, 64, $0
	anim_wait 5
	anim_obj ANIM_OBJ_MEAN_LOOK, 148, 64, $0
	anim_wait 5
	anim_obj ANIM_OBJ_MEAN_LOOK, 116, 32, $0
	anim_wait 5
	anim_obj ANIM_OBJ_MEAN_LOOK, 132, 48, $0
	anim_wait 128
	anim_ret

BattleAnim_Attract:
	anim_1gfx ANIM_GFX_OBJECTS
.loop
	anim_sound 0, 0, SFX_ATTRACT
	anim_obj ANIM_OBJ_ATTRACT, 44, 80, $2
	anim_wait 8
	anim_loop 5, .loop
	anim_wait 128
	anim_wait 64
	anim_ret

BattleAnim_HealBell:
	anim_2gfx ANIM_GFX_MISC, ANIM_GFX_NOISE
	anim_obj ANIM_OBJ_HEAL_BELL, 72, 56, $0
	anim_wait 32
.loop
	anim_sound 0, 0, SFX_HEAL_BELL
	anim_obj ANIM_OBJ_HEAL_BELL_NOTE, 72, 52, $0
	anim_wait 8
	anim_sound 0, 0, SFX_HEAL_BELL
	anim_obj ANIM_OBJ_HEAL_BELL_NOTE, 72, 52, $1
	anim_wait 8
	anim_sound 0, 0, SFX_HEAL_BELL
	anim_obj ANIM_OBJ_HEAL_BELL_NOTE, 72, 52, $2
	anim_wait 8
	anim_sound 0, 0, SFX_HEAL_BELL
	anim_obj ANIM_OBJ_HEAL_BELL_NOTE, 72, 52, $0
	anim_wait 8
	anim_sound 0, 0, SFX_HEAL_BELL
	anim_obj ANIM_OBJ_HEAL_BELL_NOTE, 72, 52, $2
	anim_wait 8
	anim_loop 4, .loop
	anim_wait 64
	anim_ret

BattleAnim_Return:
	anim_1gfx ANIM_GFX_HIT
	anim_call BattleAnim_TargetObj_2Row
	anim_bgeffect ANIM_BG_BOUNCE_DOWN, $0, $1, $0
	anim_sound 0, 0, SFX_RETURN
	anim_wait 64
	anim_incbgeffect ANIM_BG_BOUNCE_DOWN
	anim_wait 32
	anim_bgeffect ANIM_BG_BODY_SLAM, $0, $1, $0
	anim_wait 4
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_HIT_BIG, 136, 40, $0
	anim_wait 8
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_Safeguard:
	anim_1gfx ANIM_GFX_MISC
	anim_call BattleAnimSub_BGCycleOBPalsGrayAndYellow_2
	anim_obj ANIM_OBJ_SAFEGUARD, 80, 80, $0
	anim_obj ANIM_OBJ_SAFEGUARD, 80, 80, $d
	anim_obj ANIM_OBJ_SAFEGUARD, 80, 80, $1a
	anim_obj ANIM_OBJ_SAFEGUARD, 80, 80, $27
	anim_obj ANIM_OBJ_SAFEGUARD, 80, 80, $34
	anim_sound 0, 0, SFX_PROTECT
	anim_wait 96
	anim_ret

BattleAnim_FakeOut:
	anim_1gfx ANIM_GFX_OBJECTS
	anim_obj ANIM_OBJ_FAKE_OUT_L, 112, 48, $0
	anim_obj ANIM_OBJ_FAKE_OUT_R, 158, 48, $20
	anim_wait 32
	anim_sound 0, 0, SFX_DOUBLE_SLAP
	anim_incobj 1
	anim_incobj 2
	anim_wait 4
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $2
	anim_clearobjs
	anim_wait 1
	anim_sound 0, 0, SFX_RAGE
	anim_obj ANIM_OBJ_FAKE_OUT_L, 112, 48, $0
	anim_obj ANIM_OBJ_FAKE_OUT_R, 158, 48, $0
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $14, $2, $0
	anim_wait 32
	anim_ret

BattleAnim_FlameBurst:
	anim_setobjpal PAL_BATTLE_OB_RED, PAL_BTLCUSTOM_FIRE
	anim_1gfx ANIM_GFX_FIRE
	anim_sound 6, 2, SFX_STOMP
	anim_obj ANIM_OBJ_DRAGONBREATH, 64, 92, $4
	anim_wait 1
	anim_obj ANIM_OBJ_DRAGONBREATH, 64, 92, $4
	anim_wait 1
	anim_obj ANIM_OBJ_DRAGONBREATH, 64, 92, $4
	anim_wait 12
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $8, $2, $0
	anim_sound 0, 1, SFX_BURN
	anim_obj ANIM_OBJ_RADIAL_FLAME, 136, 48, $04
	anim_wait 1
	anim_obj ANIM_OBJ_RADIAL_FLAME, 136, 48, $2c
	anim_wait 1
	anim_sound 0, 1, SFX_BURN
	anim_obj ANIM_OBJ_RADIAL_FLAME, 136, 48, $14
	anim_wait 1
	anim_obj ANIM_OBJ_RADIAL_FLAME, 136, 48, $34
	anim_wait 1
	anim_sound 0, 1, SFX_BURN
	anim_obj ANIM_OBJ_RADIAL_FLAME, 136, 48, $10
	anim_wait 1
	anim_obj ANIM_OBJ_RADIAL_FLAME, 136, 48, $38
	anim_wait 1
	anim_obj ANIM_OBJ_RADIAL_FLAME, 136, 48, $20
	anim_wait 1
	anim_wait 32
	anim_ret

BattleAnim_Magnitude:
	anim_1gfx ANIM_GFX_ROCKS
.loop
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $e, $4, $0
	anim_sound 0, 1, SFX_STRENGTH
	anim_obj ANIM_OBJ_SMALL_ROCK, 128, 64, $40
	anim_wait 2
	anim_obj ANIM_OBJ_SMALL_ROCK, 120, 68, $30
	anim_wait 2
	anim_obj ANIM_OBJ_SMALL_ROCK, 152, 68, $30
	anim_wait 2
	anim_obj ANIM_OBJ_SMALL_ROCK, 144, 64, $40
	anim_wait 2
	anim_obj ANIM_OBJ_SMALL_ROCK, 136, 68, $30
	anim_wait 2
	anim_jumpuntil .loop
	anim_wait 96
	anim_ret

BattleAnim_Dynamicpunch:
	anim_2gfx ANIM_GFX_HIT, ANIM_GFX_EXPLOSION
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_call BattleAnimSub_Punch
	anim_wait 16
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $12
	anim_call BattleAnim_Explosion_2_Branch
	anim_wait 16
	anim_bgp $e4
	anim_ret

BattleAnim_Megahorn:
	anim_2gfx ANIM_GFX_HORN, ANIM_GFX_HIT
	anim_battlergfx_2row
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $30, $2, $0
	anim_wait 48
	anim_bgeffect ANIM_BG_BATTLEROBJ_1ROW, $0, $0, $0
	anim_wait 1
	anim_bgeffect ANIM_BG_TACKLE, $0, $1, $0
	anim_sound 0, 1, SFX_HORN_ATTACK
	anim_obj ANIM_OBJ_HORN, 72, 80, $1
	anim_wait 11
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $0, $0
	anim_incobj 1
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $10
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $30, $3, $0
.loop
	anim_obj ANIM_OBJ_HIT_BIG_YFIX, 136, 56, $0
	anim_wait 16
	anim_loop 3, .loop
	anim_ret

BattleAnim_Dragonbreath:
	anim_setobjpal PAL_BATTLE_OB_RED, PAL_BTLCUSTOM_DRAGONBREATH
	anim_1gfx ANIM_GFX_FIRE
	anim_sound 6, 2, SFX_EMBER
.loop
	anim_obj ANIM_OBJ_DRAGONBREATH, 64, 92, $4
	anim_wait 4
	anim_loop 10, .loop
	anim_wait 64
	anim_ret

BattleAnim_BatonPass:
	anim_1gfx ANIM_GFX_MISC
	anim_obj ANIM_OBJ_BATON_PASS, 44, 104, $20
	anim_sound 0, 0, SFX_BATON_PASS
	anim_call BattleAnim_BatonPass_branch_c9486
	anim_wait 64
	anim_ret

BattleAnim_Encore:
	anim_2gfx ANIM_GFX_OBJECTS, ANIM_GFX_STARS
	anim_obj ANIM_OBJ_ENCORE_HAND, 64, 80, $90
	anim_obj ANIM_OBJ_ENCORE_HAND, 64, 80, $10
	anim_sound 0, 0, SFX_ENCORE
	anim_wait 16
	anim_obj ANIM_OBJ_ENCORE_STAR, 64, 72, $2c
	anim_wait 32
	anim_obj ANIM_OBJ_ENCORE_STAR, 64, 72, $34
	anim_wait 16
	anim_ret

BattleAnim_Pursuit:
	anim_1gfx ANIM_GFX_HIT
.hit
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 56, $0
	anim_wait 16
	anim_ret

BattleAnim_RapidSpin:
	anim_2gfx ANIM_GFX_WIND, ANIM_GFX_HIT
	anim_obp0 $e4
.loop
	anim_sound 0, 0, SFX_MENU
	anim_obj ANIM_OBJ_RAPID_SPIN, 44, 112, $0
	anim_wait 2
	anim_loop 5, .loop
	anim_wait 24
	anim_call BattleAnim_TargetObj_2Row
	anim_bgeffect ANIM_BG_BODY_SLAM, $0, $1, $0
	anim_wait 4
	anim_resetobp0
	anim_sound 0, 1, SFX_MEGA_KICK
	anim_obj ANIM_OBJ_HIT, 136, 40, $0
	anim_wait 8
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $0, $0
	anim_wait 4
	anim_incobj  6
	anim_wait 1
	anim_ret

BattleAnim_IronTail:
	anim_1gfx ANIM_GFX_REFLECT
	anim_obp0 $0
	anim_sound 0, 0, SFX_RAGE
	anim_call BattleAnim_TargetObj_1Row
	anim_call BattleAnimSub_Metallic
	anim_wait 4
	anim_1gfx ANIM_GFX_HIT
	anim_resetobp0
	anim_bgeffect ANIM_BG_WOBBLE_MON, $0, $1, $0
	anim_wait 16
	anim_sound 0, 1, SFX_MEGA_KICK
	anim_obj ANIM_OBJ_HIT_BIG_YFIX, 136, 48, $0
	anim_wait 16
	anim_incbgeffect ANIM_BG_WOBBLE_MON
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_MetalClaw:
	anim_1gfx ANIM_GFX_REFLECT
	anim_obp0 $0
	anim_sound 0, 0, SFX_RAGE
	anim_call BattleAnim_TargetObj_1Row
	anim_call BattleAnimSub_Metallic
	anim_call BattleAnim_ShowMon_0
	anim_1gfx ANIM_GFX_CUT
	anim_resetobp0
	anim_jump BattleAnim_Scratch.hit
	anim_ret

BattleAnim_HealingLight:
	anim_jumpif $1, BattleAnim_Moonlight
	anim_jumpif $2, BattleAnim_Synthesis
BattleAnim_MorningSun:
	anim_1gfx ANIM_GFX_SHINE
	anim_bgeffect ANIM_BG_CYCLE_MID_OBPALS_GRAY_AND_YELLOW, $0, $0, $0
	anim_sound 0, 0, SFX_MORNING_SUN
.loop
	anim_obj ANIM_OBJ_MORNING_SUN, 16, 48, $88
	anim_wait 6
	anim_loop 5, .loop
	anim_wait 32
	anim_jumpif $0, BattleAnim_Sub_Glimmer_2
	anim_jump BattleAnim_Sub_Glimmer
	anim_ret

BattleAnim_Moonlight:
	anim_1gfx ANIM_GFX_SHINE
	anim_bgp $1b
	anim_bgeffect ANIM_BG_CYCLE_MID_OBPALS_GRAY_AND_YELLOW, $0, $0, $0
	anim_obj ANIM_OBJ_MOONLIGHT, 0, 40, $0
	anim_obj ANIM_OBJ_MOONLIGHT, 16, 56, $0
	anim_obj ANIM_OBJ_MOONLIGHT, 32, 72, $0
	anim_obj ANIM_OBJ_MOONLIGHT, 48, 88, $0
	anim_obj ANIM_OBJ_MOONLIGHT, 64, 104, $0
	anim_wait 1
	anim_sound 0, 0, SFX_MOONLIGHT
	anim_wait 63
	anim_jumpif $3, BattleAnim_Sub_Glimmer_2
	anim_jump BattleAnim_Sub_Glimmer

BattleAnim_Synthesis:
	anim_1gfx ANIM_GFX_SHINE
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_FADE_MON_TO_LIGHT_REPEATING, $0, $1, $40
	anim_bgeffect ANIM_BG_CYCLE_MID_OBPALS_GRAY_AND_YELLOW, $0, $0, $0
	anim_sound 0, 0, SFX_OUTRAGE
	anim_wait 72
	anim_incbgeffect ANIM_BG_FADE_MON_TO_LIGHT_REPEATING
	anim_call BattleAnim_ShowMon_0
	anim_jumpif $1, BattleAnim_Sub_Glimmer_2
	anim_jump BattleAnim_Sub_Glimmer

BattleAnim_Sub_Glimmer:
	anim_sound 0, 0, SFX_METRONOME
	anim_obj ANIM_OBJ_GLIMMER, 44, 64, $0
	anim_wait 5
	anim_obj ANIM_OBJ_GLIMMER, 24, 96, $0
	anim_wait 5
	anim_obj ANIM_OBJ_GLIMMER, 56, 104, $0
	anim_wait 21
	anim_ret

BattleAnim_Sub_Glimmer_2:
.loop
	anim_sound 0, 0, SFX_METRONOME
	anim_obj ANIM_OBJ_GLIMMER, 24, 64, $0
	anim_wait 5
	anim_obj ANIM_OBJ_GLIMMER, 56, 104, $0
	anim_wait 5
	anim_obj ANIM_OBJ_GLIMMER, 24, 104, $0
	anim_wait 5
	anim_obj ANIM_OBJ_GLIMMER, 56, 64, $0
	anim_wait 5
	anim_obj ANIM_OBJ_GLIMMER, 40, 84, $0
	anim_wait 5
	anim_loop 2, .loop
	anim_wait 16
	anim_ret

BattleAnim_Crunch:
	anim_2gfx ANIM_GFX_CUT, ANIM_GFX_HIT
	anim_bgp $1b
	anim_obp0 $c0
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $20, $2, $0
	anim_obj ANIM_OBJ_BITE, 136, 56, $a8
	anim_obj ANIM_OBJ_BITE, 136, 56, $28
	anim_wait 8
	anim_sound 0, 1, SFX_BITE
	anim_obj ANIM_OBJ_HIT_BIG_YFIX, 144, 48, $18
	anim_wait 16
	anim_sound 0, 1, SFX_BITE
	anim_obj ANIM_OBJ_HIT_BIG_YFIX, 128, 64, $18
	anim_wait 8
	anim_bgp $e4
	anim_ret

BattleAnim_CrossChop:
	anim_setobjpal PAL_BATTLE_OB_BLUE, PAL_BTLCUSTOM_GRAY
	anim_setobjpal PAL_BATTLE_OB_GRAY, PAL_BTLCUSTOM_FIRE
	anim_3gfx ANIM_GFX_CUT, ANIM_GFX_CHOP, ANIM_GFX_HIT
	anim_sound 0, 1, SFX_MEGA_PUNCH
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $58, $1, $0
	anim_obj ANIM_OBJ_CROSS_CHOP1, 128, 48, $28
	anim_obj ANIM_OBJ_CROSS_CHOP2, 142, 48, $38
	anim_setobj $1, $2
	anim_setobj $2, $2
	anim_wait 48
	anim_clearobjs
	anim_obj ANIM_OBJ_CROSS_CHOP1, 116, 36, $8
	anim_obj ANIM_OBJ_CROSS_CHOP2, 154, 36, $18
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $58, $2, $0
	anim_setobj $3, $3
	anim_setobj $4, $3
	anim_sound 0, 1, SFX_VICEGRIP
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $10
	anim_obj ANIM_OBJ_CUT_LONG_DOWN_LEFT, 150, 38, $0
	anim_obj ANIM_OBJ_CUT_LONG_DOWN_RIGHT, 120, 38, $0
	anim_wait 32
	anim_ret

BattleAnim_RainDance:
	anim_1gfx ANIM_GFX_WATER
	anim_bgp $f8
	anim_obp0 $7c
	anim_sound 0, 1, SFX_RAIN_DANCE
	anim_obj ANIM_OBJ_RAIN, 88, 0, $0
	anim_wait 8
	anim_obj ANIM_OBJ_RAIN, 88, 0, $1
	anim_wait 8
	anim_obj ANIM_OBJ_RAIN, 88, 0, $2
	anim_wait 128
	anim_ret

BattleAnim_SunnyDay:
	anim_1gfx ANIM_GFX_WATER
	anim_bgp $90
	anim_sound 0, 1, SFX_MORNING_SUN
	anim_obj ANIM_OBJ_RAIN, 88, 0, $2
	anim_wait 8
	anim_obj ANIM_OBJ_RAIN, 88, 0, $2
	anim_wait 8
	anim_obj ANIM_OBJ_RAIN, 88, 0, $2
	anim_wait 128
	anim_ret

BattleAnim_Ancientpower:
	anim_2gfx ANIM_GFX_ROCKS, ANIM_GFX_HIT
	anim_sound 0, 0, SFX_SPARK
	anim_obj ANIM_OBJ_ANCIENTPOWER, 64, 108, $20
	anim_wait 8
	anim_sound 0, 0, SFX_SPARK
	anim_obj ANIM_OBJ_ANCIENTPOWER, 75, 102, $20
	anim_wait 8
	anim_sound 0, 0, SFX_SPARK
	anim_obj ANIM_OBJ_ANCIENTPOWER, 85, 97, $20
	anim_wait 8
	anim_sound 0, 0, SFX_SPARK
	anim_obj ANIM_OBJ_ANCIENTPOWER, 96, 92, $20
	anim_wait 8
	anim_sound 0, 1, SFX_SPARK
	anim_obj ANIM_OBJ_ANCIENTPOWER, 106, 87, $20
	anim_wait 8
	anim_sound 0, 1, SFX_SPARK
	anim_obj ANIM_OBJ_ANCIENTPOWER, 116, 82, $20
	anim_wait 8
	anim_sound 0, 1, SFX_SPARK
	anim_obj ANIM_OBJ_ANCIENTPOWER, 126, 77, $20
	anim_wait 8
	anim_sound 0, 1, SFX_SPARK
	anim_obj ANIM_OBJ_HIT_BIG_YFIX, 136, 56, $0
	anim_wait 6
	anim_ret

BattleAnim_ShadowBall:
	anim_setobjpal PAL_BATTLE_OB_BLUE, PAL_BTLCUSTOM_SHADOW_BALL
	anim_3gfx ANIM_GFX_GLOW, ANIM_GFX_GLOW_SHADOW, ANIM_GFX_SMOKE
	anim_bgp $1b
	anim_obj ANIM_OBJ_GROWING_BALL, 64, 92, $0
.loop
	anim_sound 6, 3, SFX_WARP_TO
	anim_wait 8
	anim_loop 6, .loop
	anim_sound 6, 2, SFX_SLUDGE_BOMB
	anim_obj ANIM_OBJ_SHADOW_BALL, 64, 92, $2
	anim_wait 32
	anim_obj ANIM_OBJ_BALL_POOF, 132, 56, $10
	anim_wait 24
	anim_ret

BattleAnim_FutureSight:
	anim_1gfx ANIM_GFX_WIND_BG
	anim_call BattleAnimSub_BGCycleOBPalsGrayAndYellow_2
	anim_bgeffect ANIM_BG_ALTERNATE_HUES, $0, $2, $0
	anim_bgeffect ANIM_BG_PSYCHIC, $0, $0, $0
	anim_call BattleAnimSub_Agility
.loop
	anim_sound 0, 0, SFX_THROW_BALL
	anim_wait 16
	anim_loop 4, .loop
	anim_incbgeffect ANIM_BG_PSYCHIC
	anim_ret

BattleAnim_RockSmash:
	anim_2gfx ANIM_GFX_ROCKS, ANIM_GFX_HIT
.hit
	anim_sound 0, 1, SFX_SPARK
	anim_obj ANIM_OBJ_HIT_YFIX, 128, 56, $0
	anim_sound 0, 1, SFX_SPARK
	anim_obj ANIM_OBJ_ROCK_SMASH, 128, 64, $28
	anim_obj ANIM_OBJ_ROCK_SMASH, 128, 64, $5c
	anim_sound 0, 1, SFX_SPARK
	anim_obj ANIM_OBJ_ROCK_SMASH, 128, 64, $10
	anim_obj ANIM_OBJ_ROCK_SMASH, 128, 64, $e8
	anim_sound 0, 1, SFX_SPARK
	anim_obj ANIM_OBJ_ROCK_SMASH, 128, 64, $9c
	anim_obj ANIM_OBJ_ROCK_SMASH, 128, 64, $d0
	anim_wait 6
	anim_sound 0, 1, SFX_SPARK
	anim_obj ANIM_OBJ_ROCK_SMASH, 128, 64, $1c
	anim_obj ANIM_OBJ_ROCK_SMASH, 128, 64, $50
	anim_sound 0, 1, SFX_SPARK
	anim_obj ANIM_OBJ_ROCK_SMASH, 128, 64, $dc
	anim_obj ANIM_OBJ_ROCK_SMASH, 128, 64, $90
	anim_wait 32
	anim_ret

BattleAnim_Whirlpool:
BattleAnim_InWhirlpool:
	anim_1gfx ANIM_GFX_WIND
	anim_bgeffect ANIM_BG_WHIRLPOOL, $0, $0, $0
	anim_sound 0, 1, SFX_SURF
.loop
	anim_obj ANIM_OBJ_GUST, 132, 72, $0
	anim_wait 6
	anim_loop 6, .loop
	anim_incbgeffect ANIM_BG_WHIRLPOOL
	anim_wait 1
	anim_ret

BattleAnimSub_EyeBeams:
	anim_sound 6, 2, SFX_LEER
	anim_obj ANIM_OBJ_LEER, 72, 84, $0
	anim_obj ANIM_OBJ_LEER, 64, 80, $0
	anim_obj ANIM_OBJ_LEER, 88, 76, $0
	anim_obj ANIM_OBJ_LEER, 80, 72, $0
	anim_obj ANIM_OBJ_LEER, 104, 68, $0
	anim_obj ANIM_OBJ_LEER, 96, 64, $0
	anim_obj ANIM_OBJ_LEER, 120, 60, $0
	anim_obj ANIM_OBJ_LEER, 112, 56, $0
	anim_obj ANIM_OBJ_LEER_TIP, 130, 54, $0
	anim_obj ANIM_OBJ_LEER_TIP, 122, 50, $0
	anim_ret

BattleAnim_Warp_Branch:
	anim_sound 0, 0, SFX_WARP_TO
	anim_obj ANIM_OBJ_WARP, 44, 108, $0
	anim_obj ANIM_OBJ_WARP, 44, 100, $0
	anim_obj ANIM_OBJ_WARP, 44, 92, $0
	anim_obj ANIM_OBJ_WARP, 44, 84, $0
	anim_obj ANIM_OBJ_WARP, 44, 76, $0
	anim_obj ANIM_OBJ_WARP, 44, 68, $0
	anim_obj ANIM_OBJ_WARP, 44, 60, $0
	anim_ret

BattleAnim_Beam_Branch:
	anim_sound 0, 0, SFX_HYPER_BEAM
	anim_obj ANIM_OBJ_BEAM, 64, 92, $0
	anim_wait 4
	anim_sound 0, 0, SFX_HYPER_BEAM
	anim_obj ANIM_OBJ_BEAM, 80, 84, $0
	anim_wait 4
	anim_sound 0, 1, SFX_HYPER_BEAM
	anim_obj ANIM_OBJ_BEAM, 96, 76, $0
	anim_wait 4
	anim_sound 0, 1, SFX_HYPER_BEAM
	anim_obj ANIM_OBJ_BEAM, 112, 68, $0
	anim_obj ANIM_OBJ_BEAM_TIP, 126, 62, $0
	anim_ret

BattleAnim_Explosion_1_Branch:
	anim_setobjpal PAL_BATTLE_OB_RED, PAL_BTLCUSTOM_FIRE
	anim_sound 0, 0, SFX_EGG_BOMB
	anim_obj ANIM_OBJ_EXPLOSION1, 32, 64, $0
	anim_wait 5
	anim_sound 0, 0, SFX_EGG_BOMB
	anim_obj ANIM_OBJ_EXPLOSION1, 64, 104, $0
	anim_wait 5
	anim_sound 0, 0, SFX_EGG_BOMB
	anim_obj ANIM_OBJ_EXPLOSION1, 32, 104, $0
	anim_wait 5
	anim_sound 0, 0, SFX_EGG_BOMB
	anim_obj ANIM_OBJ_EXPLOSION1, 64, 64, $0
	anim_wait 5
	anim_sound 0, 0, SFX_EGG_BOMB
	anim_obj ANIM_OBJ_EXPLOSION1, 48, 84, $0
	anim_ret

BattleAnim_Explosion_2_Branch:
	anim_setobjpal PAL_BATTLE_OB_RED, PAL_BTLCUSTOM_FIRE
	anim_sound 0, 1, SFX_EGG_BOMB
	anim_obj ANIM_OBJ_EXPLOSION1, 148, 32, $0
	anim_wait 5
	anim_sound 0, 1, SFX_EGG_BOMB
	anim_obj ANIM_OBJ_EXPLOSION1, 116, 72, $0
	anim_wait 5
	anim_sound 0, 1, SFX_EGG_BOMB
	anim_obj ANIM_OBJ_EXPLOSION1, 148, 72, $0
	anim_wait 5
	anim_sound 0, 1, SFX_EGG_BOMB
	anim_obj ANIM_OBJ_EXPLOSION1, 116, 32, $0
	anim_wait 5
	anim_sound 0, 1, SFX_EGG_BOMB
	anim_obj ANIM_OBJ_EXPLOSION1, 132, 52, $0
	anim_ret

BattleAnimSub_Sound:
	anim_obj ANIM_OBJ_SOUND, 64, 76, $0
	anim_obj ANIM_OBJ_SOUND, 64, 88, $1
	anim_obj ANIM_OBJ_SOUND, 64, 100, $2
	anim_ret

BattleAnimSub_Fire:
	anim_setobjpal PAL_BATTLE_OB_RED, PAL_BTLCUSTOM_FIRE
	anim_sound 0, 1, SFX_EMBER
.loop
	anim_obj ANIM_OBJ_BURNED, 136, 56, $10
	anim_obj ANIM_OBJ_BURNED, 136, 56, $90
	anim_wait 4
	anim_loop 4, .loop
	anim_ret

BattleAnimSub_Ice:
	anim_setobjpal PAL_BATTLE_OB_BLUE, PAL_BTLCUSTOM_ICE
	anim_sound 0, 1, SFX_SHINE
	anim_obj ANIM_OBJ_ICE, 128, 42, $0
	anim_wait 6
	anim_sound 0, 1, SFX_SHINE
	anim_obj ANIM_OBJ_ICE, 144, 70, $0
	anim_wait 6
	anim_sound 0, 1, SFX_SHINE
	anim_obj ANIM_OBJ_ICE, 120, 56, $0
	anim_wait 6
	anim_sound 0, 1, SFX_SHINE
	anim_obj ANIM_OBJ_ICE, 152, 56, $0
	anim_wait 6
	anim_sound 0, 1, SFX_SHINE
	anim_obj ANIM_OBJ_ICE, 144, 42, $0
	anim_wait 6
	anim_sound 0, 1, SFX_SHINE
	anim_obj ANIM_OBJ_ICE, 128, 70, $0
	anim_ret

BattleAnimSub_Sludge:
.loop
	anim_sound 0, 1, SFX_TOXIC
	anim_obj ANIM_OBJ_SLUDGE, 132, 72, $0
	anim_wait 8
	anim_sound 0, 1, SFX_TOXIC
	anim_obj ANIM_OBJ_SLUDGE, 116, 72, $0
	anim_wait 8
	anim_sound 0, 1, SFX_TOXIC
	anim_obj ANIM_OBJ_SLUDGE, 148, 72, $0
	anim_wait 8
	anim_loop 5, .loop
	anim_wait 48
	anim_ret

BattleAnimSub_Acid:
.loop
	anim_sound 6, 2, SFX_BUBBLE_BEAM
	anim_obj ANIM_OBJ_ACID, 64, 92, $10
	anim_wait 5
	anim_loop 8, .loop
	anim_ret

BattleAnimSub_Metallic:
	anim_sound 0, 0, SFX_SHINE
	anim_bgeffect ANIM_BG_FADE_MON_TO_BLACK, $0, $1, $40
	anim_wait 8
	anim_obj ANIM_OBJ_HARDEN, 48, 84, $0
	anim_wait 32
	anim_obj ANIM_OBJ_HARDEN, 48, 84, $0
	anim_wait 64
	anim_incbgeffect ANIM_BG_FADE_MON_TO_BLACK
	anim_ret

BattleAnim_Sand_Branch::
.loop
	anim_sound 6, 2, SFX_MENU
	anim_obj ANIM_OBJ_SAND, 64, 92, $4
	anim_wait 4
	anim_loop 8, .loop
	anim_wait 32
	anim_ret

BattleAnim_TargetObj_1Row:
	anim_enemyfeetobj
	anim_bgeffect ANIM_BG_BATTLEROBJ_1ROW, $0, $0, $0
	anim_wait 6
	anim_ret

BattleAnim_TargetObj_2Row:
	anim_playerheadobj
	anim_bgeffect ANIM_BG_BATTLEROBJ_2ROW, $0, $0, $0
	anim_wait 6
	anim_ret

BattleAnim_ShowMon_0:
	anim_wait 1
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $0, $0
	anim_wait 5
	anim_incobj  1
	anim_wait 1
	anim_ret

BattleAnim_FollowEnemyFeet_1:
	anim_enemyfeetobj
	anim_bgeffect ANIM_BG_BATTLEROBJ_1ROW, $0, $1, $0
	anim_wait 6
	anim_ret

BattleAnim_FollowPlayerHead_1:
	anim_playerheadobj
	anim_bgeffect ANIM_BG_BATTLEROBJ_2ROW, $0, $1, $0
	anim_wait 4
	anim_ret

BattleAnim_ShowMon_1:
	anim_wait 1
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_wait 4
	anim_incobj  1
	anim_wait 1
	anim_ret

BattleAnim_Sharpen:
	anim_jumpif $1, BattleAnim_Meditate
	anim_jumpif $2, BattleAnim_Howl
	anim_1gfx ANIM_GFX_SHAPES
	anim_obp0 $e4
	anim_call BattleAnim_TargetObj_1Row
	anim_sound 0, 0, SFX_SHARPEN
	anim_bgeffect ANIM_BG_FADE_MON_TO_LIGHT_REPEATING, $0, $1, $40
	anim_obj ANIM_OBJ_SHARPEN, 48, 88, $0
	anim_wait 96
	anim_incobj  2
	anim_incbgeffect ANIM_BG_FADE_MON_TO_LIGHT_REPEATING
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_AcidArmor:
	anim_1gfx ANIM_GFX_HIT
	anim_call BattleAnim_TargetObj_2Row
	anim_bgeffect ANIM_BG_ACID_ARMOR, $0, $1, $8
	anim_sound 0, 0, SFX_MEGA_PUNCH
	anim_wait 64
	anim_incbgeffect ANIM_BG_ACID_ARMOR
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_Mimic:
	anim_1gfx ANIM_GFX_SPEED
	anim_obp0 $fc
	anim_sound 63, 3, SFX_LICK
	anim_obj ANIM_OBJ_MIMIC, 132, 44, $0
	anim_obj ANIM_OBJ_MIMIC, 132, 44, $8
	anim_obj ANIM_OBJ_MIMIC, 132, 44, $10
	anim_obj ANIM_OBJ_MIMIC, 132, 44, $18
	anim_obj ANIM_OBJ_MIMIC, 132, 44, $20
	anim_obj ANIM_OBJ_MIMIC, 132, 44, $28
	anim_obj ANIM_OBJ_MIMIC, 132, 44, $30
	anim_obj ANIM_OBJ_MIMIC, 132, 44, $38
	anim_wait 128
	anim_wait 48
	anim_ret

BattleAnim_BoneClub:
	anim_2gfx ANIM_GFX_HIT, ANIM_GFX_MISC
	anim_obj ANIM_OBJ_BONE_CLUB, 64, 88, $2
	anim_wait 32
	anim_sound 0, 1, SFX_BONE_CLUB
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 56, $0
	anim_wait 16
	anim_ret

BattleAnim_CottonSpore:
	anim_obp0 $54
	anim_1gfx ANIM_GFX_SMOKE_PUFF
	anim_sound 0, 1, SFX_POWDER
.loop
	anim_obj ANIM_OBJ_COTTON_SPORE, 132, 32, $0
	anim_wait 8
	anim_loop 5, .loop
	anim_wait 96
	anim_ret

BattleAnim_JumpKick:
	anim_1gfx ANIM_GFX_HIT
	anim_sound 0, 1, SFX_JUMP_KICK
	anim_obj ANIM_OBJ_KICK, 112, 72, $0
	anim_obj ANIM_OBJ_KICK, 100, 60, $0
	anim_setobj $1, $2
	anim_setobj $2, $2
	anim_wait 24
	anim_sound 0, 1, SFX_DOUBLE_KICK
	anim_obj ANIM_OBJ_HIT, 136, 48, $0
	anim_wait 16
	anim_ret

BattleAnim_SpiderWeb:
	anim_1gfx ANIM_GFX_WEB
	anim_bgeffect ANIM_BG_CYCLE_MID_OBPALS_GRAY_AND_YELLOW, $0, $2, $0
	anim_obj ANIM_OBJ_SPIDER_WEB, 132, 48, $0
	anim_sound 6, 2, SFX_SPIDER_WEB
	anim_obj ANIM_OBJ_STRING_SHOT, 64, 80, $0
	anim_wait 4
	anim_obj ANIM_OBJ_STRING_SHOT, 64, 88, $0
	anim_wait 4
	anim_obj ANIM_OBJ_STRING_SHOT, 64, 84, $0
	anim_wait 64
	anim_ret

BattleAnim_CometPunch:
	anim_1gfx ANIM_GFX_HIT
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_jumpif2 $1, .alternate
	anim_obj ANIM_OBJ_PUNCH, 144, 48, $0
	anim_wait 6
	anim_obj ANIM_OBJ_HIT_YFIX, 144, 48, $0
	anim_wait 8
	anim_ret

.alternate
	anim_obj ANIM_OBJ_PUNCH, 120, 64, $0
	anim_wait 6
	anim_obj ANIM_OBJ_HIT_YFIX, 120, 64, $0
	anim_wait 8
	anim_ret

BattleAnim_Conversion2:
	anim_1gfx ANIM_GFX_EXPLOSION
	anim_sound 63, 3, SFX_SHARPEN
	anim_obj ANIM_OBJ_CONVERSION2, 132, 44, $0
	anim_obj ANIM_OBJ_CONVERSION2, 132, 44, $8
	anim_obj ANIM_OBJ_CONVERSION2, 132, 44, $10
	anim_obj ANIM_OBJ_CONVERSION2, 132, 44, $18
	anim_obj ANIM_OBJ_CONVERSION2, 132, 44, $20
	anim_obj ANIM_OBJ_CONVERSION2, 132, 44, $28
	anim_obj ANIM_OBJ_CONVERSION2, 132, 44, $30
	anim_obj ANIM_OBJ_CONVERSION2, 132, 44, $38
	anim_wait 128
	anim_wait 48
	anim_ret

BattleAnim_TailWhip:
	anim_1gfx ANIM_GFX_HIT
	anim_call BattleAnim_TargetObj_2Row
	anim_sound 0, 0, SFX_TAIL_WHIP
	anim_bgeffect ANIM_BG_WOBBLE_MON, $0, $1, $0
	anim_wait 32
	anim_incbgeffect ANIM_BG_WOBBLE_MON
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_Meditate:
	anim_1gfx ANIM_GFX_HIT
	anim_call BattleAnim_TargetObj_1Row
	anim_sound 0, 0, SFX_PSYBEAM
	anim_bgeffect ANIM_BG_WAVE_DEFORM_USER, $0, $1, $0
	anim_wait 48
	anim_incbgeffect ANIM_BG_WAVE_DEFORM_USER
	anim_wait 48
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_Snore:
	anim_2gfx ANIM_GFX_STATUS, ANIM_GFX_NOISE
	anim_obj ANIM_OBJ_ASLEEP, 64, 80, $0
	anim_wait 32
	anim_bgeffect ANIM_BG_SHAKE_SCREEN_X, $60, $2, $0
	anim_sound 0, 0, SFX_SNORE
.loop
	anim_call BattleAnimSub_Sound
	anim_wait 16
	anim_loop 2, .loop
	anim_wait 8
	anim_ret

BattleAnim_Twister:
	anim_2gfx ANIM_GFX_WIND, ANIM_GFX_HIT
.loop1
	anim_sound 0, 0, SFX_RAZOR_WIND
	anim_obj ANIM_OBJ_GUST, 64, 112, $0
	anim_wait 6
	anim_loop 9, .loop1
.loop2
	anim_sound 0, 0, SFX_RAZOR_WIND
	anim_wait 8
	anim_loop 8, .loop2
	anim_call BattleAnim_IncObj1to9
	anim_wait 64
	anim_obj ANIM_OBJ_HIT_YFIX, 144, 64, $18
.loop3
	anim_sound 0, 1, SFX_RAZOR_WIND
	anim_wait 8
	anim_loop 4, .loop3
	anim_obj ANIM_OBJ_HIT_YFIX, 128, 32, $18
.loop4
	anim_sound 0, 1, SFX_RAZOR_WIND
	anim_wait 8
	anim_loop 4, .loop4
	anim_call BattleAnim_IncObj1to9
	anim_wait 32
	anim_ret

BattleAnim_EggBomb:
	anim_setobjpal PAL_BATTLE_OB_RED, PAL_BTLCUSTOM_FIRE
	anim_2gfx ANIM_GFX_EGG, ANIM_GFX_EXPLOSION
	anim_sound 6, 2, SFX_THROW_BALL
	anim_obj ANIM_OBJ_EGG_BOMB, 48, 80, $28
	anim_wait 32
	anim_clearobjs
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $3
	anim_sound 0, 1, SFX_EGG_BOMB
	anim_obj ANIM_OBJ_EXPLOSION2, 128, 64, $0
	anim_wait 8
	anim_sound 0, 1, SFX_EGG_BOMB
	anim_obj ANIM_OBJ_EXPLOSION2, 144, 68, $0
	anim_wait 8
	anim_sound 0, 1, SFX_EGG_BOMB
	anim_obj ANIM_OBJ_EXPLOSION2, 136, 72, $0
	anim_wait 24
	anim_ret

BattleAnim_LockOn:
	anim_jumpif $1, BattleAnim_MindReader
	anim_1gfx ANIM_GFX_MISC
	anim_sound 0, 1, SFX_MIND_READER
.loop
	anim_obj ANIM_OBJ_LOCK_ON, 132, 48, $3
	anim_obj ANIM_OBJ_LOCK_ON, 132, 48, $12
	anim_obj ANIM_OBJ_LOCK_ON, 132, 48, $20
	anim_obj ANIM_OBJ_LOCK_ON, 132, 48, $31
	anim_wait 16
	anim_loop 2, .loop
	anim_wait 32
	anim_ret

BattleAnim_Pound:
	anim_1gfx ANIM_GFX_HIT
	anim_sound 0, 1, SFX_POUND
	anim_obj ANIM_OBJ_PALM, 136, 56, $0
	anim_wait 6
	anim_obj ANIM_OBJ_HIT_YFIX, 136, 56, $0
	anim_wait 16
	anim_ret

BattleAnim_Smog:
	anim_1gfx ANIM_GFX_HAZE
	anim_sound 0, 1, SFX_BUBBLE_BEAM
.loop
	anim_obj ANIM_OBJ_SMOG, 132, 16, $0
	anim_wait 8
	anim_loop 10, .loop
	anim_wait 96
	anim_ret

BattleAnim_IncObj1to9:
	anim_incobj  1
	anim_incobj  2
	anim_incobj  3
	anim_incobj  4
	anim_incobj  5
	anim_incobj  6
	anim_incobj  7
	anim_incobj  8
	anim_incobj  9
	anim_ret

BattleAnimSub_Focus:
	anim_obj ANIM_OBJ_FOCUS, 44, 108, $6
	anim_wait 2
	anim_obj ANIM_OBJ_FOCUS, 36, 108, $6
	anim_wait 2
	anim_obj ANIM_OBJ_FOCUS, 52, 108, $8
	anim_wait 2
	anim_obj ANIM_OBJ_FOCUS, 28, 108, $8
	anim_wait 2
	anim_obj ANIM_OBJ_FOCUS, 60, 108, $6
	anim_wait 2
	anim_obj ANIM_OBJ_FOCUS, 20, 108, $8
	anim_wait 2
	anim_obj ANIM_OBJ_FOCUS, 68, 108, $8
	anim_ret
	
BattleAnimSub_AgilityMinor:
	anim_obj ANIM_OBJ_AGILITY, 8, 24, $10
	anim_obj ANIM_OBJ_AGILITY, 8, 48, $2
	anim_wait 4
	anim_obj ANIM_OBJ_AGILITY, 8, 56, $c
	anim_obj ANIM_OBJ_AGILITY, 8, 80, $4
	anim_obj ANIM_OBJ_AGILITY, 8, 104, $e
	anim_ret

BattleAnimSub_BGCycleOBPalsGrayAndYellow_2:
	anim_bgeffect ANIM_BG_CYCLE_OBPALS_GRAY_AND_YELLOW, $0, $2, $0
	anim_ret

BattleAnimSub_BGCycleOBPalsGrayAndYellow_6:
	anim_bgeffect ANIM_BG_CYCLE_OBPALS_GRAY_AND_YELLOW, $0, $6, $0
	anim_ret

BattleAnimSub_Punch:
	anim_obj ANIM_OBJ_PUNCH_SHAKE, 136, 56, $43
	anim_ret

BattleAnimSub_Agility:
	anim_setobjpal PAL_BATTLE_OB_BLUE, PAL_BTLCUSTOM_WATER
	anim_obj ANIM_OBJ_AGILITY, 8, 24, $10
	anim_obj ANIM_OBJ_AGILITY, 8, 48, $2
	anim_obj ANIM_OBJ_AGILITY, 8, 88, $8
	anim_wait 4
	anim_obj ANIM_OBJ_AGILITY, 8, 32, $6
	anim_obj ANIM_OBJ_AGILITY, 8, 56, $c
	anim_obj ANIM_OBJ_AGILITY, 8, 80, $4
	anim_obj ANIM_OBJ_AGILITY, 8, 104, $e
	anim_ret