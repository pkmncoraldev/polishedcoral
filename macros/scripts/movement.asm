
	enum_start

	enum movement_turn_head_down
macro turn_head_down
	db movement_turn_head_down ; $00
	endm

	enum movement_turn_head_up
macro turn_head_up
	db movement_turn_head_up ; $01
	endm

	enum movement_turn_head_left
macro turn_head_left
	db movement_turn_head_left ; $02
	endm

	enum movement_turn_head_right
macro turn_head_right
	db movement_turn_head_right ; $03
	endm

	enum movement_turn_step_down
macro turn_step_down
	db movement_turn_step_down ; $04
	endm

	enum movement_turn_step_up
macro turn_step_up
	db movement_turn_step_up ; $05
	endm

	enum movement_turn_step_left
macro turn_step_left
	db movement_turn_step_left ; $06
	endm

	enum movement_turn_step_right
macro turn_step_right
	db movement_turn_step_right ; $07
	endm

	enum movement_slow_step_down
macro slow_step_down
	db movement_slow_step_down ; $08
	endm

	enum movement_slow_step_up
macro slow_step_up
	db movement_slow_step_up ; $09
	endm

	enum movement_slow_step_left
macro slow_step_left
	db movement_slow_step_left ; $0a
	endm

	enum movement_slow_step_right
macro slow_step_right
	db movement_slow_step_right ; $0b
	endm

	enum movement_step_down
macro step_down
	db movement_step_down ; $0c
	endm

	enum movement_step_up
macro step_up
	db movement_step_up ; $0d
	endm

	enum movement_step_left
macro step_left
	db movement_step_left ; $0e
	endm

	enum movement_step_right
macro step_right
	db movement_step_right ; $0f
	endm

	enum movement_big_step_down
macro big_step_down
	db movement_big_step_down ; $10
	endm

	enum movement_big_step_up
macro big_step_up
	db movement_big_step_up ; $11
	endm

	enum movement_big_step_left
macro big_step_left
	db movement_big_step_left ; $12
	endm

	enum movement_big_step_right
macro big_step_right
	db movement_big_step_right ; $13
	endm

	enum movement_slow_slide_step_down
macro slow_slide_step_down
	db movement_slow_slide_step_down ; $14
	endm

	enum movement_slow_slide_step_up
macro slow_slide_step_up
	db movement_slow_slide_step_up ; $15
	endm

	enum movement_slow_slide_step_left
macro slow_slide_step_left
	db movement_slow_slide_step_left ; $16
	endm

	enum movement_slow_slide_step_right
macro slow_slide_step_right
	db movement_slow_slide_step_right ; $17
	endm

	enum movement_slide_step_down
macro slide_step_down
	db movement_slide_step_down ; $18
	endm

	enum movement_slide_step_up
macro slide_step_up
	db movement_slide_step_up ; $19
	endm

	enum movement_slide_step_left
macro slide_step_left
	db movement_slide_step_left ; $1a
	endm

	enum movement_slide_step_right
macro slide_step_right
	db movement_slide_step_right ; $1b
	endm

	enum movement_fast_slide_step_down
macro fast_slide_step_down
	db movement_fast_slide_step_down ; $1c
	endm

	enum movement_fast_slide_step_up
macro fast_slide_step_up
	db movement_fast_slide_step_up ; $1d
	endm

	enum movement_fast_slide_step_left
macro fast_slide_step_left
	db movement_fast_slide_step_left ; $1e
	endm

	enum movement_fast_slide_step_right
macro fast_slide_step_right
	db movement_fast_slide_step_right ; $1f
	endm

	enum movement_turn_away_down
macro turn_away_down
	db movement_turn_away_down ; $20
	endm

	enum movement_turn_away_up
macro turn_away_up
	db movement_turn_away_up ; $21
	endm

	enum movement_turn_away_left
macro turn_away_left
	db movement_turn_away_left ; $22
	endm

	enum movement_turn_away_right
macro turn_away_right
	db movement_turn_away_right ; $23
	endm

	enum movement_turn_in_down
macro turn_in_down
	db movement_turn_in_down ; $24
	endm

	enum movement_turn_in_up
macro turn_in_up
	db movement_turn_in_up ; $25
	endm

	enum movement_turn_in_left
macro turn_in_left
	db movement_turn_in_left ; $26
	endm

	enum movement_turn_in_right
macro turn_in_right
	db movement_turn_in_right ; $27
	endm

	enum movement_turn_waterfall_down
macro turn_waterfall_down
	db movement_turn_waterfall_down ; $28
	endm

	enum movement_turn_waterfall_up
macro turn_waterfall_up
	db movement_turn_waterfall_up ; $29
	endm

	enum movement_turn_waterfall_left
macro turn_waterfall_left
	db movement_turn_waterfall_left ; $2a
	endm

	enum movement_turn_waterfall_right
