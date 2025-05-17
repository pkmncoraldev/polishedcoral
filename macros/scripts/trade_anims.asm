	enum_start
	enum tradeanim_next_command
macro tradeanim_next
	db tradeanim_next_command ; 00
endm

	enum tradeanim_show_givemon_data_command
macro tradeanim_show_givemon_data
	db tradeanim_show_givemon_data_command ; 01
endm

	enum tradeanim_show_getmon_data_command
macro tradeanim_show_getmon_data
	db tradeanim_show_getmon_data_command ; 02
endm

	enum tradeanim_enter_link_tube_command
macro tradeanim_enter_link_tube
	db tradeanim_enter_link_tube_command ; 03
endm

DEF __enum__ = $5

	enum tradeanim_exit_link_tube_command
macro tradeanim_exit_link_tube
	db tradeanim_exit_link_tube_command ; 05
endm

	enum tradeanim_tube_to_ot_command
macro tradeanim_tube_to_ot
	db tradeanim_tube_to_ot_command ; 06
endm

DEF __enum__ = $e

	enum tradeanim_tube_to_player_command
macro tradeanim_tube_to_player
	db tradeanim_tube_to_player_command ; 0e
endm

DEF __enum__ = $16

	enum tradeanim_sent_to_ot_text_command
macro tradeanim_sent_to_ot_text
	db tradeanim_sent_to_ot_text_command ; 16
endm

	enum tradeanim_ot_bids_farewell_command
macro tradeanim_ot_bids_farewell
	db tradeanim_ot_bids_farewell_command ; 17
endm

	enum tradeanim_take_care_of_text_command
macro tradeanim_take_care_of_text
	db tradeanim_take_care_of_text_command ; 18
endm

	enum tradeanim_ot_sends_text_1_command
macro tradeanim_ot_sends_text_1
	db tradeanim_ot_sends_text_1_command ; 19
endm

	enum tradeanim_ot_sends_text_2_command
macro tradeanim_ot_sends_text_2
	db tradeanim_ot_sends_text_2_command ; 1a
endm

	enum tradeanim_setup_givemon_scroll_command
macro tradeanim_setup_givemon_scroll
	db tradeanim_setup_givemon_scroll_command ; 1b
endm

	enum tradeanim_do_givemon_scroll_command
macro tradeanim_do_givemon_scroll
	db tradeanim_do_givemon_scroll_command ; 1c
endm

	enum tradeanim_frontpic_scroll_command
macro tradeanim_frontpic_scroll
	db tradeanim_frontpic_scroll_command ; 1d
endm

	enum tradeanim_textbox_scroll_command
macro tradeanim_textbox_scroll
	db tradeanim_textbox_scroll_command ; 1e
endm

	enum tradeanim_scroll_out_right_command
macro tradeanim_scroll_out_right
	db tradeanim_scroll_out_right_command ; 1f
endm

DEF __enum__ = $21

	enum tradeanim_wait_80_command
macro tradeanim_wait_80
	db tradeanim_wait_80_command ; 21
endm

	enum tradeanim_wait_40_command
macro tradeanim_wait_40
	db tradeanim_wait_40_command ; 22
endm

	enum tradeanim_rocking_ball_command
macro tradeanim_rocking_ball
	db tradeanim_rocking_ball_command ; 23
endm

	enum tradeanim_drop_ball_command
macro tradeanim_drop_ball
	db tradeanim_drop_ball_command ; 24
endm

	enum tradeanim_wait_anim_command
macro tradeanim_wait_anim
	db tradeanim_wait_anim_command ; 25
endm

DEF __enum__ = $27

	enum tradeanim_poof_command
macro tradeanim_poof
	db tradeanim_poof_command ; 27
endm

	enum tradeanim_bulge_through_tube_command
macro tradeanim_bulge_through_tube
	db tradeanim_bulge_through_tube_command ; 28
endm

	enum tradeanim_give_trademon_sfx_command
macro tradeanim_give_trademon_sfx
	db tradeanim_give_trademon_sfx_command ; 29
endm

	enum tradeanim_get_trademon_sfx_command
macro tradeanim_get_trademon_sfx
	db tradeanim_get_trademon_sfx_command ; 2a
endm

	enum tradeanim_end_command
macro tradeanim_end
	db tradeanim_end_command ; 2b
endm

	enum tradeanim_animate_frontpic_command
macro tradeanim_animate_frontpic
	db tradeanim_animate_frontpic_command ; 2c
endm

	enum tradeanim_wait_96_command
macro tradeanim_wait_96
	db tradeanim_wait_96_command ; 2d
endm

	enum tradeanim_wait_80_if_ot_egg_command
macro tradeanim_wait_80_if_ot_egg
	db tradeanim_wait_80_if_ot_egg_command ; 2e
endm

	enum tradeanim_wait_180_if_ot_egg_command
macro tradeanim_wait_180_if_ot_egg
	db tradeanim_wait_180_if_ot_egg_command ; 2f
endm
