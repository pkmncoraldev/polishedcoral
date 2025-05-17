; pic + oam animations

MACRO frame
	db \1
DEF x = \2
if _NARG > 2
rept _NARG +- 2
DEF x = x | (1 << (\3 + 1))
	shift
endr
endc
	db x
ENDM

	enum_start $fc

	enum delanim_command ; $fc
MACRO delanim ; used for oam
	db delanim_command
ENDM

	enum dorepeat_command ; $fd
MACRO dorepeat
	db dorepeat_command
	db \1 ; #
ENDM

	enum setrepeat_command ; $fe
MACRO setrepeat
	db setrepeat_command
	db \1 ; #
ENDM

	enum endanim_command ; $ff
MACRO endanim
	db endanim_command
ENDM

DEF __enum__ = $fe

	enum dorestart_command ; $fe
MACRO dorestart ; used for oam
	db dorestart_command
ENDM
