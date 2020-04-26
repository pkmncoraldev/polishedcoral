StarglowNoPokemonHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 7, 3, 2, STARGLOW_VALLEY
	warp_def 7, 2, 2, STARGLOW_VALLEY

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_SUPER_NERD, 4, 5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, StarglowHouse2NPC, -1

StarglowHouse2NPC:
	jumptextfaceplayer StarglowHouse2NPCText
	end
	

StarglowHouse2NPCText:
	text "Those guys were"
	line "trying to take my"
	cont "#MON?"
	
	para "Joke's on them!"
	
	para "I don't have a"
	line "#MON!"
	done
