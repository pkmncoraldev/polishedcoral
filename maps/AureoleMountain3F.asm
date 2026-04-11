AureoleMountain3F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 15,  3, 2, AUREOLE_MOUNTAIN_2F
	warp_def 13, 12, 4, AUREOLE_MOUNTAIN_2F

	db 0 ; coord events

	db 2 ; bg events
	bg_event 16, 16, SIGNPOST_ITEM + REVIVE, EVENT_AUREOLE_MOUNTAIN_3F_HIDDEN_ITEM_1
	bg_event 13, 10, SIGNPOST_ITEM + FULL_HEAL, EVENT_AUREOLE_MOUNTAIN_3F_HIDDEN_ITEM_2

	db 1 ; object events
	itemball_event 11,  4, KINGS_ROCK, 1, EVENT_AUREOLE_MOUNTAIN_3F_ITEM
