DesertWasteland7_MapScriptHeader:
	db 2 ; scene scripts
	scene_script DesertWastelandTrigger0
	scene_script DesertWastelandTrigger1

	db 0 ; callbacks

	db 0 ; warp events

	db 36 ; coord events
	coord_event 14, 15, 1, DesertWastelandReset
	coord_event 15, 14, 1, DesertWastelandReset
	coord_event  4,  3, 1, DesertWastelandReset
	coord_event  5,  3, 1, DesertWastelandReset
	coord_event  6,  3, 1, DesertWastelandReset
	coord_event  7,  3, 1, DesertWastelandReset
	coord_event  8,  3, 1, DesertWastelandReset
	coord_event  9,  3, 1, DesertWastelandReset
	coord_event 10,  3, 1, DesertWastelandReset
	coord_event 11,  3, 1, DesertWastelandReset
	coord_event 12,  3, 1, DesertWastelandReset
	coord_event 13,  3, 1, DesertWastelandReset
	coord_event 14,  3, 1, DesertWastelandReset
	coord_event 15,  3, 1, DesertWastelandReset
	coord_event  3,  3, 1, DesertWastelandReset
	coord_event  3,  4, 1, DesertWastelandReset
	coord_event  3,  5, 1, DesertWastelandReset
	coord_event  3,  6, 1, DesertWastelandReset
	coord_event  3,  7, 1, DesertWastelandReset
	coord_event  3,  8, 1, DesertWastelandReset
	coord_event  3,  9, 1, DesertWastelandReset
	coord_event  3, 10, 1, DesertWastelandReset
	coord_event  3, 11, 1, DesertWastelandReset
	coord_event  3, 12, 1, DesertWastelandReset
	coord_event  3, 13, 1, DesertWastelandReset
	coord_event  3, 14, 1, DesertWastelandReset
	coord_event  3, 15, 1, DesertWastelandReset
	coord_event 14, 17, 1, DesertWastelandReset
	coord_event 14, 16, 1, DesertWastelandReset
	coord_event  3, 17, 1, DesertWastelandReset
	coord_event  3, 16, 1, DesertWastelandReset
	coord_event 17, 14, 1, DesertWastelandReset
	coord_event 16, 14, 1, DesertWastelandReset
	coord_event 17,  3, 1, DesertWastelandReset
	coord_event 16,  3, 1, DesertWastelandReset
	coord_event 14, 14, 1, DesertWastelandReset

	db 0 ; bg events

	db 0 ; object events

	