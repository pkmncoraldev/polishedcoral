RadiantOrphanageLeilanisRoom_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, RadiantOrphanageLeilanisRoomCallback

	db 2 ; warp events
	warp_def  5,  2, 3, RADIANT_ORPHANAGE_1F
	warp_def  5,  3, 3, RADIANT_ORPHANAGE_1F

	db 0 ; coord events

	db 0 ; bg events

	db 10 ; object events
	object_event  2,  1, SPRITE_ERIKA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, RadiantOrphanageLeilanisRoomErika, EVENT_SAVED_ALL_LOST_GIRLS
	object_event  1,  1, SPRITE_LEILANI_BED, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_SAVED_ALL_LOST_GIRLS
	object_event  4,  2, SPRITE_PIGTAILS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, RadiantOrphanageLeilanisRoomRose, EVENT_SAVED_ALL_LOST_GIRLS
	object_event  3,  3, SPRITE_PIGTAILS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, RadiantOrphanageLeilanisRoomLily, EVENT_SAVED_ALL_LOST_GIRLS
	object_event  4,  1, SPRITE_PIGTAILS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, RadiantOrphanageLeilanisRoomIris, EVENT_SAVED_ALL_LOST_GIRLS
	object_event  1,  3, SPRITE_PIGTAILS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, RadiantOrphanageLeilanisRoomPoppy, EVENT_SAVED_ALL_LOST_GIRLS
	object_event  4,  3, SPRITE_PIGTAILS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, RadiantOrphanageLeilanisRoomViolet, EVENT_SAVED_ALL_LOST_GIRLS
	object_event  0,  3, SPRITE_PIGTAILS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, RadiantOrphanageLeilanisRoomClover, EVENT_SAVED_ALL_LOST_GIRLS
	object_event  5,  4, SPRITE_PIGTAILS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, RadiantOrphanageLeilanisRoomFelicia, EVENT_SAVED_ALL_LOST_GIRLS
	object_event  3,  2, SPRITE_ERIKA, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, RadiantOrphanage1FErika, -1


	const_def 1 ; object constants
	const RADIANT_ORPHANAGE_LEILANIS_ROOM_ERIKA
	const RADIANT_ORPHANAGE_LEILANIS_ROOM_LEILANI_BED
	const RADIANT_ORPHANAGE_LEILANIS_ROOM_ROSE
	const RADIANT_ORPHANAGE_LEILANIS_ROOM_LILY
	const RADIANT_ORPHANAGE_LEILANIS_ROOM_IRIS
	const RADIANT_ORPHANAGE_LEILANIS_ROOM_POPPY
	const RADIANT_ORPHANAGE_LEILANIS_ROOM_VIOLET
	const RADIANT_ORPHANAGE_LEILANIS_ROOM_CLOVER
	const RADIANT_ORPHANAGE_LEILANIS_ROOM_FELICIA
	const RADIANT_ORPHANAGE_LEILANIS_ROOM_ERIKA2
	
RadiantOrphanageLeilanisRoomCallback:
	checkevent EVENT_SAVED_ALL_LOST_GIRLS
	iftrue .done_erika
	moveperson RADIANT_ORPHANAGE_LEILANIS_ROOM_ERIKA2, -5, -5
.done_erika
	checkevent EVENT_SAVED_ROSE
	iftrue .skip_rose
	moveperson RADIANT_ORPHANAGE_LEILANIS_ROOM_ROSE, -5, -5
.skip_rose
	checkevent EVENT_SAVED_LILY
	iftrue .skip_lily
	moveperson RADIANT_ORPHANAGE_LEILANIS_ROOM_LILY, -5, -5
.skip_lily
	checkevent EVENT_SAVED_IRIS
	iftrue .skip_iris
	moveperson RADIANT_ORPHANAGE_LEILANIS_ROOM_IRIS, -5, -5
.skip_iris
	checkevent EVENT_SAVED_POPPY
	iftrue .skip_poppy
	moveperson RADIANT_ORPHANAGE_LEILANIS_ROOM_POPPY, -5, -5
