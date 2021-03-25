SunbeamJungleDeep_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 1 ; warp events
	warp_def 23,  7, 2, SUNBEAM_JUNGLE_CAVE

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_ELECTABUZZ,  5, 10, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SunbeamJungleDeepElectabuzz, EVENT_SUNBEAM_JUNGLE_DEEP_ELECTABUZZ_GONE

	const_def 1 ; object constants
	const SUNBEAM_JUNGLE_DEEP_ELECTABUZZ
	
SunbeamJungleDeepElectabuzz:
	opentext
	writetext SunbeamJungleDeepElectabuzzText
	cry ELECTABUZZ
	waitbutton
	closetext
	waitsfx
	loadwildmon ELECTABUZZ, 30
	writecode VAR_BATTLETYPE, BATTLETYPE_LEGENDARY
	startbattle
	if_equal $1, SunbeamJungleDeepElectabuzz2
	disappear SUNBEAM_JUNGLE_DEEP_ELECTABUZZ
	setevent EVENT_SUNBEAM_JUNGLE_DEEP_ELECTABUZZ_GONE
	reloadmapafterbattle
;	opentext
;	writetext SunbeamJungleDeepElectabuzzTextGone
;	waitbutton
;	closetext
	end
SunbeamJungleDeepElectabuzz2:
	reloadmapafterbattle
	end
	
SunbeamJungleDeepElectabuzzText:
	text "BUZZ! BUZZ!"
	line "LECTA!"
	done
	
SunbeamJungleDeepElectabuzzTextGone:
	text "With a roar,"
	line "it retreated into"
	cont "the trees!"
	done