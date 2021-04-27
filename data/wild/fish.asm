FishGroups: ; 92488
	dbwww 00 percent + 1, .Glint_Old,        	  .Glint_Old,         	  .Glint_Old
	dbwww 75 percent + 1, .Glint_Old,        	  .Glint_Good,        	  .Glint_Super
	dbwww 75 percent + 1, .Starglow_Old,         .Starglow_Good,         .Starglow_Super
	dbwww 75 percent + 1, .Lake_Old,             .Lake_Good,             .Lake_Super
	dbwww 75 percent + 1, .Sunbeam_Old,          .Sunbeam_Good,          .Sunbeam_Super

.Daybreak_Old:
	db  70 percent + 1, DRATINI,  	10	;70%
	db  85 percent + 1, DRATINI,  	10	;15%
	db 100 percent,     DRATINI,  	10	;15%
.Daybreak_Super:
.Daybreak_Good:
	db  35 percent,     DRATINI,  	20	;40%
	db  70 percent,     DRATINI,  	20	;30%
	db  90 percent + 1, DRATINI,   	20	;20%
	db 100 percent,     DRATINI, 	20	;10%
	
.Glint_Old:
	db  70 percent + 1, MAGIKARP,   10	;70%
	db  85 percent + 1, MAGIKARP,   10	;15%
	db 100 percent,     MAGIKARP,   10	;15%
.Glint_Super:
.Glint_Good:
	db  35 percent,     POLIWAG,  	11	;40%
	db  70 percent,     BUIZEL,	    11	;30%
	db  90 percent + 1, BUIZEL,     11	;20%
	db 100 percent,     POLIWAG, 	11	;10%
	
.Starglow_Old:
	db  70 percent + 1, MAGIKARP,   10	;70%
	db  85 percent + 1, MAGIKARP,   10	;15%
	db 100 percent,     MAGIKARP,   10	;15%
.Starglow_Super:
.Starglow_Good:
	db  35 percent,     POLIWAG,  	11	;40%
	db  70 percent,     CARVANHA,   11	;30%
	db  90 percent + 1, MAGIKARP,   11	;20%
	db 100 percent,     POLIWAG, 	11	;10%

.Lake_Old:
	db  70 percent + 1, MAGIKARP,   10	;70%
	db  85 percent + 1, MAGIKARP,   10	;15%
	db 100 percent,     MAGIKARP,   10	;15%
.Lake_Super:
.Lake_Good:
	db  35 percent,     PSYDUCK,    15	;40%
	db  70 percent,     MARILL,  	15	;30%
	db  90 percent + 1, CARVANHA,   15	;20%
	db 100 percent,     PSYDUCK,    15	;10%
	
.Sunbeam_Old:
	db  70 percent + 1, MAGIKARP,   10	;70%
	db  85 percent + 1, MAGIKARP,   10	;15%
	db 100 percent,     MAGIKARP,   10	;15%
.Sunbeam_Super:
.Sunbeam_Good:
	db  35 percent,     HORSEA,   	20	;40%
	db  70 percent,     CHINCHOU,  	20	;30%
	db  90 percent + 1, STARYU,   	20	;20%
	db 100 percent,     CORSOLA, 	20	;10%


FishItems:
	db PEARL
	db PEARL
	db BIG_PEARL
