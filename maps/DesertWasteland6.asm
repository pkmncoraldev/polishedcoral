DesertWasteland6_MapScriptHeader:
	db 2 ; scene scripts
	scene_script DesertWastelandTrigger0
	scene_script DesertWastelandTrigger1

	db 0 ; callbacks

	db 0 ; warp events

	db 36 ; coord events
	coord_event  2, 14, 1, DesertWastelandReset
	coord_event  3, 14, 1, DesertWastelandReset
	coord_event  4, 14, 1, DesertWastelandReset
	coord_event  5, 14, 1, DesertWastelandReset
	coord_event  6, 14, 1, DesertWastelandReset
	coord_event  7, 14, 1, DesertWastelandReset
	coord_event  8, 14, 1, DesertWastelandReset
	coord_event  9, 14, 1, DesertWastelandReset
	coord_event 10, 14, 1, DesertWastelandReset
	coord_event 11, 14, 1, DesertWastelandReset
	coord_event 12, 14, 1, DesertWastelandReset
	coord_event 13, 14, 1, DesertWastelandReset
	coord_event 14, 14, 1, DesertWastelandReset
	coord_event 14,  2, 1, DesertWastelandReset
	coord_event 14,  3, 1, DesertWastelandReset
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
	coord_event  3,  2, 1, DesertWastelandReset
	coord_event  2,  3, 1, DesertWastelandReset
	coord_event  0, 14, 1, DesertWastelandReset
	coord_event  1, 14, 1, DesertWastelandReset
	coord_event  0,  3, 1, DesertWastelandReset
	coord_event  1,  3, 1, DesertWastelandReset
	coord_event  3,  0, 1, DesertWastelandReset
	coord_event  3,  1, 1, DesertWastelandReset
	coord_event 14,  0, 1, DesertWastelandReset
	coord_event 14,  1, 1, DesertWastelandReset
	coord_event  3,  3, 1, DesertWastelandReset

	db 0 ; bg events

	db 0 ; object events

	