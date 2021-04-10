FishGroups: ; 92488
	dbbwww 65 percent + 1, 85 percent + 1, .Shore_Old,            .Shore_Good,            .Shore_Super
	dbbwww 75 percent + 1, 85 percent + 1, .Ocean_Old,            .Ocean_Good,            .Ocean_Super
	dbbwww 70 percent + 1, 85 percent + 1, .Lake_Old,             .Lake_Good,             .Lake_Super
	dbbwww 55 percent + 1, 65 percent + 1, .Pond_Old,             .Pond_Good,             .Pond_Super
	dbbwww 60 percent + 1, 70 percent + 1, .Dratini_Old,          .Dratini_Good,          .Dratini_Super
	dbbwww 60 percent + 1, 70 percent + 1, .Qwilfish_Swarm_Old,   .Qwilfish_Swarm_Good,   .Qwilfish_Swarm_Super
	dbbwww 60 percent + 1, 70 percent + 1, .Remoraid_Swarm_Old,   .Remoraid_Swarm_Good,   .Remoraid_Swarm_Super
	dbbwww 60 percent + 1, 70 percent + 1, .Gyarados_Old,         .Gyarados_Good,         .Gyarados_Super
	dbbwww 60 percent + 1, 70 percent + 1, .Dratini_2_Old,        .Dratini_2_Good,        .Dratini_2_Super
	dbbwww 60 percent + 1, 70 percent + 1, .WhirlIslands_Old,     .WhirlIslands_Good,     .WhirlIslands_Super
	dbbwww 60 percent + 1, 70 percent + 1, .Qwilfish_Old,         .Qwilfish_Good,         .Qwilfish_Super
	dbbwww 60 percent + 1, 70 percent + 1, .Remoraid_Old,         .Remoraid_Good,         .Remoraid_Super
	dbbwww 60 percent + 1, 70 percent + 1, .Qwilfish_NoSwarm_Old, .Qwilfish_NoSwarm_Good, .Qwilfish_NoSwarm_Super

.Shore_Old: ; 924e3
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     MAGIKARP,   10
.Shore_Good: ; 924ec
	db  35 percent,     BULBASAUR,   20
	db  70 percent,     BULBASAUR,     20
	db  90 percent + 1, BULBASAUR,     20
	db 100 percent,     0, 0
.Shore_Super: ; 924f8
	db  40 percent,     BULBASAUR,     40
	db  70 percent,     0, 1
	db  90 percent + 1, BULBASAUR,     40
	db 100 percent,     BULBASAUR,    40

.Ocean_Old: ; 92504
	db  70 percent + 1, BULBASAUR,   10
	db  85 percent + 1, BULBASAUR,   10
	db 100 percent,     BULBASAUR,  10
.Ocean_Good: ; 9250d
	db  35 percent,     BULBASAUR,   20
	db  70 percent,     BULBASAUR,  20
	db  90 percent + 1, BULBASAUR,   20
	db 100 percent,     0, 2
.Ocean_Super: ; 92519
	db  40 percent,     BULBASAUR,   40
	db  70 percent,     0, 3
	db  90 percent + 1, BULBASAUR, 40
	db 100 percent,     BULBASAUR,    40

.Lake_Old: ; 92525
	db  70 percent + 1, BULBASAUR,   10
	db  85 percent + 1, BULBASAUR,   10
	db 100 percent,     BULBASAUR,    10
.Lake_Good: ; 9252e
	db  35 percent,     BULBASAUR,   20
	db  70 percent,     BULBASAUR,    20
	db  90 percent + 1, BULBASAUR,    20
	db 100 percent,     0, 4
.Lake_Super: ; 9253a
	db  40 percent,     BULBASAUR,    40
	db  70 percent,     0, 5
	db  90 percent + 1, BULBASAUR,   40
	db 100 percent,     BULBASAUR,    40

