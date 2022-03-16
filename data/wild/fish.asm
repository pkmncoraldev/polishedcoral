FishGroups: ; 92488
	dbwww 75 percent + 1, .Glint_Old,     		 .Route_3_Pond_Good,     .Route_3_Pond_Super
	dbwww 75 percent + 1, .Glint_Old,        	 .Glint_Good,        	 .Glint_Super
	dbwww 75 percent + 1, .Starglow_Old,         .Starglow_Good,         .Starglow_Super
	dbwww 75 percent + 1, .Lake_Old,             .Lake_Good,             .Lake_Super
	dbwww 75 percent + 1, .Sunbeam_Old,          .Sunbeam_Good,          .Sunbeam_Super
	dbwww 75 percent + 1, .Cave_Old,        	 .Cave_Good,        	 .Cave_Super
	dbwww 75 percent + 1, .Jungle_Old,           .Jungle_Good,           .Jungle_Super
	dbwww 75 percent + 1, .Grove_Old,        	 .Grove_Good,        	 .Grove_Super
	dbwww 75 percent + 1, .Route_3_Pond_Old,     .Route_3_Pond_Good,     .Route_3_Pond_Super
	
.Glint_Old:
	db  70 percent, MAGIKARP,   10	;70%
	db  85 percent, MAGIKARP,   10	;15%
	db 100 percent, MAGIKARP,   10	;15%
.Glint_Super:
.Glint_Good:
	db  35 percent, POLIWAG,  	11	;40%
	db  70 percent, BUIZEL,	    11	;30%
	db  90 percent, BUIZEL,     11	;20%
	db 100 percent, POLIWAG, 	11	;10%
	
.Starglow_Old:
	db  70 percent, MAGIKARP,   10	;70%
	db  85 percent, MAGIKARP,   10	;15%
	db 100 percent, MAGIKARP,   10	;15%
.Starglow_Super:
.Starglow_Good:
	db  35 percent, POLIWAG,  	11	;40%
	db  70 percent, CARVANHA,   11	;30%
	db  90 percent, MAGIKARP,   11	;20%
	db 100 percent, POLIWAG, 	11	;10%

.Lake_Old:
	db  70 percent, MAGIKARP,   10	;70%
	db  85 percent, MAGIKARP,   10	;15%
	db 100 percent, MAGIKARP,   10	;15%
.Lake_Super:
.Lake_Good:
	db  40 percent, MARILL,     15	;40%
	db  70 percent, CARVANHA,  	15	;30%
	db  90 percent, WOOPER,     15	;20%
	db 100 percent, CARVANHA,   15	;10%
	
.Sunbeam_Old:
	db  70 percent, MAGIKARP,   10	;70%
	db  85 percent, MAGIKARP,   10	;15%
	db 100 percent, MAGIKARP,   10	;15%
.Sunbeam_Super:
.Sunbeam_Good:
	db  40 percent, HORSEA,   	16	;40%
	db  70 percent, CHINCHOU,  	16	;30%
	db  90 percent, STARYU,   	16	;20%
	db 100 percent, CORSOLA, 	16	;10%
	
.Cave_Old:
	db  70 percent, MAGIKARP,   10	;70%
	db  85 percent, MAGIKARP,   10	;15%
	db 100 percent, MAGIKARP,   10	;15%
.Cave_Super:
.Cave_Good:
	db  40 percent, WOOPER,   	11	;40%
	db  70 percent, POLIWAG,  	11	;30%
	db  90 percent, POLIWAG,   	11	;20%
	db 100 percent, STARYU, 	11	;10%
	
.Jungle_Old:
	db  70 percent, MAGIKARP,   18	;70%
	db  85 percent, MAGIKARP,   18	;15%
	db 100 percent, MAGIKARP,   18	;15%
.Jungle_Super:
.Jungle_Good:
	db  40 percent, CARVANHA,   18	;40%
	db  70 percent, MARILL,  	18	;30%
	db  90 percent, STARYU,   	18	;20%
	db 100 percent, GYARADOS, 	20	;10%

.Grove_Old:
	db  70 percent, MAGIKARP,   18	;70%
	db  85 percent, MAGIKARP,   18	;15%
	db 100 percent, MAGIKARP,   18	;15%
.Grove_Super:
.Grove_Good:
	db  40 percent, MARILL,   	20	;40%
	db  70 percent, POLIWAG,  	20	;30%
	db  90 percent, MARILL,   	20	;20%
	db 100 percent, POLIWAG, 	20	;10%
	
.Route_3_Pond_Old:
.Route_3_Pond_Good:
.Route_3_Pond_Super:
	db 100 percent, DRATINI,   	20	;100%

FishItems:
	db PEARL
	db PEARL
	db BIG_PEARL
