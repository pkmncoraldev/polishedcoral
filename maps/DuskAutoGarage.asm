DuskAutoGarage_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 8 ; warp events
	warp_def  6,  0, 9, DUSK_TURNPIKE
	warp_def  6,  1, 9, DUSK_TURNPIKE
	warp_def  6,  2, 9, DUSK_TURNPIKE
	warp_def  6,  3, 9, DUSK_TURNPIKE
	warp_def  6,  4, 10, DUSK_TURNPIKE
	warp_def  6,  5, 10, DUSK_TURNPIKE
	warp_def  6,  6, 10, DUSK_TURNPIKE
	warp_def  6,  7, 10, DUSK_TURNPIKE

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	person_event SPRITE_POKEMANIAC,  3,  2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, DuskAutoGarageGuy, EVENT_SAVED_POPPY
	person_event SPRITE_PIGTAILS,  4,  2, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, DuskAutoGaragePoppy, EVENT_SAVED_POPPY
	person_event SPRITE_SPA_WORKER,  4,  6, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, DuskAutoGarageMechanic, -1
	
	
	const_def 1 ; object constants
	const DUSK_AUTO_GARAGE_GUY
	const DUSK_AUTO_GARAGE_POPPY
	const DUSK_AUTO_GARAGE_MECHANIC
	
DuskAutoGarageGuy:
	checkevent EVENT_SAVED_POPPY
	iftrue .saved_poppy
	jumptextfaceplayer DuskAutoGarageGuyText1
.saved_poppy
	jumptextfaceplayer DuskAutoGarageGuyText2
	
DuskAutoGaragePoppy:
	checkevent EVENT_LOST_GIRLS_QUEST_ACTIVE
	iftrue .time_to_save
	jumptextfaceplayer DuskAutoGaragePoppyText1
.time_to_save
	faceplayer
	opentext
	writetext DuskAutoGaragePoppyText2
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal UP, .YouAreFacingUp
	applymovement DUSK_AUTO_GARAGE_POPPY, Movement_DuskAutoGaragePoppy1
	jump .end
.YouAreFacingUp
	applymovement DUSK_AUTO_GARAGE_POPPY, Movement_DuskAutoGaragePoppy2
.end
	playsound SFX_EXIT_BUILDING
	disappear DUSK_AUTO_GARAGE_POPPY
	setevent EVENT_SAVED_POPPY
	callasm PoppySetNameAsm
	special Special_SaveLostGirl
	end
	
PoppySetNameAsm:
	ld hl, .poppystring
	ld bc, PKMN_NAME_LENGTH
	ld de, wStringBuffer1
	rst CopyBytes
	ret
	
.poppystring:
	db "POPPY@@@@@@"
	
DuskAutoGarageMechanic:
	checkevent EVENT_SAVED_POPPY
	iftrue .saved_poppy
	jumptextfaceplayer DuskAutoGarageMechanicText1
.saved_poppy
	jumptextfaceplayer DuskAutoGarageMechanicText2

DuskAutoGarageGuyText1:
	text "This little girl"
	line "can't be here!"
	
	para "It's not safe,"
	line "but she just won't"
	cont "leave!"
	
	para "She's holding"
	line "everything up!"
	done
	
DuskAutoGarageGuyText2:
	text "Thank goodness."
	
	para "I thought she was"
	line "never going to"
	cont "leave!"
	
	para "Now I can finally"
	line "get back to the"
	cont "front counter."
	done
	
DuskAutoGaragePoppyText1:
	text "Yaaay!"
	
	para "Look at the cars!"
	
	para "I wanna fix cars"
	line "when I grow up!"
	done
	
DuskAutoGaragePoppyText2:
	text "POPPY: Yaaay!"
	
	para "Look at the cars!"
	
	para "I wanna fix cars"
	line "when I grow up!"
	
	para "Huh?"
	
	para "GRAMMA LEILANI is"
	line "worried about me?"
	
	para "Aw, but I'm having"
	line "fun!"
	
	para "…"
	
	para "Alright, fine."
	
	para "I don't want to"
	line "make her sad…"
	
	para "I'll go home…"
	done
	
DuskAutoGarageMechanicText1:
	text "I can't get any"
	line "work done with"
	cont "that little girl"
	cont "running around!"
	done
	
DuskAutoGarageMechanicText2:
	text "It sure is quiet"
	line "without that girl"
	cont "running around."
	
	para "I almost miss her…"
	
	para "Maybe I just miss"
	line "not havin' to"
	cont "work!"
	
	para "Gahaha!"
	done
	
Movement_DuskAutoGaragePoppy2:
	step_left
	
Movement_DuskAutoGaragePoppy1:
	step_down
	step_down
	step_end
