LuminaAdminHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 7, 3, 3, LUMINA_TOWN
	warp_def 7, 2, 3, LUMINA_TOWN

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  6,  6, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LuminaAdminHouseAlan, -1
	
LuminaAdminHouseAlan:
	faceplayer
	checkevent EVENT_MET_ALAN
	iftrue .talked
	opentext TEXTBOX_UNKNOWN
	writetext LuminaAdminHouseAlanText1
	buttonsound
	changetextboxspeaker TEXTBOX_ALAN
	farwritetext StdBlankText
	pause 6
	jump .end
.talked
	opentext TEXTBOX_ALAN
.end
	writetext LuminaAdminHouseAlanText2
	waitbutton
	closetext
	spriteface 1, UP
	setevent EVENT_MET_ALAN
	end
	
LuminaAdminHouseAlanText1:
	text "Hi there, kiddo.<WAIT_S>"
	line "Are you a TRAINER?"
	
	para "That must mean you"
	line "use the #MON"
	cont "STORAGE SYSTEM on"
	cont "the PCs at the"
	cont "#MON CENTER."
	
	para "I'm the system"
	line "administrator!"
	
	para "My name is ALAN."
	done
	
LuminaAdminHouseAlanText2:
	text "Living up here,"
	line "it's not often I"
	cont "see an end user."
	
	para "Go ahead and make"
	line "yourself at home."

	para "Since we don't have"
	line "a #MON CENTER,"
	cont "feel free to use"
	cont "the PC over there."
	
	para "Any #MON you've"
	line "deposited should"
	cont "be on the server"
	cont "here, anyway."
	done
	
