ObscuraMuseum2F_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, ObscuraMuseum2FCallback

	db 4 ; warp events
	warp_def  4,  7, 5, OBSCURA_MUSEUM_1F
	warp_def  6,  2, 1, OBSCURA_GYM
	warp_def  6,  3, 2, OBSCURA_GYM
	warp_def  6, 19, 1, OBSCURA_MUSEUM_3F

	db 0 ; coord events

	db 32 ; bg events
	signpost  5, 10, SIGNPOST_JUMPTEXT, ObscuraMuseumFossilText
	signpost  5, 11, SIGNPOST_JUMPTEXT, ObscuraMuseumFossilText
	signpost  5, 13, SIGNPOST_JUMPTEXT, ObscuraMuseumFossilText
	signpost 12,  6, SIGNPOST_JUMPTEXT, ObscuraMuseumFossilText
	signpost 12,  7, SIGNPOST_JUMPTEXT, ObscuraMuseumFossilText
	signpost 12, 12, SIGNPOST_JUMPTEXT, ObscuraMuseumFossilText
	signpost 12, 13, SIGNPOST_JUMPTEXT, ObscuraMuseumFossilText
	signpost 13, 13, SIGNPOST_JUMPTEXT, ObscuraMuseumFossilText
	signpost  8, 14, SIGNPOST_JUMPTEXT, ObscuraMuseumFossilText
	signpost  8, 15, SIGNPOST_JUMPTEXT, ObscuraMuseumFossilText
	signpost  9, 14, SIGNPOST_JUMPTEXT, ObscuraMuseumFossilText
	signpost  9, 15, SIGNPOST_JUMPTEXT, ObscuraMuseumFossilText
	signpost  8,  8, SIGNPOST_JUMPTEXT, ObscuraMuseumWoodText
	signpost  8,  9, SIGNPOST_JUMPTEXT, ObscuraMuseumWoodText
	signpost  8, 10, SIGNPOST_JUMPTEXT, ObscuraMuseumWoodText
	signpost  8, 11, SIGNPOST_JUMPTEXT, ObscuraMuseumWoodText
	signpost  9,  8, SIGNPOST_JUMPTEXT, ObscuraMuseumWoodText
	signpost  9,  9, SIGNPOST_JUMPTEXT, ObscuraMuseumWoodText
	signpost  9, 11, SIGNPOST_JUMPTEXT, ObscuraMuseumWoodText
	signpost 12,  8, SIGNPOST_JUMPTEXT, ObscuraMuseumWoodText
	signpost 12,  9, SIGNPOST_JUMPTEXT, ObscuraMuseumWoodText
	signpost 12, 10, SIGNPOST_JUMPTEXT, ObscuraMuseumWoodText
	signpost 12, 11, SIGNPOST_JUMPTEXT, ObscuraMuseumWoodText
	signpost  5, 12, SIGNPOST_JUMPTEXT, ObscuraMuseumFossilFactText
	signpost  9, 10, SIGNPOST_JUMPTEXT, ObscuraMuseumWoodFactText
	signpost  4,  6, SIGNPOST_JUMPTEXT, ObscuraMuseum2FSign
	signpost  6, 18, SIGNPOST_JUMPTEXT, ObscuraMuseum2FSign
	signpost  7,  4, SIGNPOST_JUMPTEXT, ObscuraMuseumGymSign
	signpost  6,  2, SIGNPOST_IFSET, ObscuraMuseumGymDoor
	signpost  6,  3, SIGNPOST_IFSET, ObscuraMuseumGymDoor
	signpost  8, 18, SIGNPOST_IFSET, ObscuraMuseumBarrier
	signpost  8, 19, SIGNPOST_IFSET, ObscuraMuseumBarrier

	db 5 ; object events
	person_event SPRITE_SNARE,  5,  8, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 1, ObscuraMuseum2FSnare1, EVENT_SNARE_GONE_FROM_MUSEUM
	person_event SPRITE_SNARE,  7, 14, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 2, ObscuraMuseum2FSnare2, EVENT_SNARE_GONE_FROM_MUSEUM
	person_event SPRITE_SNARE,  9,  5, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 2, ObscuraMuseum2FSnare3, EVENT_MUSEUM_SNARE_GUY_GONE
	person_event SPRITE_ROCKY,  9, 19, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObscuraMuseum2FRocky, EVENT_MUSEUM_2F_ROCKY_GONE
	person_event SPRITE_SNARE_GIRL, 12, 21, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObscuraMuseum2FSnareNPC, EVENT_SNARE_GONE_FROM_MUSEUM
	
	
	const_def 1 ; object constants
	const OBSCURA_MUSEUM_2F_SNARE_1
	const OBSCURA_MUSEUM_2F_SNARE_2
	const OBSCURA_MUSEUM_2F_SNARE_3
	const OBSCURA_MUSEUM_2F_SNARE_NPC
	
