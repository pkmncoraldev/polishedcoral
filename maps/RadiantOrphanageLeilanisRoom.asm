RadiantOrphanageLeilanisRoom_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def  5,  2, 3, RADIANT_ORPHANAGE_1F
	warp_def  5,  3, 3, RADIANT_ORPHANAGE_1F

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  2,  1, SPRITE_ERIKA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, RadiantOrphanageLeilanisRoomErika, -1
	object_event  1,  1, SPRITE_LEILANI_BED, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1


	const_def 1 ; object constants
	const RADIANT_ORPHANAGE_LEILANIS_ROOM_ERIKA

RadiantOrphanageLeilanisRoomErika:
	checkevent EVENT_TALKED_TO_ERIKA_ONCE
	iftrue .talked_once
	opentext
	writetext RadiantOrphanageLeilanisRoomErikaText1
	waitbutton
	closetext
	pause 30
	faceplayer
	opentext
	writetext RadiantOrphanageLeilanisRoomErikaText2
	waitbutton
	closetext
	spriteface RADIANT_ORPHANAGE_LEILANIS_ROOM_ERIKA, LEFT
	pause 30
	opentext
	writetext RadiantOrphanageLeilanisRoomErikaText3
	waitbutton
	closetext
	pause 40
	faceplayer
	opentext
	writetext RadiantOrphanageLeilanisRoomErikaText4
	waitbutton
	closetext
	spriteface RADIANT_ORPHANAGE_LEILANIS_ROOM_ERIKA, LEFT
	pause 40
.talked_once
	faceplayer
	opentext
	writetext RadiantOrphanageLeilanisRoomErikaText5
	waitbutton
	closetext
	spriteface RADIANT_ORPHANAGE_LEILANIS_ROOM_ERIKA, LEFT
	setevent EVENT_TALKED_TO_ERIKA_ONCE
	end
	
RadiantOrphanageLeilanisRoomErikaText1:
	text "Oh GRAMMA…"
	done
	
RadiantOrphanageLeilanisRoomErikaText2:
	text "Ah, excuse me…"
	
	para "My name is ERIKA."
	
	para "If you're here for"
	line "a GYM BATTLE, now's"
	cont "not a good time…"
	
	para "As you can see,"
	line "GRAMMA LEILANI"
	cont "isn't well…"
	done
	
RadiantOrphanageLeilanisRoomErikaText3:
	text "I came here from"
	line "the KANTO REGION"
	cont "when I heard she"
	cont "was sick."
	
	para "I've been taking"
	line "care of her, but"
	cont "she just isn't"
	cont "getting better…"
	
	para "…"
	done
	
RadiantOrphanageLeilanisRoomErikaText4:
	text "Not only does"
	line "GRAMMA run the"
	cont "GYM here,"
	
	para "but she also"
	line "runs this little"
	cont "ORPHANAGE."
	
	para "She takes care"
	line "of all the kids"
	cont "here."
	
	para "If she doesn't"
	line "get better…"
	
	para "The children…"
	
	done
	
RadiantOrphanageLeilanisRoomErikaText5:
	text "The girls ran off"
	line "to the nearby"
	cont "meadow to fetch"
	cont "GRAMMA LEILANI"
	cont "some flowers."
	
	para "Could I ask you"
	line "to go find them"
	cont "and send them"
	cont "back home?"
	
	para "I would really"
	line "appreciate it."
	done
