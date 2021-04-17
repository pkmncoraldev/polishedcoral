StarglowFishingGuruHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 7, 3, 4, STARGLOW_VALLEY
	warp_def 7, 2, 4, STARGLOW_VALLEY

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_FISHING_GURU, 4, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 2, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, StarglowHouse4FishingGuru, -1

StarglowHouse4FishingGuru:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_FISHING_GURU
	iftrue .havetalked
	setevent EVENT_TALKED_TO_FISHING_GURU
	checkitem GOOD_ROD
	iftrue .haverod
	writetext StarglowHouse4FishingGuruText1
	buttonsound
	farwritetext StdBlankText
	pause 6
.havetalked
	checkitem GOOD_ROD
	iftrue .haverod
	writebyte MAGIKARP
	special Special_FindThatSpecies
	iftrue .havekarp
	writetext StarglowHouse4FishingGuruText2
	waitbutton
	closetext
	end
.havekarp
	writetext StarglowHouse4FishingGuruText3
	verbosegiveitem GOOD_ROD
.haverod
	writetext StarglowHouse4FishingGuruText4
	waitbutton
	closetext
	end
	
StarglowHouse4FishingGuruText1:
	text "Hey, kid."
	
	para "I am the fabulous"
	line "FISHING GURU!"
	
	para "I'm sure my reputa-"
	line "tion preceeds me."
	
	para "What's that?"
	
	para "You've never heard"
	line "of me?"
	
	para "Well, you must be"
	line "new in town."
	
	para "That's the only"
	line "conceivable way"
	cont "you'd have never"
	cont "heard of my many"
	cont "exploits!"
	
	para "Of all the fisher-"
	line "men in this town"
	cont "I am the best!"
	
	para "There's not man nor"
	line "mon out there that"
	cont "could ever best my"
	cont "fishing abilities!"
	
	para "Hahahahah!"
	
	para "I like the look in"
	line "your eyes, kid."
	
	para "So fierce!"
	line "So determined!"
	
	para "Reminds me of my-"
	line "self at your age."
	
	para "Tell you what."
	
	para "Prove your mettle"
	line "as a fisherman by"
	cont "catching me a"
	cont "MAGIKARP."
	
	para "MAGIKARP can be"
	line "found everywhere"
	cont "around here, so"
	cont "it shouldn't be"
	cont "too tough."
	done
	
StarglowHouse4FishingGuruText2:
	text "Get out there and"
	line "catch me a good"
	cont "MAGIKARP!"
	
	para "I promise it'll be"
	line "worth your time."
	done
	
StarglowHouse4FishingGuruText3:
	text "Oh!"
	
	para "Is that a"
	line "MAGIKARP?"
	
	para "And it's a beauty,"
	line "too!"
	
	para "Good work, kid!"
	
	para "If I didn't know"
	line "any better, I'd say"
	cont "that I caught it"
	cont "myself!"
	
	para "Anyway, here's that"
	line "reward I promised."
	prompt
	
StarglowHouse4FishingGuruText4:
	text "With that GOOD ROD"
	line "you can catch lots"
	cont "of new #MON!"
	
	para "No more fishing up"
	line "MAGIKARP after"
	cont "MAGIKARP."
	
	para "You'll be a fishing"
	line "pro!"
	
	para "Not as good as me,"
	line "of course!"
	
	para "Hahahahah!"
	done
