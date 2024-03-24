WestTrainCaboose_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 1 ; warp events
	warp_event 0,  2, TRAIN_CABIN_2, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	tapeball_event  2,  2, MUSIC_TRAIN, 1, EVENT_MUSIC_TRAIN
