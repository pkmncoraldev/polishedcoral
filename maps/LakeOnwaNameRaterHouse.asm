LakeOnwaNameRaterHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 7, 3, 4, LAKE_ONWA
	warp_def 7, 2, 4, LAKE_ONWA

	db 0 ; coord events

	db 3 ; bg events
	signpost 1, 6, SIGNPOST_READ, LakeNameRaterBookshelf
	signpost 1, 7, SIGNPOST_READ, LakeNameRaterBookshelf
	signpost 0, 2, SIGNPOST_READ, LakeNameRaterRockTown

	db 1 ; object events
	person_event SPRITE_GENTLEMAN,  4,  2, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, 0, PERSONTYPE_SCRIPT, 0, LakeNameRater, -1

LakeNameRater:
	faceplayer
	opentext
	special SpecialNameRater
	waitbutton
	closetext
	end
	
LakeNameRaterBookshelf:
	jumpstd difficultbookshelf
	
LakeNameRaterRockTown:
	jumptext LakeNameRaterRockTownText
	
LakeNameRaterRockTownText:
	text "A very strange"
	line "looking piece of"
	cont "land near a lake."
	
	para "Cheap looking rock"
	line "buildings are"
	cont "scattered about."
	
	para "The picture is"
	line "labelled:"
	cont "“ROCK TOWN”."
	done
