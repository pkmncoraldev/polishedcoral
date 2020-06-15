EventideBikeShop_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  3,  7, EVENTIDE_VILLAGE, 5
	warp_event  2,  7, EVENTIDE_VILLAGE, 5

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	person_event SPRITE_BREEDER,  2,  7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, EventideBikeShopOwner, EVENT_HAVENT_SAVED_BIKESHOP_OWNERS_SON
	person_event SPRITE_CHILD,  5,  5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, EventideBikeShopKid, EVENT_HAVENT_SAVED_BIKESHOP_OWNERS_SON
	person_event SPRITE_BREEDER,  4,  4, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, EventideBikeShopOwnerNpc, EVENT_SAVED_BIKESHOP_OWNERS_SON


EventideBikeShopOwner:
	opentext
	checkitem BICYCLE
	iftrue .havebike
	writetext EventideBikeShopOwnerGiveBikeText1
	waitbutton
	verbosegiveitem BICYCLE
.havebike
	writetext  EventideBikeShopOwnerGiveBikeText2
	waitbutton
	closetext
	end
	
EventideBikeShopKid:
	jumptextfaceplayer EventideBikeShopKidText
	
EventideBikeShopOwnerNpc:
	jumptextfaceplayer EventideBikeShopOwnerNpcText
	
EventideBikeShopOwnerGiveBikeText1:
	text "You're the one that"
	line "helped my son in"
	cont "woods, aren't you?"
	
	para "I can't thank you"
	line "enough!"
	
	para "Now that he's back,"
	line "I can open the"
	cont "shop again!"
	
	para "Here, I want you"
	line "to take this as" 
	cont "thanks!"
	done
	
EventideBikeShopOwnerGiveBikeText2:
	text "That BICYCLE has"
	line "two gears."
	
	para "Press the B BUTTON"
	line "to switch gears."
	
	para "In HIGH GEAR,"
	line "you'll zoom along"
	cont "at breakneck"
	cont "speeds!"
	
	para "In LOW GEAR, you"
	line "have a lot more"
	cont "control."
	
	para "It's important to"
	line "switch gears based"
	cont "on the situation."
	done
	
EventideBikeShopKidText:
	text "Thanks for saving"
	line "me, big kid!"
	done
	
EventideBikeShopOwnerNpcText:
	text "Huh?"
	
	para "Sorry we're closed."
	
	para "My son has gone"
	line "missing!"
	
	para "He went off into"
	line "the forest to"
	cont "play, and hasn't"
	cont "come home."
	
	para "Oh, I hope he's"
	line "ok…"
	done
