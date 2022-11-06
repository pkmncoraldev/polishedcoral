Route3FriendshipHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def  7,  2, 3, ROUTE_3
	warp_def  7,  3, 3, ROUTE_3

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route3FriendshipHouseNPC, -1
	
	
Route3FriendshipHouseNPC:
	faceplayer
	opentext
	special GetFirstPokemonHappiness
	writetext FriendshipIntroText
	buttonsound
	farwritetext StdBlankText
	pause 6
	ifgreater $db, .Happiest
	ifgreater $b3, .Happy
	ifgreater $77, .KindaHappy
	ifgreater $45, .Neutral
	ifgreater $1d, .Dislike
	jumpopenedtext FriendshipHateText
	
.Happiest:
	writetext FriendshipHappiestText
	waitbutton
	closetext
	end
	
.Happy:
	jumpopenedtext FriendshipHappyText
	
.KindaHappy:
	jumpopenedtext FriendshipKindaHappyText
	
.Neutral:
	jumpopenedtext FriendshipNeutralText
	
.Dislike:
	jumpopenedtext FriendshipDislikeText
	
FriendshipIntroText:
	text "Hello sweetie."
	
	para "Oh, your"
	line "@"
	text_from_ram wStringBuffer1
	text "…"
	done

FriendshipHappiestText:
	text "It loves you very"
	line "much!"

	para "You must be a"
	line "great TRAINER!"
	done
	
FriendshipHappyText:
	text "It seems happy"
	line "with you."
	
	para "Make sure to keep"
	line "treating it with"
	cont "plenty of love!"
	done
	
FriendshipKindaHappyText:
	text "It's warming up to"
	line "you."
	
	para "Treat it with lots"
	line "of love, and it'll"
	cont "be even happier!"
	done

FriendshipNeutralText:
	text "It doesn't know you"
	line "very well yet."
	
	para "Treat it with lots"
	line "of love, and it'll"
	cont "come around."
	done
	
FriendshipDislikeText:
	text "It seems like it"
	line "doesn't like you"
	cont "very much…"
	
	para "Try to treat it"
	line "with more love and"
	cont "care…"
	done
	
FriendshipHateText:
	text "It hates you!"
	
	para "What have you done"
	line "to this poor"
	cont "#MON?"
	done