macro turn_waterfall_right
	db movement_turn_waterfall_right ; $2b
	endm

	enum movement_slow_jump_step_down
macro slow_jump_step_down
	db movement_slow_jump_step_down ; $2c
	endm

	enum movement_slow_jump_step_up
macro slow_jump_step_up
	db movement_slow_jump_step_up ; $2d
	endm

	enum movement_slow_jump_step_left
macro slow_jump_step_left
	db movement_slow_jump_step_left ; $2e
	endm

	enum movement_slow_jump_step_right
macro slow_jump_step_right
	db movement_slow_jump_step_right ; $2f
	endm

	enum movement_jump_step_down
macro jump_step_down
	db movement_jump_step_down ; $30
	endm

	enum movement_jump_step_up
macro jump_step_up
	db movement_jump_step_up ; $31
	endm

	enum movement_jump_step_left
macro jump_step_left
	db movement_jump_step_left ; $32
	endm

	enum movement_jump_step_right
macro jump_step_right
	db movement_jump_step_right ; $33
	endm

	enum movement_fast_jump_step_down
macro fast_jump_step_down
	db movement_fast_jump_step_down ; $34
	endm

	enum movement_fast_jump_step_up
macro fast_jump_step_up
	db movement_fast_jump_step_up ; $35
	endm

	enum movement_fast_jump_step_left
macro fast_jump_step_left
	db movement_fast_jump_step_left ; $36
	endm

	enum movement_fast_jump_step_right
macro fast_jump_step_right
	db movement_fast_jump_step_right ; $37
	endm

	enum movement_remove_sliding
macro remove_sliding
	db movement_remove_sliding ; $38
	endm

	enum movement_set_sliding
macro set_sliding
	db movement_set_sliding ; $39
	endm

	enum movement_remove_fixed_facing
macro remove_fixed_facing
	db movement_remove_fixed_facing ; $3a
	endm

	enum movement_fix_facing
macro fix_facing
	db movement_fix_facing ; $3b
	endm

	enum movement_show_person
macro {show_person}
	db movement_show_person ; $3c
	endm

	enum movement_hide_person
macro {hide_person}
	db movement_hide_person ; $3d
	endm

	enum movement_step_sleep_1
macro step_sleep_1
	db movement_step_sleep_1 ; $3e
	endm

	enum movement_step_sleep_2
macro step_sleep_2
	db movement_step_sleep_2 ; $3f
	endm

	enum movement_step_sleep_3
macro step_sleep_3
	db movement_step_sleep_3 ; $40
	endm

	enum movement_step_sleep_4
macro step_sleep_4
	db movement_step_sleep_4 ; $41
	endm

	enum movement_step_sleep_5
macro step_sleep_5
	db movement_step_sleep_5 ; $42
	endm

	enum movement_step_sleep_6
macro step_sleep_6
	db movement_step_sleep_6 ; $43
	endm

	enum movement_step_sleep_7
macro step_sleep_7
	db movement_step_sleep_7 ; $44
	endm

	enum movement_step_sleep_8
macro step_sleep_8
	db movement_step_sleep_8 ; $45
	endm

	enum movement_step_sleep
macro step_sleep
	db movement_step_sleep ; $46
	db \1 ; duration
	endm

	enum movement_step_end
macro step_end
	db movement_step_end ; $47
	endm

	enum movement_step_resume
macro step_resume
	db movement_step_resume ; $48
	endm

	enum movement_remove_person
macro {remove_person}
	db movement_remove_person ; $49
	endm

	enum movement_step_loop
macro step_loop
	db movement_step_loop ; $4a
	endm

	enum movement_step_4b
macro step_4b
	db movement_step_4b ; $4b
	endm

	enum movement_teleport_from
macro teleport_from
	db movement_teleport_from ; $4c
	endm

	enum movement_teleport_to
macro teleport_to
	db movement_teleport_to ; $4d
	endm

	enum movement_skyfall
macro skyfall
	db movement_skyfall ; $4e
	endm

	enum movement_step_dig
macro step_dig
	db movement_step_dig ; $4f
	db \1
	endm

	enum movement_step_bump
macro step_bump
	db movement_step_bump ; $50
	endm

	enum movement_fish_got_bite
macro fish_got_bite
	db movement_fish_got_bite ; $51
	endm

	enum movement_fish_cast_rod
macro fish_cast_rod
	db movement_fish_cast_rod ; $52
	endm

	enum movement_hide_emote
macro hide_emote
	db movement_hide_emote ; $53
	endm

	enum movement_show_emote
macro show_emote
	db movement_show_emote ; $54
	endm

	enum movement_step_shake
macro step_shake
	db movement_step_shake ; $55
	db \1 ; displacement
	endm

	enum movement_tree_shake
macro tree_shake
	db movement_tree_shake
	endm

	enum movement_rock_smash
macro rock_smash
	db movement_rock_smash ; $57
	db \1
	endm

	enum movement_return_dig
