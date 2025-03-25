Route28OttosTent_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 5, 2, 3, ROUTE_28
	warp_def 5, 1, 3, ROUTE_28

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	person_event SPRITE_ELDER,  3,  2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route28OttosTentOtto, -1
	object_event  1,  3, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, TOGEPI, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, Route28OttosTentTogepi, -1
	
Route28OttosTentOtto:
	end

Route28OttosTentTogepi:
	opentext
	writetext Route28OttosTentTogepiText
	cry TOGEPI
	waitbutton
	closetext
	end

Route28OttosTentTogepiText:
	text "TOGEPI: Prrrrri!"
	done