INCLUDE "constants.asm"


SECTION "Egg Moves", ROMX


INCLUDE "data/pokemon/egg_move_pointers.asm"


EggMoves::

NoEggMoves:
	db TACKLE_SCRATCH_POUND
	db $ff
