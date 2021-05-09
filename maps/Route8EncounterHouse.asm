Route8EncounterHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_def 7, 3, 3, ROUTE_8
	warp_def 7, 2, 3, ROUTE_8
	warp_def  0,  3, 1, ROUTE_8_GARDEN

	db 0 ; coord events

	db 15 ; bg events
	signpost  1,  1, SIGNPOST_READ, Route8Flowers
	signpost  1,  0, SIGNPOST_READ, Route8Flowers
	signpost  2,  0, SIGNPOST_READ, Route8Flowers
	signpost  3,  0, SIGNPOST_READ, Route8Flowers
	signpost  4,  1, SIGNPOST_READ, Route8Flowers
	signpost  5,  1, SIGNPOST_READ, Route8Flowers
	signpost  6,  0, SIGNPOST_READ, Route8Flowers
	signpost  7,  0, SIGNPOST_READ, Route8Flowers
	signpost  7,  6, SIGNPOST_READ, Route8Flowers
	signpost  6,  7, SIGNPOST_READ, Route8Flowers
	signpost  5,  7, SIGNPOST_READ, Route8Flowers
	signpost  4,  7, SIGNPOST_READ, Route8Flowers
	signpost  3,  7, SIGNPOST_READ, Route8Flowers
	signpost  1,  7, SIGNPOST_READ, Route8Flowers
	signpost  1,  4, SIGNPOST_READ, Route8Flowers

	db 1 ; object events
	person_event SPRITE_GRANNY,  3,  3, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route8EncounterHouseLady, -1

Route8EncounterHouseLady:
	faceplayer
	opentext
	checkflag ENGINE_DAILY_ROUTE_GARDEN
	iftrue .alreadytalked
	writetext Route8EncounterHouseLadyText1
	waitbutton
	callasm Route8EncounterHouseLadyAsm
	ifequal 3, .yesand
	iffalse .no
	writetext Route8EncounterHouseLadyText2
	waitbutton
	closetext
	setflag ENGINE_ENCOUNTER_HOUSE
	setflag ENGINE_DAILY_ROUTE_GARDEN
	end
.yesand
	writetext Route8EncounterHouseLadyText5
	waitbutton
	closetext
	setflag ENGINE_ENCOUNTER_HOUSE
	setflag ENGINE_DAILY_ROUTE_GARDEN
	end
.no
	writetext Route8EncounterHouseLadyText3
	waitbutton
	closetext
	end
.alreadytalked
	callasm Route8EncounterHouseLadyAsm2
	writetext Route8EncounterHouseLadyText4
	waitbutton
	closetext
	end
	
Route8EncounterHouseLadyAsm:
	farcall SelectEncounterHouseMon
	jr c, .cancel
	ld a, [wCurPartySpecies]
	ld [wEncounterHouseMon], a
	farcall GetPreEvolution
	farcall GetPreEvolution
	ld a, [wEncounterHouseMon]
	ld b, a
	ld a, [wCurPartySpecies]
	cp b
	jr nz, .evo
	ld [wEncounterHouseMon], a
	ld [wStringBuffer1], a
	ld a, TRUE
	ld [wScriptVar], a
	ret
.cancel
	ld a, FALSE
	ld [wScriptVar], a
	ret
.evo
	ld [wEncounterHouseMon], a
	ld [wStringBuffer1], a
	ld a, 3
	ld [wScriptVar], a
	ret
	
Route8EncounterHouseLadyAsm2:
	ld a, [wEncounterHouseMon]
	ld [wStringBuffer1], a
	ret
	
Route8EncounterHouseLadyText1:
	text "Ah!"
	
	para "I just love tend-"
	line "ing to the flowers"
	cont "in my garden!"
	
	para "They attract #-"
	line "MON of all kinds!"
	
	para "I saw one earlier"
	line "that I don't see"
	cont "normally!"
	
	para "I can't really"
	line "describe it very"
	cont "well."
	
	para "Maybe you could"
	line "show me one of"
	cont "your #MON to"
	cont "jog my memory?"
	done
	
Route8EncounterHouseLadyText2:
	text "That's it!"
	
	para "That's the #MON"
	line "I saw!"
	
	para "I wonder if it's"
	line "still back there…"
	done
	
Route8EncounterHouseLadyText3:
	text "That's a shame."
	
	para "Maybe it'll come"
	line "to me eventually…"
	done
	
Route8EncounterHouseLadyText4:
	text "Have you had any"
	line "luck finding that"
	cont "#MON in the"
	cont "garden?"
	done

Route8EncounterHouseLadyText5:
	text "That's not it, but"
	line "it looked similar…"
	
	para "I wonder if it's"
	line "still back there…"
	done
