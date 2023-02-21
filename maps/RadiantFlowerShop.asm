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
	
	
.try_give_pouch
	writetext RadiantFlowerShopClerkGivePouchText1
	waitbutton
	verbosegiveitem POLLEN_POUCH
	callasm RadiantFlowerShopClerkClearPollenAsm
	writetext RadiantFlowerShopClerkGivePouchText2
	waitbutton
	closetext
	end
	
RadiantFlowerShopClerkClearPollenAsm:
	xor a
	ld [wPollenSteps], a
	ret
	
RadiantFlowerShopClerkGivePouchText1:
	text "Wow! Your clothes"
	line "are coverd in"
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
	
	para "kick up while"
	line "walking through"
	cont "the flowers."
	
	para "It can hold 250"
	line "POLLEN PUFFs!"
	
	para "Come see me when"
	line "you fill it up"
	cont "and I'll give you"
	cont "something!"
	done