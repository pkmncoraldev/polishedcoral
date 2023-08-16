Route18_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_event 41, 42, ROUTE_18_DUSK_GATE, 1
	warp_event 41, 43, ROUTE_18_DUSK_GATE, 2
	warp_event 22,  9, SEASIDE_CAVE_1F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	person_event SPRITE_TWIN, 36, 21, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route18Clover, EVENT_SAVED_CLOVER
	person_event SPRITE_SKATER, 24, 18, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1


	const_def 1 ; object constants
	const ROUTE_18_CLOVER
	
Route18Clover:
	checkevent EVENT_LOST_GIRLS_QUEST_ACTIVE
	iftrue .time_to_save
	jumptextfaceplayer Route18CloverText1
.time_to_save
	faceplayer
	opentext
	writetext Route18CloverText2
	waitbutton
	closetext
	playsound SFX_JUMP_OVER_LEDGE
	applymovement ROUTE_18_CLOVER, Movement_Route18Clover
	disappear ROUTE_18_CLOVER
	setevent EVENT_SAVED_CLOVER
	callasm CloverSetNameAsm
	special Special_SaveLostGirl
	end
	
CloverSetNameAsm:
	ld hl, .cloverstring
	ld bc, PKMN_NAME_LENGTH
	ld de, wStringBuffer1
	rst CopyBytes
	ret
	
.cloverstring:
	db "CLOVER@@@@@"
	
Route18CloverText1:
	text "Hehe…"
	
	para "Me and the other"
	line "girls ran away"
	cont "from home!"
	
	para "It's fun to act"
	line "out!"
	done
	
Route18CloverText2:
	text "Hehe…"
	
	para "Me and the other"
	line "girls ran away"
	cont "from home!"
	
	para "It's fun to act"
	line "out!"
	
	para "…"
	
	para "Huh? GRAMMA is"
	line "sick?"
	
	para "I didn't want to"
	line "actually hurt"
	cont "GRAMMA…"
	
	para "I guess I'll"
	line "go home then."
	done
	
Movement_Route18Clover:
	jump_step_down
	step_down
	step_down
	step_down
	step_end