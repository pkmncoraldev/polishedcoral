StarglowNoPokemonHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, StarglowNoPokemonHouseCallback

	db 2 ; warp events
	warp_def 7, 3, 2, STARGLOW_VALLEY
	warp_def 7, 2, 2, STARGLOW_VALLEY

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	person_event SPRITE_SUPER_NERD, 4, 5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, StarglowHouse2NPC, -1
	tapeball_event  3, 3, MUSIC_STARGLOW_VALLEY, 1, EVENT_MUSIC_STARGLOW_VALLEY


	const_def 1 ; object constants
	const STARGLOW_NO_POKEMON_HOUSE_NPC
	const STARGLOW_NO_POKEMON_HOUSE_TAPE

StarglowNoPokemonHouseCallback:
	checkevent EVENT_PUNKS_HAVENT_LEFT_STARGLOW
	iffalse .end
	moveperson STARGLOW_NO_POKEMON_HOUSE_TAPE, -1, -1
.end
	return

StarglowHouse2NPC:
	checkevent EVENT_PUNKS_HAVENT_LEFT_STARGLOW
	iftrue .text1
	jumptextfaceplayer StarglowHouse2NPCText2
.text1
	jumptextfaceplayer StarglowHouse2NPCText

StarglowHouse2NPCText:
	text "Those guys were"
	line "trying to take my"
	cont "#MON?"
	
	para "Joke's on them!"
	
	para "I don't have a"
	line "#MON!"
	done
	
StarglowHouse2NPCText2:
	text "You know, maybe I"
	line "should think about"
	cont "getting a #MON."
	
	para "Like, for"
	line "protection."
	
	para "Then again, that"
	line "might make me a"
	cont "target for weirdos"
	cont "who want to steal"
	cont "it…"
	done
