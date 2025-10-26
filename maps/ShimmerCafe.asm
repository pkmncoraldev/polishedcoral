ShimmerCafe_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  2,  7, SHIMMER_CITY, 26
	warp_event  3,  7, SHIMMER_CITY, 26

	db 0 ; coord events

	db 1 ; bg events
	signpost  0,  1, SIGNPOST_JUMPTEXT, ShimmerCafePoster

	db 5 ; object events
	person_event SPRITE_FISHING_GURU,  2,  4, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ShimmerCafeNPC1, -1
	person_event SPRITE_SAILOR,  4,  2, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ShimmerCafeNPC2, -1
	person_event SPRITE_SAILOR,  6,  7, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ShimmerCafeNPC3, -1
	person_event SPRITE_FAT_GUY,  1,  0, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ShimmerCafeNPC4, EVENT_SHIMMER_BOAT_GUY_AT_WORK
	person_event SPRITE_PONYTAIL,  3,  7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, ShimmerCafeClerk, -1
	
	
ShimmerCafePoster:
	text "SPECIAL!"
	line "Today only!"
	
	para "Buy one at 200%"
	line "markup, get one"
	cont "completely free!"
	done
	
ShimmerCafeNPC1:
	faceplayer
	opentext
	writetext ShimmerCafeNPC1Text
	waitbutton
	closetext
	spriteface 1, LEFT
	end
	
ShimmerCafeNPC2:
	faceplayer
	opentext
	writetext ShimmerCafeNPC2Text
	waitbutton
	closetext
	spriteface 2, UP
	end
	
ShimmerCafeNPC3:
	faceplayer
	opentext
	writetext ShimmerCafeNPC3Text
	waitbutton
	closetext
	spriteface 3, UP
	end

ShimmerCafeNPC4:
	checkevent EVENT_CAN_TALK_TO_SHIMMER_BOAT_MAN
	iftrue .do_it
	jumptextfaceplayer ShimmerCafeNPC4Text1
.do_it
	faceplayer
	opentext
	checkevent EVENT_SHIMMER_BOAT_MAN_TALKED_ONCE
	iftrue .skip
	setevent EVENT_SHIMMER_BOAT_MAN_TALKED_ONCE
	writetext ShimmerCafeNPC4Text2
	buttonsound
	farwritetext StdBlankText
	pause 6
.skip
	writetext ShimmerCafeNPC4Text3
	waitbutton
	special FadeOutPalettes
	special Special_ChooseItem
	iffalse .no
	callasm CheckItemHotDog
	iffalse .not_interested
	takeitem DUBIOUS_DOG
	writetext ShimmerCafeNPC4Text4
	waitbutton
	closetext
	pause 5
	spriteface 4, LEFT
	pause 5
	opentext
	writetext ShimmerCafeNPC4Text5
	waitbutton
	closetext
	pause 30
	faceplayer
	opentext
	writetext ShimmerCafeNPC4Text6
	waitbutton
	closetext
	applymovement PLAYER, Movement_ShimmerCafe1
	applymovement 4, Movement_ShimmerCafe2
	disappear 4
	playsound SFX_EXIT_BUILDING
	setevent EVENT_SHIMMER_BOAT_GUY_AT_WORK
	end
.not_interested
	writetext ShimmerCafeNPC4TextWrong
	waitbutton
	closetext
	end
.no
	writetext ShimmerCafeNPC4TextNo
	waitbutton
	closetext
	end
	
CheckItemHotDog:
	ld a, [wCurItem]
	cp DUBIOUS_DOG
	jr nz, .no
	ld a, TRUE
	ld [wScriptVar], a
	ret
.no
	ld a, FALSE
	ld [wScriptVar], a
	ret
	
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
	text "When fishing in"
	line "the ocean, you'll"
	cont "sometimes find"
	cont "CORAL SHARDS."
	
	para "In rivers and"
	line "ponds, you'll just"
	cont "find junk like"
	cont "BOTTLE CAPS."
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
	line "rough and rowdy."
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
	text "Ah, <WAIT_S>PROF. HILL"
	line "sent you?"
	
	para "You must be with"
	line "the research team."
	
	para "A little young,"
	line "aren't you?"
	
	para "Oh well.<WAIT_S>"
	line "PUEBLO BRILLO?"
	
	para "Sure, I can take"
	line "you there."
	
	para "I just need you to"
	line "do one tiny thing"
	cont "for me first."
	done
	
ShimmerCafeNPC4Text3:
	text "I come here every"
	line "day, and I'm sick"
	cont "of the food!"
	
	para "I want something"
	line "new and weird!"
	
	para "Bring me something"
	line "like that, and I'll"
	cont "take you to PUEBLO"
	cont "BRILLO."
	done
	
ShimmerCafeNPC4Text4:
	text "What's this?<WAIT_S>"
	line "I'll give it a try."
	done
	
ShimmerCafeNPC4Text5:
	text "Munch… Chew…"
	line "Munch…"
	done
	
ShimmerCafeNPC4Text6:
	text "Ah man!<WAIT_S>"
	line "That's foul!"
	
	para "…<WAIT_L>But it IS"
	line "different…"
	
	para "Alright, sure."
	line "I'll take you."
	
	para "Meet me at the"
	line "BOAT HOUSE at the"
	cont "EAST end of town."
	done
	
ShimmerCafeNPC4TextWrong:
	text "Nah…<WAIT_S> Try"
	line "something else."
	
	para "Maybe something"
	line "a bit weirder!"
	done
	
ShimmerCafeNPC4TextNo:
	text "No ride then.<WAIT_S>"
	line "Sorry!"
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