macro return_dig
	db movement_return_dig ; $58
	db \1
	endm

	enum movement_skyfall_top
macro skyfall_top
	db movement_skyfall_top ; $59
	endm

	
	enum movement_player_walk_step_down
macro player_walk_step_down
	db movement_player_walk_step_down ; $5a
	endm

	enum movement_player_walk_step_up
macro player_walk_step_up
	db movement_player_walk_step_up ; $5b
	endm

	enum movement_player_walk_step_left
macro player_walk_step_left
	db movement_player_walk_step_left ; $5c
	endm

	enum movement_player_walk_step_right
macro player_walk_step_right
	db movement_player_walk_step_right ; $5d
	endm
	
	
	enum movement_player_run_step_down
macro player_run_step_down
	db movement_player_run_step_down ; $5a
	endm

	enum movement_player_run_step_up
macro player_run_step_up
	db movement_player_run_step_up ; $5b
	endm

	enum movement_player_run_step_left
macro player_run_step_left
	db movement_player_run_step_left ; $5c
	endm

	enum movement_player_run_step_right
macro player_run_step_right
	db movement_player_run_step_right ; $5d
	endm
	
	enum movement_run_step_down
macro run_step_down
	db movement_run_step_down ; $5a
	endm

	enum movement_run_step_up
macro run_step_up
	db movement_run_step_up ; $5b
	endm

	enum movement_run_step_left
macro run_step_left
	db movement_run_step_left ; $5c
	endm

	enum movement_run_step_right
macro run_step_right
	db movement_run_step_right ; $5d
	endm

	enum movement_fast_step_down
macro fast_step_down
	db movement_fast_step_down ; $5e
	endm

	enum movement_fast_step_up
macro fast_step_up
	db movement_fast_step_up ; $5f
	endm

	enum movement_fast_step_left
macro fast_step_left
	db movement_fast_step_left ; $60
	endm

	enum movement_fast_step_right
macro fast_step_right
	db movement_fast_step_right ; $61
	endm
	
	enum movement_pippi_run_step_down
macro pippi_run_step_down
	db movement_pippi_run_step_down ; $5e
	endm

	enum movement_pippi_run_step_up
macro pippi_run_step_up
	db movement_pippi_run_step_up ; $5f
	endm

	enum movement_pippi_run_step_left
macro pippi_run_step_left
	db movement_pippi_run_step_left ; $60
	endm

	enum movement_pippi_run_step_right
macro pippi_run_step_right
	db movement_pippi_run_step_right ; $61
	endm
	
	enum movement_pippi_fast_step_down
macro pippi_fast_step_down
	db movement_pippi_fast_step_down ; $5e
	endm

	enum movement_pippi_fast_step_up
macro pippi_fast_step_up
	db movement_pippi_fast_step_up ; $5f
	endm

	enum movement_pippi_fast_step_left
macro pippi_fast_step_left
	db movement_pippi_fast_step_left ; $60
	endm

	enum movement_pippi_fast_step_right
macro pippi_fast_step_right
	db movement_pippi_fast_step_right ; $61
	endm
	
	enum movement_skateboard_step_down
macro skateboard_step_down
	db movement_skateboard_step_down ; $5e
	endm

	enum movement_skateboard_step_up
macro skateboard_step_up
	db movement_skateboard_step_up ; $5f
	endm

	enum movement_skateboard_step_left
macro skateboard_step_left
	db movement_skateboard_step_left ; $60
	endm

	enum movement_skateboard_step_right
macro skateboard_step_right
	db movement_skateboard_step_right ; $61
	endm
	
	enum movement_skateboard_slow_step_down
macro skateboard_slow_step_down
	db movement_skateboard_slow_step_down ; $62
	endm

	enum movement_skateboard_slow_step_up
macro skateboard_slow_step_up
	db movement_skateboard_slow_step_up ; $63
	endm

	enum movement_skateboard_slow_step_left
macro skateboard_slow_step_left
	db movement_skateboard_slow_step_left ; $64
	endm

	enum movement_skateboard_slow_step_right
macro skateboard_slow_step_right
	db movement_skateboard_slow_step_right ; $65
	endm
	
	enum movement_muk_up
macro step_muk_up
	db movement_muk_up ; $66
	endm

	enum movement_muk_down
macro step_muk_down
	db movement_muk_down ; $67
	endm
	
	enum movement_muk_sleep
macro step_muk_sleep
	db movement_muk_sleep ; $68
	endm
	
	enum movement_dealer_down
macro step_dealer_down
	db movement_dealer_down ; $69
	endm
	
	enum movement_dealer_left
macro step_dealer_left
	db movement_dealer_left ; $6a
	endm
	
	enum movement_dealer_right
macro step_dealer_right
	db movement_dealer_right ; $6b
	endm
	
	enum movement_jump_in_place
macro jump_in_place
	db movement_jump_in_place ; $11
	endm
