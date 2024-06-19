RadiantOrphanage1F_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, RadiantOrphanage1FCallback

	db 5 ; warp events
	warp_def  9,  4, 4, RADIANT_TOWNSHIP
	warp_def  9,  5, 4, RADIANT_TOWNSHIP
	warp_def  2,  0, 1, RADIANT_ORPHANAGE_LEILANIS_ROOM
	warp_def  3,  9, 1, RADIANT_ORPHANAGE_2F
	warp_def  2,  8, 1, RADIANT_GYM

	db 0 ; coord events

	db 3 ; bg events
	signpost  2,  1, SIGNPOST_READ, RadiantOrphanage1FLeilanisRoomSign
	signpost  2,  7, SIGNPOST_READ, RadiantOrphanage1FGymRoomSign
	signpost  2,  8, SIGNPOST_IFSET, RadiantOrphanage1FLockedDoor

	db 13 ; object events
	object_event  3,  5, SPRITE_LEILANI_VARIABLE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ALWAYS_SET
	object_event  3,  5, SPRITE_LEILANI_CHAIR_2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, RadiantOrphanage1FChair, EVENT_RADIANT_GYM_INACTIVE
	object_event  3,  5, SPRITE_LEILANI_CHAIR, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, RadiantOrphanage1FLeilani, EVENT_RADIANT_GYM_ACTIVE
	object_event  3,  5, SPRITE_LEILANI_CHAIR_2, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_RADIANT_GYM_ACTIVE
	object_event -5, -5, SPRITE_PIGTAILS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, RadiantOrphanageLeilanisRoomRose, -1
	object_event -5, -5, SPRITE_PIGTAILS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, RadiantOrphanageLeilanisRoomLily, -1
	object_event -5, -5, SPRITE_PIGTAILS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, RadiantOrphanageLeilanisRoomIris, -1
	object_event -5, -5, SPRITE_PIGTAILS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, RadiantOrphanageLeilanisRoomPoppy, -1
	object_event -5, -5, SPRITE_PIGTAILS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, RadiantOrphanageLeilanisRoomViolet, -1
	object_event -5, -5, SPRITE_PIGTAILS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, RadiantOrphanageLeilanisRoomClover, -1
	object_event -5, -5, SPRITE_PIGTAILS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, RadiantOrphanageLeilanisRoomFelicia, -1
	object_event  3,  5, SPRITE_LEILANI_CHAIR_2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, RadiantOrphanage1FChairDusty, EVENT_SAVED_ALL_LOST_GIRLS
	
	

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
	const RADIANT_ORPHANAGE_1F_LEILANI_CHAIR_DUSTY
	const RADIANT_ORPHANAGE_1F_ERIKA

RadiantOrphanage1FCallback:
	checkevent EVENT_RADIANT_GYM_INACTIVE
	iftrue .end
	checkevent EVENT_RADIANT_GYM_ACTIVE
	iffalse .end
	changeblock $8, $2, $39
	callasm GenericFinishBridge
.end
	return

RadiantOrphanage1FErika:
	checkevent EVENT_CAN_FIGHT_ERIKA
	iftrue .can_fight
	checkevent EVENT_RADIANT_GYM_ACTIVE
	iftrue .gym_active
	jumptextfaceplayer RadiantOrphanage1FErikaText1
.gym_active
	jumptextfaceplayer RadiantOrphanage1FErikaText2
.can_fight
	checkevent EVENT_BEAT_ERIKA
	iffalse .battle
	jumptextfaceplayer RadiantOrphanage1FErikaText4
.battle
	faceplayer
	opentext
	writetext RadiantOrphanage1FErikaText3
	yesorno
	iffalse .no
	closetext
	waitsfx
	winlosstext RadiantOrphanage1FErikaWinText, 0
	setlasttalked RADIANT_ORPHANAGE_LEILANIS_ROOM_ERIKA2
	loadtrainer ERIKA, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ERIKA
	jumptextfaceplayer RadiantOrphanage1FErikaText4
