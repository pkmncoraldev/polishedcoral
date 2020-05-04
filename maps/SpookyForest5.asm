SpookyForest5_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 0 ; warp events

	db 4 ; coord events
	coord_event  6, 13, 0, SpookyForestReset
	coord_event  7, 13, 0, SpookyForestReset
	coord_event 13,  6, 0, SpookyForestReset
	coord_event 13,  7, 0, SpookyForestReset

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_CHILD,  2,  4, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SpookyForest5LostKid, EVENT_SAVED_BIKESHOP_OWNERS_SON
	
	const_def 1 ; object constants
	const SPOOKY_FOREST_5_LOST_KID
	
SpookyForest5LostKid:
	checkevent EVENT_TALKED_BIKESHOP_OWNERS_SON
	iftrue .alreadytalked
	setevent EVENT_TALKED_BIKESHOP_OWNERS_SON
	opentext
	writetext SpookyForest5LostKidText1
	waitbutton
	closetext
	playsound SFX_PAY_DAY
	faceplayer
	showemote EMOTE_SHOCK, SPOOKY_FOREST_5_LOST_KID, 15
	opentext
	writetext SpookyForest5LostKidText2
.cont
	yesorno
	iffalse .no
	waitsfx
	special FadeOutPalettes
	closetext
	special Special_ForcePlayerStateNormal
	domaptrigger SPOOKY_FOREST_ESCORT, $1
	warp2 UP, SPOOKY_FOREST_ESCORT, $24, $13
	end
.no
	writetext SpookyForest5LostKidText3
	waitbutton
	closetext
	spriteface SPOOKY_FOREST_5_LOST_KID, UP
	end
.alreadytalked
	faceplayer
	opentext
	writetext SpookyForest5LostKidText4
	jump .cont
	
	
SpookyForest5LostKidText1:
	text "Where'd she go?"
	
	para "What do I do?"
	done
	
SpookyForest5LostKidText2:
	text "Oh!"
	
	para "A big kid!"
	
	para "I was playing by"
	line "myself in the"
	cont "woods,"

	para "when I saw this"
	line "girl."
	
	para "I heard there was"
	line "a big house in the"
	cont "woods,"
	
	para "and I thought she"
	line "might live there…"
	
	para "I tried to follow"
	line "her, but she" 
	cont "disappeared…"
	
	para "Can you help me"
	line "get out of here?"	
	done

SpookyForest5LostKidText3:
	text "You're so mean!"
	done
	
SpookyForest5LostKidText4:
	text  "A big kid!"
	
	para "Can you help me"
	line "get out of here?"	
	done
	
	
