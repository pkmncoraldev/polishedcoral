GlintApartmentLeft2F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 1 ; warp events
	warp_def 1, 1, 3, GLINT_APARTMENT_LEFT_1F

	db 1 ; coord events
	xy_trigger 0, 4, 2, 0, GlintApt12FTV, 0, 0

	db 0 ; bg events

	db 2 ; object events
	person_event SPRITE_ROCKER, 5, 2, SPRITEMOVEDATA_STANDING_UP, 0, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, GlintApt12FNpc1, -1
	person_event SPRITE_POKEFAN_F, 6, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GlintApt12FNpc2, -1

	const_def 1 ; object constants
	const GLINT_APT12F_NPC1
	const GLINT_APT12F_NPC2

GlintApt12FNpc1:
	faceplayer
	opentext
	writetext GlintApt12FNpc1Text
	waitbutton
	spriteface GLINT_APT12F_NPC1, UP
	closetext
	end
	
GlintApt12FNpc2:
	faceplayer
	opentext
	checkitem RIVAL_POKEDEX
	iffalse .havemapcard
	writetext GlintApt12FNpc2Text1
	waitbutton
	closetext
	end
	
.havemapcard:
	writetext GlintApt12FNpc2Text2
	waitbutton
	closetext
	end
	
GlintApt12FTV:
	special Special_StopRunning
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, GLINT_APT12F_NPC1, 15
	checkcode VAR_FACING
	if_equal RIGHT, .YouAreFacingRight
	opentext
	writetext GlintApt12FTVText1
	waitbutton
	closetext
	pause 10
	spriteface PLAYER, DOWN
	opentext
	writetext GlintApt12FTVText2
	waitbutton
	closetext
	applymovement PLAYER, Movement_GlintApt12FTV1
	end
.YouAreFacingRight
	opentext
	writetext GlintApt12FTVText1
	waitbutton
	closetext
	pause 10
	spriteface PLAYER, DOWN
	opentext
	writetext GlintApt12FTVText2
	waitbutton
	closetext
	applymovement PLAYER, Movement_GlintApt12FTV2
	end
	
GlintApt12FNpc1Text:
	text "Talking to people"
	line "is useful."
	
	para "They'll tell you"
	line "vital information"
	cont "that they know."
	
	para "It's probably a"
	line "good idea to talk"
	cont "to every person"
	cont "you see."
	
	para "Except for me that"
	line "is."
	
	para "I'm trying to watch"
	line "TV."
	done
	
GlintApt12FNpc2Text1:
	text "Do you see that"
	line "map on the wall"
	cont "by the TV?"
	
	para "That's a map of"
	line "the ONWA REGION."
	
	para "If you have a"
	line "MAP CARD for your"
	cont "#GEAR,"
	
	para "you can view it"
	line "from anywhere."
	
	para "You should see if"
	line "you can find one."
	done
	
GlintApt12FNpc2Text2:
	text "Do you see that"
	line "map on the wall"
	cont "by the TV?"
	
	para "That's a map of"
	line "the ONWA REGION."
	
	para "If you have a"
	line "MAP CARD for your"
	cont "#GEAR,"
	
	para "you can view it"
	line "from anywhere."
	
	para "Oh!"
	
	para "You already have"
	line "one."
	
	para "How convenient."
	done
	
GlintApt12FTVText1:
	text "Hey!"
	done
	
GlintApt12FTVText2:
	text "Do you mind?"
	
	para "I'm watching that!"
	done
	
Movement_GlintApt12FTV1:
	step_right
	step_end

Movement_GlintApt12FTV2:
	step_left
	step_end