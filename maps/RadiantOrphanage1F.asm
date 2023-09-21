RadiantOrphanage1F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_def  9,  4, 4, RADIANT_TOWNSHIP
	warp_def  9,  5, 4, RADIANT_TOWNSHIP
	warp_def  2,  0, 1, RADIANT_ORPHANAGE_LEILANIS_ROOM

	db 0 ; coord events

	db 2 ; bg events
	signpost  2,  1, SIGNPOST_READ, RadiantOrphanage1FLeilanisRoomSign
	signpost  2,  7, SIGNPOST_READ, RadiantOrphanage1FGymRoomSign

	db 11 ; object events
	object_event  3,  5, SPRITE_LEILANI_VARIABLE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ALWAYS_SET
	object_event  3,  5, SPRITE_LEILANI_CHAIR_2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, RadiantOrphanage1FChair, EVENT_ALWAYS_SET
	object_event  3,  5, SPRITE_LEILANI_CHAIR, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, RadiantOrphanage1FLeilani, -1
	object_event  3,  5, SPRITE_LEILANI_CHAIR_2, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event -5, -5, SPRITE_PIGTAILS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, RadiantOrphanage1FGirlsTest, -1
	object_event -5, -5, SPRITE_PIGTAILS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, RadiantOrphanageLeilanisRoomLily, -1
	object_event -5, -5, SPRITE_PIGTAILS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, RadiantOrphanageLeilanisRoomIris, -1
	object_event -5, -5, SPRITE_PIGTAILS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, RadiantOrphanageLeilanisRoomPoppy, -1
	object_event -5, -5, SPRITE_PIGTAILS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, RadiantOrphanageLeilanisRoomViolet, -1
	object_event -5, -5, SPRITE_PIGTAILS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, RadiantOrphanageLeilanisRoomClover, -1
	object_event -5, -5, SPRITE_PIGTAILS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, RadiantOrphanageLeilanisRoomFelicia, -1
	

	const_def 1 ; object constants
	const RADIANT_ORPHANAGE_1F_LEILANI_2
	const RADIANT_ORPHANAGE_1F_LEILANI_CHAIR_2
	const RADIANT_ORPHANAGE_1F_LEILANI_1
	const RADIANT_ORPHANAGE_1F_LEILANI_CHAIR_1
	const RADIANT_ORPHANAGE_1F_ROSE
	const RADIANT_ORPHANAGE_1F_LILY
	const RADIANT_ORPHANAGE_1F_IRIS
	const RADIANT_ORPHANAGE_1F_POPPY
	const RADIANT_ORPHANAGE_1F_VIOLET
	const RADIANT_ORPHANAGE_1F_CLOVER
	const RADIANT_ORPHANAGE_1F_FELICIA

RadiantOrphanage1FGirlsTest:
	end

RadiantOrphanage1FChair:
	jumptext RadiantOrphanage1FChairText

RadiantOrphanage1FLeilani:
	spriteface RADIANT_ORPHANAGE_1F_LEILANI_1, DOWN
	spriteface RADIANT_ORPHANAGE_1F_LEILANI_1, DOWN
	checkcode VAR_FACING
	if_equal LEFT, .YouAreFacingLeft
	opentext
	writetext RadiantOrphanage1FLeilaniTextWrongSide
	waitbutton
	closetext
	end
