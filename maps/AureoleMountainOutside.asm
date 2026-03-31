AureoleMountainOutside_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_def 49, 10, 10, AUREOLE_MOUNTAIN_1F
	warp_def 43, 36, 3, AUREOLE_MOUNTAIN_OUTSIDE
	warp_def 23, 30, 2, AUREOLE_MOUNTAIN_OUTSIDE

	db 4 ; coord events
	coord_event  4, 38, 0, AureoleMountainOutsideBridgeUp
	coord_event  5, 38, 0, AureoleMountainOutsideBridgeUp
	coord_event  4, 39, 1, AureoleMountainOutsideBridgeDown
	coord_event  5, 39, 1, AureoleMountainOutsideBridgeDown

	db 2 ; bg events
	signpost 32, 27, SIGNPOST_JUMPTEXT, AureoleMountainOutsideBarrelText
	signpost 33, 27, SIGNPOST_JUMPTEXT, AureoleMountainOutsideBarrelText

	db 0 ; object events


AureoleMountainOutsideBarrelText:
	text "Big empty barrels."
	done
	
AureoleMountainOutsideBridgeUp:
	changeblock $16, $28, $b1
	changeblock $18, $28, $b2
	changeblock $1a, $28, $b3
	dotrigger $1
	end
	
AureoleMountainOutsideBridgeDown:
	changeblock $16, $28, $b5
	changeblock $18, $28, $b6
	changeblock $1a, $28, $b7
	dotrigger $0
	end