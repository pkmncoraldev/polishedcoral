SunbeamJungleDeep_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 1 ; warp events
	warp_def 27,  7, 2, SUNBEAM_JUNGLE_CAVE

	db 0 ; coord events

	db 1 ; bg events
	bg_event 13, 12, SIGNPOST_ITEM + THUNDERSTONE, EVENT_SUNBEAM_JUNGLE_DEEP_HIDDEN_THUNDERSTONE

	db 12 ; object events
	person_event SPRITE_MISC_OVERHEAD, -2, -2, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 10,  9, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, ELECTABUZZ, -1, -1, PAL_NPC_BROWN, PERSONTYPE_SCRIPT, 0, SunbeamJungleDeepElectabuzz, EVENT_SUNBEAM_JUNGLE_DEEP_ELECTABUZZ_GONE
	itemball_event 13,  9, MAGMARIZER, 1, EVENT_SUNBEAM_JUNGLE_DEEP_POKE_BALL
	itemball_event 16, 20, SUPER_REPEL, 1, EVENT_SUNBEAM_JUNGLE_DEEP_POKE_BALL2
	tapeball_event 34, 14, MUSIC_SNARE_INVASION, 1, EVENT_MUSIC_SNARE_INVASION
	tmhmball_event 33, 32, TM_SHOCK_WAVE, EVENT_TM34
	person_event SPRITE_BUG_MANIAC, 14, 29, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SunbeamJungleDeepNPC1, -1
	person_event SPRITE_AROMA_LADY, 17, 33, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SunbeamJungleDeepNPC2, -1
	itemball_event 30,  4, MACHO_BRACE, 1, EVENT_SUNBEAM_JUNGLE_DEEP_POKE_BALL3
	object_event 13, 25, SPRITE_RAFFLESIA, SPRITEMOVEDATA_CUTTABLE_TREE, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunbeamJungleRafflesia, -1
	object_event 16, 21, SPRITE_RAFFLESIA, SPRITEMOVEDATA_CUTTABLE_TREE, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunbeamJungleRafflesia, -1
	object_event  4, 10, SPRITE_RAFFLESIA, SPRITEMOVEDATA_CUTTABLE_TREE, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunbeamJungleRafflesia, -1

	const_def 1 ; object constants
	const SUNBEAM_JUNGLE_DEEP_SPORES
	const SUNBEAM_JUNGLE_DEEP_ELECTABUZZ
	
SunbeamJungleDeepElectabuzz:
	opentext TEXTBOX_POKEMON, ELECTABUZZ
	writetext SunbeamJungleDeepElectabuzzText
	cry ELECTABUZZ
	waitbutton
	closetext
	waitsfx
	loadwildmon ELECTABUZZ, 22
	writecode VAR_BATTLETYPE, BATTLETYPE_LEGENDARY
	startbattle
	disappear SUNBEAM_JUNGLE_DEEP_ELECTABUZZ
	reloadmapafterbattle
	setevent EVENT_SUNBEAM_JUNGLE_DEEP_ELECTABUZZ_2
	checkcode VAR_MONJUSTCAUGHT
	if_equal ELECTABUZZ, .CaughtElectabuzz
	opentext
	writetext SunbeamJungleDeepElectabuzzTextGone
	waitbutton
	closetext
.CaughtElectabuzz
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	setevent EVENT_UNIQUE_ENCOUNTER_ELECTABUZZ_BOSS
	end
	
SunbeamJungleDeepNPC1:
	checkevent EVENT_REACHED_LUSTER_CITY
	iftrue .done
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
.done
	jumptextfaceplayer SunbeamJungleDeepNPC1Text2
	
SunbeamJungleDeepNPC2:
	checkevent EVENT_REACHED_LUSTER_CITY
	iftrue .done
	jumptextfaceplayer SunbeamJungleDeepNPC2Text
.done
	jumptextfaceplayer SunbeamJungleDeepNPC2Text2
	
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
	
SunbeamJungleDeepNPC1Text2:
	text "No sign of the"
	line "#MON we were"
	cont "looking for…"
	
	para "Maybe we should"
	line "pack up and head"
	cont "home…"
	done
	
SunbeamJungleDeepNPC2Text:
	text "Some shady guys"
	line "have been around"
	cont "the jungle lately."
	
	para "I really hope"
	line "they aren't up to"
	cont "anything."
	
	para "There are lots of"
	line "rare and powerful"
	cont "#MON around"
	cont "here…"
	done
	
SunbeamJungleDeepNPC2Text2:
	text "Those shady guys"
	line "that were around"
	cont "seem to be gone."
	
	para "Good riddance!"
	done
	
SunbeamJungleDeepElectabuzzText:
	text "BUZZ! <WAIT_S>BUZZ!<WAIT_S>"
	line "LECTA!"
	done
	
SunbeamJungleDeepElectabuzzTextGone:
	text "With a loud roar,"
	line "ELECTABUZZ went"
	cont "deep into the"
	cont "jungle!"
	done