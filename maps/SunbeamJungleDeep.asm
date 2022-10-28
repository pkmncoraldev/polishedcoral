SunbeamJungleDeep_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 1 ; warp events
	warp_def 23,  7, 2, SUNBEAM_JUNGLE_CAVE

	db 0 ; coord events

	db 1 ; bg events
	bg_event 13,  8, SIGNPOST_ITEM + THUNDERSTONE, EVENT_SUNBEAM_JUNGLE_DEEP_HIDDEN_THUNDERSTONE

	db 5 ; object events
	object_event 10, 5, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, ELECTABUZZ, -1, -1, PAL_NPC_BROWN, PERSONTYPE_SCRIPT, 0, SunbeamJungleDeepElectabuzz, EVENT_SUNBEAM_JUNGLE_DEEP_ELECTABUZZ_GONE
	itemball_event 13,  5, MAGMARIZER, 1, EVENT_SUNBEAM_JUNGLE_DEEP_POKE_BALL
	itemball_event 34, 10, PP_UP, 1, EVENT_SUNBEAM_JUNGLE_DEEP_POKE_BALL_2
	person_event SPRITE_BUG_MANIAC, 10, 29, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SunbeamJungleDeepNPC1, -1
	person_event SPRITE_AROMA_LADY, 13, 33, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SunbeamJungleDeepNPC2, -1

	const_def 1 ; object constants
	const SUNBEAM_JUNGLE_DEEP_ELECTABUZZ
	
SunbeamJungleDeepElectabuzz:
	opentext
	writetext SunbeamJungleDeepElectabuzzText
	cry ELECTABUZZ
	waitbutton
	closetext
	waitsfx
	loadwildmon ELECTABUZZ, 25
	writecode VAR_BATTLETYPE, BATTLETYPE_LEGENDARY
	startbattle
	disappear SUNBEAM_JUNGLE_DEEP_ELECTABUZZ
	reloadmapafterbattle
	setevent EVENT_SUNBEAM_JUNGLE_DEEP_ELECTABUZZ_2
	checkcode VAR_MONJUSTCAUGHT
	if_equal ELECTABUZZ, .CaughtElecatbuzz
	opentext
	writetext SunbeamJungleDeepElectabuzzTextGone
	waitbutton
	closetext
.CaughtElecatbuzz
	end
	
SunbeamJungleDeepNPC1:
	faceplayer
	opentext
	writetext SunbeamJungleDeepHealText
	yesorno
	iffalse .no
	closetext
	special FadeOutPalettesBlack
	special HealParty
	special SaveMusic
	playmusic MUSIC_HEAL
	pause 60
	special RestoreMusic
	callasm LoadMapPals
	special FadeInPalettes
.no
	closetext
	end
	
SunbeamJungleDeepNPC2:
	jumptextfaceplayer SunbeamJungleDeepNPC2Text
	end
	
SunbeamJungleDeepHealText:
	text "We're on the trail"
	line "of a crazy strong"
	cont "#MON that was"
	cont "spotted nearby."
	
	para "Are you looking"
	line "for it too?"
	
	para "If you're heading"
	line "on, you should"
	cont "take a rest first."
	done
	
SunbeamJungleDeepNPC2Text:
	text "Some shady guys"
	line "have been around"
	cont "the jungle lately."
	
	para "I really hope"
	line "they aren't up to"
	cont "anything."
	
	para "There's a lot of"
	line "rare and powerful"
	cont "#MON around"
	cont "here…"
	done
	
SunbeamJungleDeepElectabuzzText:
	text "BUZZ! BUZZ!"
	line "LECTA!"
	done
	
SunbeamJungleDeepElectabuzzTextGone:
	text "With a loud roar,"
	line "ELECTABUZZ went"
	cont "deep into the"
	cont "jungle!"
	done