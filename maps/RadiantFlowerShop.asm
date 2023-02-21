RadiantFlowerShop_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def  7,  2, 1, RADIANT_TOWNSHIP
	warp_def  7,  3, 1, RADIANT_TOWNSHIP

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_DAISY,  3,  0, SPRITEMOVEDATA_STANDING_RIGHT, 2, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, RadiantFlowerShopClerk, -1


RadiantFlowerShopClerk:
	faceplayer
	opentext
	checkitem POLLEN_POUCH
	iffalse .try_give_pouch
	callasm CheckSunflowerPollenAsm
	ifequal 0, .pouch_full
	checkevent EVENT_GOT_POLLEN_REWARD
	iftrue .got_pollen_reward_once
	writetext RadiantFlowerShopClerkPouchNotFullText
	waitbutton
	closetext
	end
.pouch_full
	writetext RadiantFlowerShopClerkPouchFullText1
	yesorno
	iffalse .said_no
	callasm RadiantFlowerShopClerkClearPollenAsm
	writetext RadiantFlowerShopHandedOverPollenText
	playsound SFX_LEVEL_UP 
	waitsfx
	verbosegiveitem POTION
.got_pollen_reward_once
	writetext RadiantFlowerShopClerkPouchFullText2
	waitbutton
	closetext
	setevent EVENT_GOT_POLLEN_REWARD
	end
.said_no
	writetext RadiantFlowerShopClerkNoText
	waitbutton
	closetext
	end
.try_give_pouch
	callasm CheckIfPlayerIsCoveredInPollen
	iftrue .give_pouch
	writetext RadiantFlowerShopClerkNotCoveredInPollenText
	waitbutton
	closetext
	end
.give_pouch
	writetext RadiantFlowerShopClerkGivePouchText1
	waitbutton
	verbosegiveitem POLLEN_POUCH
	callasm RadiantFlowerShopClerkClearPollenAsm
	writetext RadiantFlowerShopClerkGivePouchText2
	waitbutton
	closetext
	end
	
CheckIfPlayerIsCoveredInPollen:
	ld a, [wPollenSteps]
	cp 10
	jr nc, .yes
	ld a, FALSE
	ld [wScriptVar], a
	ret
.yes
	ld a, TRUE
	ld [wScriptVar], a
	ret
	
RadiantFlowerShopClerkClearPollenAsm:
	xor a
	ld [wPollenSteps], a
	ret
	
RadiantFlowerShopClerkNotCoveredInPollenText:
	text "Your clothes are"
	line "so clean…"
	
	para "I thought you"
	line "might be another"
	cont "flower fan, but"
	cont "you aren't covered"
	cont "in pollen…"
	
	para "Come back when you"
	line "learn to love the"
	cont "flowers!"
	done
	
RadiantFlowerShopClerkGivePouchText1:
	text "Wow! Your clothes"
	line "are covered in"
	cont "pollen!"
	
	para "You've been walking"
	line "through the"
	cont "flowers, right?"
	
	para "You shouldn't let"
	line "all that pollen"
	cont "go to waste!"
	
	para "Here, take this."
	done
	
RadiantFlowerShopClerkGivePouchText2:
	text "That POLLEN POUCH"
	line "will collect the"
	cont "POLLEN PUFFs you"
	cont "kick up while"
	cont "walking through"
	cont "the flowers."
	
	para "It can hold 250"
	line "POLLEN PUFFs!"
	
	para "Come see me when"
	line "you fill it up"
	cont "and I'll give you"
	cont "something!"
	done
	
RadiantFlowerShopClerkPouchNotFullText:
	text "Come see me when"
	line "you fill up your"
	cont "POLLEN POUCH."
	
	para "I'll give you"
	line "something!"
	done
	
RadiantFlowerShopClerkPouchFullText1:	;TODO: Decide reward
	text "Oh!"
	
	para "Your POLLEN POUCH"
	line "is full!"
	
	para "Do you wanna trade"
	line "for a POTION?"
	done
	
RadiantFlowerShopClerkPouchFullText2:
	text "Come see me when"
	line "you fill up your"
	cont "POLLEN POUCH"
	cont "again."
	
	para "We can trade some"
	line "more!"
	done
	
RadiantFlowerShopClerkNoText:
	text "Maybe next time…"
	done
	
RadiantFlowerShopHandedOverPollenText:
	text "<PLAYER> emptied"
	line "the POLLEN POUCH."
	done