.YouAreFacingLeft
	appear RADIANT_ORPHANAGE_1F_LEILANI_2
	appear RADIANT_ORPHANAGE_1F_LEILANI_CHAIR_2
	setevent EVENT_ALWAYS_SET
	opentext
	writetext RadiantOrphanage1FLeilaniText1
	waitbutton
	closetext
	applyonemovement PLAYER, step_up
	spriteface PLAYER, DOWN
	disappear RADIANT_ORPHANAGE_1F_LEILANI_1
	disappear RADIANT_ORPHANAGE_1F_LEILANI_CHAIR_1
	spriteface RADIANT_ORPHANAGE_1F_LEILANI_2, RIGHT
	variablesprite SPRITE_LEILANI_VARIABLE, SPRITE_LEILANI
	special MapCallbackSprites_LoadUsedSpritesGFX
	playsound SFX_JUMP_OVER_LEDGE
	applyonemovement RADIANT_ORPHANAGE_1F_LEILANI_2, slow_step_right
	spriteface RADIANT_ORPHANAGE_1F_LEILANI_2, UP
	opentext
	writetext RadiantOrphanage1FLeilaniText2
	waitbutton
	closetext
	applymovement RADIANT_ORPHANAGE_1F_LEILANI_2, Movement_RadiantOrphanage1FLeilani
	spriteface PLAYER, RIGHT
	spriteface RADIANT_ORPHANAGE_1F_LEILANI_2, DOWN
	opentext
	writetext RadiantOrphanage1FLeilaniText3
	waitbutton
	closetext
	applyonemovement RADIANT_ORPHANAGE_1F_LEILANI_2, slow_step_up
	disappear RADIANT_ORPHANAGE_1F_LEILANI_2
	playsound SFX_ENTER_DOOR
	pause 5
	disappear RADIANT_ORPHANAGE_1F_ROSE
	disappear RADIANT_ORPHANAGE_1F_LILY
	disappear RADIANT_ORPHANAGE_1F_IRIS
	disappear RADIANT_ORPHANAGE_1F_POPPY
	disappear RADIANT_ORPHANAGE_1F_VIOLET
	disappear RADIANT_ORPHANAGE_1F_CLOVER
	disappear RADIANT_ORPHANAGE_1F_FELICIA
	opentext
	writetext RadiantOrphanage1FGirlsText
	waitbutton
	closetext
	moveperson RADIANT_ORPHANAGE_1F_ROSE, 9, 3
	moveperson RADIANT_ORPHANAGE_1F_LILY, 9, 3
	moveperson RADIANT_ORPHANAGE_1F_IRIS, 9, 3
	moveperson RADIANT_ORPHANAGE_1F_POPPY, 9, 3
	moveperson RADIANT_ORPHANAGE_1F_VIOLET, 9, 3
	moveperson RADIANT_ORPHANAGE_1F_CLOVER, 9, 3
	moveperson RADIANT_ORPHANAGE_1F_FELICIA, 9, 3
	pause 15
	appear RADIANT_ORPHANAGE_1F_ROSE
	playsound SFX_EXIT_BUILDING
	applymovement RADIANT_ORPHANAGE_1F_ROSE, Movement_RadiantOrphanage1FGirls
	disappear RADIANT_ORPHANAGE_1F_ROSE
	playsound SFX_ENTER_DOOR
	pause 10
	appear RADIANT_ORPHANAGE_1F_LILY
	playsound SFX_EXIT_BUILDING
	applymovement RADIANT_ORPHANAGE_1F_LILY, Movement_RadiantOrphanage1FGirls
	disappear RADIANT_ORPHANAGE_1F_LILY
	playsound SFX_ENTER_DOOR
	pause 10
	appear RADIANT_ORPHANAGE_1F_IRIS
	playsound SFX_EXIT_BUILDING
	applymovement RADIANT_ORPHANAGE_1F_IRIS, Movement_RadiantOrphanage1FGirls
	disappear RADIANT_ORPHANAGE_1F_IRIS
	playsound SFX_ENTER_DOOR
	pause 10
	appear RADIANT_ORPHANAGE_1F_POPPY
	playsound SFX_EXIT_BUILDING
	applymovement RADIANT_ORPHANAGE_1F_POPPY, Movement_RadiantOrphanage1FGirls
	disappear RADIANT_ORPHANAGE_1F_POPPY
	playsound SFX_ENTER_DOOR
	pause 10
	appear RADIANT_ORPHANAGE_1F_VIOLET
	playsound SFX_EXIT_BUILDING
	applymovement RADIANT_ORPHANAGE_1F_VIOLET, Movement_RadiantOrphanage1FGirls
	disappear RADIANT_ORPHANAGE_1F_VIOLET
	playsound SFX_ENTER_DOOR
	pause 10
	appear RADIANT_ORPHANAGE_1F_CLOVER
	playsound SFX_EXIT_BUILDING
	applymovement RADIANT_ORPHANAGE_1F_CLOVER, Movement_RadiantOrphanage1FGirls
	disappear RADIANT_ORPHANAGE_1F_CLOVER
	playsound SFX_ENTER_DOOR
	pause 10
	appear RADIANT_ORPHANAGE_1F_FELICIA
	playsound SFX_EXIT_BUILDING
	applymovement RADIANT_ORPHANAGE_1F_FELICIA, Movement_RadiantOrphanage1FGirls2
	disappear RADIANT_ORPHANAGE_1F_FELICIA
	playsound SFX_ENTER_DOOR
	end
	
RadiantOrphanage1FLeilanisRoomSign:
	jumptext RadiantOrphanage1FLeilanisRoomSignText
	
RadiantOrphanage1FGymRoomSign:
	jumptext RadiantOrphanage1FGymRoomSignText
	
Movement_RadiantOrphanage1FLeilani:
	slow_step_right
	slow_step_right
	slow_step_right
	slow_step_right
	slow_step_up
	slow_step_up
	step_end
	
Movement_RadiantOrphanage1FGirls2:
	step_left
	step_sleep 20
	turn_step_right
	step_sleep 20
	turn_step_left
	step_sleep 20
	turn_step_down
	step_sleep 25
	step_up
	step_end
	
Movement_RadiantOrphanage1FGirls:
	step_left
	step_up
	step_end
	
RadiantOrphanage1FLeilanisRoomSignText:
	text "LEILANI'S ROOM"
	done
	
RadiantOrphanage1FGymRoomSignText:
	text "RADIANT TOWNSHIP"
	line "#MON GYM"
	cont "LEADER: LEILANI"
	
	para "The ferocious"
	line "flower."
	done
	
RadiantOrphanage1FChairText:
	text "LEILANI's rocking"
	line "chair."
	
	para "There are cute"
	line "floral patterns"
	cont "carved into the"
	cont "wood."
	done
	
RadiantOrphanage1FLeilaniTextWrongSide:
	text "What's that, honey?"
	
	para "Come around and"
	line "speak into my good"
	cont "ear."
	done
	
RadiantOrphanage1FLeilaniText1:
	text "I'm getting up now."
	done
	
RadiantOrphanage1FLeilaniText2:
	text "Come along, sugar."
	
	para "We'll battle in the"
	line "other room."
	done
	
RadiantOrphanage1FLeilaniText3:
	text "Ok girls!"
	
	para "Battle time!"
	done
	
RadiantOrphanage1FGirlsText:
	text "Coming GRAMMA!"
	done