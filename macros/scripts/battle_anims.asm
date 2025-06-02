macro anim_wait
if \1 >= $d0
	flip out
endc
	db \1
	endm

	enum_start $d0

	enum anim_obj_command ; d0
MACRO anim_obj
	db anim_obj_command
if _NARG <= 4
	dw \1 ; object
	db \2 ; x
	db \3 ; y
	db \4 ; param
endc
ENDM

	enum anim_1gfx_command ; d1
macro anim_1gfx
	db anim_1gfx_command
	db \1 ; gfx1
	endm

	enum anim_2gfx_command ; d2
macro anim_2gfx
	db anim_2gfx_command
	db \1 ; gfx1
	db \2 ; gfx2
	endm

	enum anim_3gfx_command ; d3
macro anim_3gfx
	db anim_3gfx_command
	db \1 ; gfx1
	db \2 ; gfx2
	db \3 ; gfx3
	endm

	enum anim_4gfx_command ; d4
macro anim_4gfx
	db anim_4gfx_command
	db \1 ; gfx1
	db \2 ; gfx2
	db \3 ; gfx3
	db \4 ; gfx4
	endm

	enum anim_5gfx_command ; d5
macro anim_5gfx
	db anim_5gfx_command
	db \1 ; gfx1
	db \2 ; gfx2
	db \3 ; gfx3
	db \4 ; gfx4
	db \5 ; gfx5
	endm

	enum anim_incobj_command ; d6
macro anim_incobj
	db anim_incobj_command
	db \1 ; id
	endm

	enum anim_setobj_command ; d7
macro anim_setobj
	db anim_setobj_command
	db \1 ; id
	db \2 ; obj
	endm

	enum anim_incbgeffect_command ; d8
macro anim_incbgeffect
	db anim_incbgeffect_command
	db \1 ; effect
	endm

	enum anim_enemyfeetobj_command ; d9
macro {anim_enemyfeetobj}
	db anim_enemyfeetobj_command
	endm

	enum anim_playerheadobj_command ; da
macro {anim_playerheadobj}
	db anim_playerheadobj_command
	endm

	enum anim_checkpokeball_command ; db
macro anim_checkpokeball
	db anim_checkpokeball_command
	endm

	enum anim_transform_command ; dc
macro anim_transform
	db anim_transform_command
	endm

	enum anim_raisesub_command ; dd
macro anim_raisesub
	db anim_raisesub_command
	endm

	enum anim_dropsub_command ; de
macro anim_dropsub
	db anim_dropsub_command
	endm

	enum anim_resetobp0_command ; df
macro anim_resetobp0
	db anim_resetobp0_command
	endm

	enum anim_sound_command ; e0
macro anim_sound
	db anim_sound_command
	db (\1 << 2) | \2 ; duration, tracks
	db \3 ; id
	endm

	enum anim_cry_command ; e1
macro anim_cry
	db anim_cry_command
	db \1 ; pitch
	endm

	enum anim_minimizeopp_command ; e2
macro anim_minimizeopp
	db anim_minimizeopp_command
	endm

	enum anim_oamon_command ; e3
macro anim_oamon
	db anim_oamon_command
	endm

	enum anim_oamoff_command ; e4
macro anim_oamoff
	db anim_oamoff_command
	endm

	enum anim_clearobjs_command ; e5
macro anim_clearobjs
	db anim_clearobjs_command
	endm

	enum anim_beatup_command ; e6
macro anim_beatup
	db anim_beatup_command
	endm

	enum anim_checkturn_command ; e7
macro anim_checkturn
	db anim_checkturn_command
	endm

	enum anim_updateactorpic_command ; e8
macro anim_updateactorpic
	db anim_updateactorpic_command
	endm

	enum anim_minimize_command ; e9
macro anim_minimize
	db anim_minimize_command
	endm

	enum anim_setbgpal_command ; ea
macro anim_setbgpal
	db anim_setbgpal_command
	db \1 ; pal index to set (0-7)
	db \2 ; battle pal
	endm

	enum anim_setobjpal_command ; eb
macro anim_setobjpal
	db anim_setobjpal_command
	db \1 ; pal index to set (0-7)
	db \2 ; battle pal
	endm

	enum anim_0xec_command ; ec
macro anim_0xec
	db anim_0xec_command
	endm

	enum anim_0xed_command ; ed
macro anim_0xed
	db anim_0xed_command
	endm

	enum anim_jumpand_command ; ee
macro anim_jumpand
	db anim_jumpand_command
	db \1 ; value
	dw \2 ; address
	endm

	enum anim_jumpuntil_command ; ef
macro anim_jumpuntil
	db anim_jumpuntil_command
	dw \1 ; address
	endm

	enum anim_bgeffect_command ; f0
macro anim_bgeffect
	db anim_bgeffect_command
	db \1 ; effect
	db \2 ; unknown
	db \3 ; unknown
	db \4 ; unknown
	endm

	enum anim_bgp_command ; f1
macro anim_bgp
	db anim_bgp_command
	db \1 ; colors
	endm

	enum anim_obp0_command ; f2
macro anim_obp0
	db anim_obp0_command
	db \1 ; colors
	endm

	enum anim_obp1_command ; f3
macro anim_obp1
	db anim_obp1_command
	db \1 ; colors
	endm

	enum anim_clearsprites_command ; f4
macro {anim_clearsprites}
	db anim_clearsprites_command
	endm

	enum anim_clearenemyhud_command ; $f5
macro anim_clearenemyhud
	db anim_clearenemyhud_command
ENDM

	enum anim_jumpif2_command ; f6
macro anim_jumpif2
	db anim_jumpif2_command
	db \1 ; value
	dw \2 ; address
	endm

	enum anim_clearfirstbgeffect_command ; f7
macro anim_clearfirstbgeffect
	db anim_clearfirstbgeffect_command
	endm

	enum anim_jumpif_command ; f8
macro anim_jumpif
	db anim_jumpif_command
	db \1 ; value
	dw \2 ; address
	endm

	enum anim_setvar_command ; f9
macro anim_setvar
	db anim_setvar_command
	db \1 ; value
	endm

	enum anim_incvar_command ; fa
macro anim_incvar
	db anim_incvar_command
	endm

	enum anim_jumpvar_command ; fb
macro anim_jumpvar
	db anim_jumpvar_command
	db \1 ; value
	dw \2 ; address
	endm

	enum anim_jump_command ; fc
macro anim_jump
	db anim_jump_command
	dw \1 ; address
	endm

	enum anim_loop_command ; fd
macro anim_loop
	db anim_loop_command
	db \1 ; count
	dw \2 ; address
	endm

	enum anim_call_command ; fe
macro anim_call
	db anim_call_command
	dba \1 ; address
	endm

	enum anim_ret_command ; ff
macro anim_ret
	db anim_ret_command
	endm
