LusterSkyscraper1_3F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 1 ; warp events
	warp_event  6,  1, LUSTER_SKYSCRAPER_1_ELEVATOR, 1

	db 0 ; coord events

	db 1 ; bg events
	signpost  1,  5, SIGNPOST_UP, Skyscraper3FSign

	db 7 ; object events
	person_event SPRITE_POKEMANIAC, 5, 6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LusterSkyscraper1_3F_NPC1, -1
	person_event SPRITE_POKEMANIAC, 7, 3, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LusterSkyscraper1_3F_NPC2, -1
	person_event SPRITE_BEAUTY, 7, 0, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LusterSkyscraper1_3F_NPC3, -1
	person_event SPRITE_SLOWPOKETAIL, 3, 6, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_SLOWPOKETAIL, 5, 6, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_SLOWPOKETAIL, 5, 3, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_SLOWPOKETAIL, 5, 0, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1

	const_def 1 ; object constants
	const LUSTER_SKYSCRAPER_1_3F_NPC_1
	const LUSTER_SKYSCRAPER_1_3F_NPC_2
	const LUSTER_SKYSCRAPER_1_3F_NPC_3
	
	
LusterSkyscraper1_3F_NPC1:
	faceplayer
	opentext
	checkevent EVENT_GOT_DUBIOUS_DISC
	iftrue .got_disc
	checkitem UP_GRADE
	iffalse .No_Up_Grade1
	writetext LusterSkyscraper1_3F_NPC1Text1
	jump .cont
.got_disc
	checkitem UP_GRADE
	iffalse .No_Up_Grade2
	writetext LusterSkyscraper1_3F_NPC1Text2
.cont
	yesorno
	iffalse .no
	writetext LusterSkyscraper1_3F_Gave_Up_Grade
	playsound SFX_LEVEL_UP 
	waitsfx
	verbosegiveitem DUBIOUS_DISC
	takeitem UP_GRADE
	writetext LusterSkyscraper1_3F_NPC1Text3
	setevent EVENT_GOT_DUBIOUS_DISC
	jump .end
.no
	writetext LusterSkyscraper1_3F_NPC1TextNo
	jump .end
.No_Up_Grade1
	writetext LusterSkyscraper1_3F_NPC1Text4
	jump .end
.No_Up_Grade2
	writetext LusterSkyscraper1_3F_NPC1Text5
.end
	waitbutton
	closetext
	spriteface LUSTER_SKYSCRAPER_1_3F_NPC_1, UP
	end
	
LusterSkyscraper1_3F_NPC2:
	jumptext LusterSkyscraper_NPCText
;	faceplayer
;	opentext
;	writetext LusterSkyscraper1_3F_NPC2Text
;	waitbutton
;	closetext
;	spriteface LUSTER_SKYSCRAPER_1_3F_NPC_2, UP
;	end

LusterSkyscraper1_3F_NPC3:
	faceplayer
	opentext
	writetext LusterSkyscraper1_3F_NPC3Text
	waitbutton
	closetext
	spriteface LUSTER_SKYSCRAPER_1_3F_NPC_3, UP
	end
	
LusterSkyscraper1_3F_NPC1Text1:
	text "Hey kid."
	
	para "You want something"
	line "cool?"
	
	para "I'll give it to you"
	line "if you let me have"
	cont "your UP GRADE."
	done
	
LusterSkyscraper1_3F_NPC1Text2:
	text "You wanna swap"
	line "discs again?"
	
	para "I'll take your"
	line "UP GRADE."
	done
	
LusterSkyscraper1_3F_NPC1Text3:
	text "This disc has some"
	line "weird data on it."
	
	para "It might cause"
	line "something cool to"
	cont "happen to certain"
	cont "#MON."
	done
	
LusterSkyscraper1_3F_NPC1Text4:
	text "Hey kid."
	
	para "You want something"
	line "cool?"
	
	para "Bring me an"
	line "UP GRADE."
	
	para "You can probably"
	line "find one at the"
	cont "ELECTRONICS SHOP"
	cont "in the MALL."
	done
	
LusterSkyscraper1_3F_NPC1Text5:
	text "We have a ton of"
	line "those weird discs."
	
	para "Bring me another"
	line "UP GRADE if you"
	cont "want to trade."
	done
	
LusterSkyscraper1_3F_NPC1TextNo:
	text "Hey, your loss."
	done
	
LusterSkyscraper1_3F_Gave_Up_Grade:
	text "<PLAYER> handed"
	line "over UP GRADE."
	done
	
LusterSkyscraper1_3F_NPC3Text:
	text "We've been having"
	line "a lot of computer"
	cont "issues lately."
	
	para "I hope we don't"
	line "have a computer"
	cont "virus!"
	done
