SunbeamBeach_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	person_event SPRITE_ROWBOAT, 29, 10, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SunbeamIslandSunbather, -1
	person_event SPRITE_UMBRELLA, 24, 11, SPRITEMOVEDATA_UMBRELLA_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_UMBRELLA, 24, 12, SPRITEMOVEDATA_UMBRELLA_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_UMBRELLA, 28, 11, SPRITEMOVEDATA_UMBRELLA_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_UMBRELLA, 28, 12, SPRITEMOVEDATA_UMBRELLA_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_SUPER_NERD, 43, 19, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, 0, -1

SunbeamIslandSunbather:
	checktime 1<<NITE
	iftrue .nite
	jumptext SunbeamIslandSunbatherText
.nite
	jumptext SunbeamIslandSunbatherText2
	
SunbeamIslandSunbatherText:
	text "Can I help you?"
	
	para "You're blocking"
	line "my sun."
	done
	
SunbeamIslandSunbatherText2:
	text "…"
	
	para "She's sleeping."
	done