.Pond_Old: ; 92546
	db  70 percent + 1, BULBASAUR,   10
	db  85 percent + 1, BULBASAUR,   10
	db 100 percent,     BULBASAUR,    10
.Pond_Good: ; 9254f
	db  35 percent,     BULBASAUR,   20
	db  70 percent,     BULBASAUR,    20
	db  90 percent + 1, BULBASAUR,    20
	db 100 percent,     0, 6
.Pond_Super: ; 9255b
	db  40 percent,     BULBASAUR,    40
	db  70 percent,     0, 7
	db  90 percent + 1, BULBASAUR,   40
	db 100 percent,     BULBASAUR,    40

.Dratini_Old: ; 92567
	db  70 percent + 1, BULBASAUR,   10
	db  85 percent + 1, BULBASAUR,   10
	db 100 percent,     BULBASAUR,   10
.Dratini_Good: ; 92570
	db  35 percent,     BULBASAUR,   20
	db  70 percent,     BULBASAUR,   20
	db  90 percent + 1, BULBASAUR,   20
	db 100 percent,     0, 8
.Dratini_Super: ; 9257c
	db  40 percent,     BULBASAUR,   40
	db  70 percent,     0, 9
	db  90 percent + 1, BULBASAUR,   40
	db 100 percent,     BULBASAUR,  40

.Qwilfish_Swarm_Old: ; 92588
	db  70 percent + 1, BULBASAUR,   5
	db  85 percent + 1, BULBASAUR,   5
	db 100 percent,     BULBASAUR,   5
.Qwilfish_Swarm_Good: ; 92591
	db  35 percent,     BULBASAUR,   20
	db  70 percent,     BULBASAUR,   20
	db  90 percent + 1, BULBASAUR,   20
	db 100 percent,     0, 10
.Qwilfish_Swarm_Super: ; 9259d
	db  40 percent,     BULBASAUR,   40
	db  70 percent,     0, 11
	db  90 percent + 1, BULBASAUR,   40
	db 100 percent,     BULBASAUR,   40

.Remoraid_Swarm_Old: ; 925a9
	db  70 percent + 1, BULBASAUR,   10
	db  85 percent + 1, BULBASAUR,   10
	db 100 percent,     BULBASAUR,   10
.Remoraid_Swarm_Good: ; 925b2
	db  35 percent,     BULBASAUR,   20
	db  70 percent,     BULBASAUR,   20
	db  90 percent + 1, BULBASAUR,   20
	db 100 percent,     0, 12
.Remoraid_Swarm_Super: ; 925be
	db  40 percent,     BULBASAUR,   40
	db  70 percent,     0, 13
	db  90 percent + 1, BULBASAUR,   40
	db 100 percent,     BULBASAUR,   40

.Gyarados_Old: ; 925ca
	db  70 percent + 1, BULBASAUR,   10
	db  85 percent + 1, BULBASAUR,   10
	db 100 percent,     BULBASAUR,   10
.Gyarados_Good: ; 925d3
	db  35 percent,     BULBASAUR,   20
	db  70 percent,     BULBASAUR,   20
	db  90 percent + 1, BULBASAUR,   20
	db 100 percent,     0, 14
.Gyarados_Super: ; 925df
	db  40 percent,     BULBASAUR,   40
	db  70 percent,     0, 15
	db  90 percent + 1, BULBASAUR,   40
	db 100 percent,     BULBASAUR,   40

.Dratini_2_Old: ; 925eb
	db  70 percent + 1, BULBASAUR,   10
	db  85 percent + 1, BULBASAUR,   10
	db 100 percent,     BULBASAUR,   10
.Dratini_2_Good: ; 925f4
	db  35 percent,     BULBASAUR,   10
	db  70 percent,     BULBASAUR,   10
	db  90 percent + 1, BULBASAUR,   10
	db 100 percent,     0, 16