.skip_poppy
	checkevent EVENT_SAVED_VIOLET
	iftrue .skip_violet
	moveperson RADIANT_ORPHANAGE_LEILANIS_ROOM_VIOLET, -5, -5
.skip_violet
	checkevent EVENT_SAVED_CLOVER
	iftrue .skip_clover
	moveperson RADIANT_ORPHANAGE_LEILANIS_ROOM_CLOVER, -5, -5
.skip_clover
	checkevent EVENT_SAVED_FELICIA
	iftrue .skip_felicia
	moveperson RADIANT_ORPHANAGE_LEILANIS_ROOM_FELICIA, -5, -5
.skip_felicia
	return

RadiantOrphanageLeilanisRoomRose:
	jumptextfaceplayer RadiantOrphanageLeilanisRoomRoseText
	
RadiantOrphanageLeilanisRoomRoseText:
	text "FELICIA said some-"
	line "thing about the"
	cont "beach before she"
	cont "ran off."
	done
	
RadiantOrphanageLeilanisRoomLily:
	jumptextfaceplayer RadiantOrphanageLeilanisRoomLilyText
	
RadiantOrphanageLeilanisRoomLilyText:
	text "CLOVER was with me"
	line "but I lost track"
	cont "of her when we got"
	cont "to DUSK TURNPIKE."
	done
	
RadiantOrphanageLeilanisRoomIris:
	jumptextfaceplayer RadiantOrphanageLeilanisRoomIrisText
	
RadiantOrphanageLeilanisRoomIrisText:
	text "I think LILY ran"
	line "off toward DUSK"
	cont "TURNPIKE."
	done
	
RadiantOrphanageLeilanisRoomPoppy:
	jumptextfaceplayer RadiantOrphanageLeilanisRoomPoppyText
	
RadiantOrphanageLeilanisRoomPoppyText:
	text "IRIS said she was"
	line "going to pick some"
	cont "flowers for GRAMMA"
	cont "LEILANI."
	done
	
RadiantOrphanageLeilanisRoomViolet:
	jumptextfaceplayer RadiantOrphanageLeilanisRoomVioletText
	
RadiantOrphanageLeilanisRoomVioletText:
	text "POPPY told me she"
	line "wanted to go look"
	cont "at the cars at"
	cont "DUSK TURNPIKE."
	done
	
RadiantOrphanageLeilanisRoomClover:
	jumptextfaceplayer RadiantOrphanageLeilanisRoomCloverText
	
RadiantOrphanageLeilanisRoomCloverText:
	text "VIOLET loves the"
	line "smell of the"
	cont "flowers at RADIANT"
	cont "MEADOW."
	done
	
RadiantOrphanageLeilanisRoomFelicia:
	jumptextfaceplayer RadiantOrphanageLeilanisRoomFeliciaText
	
RadiantOrphanageLeilanisRoomFeliciaText:
	text "ROSE probably went"
	line "off to RADIANT"
	cont "MEADOW."
	
	para "She loves the"
	line "sunflowers."
	done

RadiantOrphanageLeilanisRoomErika:
	setevent EVENT_MET_LEILANI
	callasm CalcRemainingLostGirlsAsm
	ifequal 1, .saved_one
	ifequal 6, .saved_almost_all
	ifequal 7, .saved_all
	ifnotequal 0, .saved_some
	checkevent EVENT_LOST_GIRLS_QUEST_ACTIVE
	iftrue .talked_once
	setevent EVENT_LOST_GIRLS_QUEST_ACTIVE
	domaptrigger SHIMMER_UNDER_BOARDWALK, $1
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
	pause 70
.talked_once
	faceplayer
	opentext
	writetext RadiantOrphanageLeilanisRoomErikaText5
	waitbutton
	closetext
	spriteface RADIANT_ORPHANAGE_LEILANIS_ROOM_ERIKA, LEFT
	end
