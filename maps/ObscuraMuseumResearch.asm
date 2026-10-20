ObscuraMuseumResearch_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def  5,  4, 5, OBSCURA_MUSEUM_EMPLOYEE_ROOM
	warp_def  5,  5, 5, OBSCURA_MUSEUM_EMPLOYEE_ROOM

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_SCIENTIST,  2,  4, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObscuraMuseumResearchNPC, -1


ObscuraMuseumResearchNPC:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_VOLCARONA_RESEARCHER
	iftrue .talked
	writetext ObscuraMuseumResearchNPCText1
	setevent EVENT_TALKED_TO_VOLCARONA_RESEARCHER
	jump .cont
.talked
	writetext ObscuraMuseumResearchNPCText4
.cont
	yesorno
	iffalse .no
	callasm SelectVolcarona
	iffalse .no
	ifequal 2, .wrong
	writetext ObscuraMuseumResearchNPCText5
	yesorno
	iffalse .no
	writetext ObscuraMuseumResearchNPCText6
	waitbutton
	callasm DoEvoAnimation
	writetext ObscuraMuseumResearchNPCText7
	waitbutton
	closetext
	end
.wrong
	writetext ObscuraMuseumResearchNPCText3
	jump .done
.no
	writetext ObscuraMuseumResearchNPCText2
.done
	waitbutton
	closetext
	spriteface 1, UP
	end

ObscuraMuseumResearchNPCText1:
	text "Do you have the"
	line "#MON VOLCARONA?"
	
	para "We've recently"
	line "uncovered some DNA"
	cont "from its ancient"
	cont "ancestor."
	
	para "I've come up with"
	line "a way to revert a"
	cont "VOLCARONA back to"
	cont "this more primal"
	cont "form."
	
	para "Are you"
	line "interested?"
	done
	
ObscuraMuseumResearchNPCText2:
	text "Bring me VOLCARONA"
	line "if you change your"
	cont "mind."
	done
	
ObscuraMuseumResearchNPCText3:
	text "That's not"
	line "VOLCARONA!"
	
	para "Stop wasting my"
	line "time!"
	done
	
ObscuraMuseumResearchNPCText4:
	text "Have you come to"
	line "convert VOLCARONA"
	cont "into its more"
	cont "primal form?"
	done
	
ObscuraMuseumResearchNPCText5:
	text "Yes!<WAIT_S> VOLCARONA!"
	
	para "If we do this,"
	line "there's no going"
	cont "back."
	
	para "Also, you should"
	line "know that ancient"
	cont "VOLCARONA can't use"
	cont "FIRE-type attacks."
	
	para "It's moves will"
	line "surely change!"
	
	para "Is all of that"
	line "alright?"
	done
	
ObscuraMuseumResearchNPCText6:
	text "Great!"
	
	line "Let's get started!"
	done
	
ObscuraMuseumResearchNPCText7:
	text "Success!"
	
	para "This is a big"
	line "breakthrough!"
	
	para "But, we can always"
	line "use more data."
	
	para "Come back if you"
	line "want to change"
	cont "more VOLCARONA."
	done
	
SelectVolcarona:
	farcall SelectEncounterHouseMon
	jr c, .cancel
	ld a, [wCurPartySpecies]
	cp VOLCARONA
	jr nz, .wrong
	ld a, TRUE
	ld [wScriptVar], a
	ret
.cancel
	ld a, FALSE
	ld [wScriptVar], a
	ret
.wrong
	ld a, 2
	ld [wScriptVar], a
	ret

DoEvoAnimation:
	ld a, $1
	ld [wForceEvolution], a
	call DisableSpriteUpdates
	call ClearBGPalettes
	call Load1bppFont
	call Load1bppFrame
	farcall EvolvePokemon
	jp ReturnToMapWithSpeechTextbox