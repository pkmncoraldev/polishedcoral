Route28_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_PICNICKER, 20, 26, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 0, Route28Trainer1, -1
	
	
Route28Trainer1:
	generictrainer PICNICKER, LES, EVENT_BEAT_ROUTE_28_TRAINER_1, .SeenText, .BeatenText

	text "I'm talking to my"
	line "friend in VIOLET"
	cont "CITY in the JOHTO"
	cont "REGION."
	done

.SeenText:
	text "Uh-huh. Yeah, and"
	line "you know…"

	para "Pardon? Battle?"
	line "I'm on the phone."

	para "Oh, all right. But"
	line "make it fast."
	done

.BeatenText:
	text "Oh! I've got to"
	line "relieve my anger!"
	done
	