.no
	writetext RadiantOrphanage1FErikaNoText
	waitbutton
	closetext
	end

RadiantOrphanage1FErikaText1:
	text "Everything's back"
	line "to normal thanks"
	cont "to you!"
	
	para "GRAMMA LEILANI is"
	line "doing much better."
	
	para "I'm sure she would"
	line "love to offer you"
	cont "a GYM battle if"
	cont "asked her."
	done
	
RadiantOrphanage1FErikaText2:
	text "Everything's back"
	line "to normal thanks"
	cont "to you!"
	
	para "Thank you so much!"	
	
	para "I'm going to stick"
	line "around a while"
	cont "longer before I"
	cont "head back home to"
	cont "KANTO."
	done
	
RadiantOrphanage1FErikaText3:
	text "Oh, hello"
	line "<PLAYER>."
	
	para "I heard that you"
	line "beat GRAMMA."
	
	para "You know, back in"
	line "KANTO, I'm actually"
	cont "a GYM LEADER too."
	
	para "You've piqued my"
	line "interest…"
	
	para "Would you please"
	line "battle me?"
	done
	
RadiantOrphanage1FErikaText4:
	text "You really are"
	line "amazing, <PLAYER>!"
	
	para "I'm going to stick"
	line "around a while"
	cont "longer before I"
	cont "head back home to"
	cont "KANTO."
	
	para "I hope to see you"
	line "again someday."
	done
	
RadiantOrphanage1FErikaNoText:
	text "I see…"
	
	para "Next time, then!"
	done
	
RadiantOrphanage1FErikaWinText:
	text "Incredible!"
	done

RadiantOrphanage1FChair:
	jumptext RadiantOrphanage1FChairText
	
RadiantOrphanage1FChairDusty:
	jumptext RadiantOrphanage1FChairDustyText

RadiantOrphanage1FLeilani:
	variablesprite SPRITE_LEILANI_VARIABLE, SPRITE_LEILANI_CHAIR
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
	setevent EVENT_RADIANT_GYM_ACTIVE
	clearevent EVENT_RADIANT_GYM_INACTIVE
	opentext
	checkevent EVENT_BEAT_LEILANI
	iftrue .rematch
	writetext RadiantOrphanage1FLeilaniText1
	waitbutton
	jump .cont
.rematch
	writetext RadiantOrphanage1FLeilaniText4
	yesorno
	iffalse .no
.cont
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
	spriteface RADIANT_ORPHANAGE_1F_LEILANI_2, DOWN
	spriteface PLAYER, RIGHT
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
	pause 20
	appear RADIANT_ORPHANAGE_1F_ROSE
	playsound SFX_EXIT_BUILDING
	applymovement RADIANT_ORPHANAGE_1F_ROSE, Movement_RadiantOrphanage1FGirls
	disappear RADIANT_ORPHANAGE_1F_ROSE
	playsound SFX_ENTER_DOOR
	pause 15
	appear RADIANT_ORPHANAGE_1F_LILY
	playsound SFX_EXIT_BUILDING
	applymovement RADIANT_ORPHANAGE_1F_LILY, Movement_RadiantOrphanage1FGirls
	disappear RADIANT_ORPHANAGE_1F_LILY
	playsound SFX_ENTER_DOOR
	pause 15
	appear RADIANT_ORPHANAGE_1F_IRIS
	playsound SFX_EXIT_BUILDING
	applymovement RADIANT_ORPHANAGE_1F_IRIS, Movement_RadiantOrphanage1FGirls
	disappear RADIANT_ORPHANAGE_1F_IRIS
	playsound SFX_ENTER_DOOR
	pause 15
	appear RADIANT_ORPHANAGE_1F_POPPY
	playsound SFX_EXIT_BUILDING
	applymovement RADIANT_ORPHANAGE_1F_POPPY, Movement_RadiantOrphanage1FGirls
	disappear RADIANT_ORPHANAGE_1F_POPPY
	playsound SFX_ENTER_DOOR
	pause 15
	appear RADIANT_ORPHANAGE_1F_FELICIA
	playsound SFX_EXIT_BUILDING
	applymovement RADIANT_ORPHANAGE_1F_FELICIA, Movement_RadiantOrphanage1FGirls
	disappear RADIANT_ORPHANAGE_1F_FELICIA
	playsound SFX_ENTER_DOOR
	pause 15
	appear RADIANT_ORPHANAGE_1F_VIOLET
	playsound SFX_EXIT_BUILDING
	applymovement RADIANT_ORPHANAGE_1F_VIOLET, Movement_RadiantOrphanage1FGirls
	disappear RADIANT_ORPHANAGE_1F_VIOLET
	playsound SFX_ENTER_DOOR
	pause 15
	appear RADIANT_ORPHANAGE_1F_CLOVER
	playsound SFX_EXIT_BUILDING
	applymovement RADIANT_ORPHANAGE_1F_CLOVER, Movement_RadiantOrphanage1FGirls2
	disappear RADIANT_ORPHANAGE_1F_CLOVER
	playsound SFX_ENTER_DOOR
	changeblock $8, $2, $39
	callasm GenericFinishBridge
	end