ObscuraMuseum2FCallback:
	checkevent EVENT_MUSEUM_ROPE_LEFT
	iffalse .skip1
	changeblock $6, $8, $75
.skip1
	checkevent EVENT_MUSEUM_ROPE_RIGHT
	iffalse .skip2
	changeblock $c, $8, $75
.skip2
	checkevent EVENT_MUSEUM_BARRIER_DOWN
	iffalse .skip3
	changeblock $12, $6, $8a
	changeblock $12, $8, $8b
.skip3
	checkevent EVENT_SNARE_AT_MUSEUM
	iffalse .end
	changeblock $2, $6, $80
.end
	return
	
ObscuraMuseum2FRocky:
	checkevent EVENT_MUSEUM_2F_TALKED_TO_ROCKY
	iftrue .talked
	clearevent EVENT_MUSEUM_ROPE_LEFT
	setevent EVENT_MUSEUM_ROPE_RIGHT
	setevent EVENT_MUSEUM_CAN_LOWER_BARRIER
	setevent EVENT_MUSEUM_2F_TALKED_TO_ROCKY
	appear OBSCURA_MUSEUM_2F_SNARE_3
	changeblock $6, $8, $4b
	changeblock $c, $8, $75
	jumptextfaceplayer ObscuraMuseum2FRockyText1
.talked
	jumptextfaceplayer ObscuraMuseum2FRockyText2
	
ObscuraMuseum2FRockyText1:
ObscuraMuseum2FRockyText2:
	text "Darn!<WAIT_S> They put up"
	line "the barrier to the"
	cont "third floor!"
	
	para "You're gonna have"
	line "to go back do to"
	cont "the employees only"
	cont "room where you"
	cont "came in."
	
	para "You can drop the"
	line "barrier from in"
	cont "there."
	
	para "Hurry!<WAIT_S> Time is"
	line "running out!"
	done
	
ObscuraMuseum2FSnareNPC:
	faceplayer
	opentext
	writetext ObscuraMuseum2FSnareNPCText
	waitbutton
	closetext
	spriteface OBSCURA_MUSEUM_2F_SNARE_NPC, UP
	end
	
ObscuraMuseum2FSnareNPCText:
	text "Fight you?<WAIT_S>"
	line "No way."
	
	para "I'm just enjoying"
	line "a drink from the"
	cont "vending machine."
	done
	
ObscuraMuseum2FSnare1:
	generictrainer GRUNTM, MUSEUM_GRUNTM_4, EVENT_BEAT_MUSEUM_GRUNT_6, .SeenText, .BeatenText

	text "You won't get"
	line "much further."
	
	para "I'm sure of it."
	done

.SeenText:
	text "Well, you made"
	line "it this far."
	
	para "But that's it!"
	done

.BeatenText:
	text "Oh well."
	done
	
ObscuraMuseum2FSnare2:
	generictrainer GRUNTM, MUSEUM_GRUNTM_5, EVENT_BEAT_MUSEUM_GRUNT_7, .SeenText, .BeatenText

	text "I've been reading"
	line "these fossil"
	cont "facts."
	
	para "Interesting stuff."
	
	para "…<WAIT_M>I mean…"
	
	para "You'll never stop"
	line "TEAM SNARE!"
	
	para "MUAH HA HA!"
	
	para "Yeah."
	done

.SeenText:
	text "There's tons of"
	line "cool stuff here."
	
	para "Why aren't we"
	line "taking more of it?"
	done

.BeatenText:
	text "Not cool!"
	done
	
ObscuraMuseum2FSnare3:
	generictrainer GRUNTM, MUSEUM_GRUNTM_6, EVENT_BEAT_MUSEUM_GRUNT_8, .SeenText, .BeatenText

	text "I didn't think"
	line "I'd get to pick"
	cont "a fight unless I"
	cont "moved the rope."
	
	para "Sorry about that."
	done

.SeenText:
	text "Someone moved the"
	line "rope?"
	
	para "Yeah, that was me."
	done

.BeatenText:
	text "Yikes!"
	done
	
ObscuraMuseumGymDoor:
	dw EVENT_SNARE_AT_MUSEUM
	jumptext ObscuraMuseumGymDoorText
	
ObscuraMuseumGymDoorText:
	text "It's locked."
	done

ObscuraMuseumBarrier:
	dw EVENT_MUSEUM_BARRIER_DOWN
	jumptext ObscuraMuseumBarrierText
	
ObscuraMuseumBarrierText:
	text "A barrier blocks"
	line "the way."
	done
