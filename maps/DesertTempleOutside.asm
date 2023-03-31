DesertTempleOutside_MapScriptHeader:
	db 2 ; scene scripts
	scene_script DesertWastelandTrigger0
	scene_script DesertWastelandTrigger1

	db 0 ; callbacks

	db 0 ; warp events

	db 26 ; coord events
	coord_event  4, 16, 1, DesertWastelandReset
	coord_event  4, 15, 1, DesertWastelandReset
	coord_event 23, 24, 1, DesertWastelandReset
	coord_event 24, 23, 1, DesertWastelandReset
	coord_event 25, 22, 1, DesertWastelandReset
	coord_event 26, 21, 1, DesertWastelandReset
	coord_event 27, 20, 1, DesertWastelandReset
	coord_event 28, 19, 1, DesertWastelandReset
	coord_event 28, 18, 1, DesertWastelandReset
	coord_event 28, 17, 1, DesertWastelandReset
	coord_event 28, 16, 1, DesertWastelandReset
	coord_event 28, 15, 1, DesertWastelandReset
	coord_event 28, 14, 1, DesertWastelandReset
	coord_event 28, 13, 1, DesertWastelandReset
	coord_event  9, 24, 1, DesertWastelandReset
	coord_event  8, 23, 1, DesertWastelandReset
	coord_event  7, 22, 1, DesertWastelandReset
	coord_event  6, 21, 1, DesertWastelandReset
	coord_event  5, 20, 1, DesertWastelandReset
	coord_event  4, 19, 1, DesertWastelandReset
	coord_event  4, 18, 1, DesertWastelandReset
	coord_event  4, 17, 1, DesertWastelandReset
	coord_event  4, 14, 1, DesertWastelandReset
	coord_event 28, 12, 1, DesertWastelandReset
	coord_event 22, 25, 1, DesertWastelandReset
	coord_event 10, 25, 1, DesertWastelandReset

	db 0 ; bg events

	db 0 ; object events
