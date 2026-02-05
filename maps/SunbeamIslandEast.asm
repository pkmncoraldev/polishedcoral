SunbeamIslandEast_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 4 ; warp events
	warp_def 33,  4, 4, SUNBEAM_JUNGLE
	warp_def 33,  5, 5, SUNBEAM_JUNGLE
	warp_def 33,  6, 6, SUNBEAM_JUNGLE
	warp_def 33,  7, 7, SUNBEAM_JUNGLE

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	person_event SPRITE_FLOATING_BALL, 48,  3, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunbeamFloatingBall1, EVENT_SUNBEAM_FLOATING_BALL_1
	person_event SPRITE_FLOATING_BALL, 54,  6, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SunbeamFloatingBall2, EVENT_TM24
	person_event SPRITE_FLOATING_BALL, 50,  9, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, SunbeamFloatingBall3, EVENT_MUSIC_SNARE_BATTLE
	
	
SunbeamFloatingBall1:
	loadvar wCurItemBallContents, MAGNET
	loadvar wCurItemBallQuantity, 1
	farscall FindItemInBallScript
	iffalse .end
	setevent EVENT_SUNBEAM_FLOATING_BALL_1
.end
	end
	
SunbeamFloatingBall2:
	loadvar wCurItemBallContents, TM_THUNDERBOLT
	farscall FindTMHMInBallScript
	iffalse .end
	setevent EVENT_TM24
.end
	end
	
SunbeamFloatingBall3:
	loadvar wCurItemBallContents, MUSIC_SNARE_BATTLE
	loadvar wCurItemBallQuantity, 2
	farscall FindTapeInBallScript
	iffalse .end
	setevent EVENT_MUSIC_SNARE_BATTLE
.end
	end