.Dratini_2_Super: ; 92600
	db  40 percent,     BULBASAUR,   10
	db  70 percent,     0, 17
	db  90 percent + 1, BULBASAUR,   10
	db 100 percent,     BULBASAUR,  10

.WhirlIslands_Old: ; 9260c
	db  70 percent + 1, BULBASAUR,   10
	db  85 percent + 1, BULBASAUR,   10
	db 100 percent,     BULBASAUR,     10
.WhirlIslands_Good: ; 92615
	db  35 percent,     BULBASAUR,   20
	db  70 percent,     BULBASAUR,     20
	db  90 percent + 1, BULBASAUR,     20
	db 100 percent,     0, 18
.WhirlIslands_Super: ; 92621
	db  40 percent,     BULBASAUR,     40
	db  70 percent,     0, 19
	db  90 percent + 1, BULBASAUR,    40
	db 100 percent,     BULBASAUR,     40

.Qwilfish_NoSwarm_Old:
.Qwilfish_Old: ; 9262d
	db  70 percent + 1, BULBASAUR,   10
	db  85 percent + 1, BULBASAUR,   10
	db 100 percent,     BULBASAUR,  10
.Qwilfish_NoSwarm_Good:
.Qwilfish_Good: ; 92636
	db  35 percent,     BULBASAUR,   20
	db  70 percent,     BULBASAUR,  20
	db  90 percent + 1, BULBASAUR,  20
	db 100 percent,     0, 20
.Qwilfish_NoSwarm_Super:
.Qwilfish_Super: ; 92642
	db  40 percent,     BULBASAUR,  40
	db  70 percent,     0, 21
	db  90 percent + 1, BULBASAUR,   40
	db 100 percent,     BULBASAUR,   40

.Remoraid_Old: ; 9264e
	db  70 percent + 1, BULBASAUR,   10
	db  85 percent + 1, BULBASAUR,   10
	db 100 percent,     BULBASAUR,    10
.Remoraid_Good: ; 92657
	db  35 percent,     BULBASAUR,   20
	db  70 percent,     BULBASAUR,    20
	db  90 percent + 1, BULBASAUR,    20
	db 100 percent,     0, 6
.Remoraid_Super: ; 92663
	db  40 percent,     BULBASAUR,    40
	db  70 percent,     0, 7
	db  90 percent + 1, BULBASAUR,   40
	db 100 percent,     BULBASAUR,   40
; 9266f


TimeFishGroups: ; 9266f
	;  day              nite
	db BULBASAUR,    20,  BULBASAUR,     20
	db BULBASAUR,    40,  BULBASAUR,     40
	db BULBASAUR,   20,  BULBASAUR,   20
	db BULBASAUR,   40,  BULBASAUR,   40
	db BULBASAUR,    20,  BULBASAUR,    20
	db BULBASAUR,    40,  BULBASAUR,    40
	db BULBASAUR,    20,  BULBASAUR,    20
	db BULBASAUR,    40,  BULBASAUR,    40
	db BULBASAUR,    20,  BULBASAUR,    20
	db BULBASAUR,    40,  BULBASAUR,    40
	db BULBASAUR,   20,  BULBASAUR,   20
	db BULBASAUR,   40,  BULBASAUR,   40
	db BULBASAUR,   20,  BULBASAUR,   20
	db BULBASAUR,   40,  BULBASAUR,   40
	db BULBASAUR,   20,  BULBASAUR,   20
	db BULBASAUR,   40,  BULBASAUR,   40
	db BULBASAUR,    10,  BULBASAUR,    10
	db BULBASAUR,    10,  BULBASAUR,    10
	db BULBASAUR,     20,  BULBASAUR,     20
	db BULBASAUR,     40,  BULBASAUR,     40
	db BULBASAUR,  20,  BULBASAUR,  20
	db BULBASAUR,  40,  BULBASAUR,  40
; 926c7


FishItems:
	db PEARL
	db BIG_PEARL
	db BOTTLE_CAP
