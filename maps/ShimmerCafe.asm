ShimmerCafe_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  2,  7, SHIMMER_CITY, 26
	warp_event  3,  7, SHIMMER_CITY, 26

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	person_event SPRITE_FISHING_GURU,  2,  4, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ShimmerCafeNPC1, -1
	person_event SPRITE_SAILOR,  4,  2, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ShimmerCafeNPC2, -1
	person_event SPRITE_SAILOR,  6,  7, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ShimmerCafeNPC3, -1
	person_event SPRITE_FAT_GUY,  1,  0, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ShimmerCafeNPC4, EVENT_SHIMMER_BOAT_GUY_AT_WORK
	person_event SPRITE_BEAUTY,  3,  7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, ShimmerCafeClerk, -1
	
	
ShimmerCafeNPC1:
	jumptextfaceplayer ShimmerCafeNPC1Text
	
ShimmerCafeNPC2:
	jumptextfaceplayer ShimmerCafeNPC2Text
	
ShimmerCafeNPC3:
	jumptextfaceplayer ShimmerCafeNPC3Text

ShimmerCafeNPC4:
	checkevent EVENT_CAN_TALK_TO_SHIMMER_BOAT_MAN
	iftrue .do_it
	jumptextfaceplayer ShimmerCafeNPC4Text1
.do_it
	faceplayer
	opentext
	writetext ShimmerCafeNPC4Text2
	waitbutton
	closetext
	applymovement PLAYER, Movement_ShimmerCafe1
	applymovement 4, Movement_ShimmerCafe2
	disappear 4
	playsound SFX_EXIT_BUILDING
	setevent EVENT_SHIMMER_BOAT_GUY_AT_WORK
	end
	
Movement_ShimmerCafe1:
	fix_facing
	step_right
	remove_fixed_facing
	step_end
	
Movement_ShimmerCafe2:
	step_right
	step_down
	step_down
	step_down
	step_down
	step_down
	step_right
	step_down
	step_end
	
ShimmerCafeNPC1Text:
	text "Most of the guys"
	line "who hang out in"
	cont "here are SAILORS."
	
	para "This is a port"
	line "town after all!"
	done

ShimmerCafeNPC2Text:
	text "This place is"
	line "great!"
	
	para "Good drinks, good"
	line "grub, and a cutie"
	cont "at the counter!"
	done
	
ShimmerCafeNPC3Text:
	text "One of my buddies"
	line "prefers MOOMOO's"
	cont "in the next town"
	cont "over."
	
	para "That place is too"
	line "rowdy and dirty."
	done
	
ShimmerCafeNPC4Text1:
	text "You know about"
	line "the RESEARCH LAB?"
	
	para "They're studying"
	line "ancient ruins or"
	cont "something."
	
	para "I'm always having"
	line "to ferry around"
	cont "the researchers."
	done
	
ShimmerCafeNPC4Text2:
	text "Ah, PROF. HILL"
	line "sent you?"
	
	para "You must be with"
	line "the research team."
	
	para "A little young,"
	line "aren't you?"
	
	para "Oh well."
	
	para "PUEBLO BRILLO?"
	
	para "Alright, sure."
	line "I'll take you."
	
	para "Meet me at the"
	line "BOAT HOUSE at the"
	cont "EAST end of town."
	done
	
ShimmerCafeClerk:
	opentext
	writetext ShimmerCafeClerkText
	waitbutton
	callasm ShimmerCafeClerkAsm
	writetext ShimmerCafeClerkText2
	waitbutton
	closetext
	end
	
ShimmerCafeClerkText:
	text "What can I get"
	line "ya?"
	done
	
ShimmerCafeClerkText2:
	text "Come again."
	done
	
ShimmerCafeClerkAsm:
	ld a, MARTTYPE_BARTENDER
	ld c, a
	ld a, MART_SHIMMER_CAFE
	ld e, a
	ld d, 0
	ld a, [wScriptBank]
	ld b, a
	farcall OpenMartDialog
	ret