.no
	disappear RADIANT_ORPHANAGE_1F_LEILANI_2
	disappear RADIANT_ORPHANAGE_1F_LEILANI_CHAIR_2
	setevent EVENT_ALWAYS_SET
	checkevent EVENT_LEILANI_CANDY
	iffalse .candy
	writetext RadiantOrphanage1FLeilaniText5
	waitbutton
	closetext
	end
.candy
	writetext RadiantOrphanage1FLeilaniText6
	waitbutton
	verbosegiveitem RARE_CANDY
	closetext
	setevent EVENT_LEILANI_CANDY
	end
	
RadiantOrphanage1FLeilanisRoomSign:
	jumptext RadiantOrphanage1FLeilanisRoomSignText
	
RadiantOrphanage1FGymRoomSign:
	jumptext RadiantOrphanage1FGymRoomSignText
	
RadiantOrphanage1FLockedDoor:
	dw EVENT_RADIANT_GYM_INACTIVE
	jumptext RadiantOrphanage1FLockedDoorText
	
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
	step_sleep 35
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
	text "RADIANT TOWN"
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
	
RadiantOrphanage1FChairDustyText:
	text "A dusty rocking"
	line "chair."
	
	para "There are cute"
	line "floral patterns"
	cont "carved into the"
	cont "wood."
	done
	
RadiantOrphanage1FLeilaniTextWrongSide:
	text "What's that, deary?"
	
	para "Come around and"
	line "speak into my good"
	cont "ear."
	done
	
RadiantOrphanage1FLeilaniText1:
	text "You're <PLAYER>,"
	line "aren't you?"
	
	para "ERIKA told me that"
	line "you're the one who"
	cont "found the girls."
	
	para "Oh bless you,"
	line "child."
	
	para "Those girls will"
	line "be the death of"
	cont "me, surely!"
	
	para "Oh, <WAIT_S>listen to me"
	line "going on and on!"
	
	para "You came for a GYM"
	line "battle didn't you?"
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
	
RadiantOrphanage1FLeilaniText4:
	text "Hello, deary."
	
	para "Did you come for"
	line "another battle?"
	done
	
RadiantOrphanage1FLeilaniText5:
	text "Oh, <WAIT_S>you just came"
	line "for a visit?"
	
	para "How thoughtful!"
	done
	
RadiantOrphanage1FLeilaniText6:
	text "Oh, <WAIT_S>you just came"
	line "for a visit?"
	
	para "How thoughtful!"
	
	para "Have a piece of"
	line "candy!"
	done
	
RadiantOrphanage1FGirlsText:
	text "Coming GRAMMA!"
	done
	
RadiantOrphanage1FLockedDoorText:
	text "The door is"
	line "locked."
	done
