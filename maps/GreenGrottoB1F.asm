GreenGrottoB1F_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, GreenGrottoB1FCallback

	db 6 ; warp events
	warp_event  3, 13, GREEN_GROTTO_1F, 3
	warp_event 11, 21, GREEN_GROTTO_1F, 4
	warp_event 31, 13, GREEN_GROTTO_1F, 5
	warp_event 11, 10, ROUTE_1, 1
	warp_event 29,  6, ROUTE_1, 1
	warp_event 34, 20, ROUTE_1, 1

	db 0 ; coord events

	db 5 ; bg events
	signpost 10,  9, SIGNPOST_IFSET, GreenGrottoB1FRock1
	signpost 10, 10, SIGNPOST_IFSET, GreenGrottoB1FRock2
	signpost  6, 27, SIGNPOST_IFSET, GreenGrottoB1FRock3
	signpost  6, 28, SIGNPOST_IFSET, GreenGrottoB1FRock4
	signpost 21, 34, SIGNPOST_IFSET, GreenGrottoB1FRock5

	db 0 ; object events
	
GreenGrottoB1FCallback:
	checkevent EVENT_GREEN_GROTTO_BOULDER_1
	iffalse .skip1
	changeblock $8, $a, $5a
.skip1
	checkevent EVENT_GREEN_GROTTO_BOULDER_2
	iffalse .skip2
	changeblock $a, $a, $5d
.skip2
	checkevent EVENT_GREEN_GROTTO_BOULDER_3
	iffalse .skip3
	changeblock $1a, $6, $5c
.skip3
	checkevent EVENT_GREEN_GROTTO_BOULDER_4
	iffalse .skip4
	changeblock $1c, $6, $5b
.skip4
	checkevent EVENT_GREEN_GROTTO_BOULDER_5
	iffalse .skip5
	changeblock $22, $14, $5e
.skip5
	return

GreenGrottoB1FRock1:
	dw EVENT_GREEN_GROTTO_BOULDER_1
	jumptext GreenGrottoB1FRockText1
	
GreenGrottoB1FRock2:
	dw EVENT_GREEN_GROTTO_BOULDER_2
	jumptext GreenGrottoB1FRockText1
	
GreenGrottoB1FRock3:
	dw EVENT_GREEN_GROTTO_BOULDER_3
	jumptext GreenGrottoB1FRockText1
	
GreenGrottoB1FRock4:
	dw EVENT_GREEN_GROTTO_BOULDER_4
	jumptext GreenGrottoB1FRockText1
	
GreenGrottoB1FRock5:
	dw EVENT_GREEN_GROTTO_BOULDER_5
	jumptext GreenGrottoB1FRockText2

GreenGrottoB1FRockText1:
	text "It's lodged into"
	line "place and can be"
	cont "walked on."
	done
	
GreenGrottoB1FRockText2:
	text "It's lodged into"
	line "place."
	done
