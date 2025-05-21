MACRO RGB
rept _NARG / 3
if DEF(NOIR)
DEF x = (299 * \1 + 587 * \2 + 114 * \3) / 1000
	dw palred x + palgreen x + palblue x
else
	dw palred (\1) + palgreen (\2) + palblue (\3)
endc
	shift
	shift
	shift
endr
ENDM

DEF palred   EQUS "(1 << 0) *"
DEF palgreen EQUS "(1 << 5) *"
DEF palblue  EQUS "(1 << 10) *"

DEF palettes EQUS "* 8"
DEF palette  EQUS "+ 8 *"

DEF tiles EQUS "* $10"
DEF tile  EQUS "+ $10 *"