.saved_one
	faceplayer
	opentext
	writetext RadiantOrphanageLeilanisRoomErikaSavedOneText
	waitbutton
	closetext
	spriteface RADIANT_ORPHANAGE_LEILANIS_ROOM_ERIKA, LEFT
	end
.saved_some
	faceplayer
	opentext
	writetext RadiantOrphanageLeilanisRoomErikaSavedSomeText
	waitbutton
	closetext
	spriteface RADIANT_ORPHANAGE_LEILANIS_ROOM_ERIKA, LEFT
	opentext
	writetext RadiantOrphanageLeilanisRoomErikaSavedSomeText2
	waitbutton
	closetext
	end
.saved_almost_all
	faceplayer
	opentext
	writetext RadiantOrphanageLeilanisRoomErikaSavedAlmostAllText
	waitbutton
	closetext
	spriteface RADIANT_ORPHANAGE_LEILANIS_ROOM_ERIKA, LEFT
	opentext
	writetext RadiantOrphanageLeilanisRoomErikaSavedAlmostAllText2
	waitbutton
	closetext
	end
.saved_all
	end
	
CalcRemainingLostGirlsAsm:
	ld a, [wLostGirls]
	ld c, a
	ld a, NUM_LOST_GIRLS
	sub c
	ld [wItemQuantityChangeBuffer], a
	ld a, [wLostGirls]
	ld [wScriptVar], a
	ret
	
RadiantOrphanageLeilanisRoomErikaSavedOneText:
	text "Oh my!"
	
	para "One of the girls"
	line "has returned!"
	
	para "Did you find her?"
	
	para "Thank you!"
	
	para "Can I ask for your"
	line "help in finding"
	cont "the rest?"
	
	para "There are still 6"
	line "girls missing."
	done
	
RadiantOrphanageLeilanisRoomErikaSavedSomeText:
	text "Oh my!"
	
	para "Some of the girls"
	line "have returned!"
	
	para "Did you find them?"
	
	para "Thank you!"
	
	para "Can I ask for your"
	line "help in finding"
	cont "the rest?"
	
	para "There are still @"
	deciram wItemQuantityChangeBuffer, 1, 2
	text ""
	line "girls missing."
	done
	
RadiantOrphanageLeilanisRoomErikaSavedSomeText2:
	text "Hang in there,"
	line "GRAMMA…"
	done
	
RadiantOrphanageLeilanisRoomErikaSavedAlmostAllText:
	text "Thank goodness!"
	
	para "Most of the girls"
	line "have returned!"
	
	para "Only 1 more is"
	line "missing now!"
	
	para "Can I ask for your"
	line "help in finding"
	cont "her?"
	done
	
RadiantOrphanageLeilanisRoomErikaSavedAlmostAllText2:
	text "You hear that,"
	line "GRAMMA?"
	
	para "It's going to be"
	line "ok!"
	done
	
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
	cont "to visit GRAMMA"
	cont "and the girls of"
	cont "the ORPHANAGE."
	
	para "When I got here,"
	line "all the girls had"
	cont "gone missing and"
	cont "GRAMMA was bed-"
	cont "ridden with worry."
	
	para "I've been taking"
	line "care of her, but"
	cont "she just isn't"
	cont "getting better…"
	done
	
RadiantOrphanageLeilanisRoomErikaText4:
	text "If the girls don't"
	line "return soon…"
	
	para "I don't think she'll"
	line "get any better!"
	
	para "Oh, I hope they're"
	line "ok…"
	done
	
RadiantOrphanageLeilanisRoomErikaText5:
	text "There are @"
	deciram wItemQuantityChangeBuffer, 1, 2
	text " girls"
	line "that ran off."
	
	para "ROSE, <WAIT_S>LILY, <WAIT_S>IRIS,<WAIT_S>"
	line "POPPY, <WAIT_S>FELICIA,"
	cont "VIOLET<WAIT_S> and CLOVER."
	
	para "Could I ask you"
	line "to keep an eye out"
	cont "for them on your"
	cont "travels?"
	
	para "I would really"
	line "appreciate it."
	done
