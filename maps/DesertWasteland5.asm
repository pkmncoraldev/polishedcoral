DesertWasteland5_MapScriptHeader:
	db 2 ; scene scripts
	scene_script DesertWastelandTrigger0
	scene_script DesertWastelandTrigger1

	db 0 ; callbacks

	db 0 ; warp events

	db 36 ; coord events
	coord_event  2,  3, 1, DesertWastelandReset
	coord_event  3,  3, 1, DesertWastelandReset
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
	coord_event  2, 14, 1, DesertWastelandReset
	coord_event  3, 15, 1, DesertWastelandReset
	coord_event 14,  4, 1, DesertWastelandReset
	coord_event 14,  5, 1, DesertWastelandReset
	coord_event 14,  6, 1, DesertWastelandReset
	coord_event 14,  7, 1, DesertWastelandReset
	coord_event 14,  8, 1, DesertWastelandReset
	coord_event 14,  9, 1, DesertWastelandReset
	coord_event 14, 10, 1, DesertWastelandReset
	coord_event 14, 11, 1, DesertWastelandReset
	coord_event 14, 12, 1, DesertWastelandReset
	coord_event 14, 13, 1, DesertWastelandReset
	coord_event 14, 14, 1, DesertWastelandReset
	coord_event 14, 15, 1, DesertWastelandReset
	coord_event 14, 17, 1, DesertWastelandReset
	coord_event 14, 16, 1, DesertWastelandReset
	coord_event  3, 17, 1, DesertWastelandReset
	coord_event  3, 16, 1, DesertWastelandReset
	coord_event  0, 14, 1, DesertWastelandReset
	coord_event  1, 14, 1, DesertWastelandReset
	coord_event  0,  3, 1, DesertWastelandReset
	coord_event  1,  3, 1, DesertWastelandReset
	coord_event  3, 14, 1, DesertWastelandReset

	db 0 ; bg events

	db 0 ; object events

	