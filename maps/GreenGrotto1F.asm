GreenGrotto1F_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_CMDQUEUE, GreenGrotto1FRocksCallback

	db 8 ; warp events
	warp_event 35, 25, ROUTE_28, 4
	warp_event  3, 19, ROUTE_1, 1
	warp_event 11, 13, GREEN_GROTTO_B1F, 1
	warp_event 19, 21, GREEN_GROTTO_B1F, 2
	warp_event 39, 13, GREEN_GROTTO_B1F, 3
	warp_event 16, 11, GREEN_GROTTO_B1F, 4
	warp_event 34,  7, GREEN_GROTTO_B1F, 5
	warp_event 42, 21, GREEN_GROTTO_B1F, 6

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	strengthboulder_event  9, 21, EVENT_GREEN_GROTTO_BOULDER_1
	strengthboulder_event 15,  5, EVENT_GREEN_GROTTO_BOULDER_2
	strengthboulder_event 40,  5, EVENT_GREEN_GROTTO_BOULDER_3
	strengthboulder_event 33, 13, EVENT_GREEN_GROTTO_BOULDER_4
	strengthboulder_event 38, 21, EVENT_GREEN_GROTTO_BOULDER_5
	
	
	const_def 1 ; object constants
	const GREEN_GROTTO_BOULDER_1
	const GREEN_GROTTO_BOULDER_2
	const GREEN_GROTTO_BOULDER_3
	const GREEN_GROTTO_BOULDER_4
	const GREEN_GROTTO_BOULDER_5

GreenGrotto1FRocksCallback:
	writecmdqueue .BoulderCmdQueue
	return

.BoulderCmdQueue:
	dbw CMDQUEUE_STONETABLE, .BoulderTable ; check if any stones are sitting on a warp
	dw 0 ; filler

.BoulderTable:
	stonetable 6, GREEN_GROTTO_BOULDER_1, .Boulder_1
	stonetable 6, GREEN_GROTTO_BOULDER_2, .Boulder_2
	stonetable 7, GREEN_GROTTO_BOULDER_3, .Boulder_3
	stonetable 7, GREEN_GROTTO_BOULDER_4, .Boulder_4
	stonetable 8, GREEN_GROTTO_BOULDER_5, .Boulder_5
	db -1 ; end

.Boulder_1:
	disappear GREEN_GROTTO_BOULDER_1
	sjump .FinishBoulder
	
.Boulder_2:
	disappear GREEN_GROTTO_BOULDER_2
	sjump .FinishBoulder
	
.Boulder_3:
	disappear GREEN_GROTTO_BOULDER_3
	sjump .FinishBoulder
	
.Boulder_4:
	disappear GREEN_GROTTO_BOULDER_4
	sjump .FinishBoulder
	
.Boulder_5:
	disappear GREEN_GROTTO_BOULDER_5
	sjump .FinishBoulder
	
.FinishBoulder
	pause 30
	playsound SFX_STRENGTH
	earthquake 80
	opentext
	writetext GreenGrottoBoulderFellThroughText
	waitbutton
	closetext
	end
	
GreenGrottoBoulderFellThroughText:
	text "The boulder fell"
	line "through."
	done
