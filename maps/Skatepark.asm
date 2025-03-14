Skatepark_MapScriptHeader:
	db 4 ; scene scripts
	scene_script SkateparkTrigger0
	scene_script SkateparkTrigger1
	scene_script SkateparkTrigger2
	scene_script SkateparkTrigger3

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, SkateparkCallback

	db 1 ; warp events
	warp_def 41,  1, 7, FLICKER_STATION

	db 34 ; coord events
	coord_event 15, 28, 2, SkateparkFountain
	coord_event 18, 28, 2, SkateparkFountain
	coord_event 15, 31, 2, SkateparkFountain
	coord_event 18, 31, 2, SkateparkFountain
	coord_event  5, 48, 2, SkateparkRail1
	coord_event  5, 54, 2, SkateparkRail1
	coord_event  8, 51, 2, SkateparkRail2
	coord_event 13, 53, 2, SkateparkRail3
	coord_event 16, 50, 2, SkateparkRail4
	coord_event 22, 50, 2, SkateparkRail4
	coord_event 19, 53, 2, SkateparkRail5
	coord_event 19, 40, 2, SkateparkRail5
	coord_event  7, 60, 2, SkateparkFlowerBed1
	coord_event 10, 60, 2, SkateparkFlowerBed1
	coord_event 12, 60, 2, SkateparkFlowerBed1
	coord_event 15, 60, 2, SkateparkFlowerBed1
	coord_event 17, 60, 2, SkateparkFlowerBed1
	coord_event 20, 60, 2, SkateparkFlowerBed1
	coord_event 12, 38, 2, SkateparkFlowerBed2
	coord_event 15, 38, 2, SkateparkFlowerBed2
	coord_event 10, 32, 2, SkateparkFlowerBed3
	coord_event 10, 35, 2, SkateparkFlowerBed3
	coord_event 10, 26, 2, SkateparkFlowerBed4
	coord_event 10, 29, 2, SkateparkFlowerBed4
	coord_event 23, 32, 2, SkateparkFlowerBed5
	coord_event 23, 35, 2, SkateparkFlowerBed5
	coord_event 23, 26, 2, SkateparkFlowerBed6
	coord_event 23, 29, 2, SkateparkFlowerBed6
	coord_event 10, 23, 2, SkateparkFlowerBed7
	coord_event 13, 23, 2, SkateparkFlowerBed7
	coord_event 15, 23, 2, SkateparkFlowerBed7
	coord_event 18, 23, 2, SkateparkFlowerBed7
	coord_event 20, 23, 2, SkateparkFlowerBed7
	coord_event 23, 23, 2, SkateparkFlowerBed7

	db 0 ; bg events

	db 15 ; object events
	person_event SPRITE_VALVE_2, 42,  9, SPRITEMOVEDATA_HALFPIPE_1, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_VALVE_2, 42, 15, SPRITEMOVEDATA_HALFPIPE_2, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_SKATER, 24, 16, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SkateparkTMNpc, EVENT_SKATEPARK_NPCS_GONE
	person_event SPRITE_SKATER, 42, 18, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, SkateparkGuard, EVENT_SKATEPARK_GUARDS_GONE
	person_event SPRITE_SKATER, 42, 20, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SkateparkGuard, EVENT_SKATEPARK_GUARDS_GONE
	person_event SPRITE_SKATER, 48, 11, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SkateparkNPC1, EVENT_SKATEPARK_NPCS_GONE
	person_event SPRITE_SKATER, 53, 22, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, SkateparkNPC2, EVENT_SKATEPARK_NPCS_GONE
	person_event SPRITE_SKATER, 59, 18, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, SkateparkNPC3, EVENT_SKATEPARK_NPCS_GONE
	person_event SPRITE_SKATER, 51,  2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SkateparkNPC4, EVENT_SKATEPARK_NPCS_GONE
	person_event SPRITE_SKATER, 50, 19, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_SKATEPARK_NPCS_GONE
	person_event SPRITE_CUTE_GIRL, 58,  6, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SkateparkNPC5, EVENT_SKATEPARK_NPCS_GONE
	person_event SPRITE_PONYTAIL, 58,  7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SkateparkNPC6, EVENT_SKATEPARK_NPCS_GONE
	person_event SPRITE_SKATER, 35, 13, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, SkateparkNPC7, EVENT_SKATEPARK_NPCS_GONE
	person_event SPRITE_SKATER, 29, 19, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, SkateparkNPC8, EVENT_SKATEPARK_NPCS_GONE
	person_event SPRITE_SKATER, 34, 21, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SkateparkNPC9, EVENT_SKATEPARK_NPCS_GONE
	
	
SkateparkCallback:
	setevent EVENT_ROUTE_12_SKATERS_GONE
	return
	
SkateparkTrigger0:
SkateparkTrigger2:
	end
	
SkateparkTrigger1:
	callasm SkateparkClearContestStuffAsm
	pause 20
	opentext
	writetext SkateparkCountdown3
	playsound SFX_TALLY
	pause 25
	writetext SkateparkCountdown2
	playsound SFX_TALLY
	pause 25
	writetext SkateparkCountdown1
	playsound SFX_TALLY
	pause 25
	writetext SkateparkCountdownGo
	playsound SFX_THROW_BALL
	pause 25
	closetext
	dotrigger $2
	playmusic MUSIC_GSC_GAME_CORNER
	setevent EVENT_SKATEPARK_CONTEST_TIMER
	end
	
SkateparkTrigger3:
	playmapmusic
	pause 20
	opentext
	writetext SkateparkTMNPCText2	;TODO let the player lose
	waitbutton
	verbosegivetmhm TM_RAPID_SPIN
	writetext SkateparkTMNPCText8
	waitbutton
	closetext
	setevent EVENT_DONE_SKATEBOARD_CONTEST_ONCE
	setevent EVENT_DONE_SKATEBOARD_CONTEST_TODAY	;TODO daily event
	dotrigger $0
	end
	
SkateparkClearContestStuffAsm:
	xor a
	ld [wSkateparkCurTrick], a
	ld [wSkateparkComboTimer], a
	ld [wSkateparkScore], a
	ld [wSkateparkCombo], a
	ld [wSkateparkStaleTrick1], a
	ld [wSkateparkStaleTrick2], a
	ld [wSkateparkStaleTrick3], a
	ld [wSkateparkStaleTrick4], a
	ret
	
SkateparkCountdown3:
	text "3…"
	done
	
SkateparkCountdown2:
	text "2…"
	done
	
SkateparkCountdown1:
	text "1…"
	done
	
SkateparkCountdownGo:
	text "GO!"
	done
	
SkateparkGuard:
	checkcode VAR_FACING
	if_equal DOWN, .yourefacingdown
	jumptextfaceplayer SkateparkGuardText1
.yourefacingdown
	jumptextfaceplayer SkateparkGuardText2
	
SkateparkGuardText1:
	text "RAPID SPIN only"
	line "past here."
	
	para "You aren't with"
	line "us, so scram!"
	done
	
SkateparkGuardText2:
	text "What!?"
	
	para "How'd you get past"
	line "us?"
	done
	
SkateparkNPC1:
	jumptextfaceplayer SkateparkNPC1Text
	
SkateparkNPC1Text:
	text "All the coolest"
	line "skaters here are"
	cont "part of a group"
	cont "called RAPID SPIN."
	
	para "They treat others"
	line "like second-class"
	cont "citizens!"
	done
	
SkateparkNPC2:
	jumptextfaceplayer SkateparkNPC2Text
	
SkateparkNPC2Text:
	text "Remember to OLLIE"
	line "at the end of a"
	cont "rail, or you'll"
	cont "fall!"
	done
	
SkateparkNPC3:
	jumptextfaceplayer SkateparkNPC3Text
	
SkateparkNPC3Text:
	text "I like grinding"
	line "the flowerbeds."
	
	para "You can't do a"
	line "GRIND TURN on a"
	cont "rail like you can"
	cont "a flowerbed."
	done
	
SkateparkNPC4:
	jumptextfaceplayer SkateparkNPC4Text
	
SkateparkNPC4Text:
	text "I keep bailing!"
	
	para "It feels like I'll"
	line "never get the hang"
	cont "of this!"
	done
	
SkateparkNPC5:
	faceplayer
	opentext
	writetext SkateparkNPC5Text
	waitbutton
	closetext
	spriteface 11, RIGHT
	end
	
SkateparkNPC5Text:
	text "RAPID SPIN are"
	line "so cool!"
	done
	
SkateparkNPC6:
	faceplayer
	opentext
	writetext SkateparkNPC6Text
	waitbutton
	closetext
	spriteface 12, LEFT
	end
	
SkateparkNPC6Text:
	text "You're a skater,"
	line "huh?"
	
	para "Are you part of"
	line "RAPID SPIN?"
	done
	
SkateparkNPC7:
	jumptextfaceplayer SkateparkNPC7Text
	
SkateparkNPC7Text:
	text "Your board…"
	
	para "Doesn't that"
	line "belong to the"
	cont "leader of"
	cont "“THE NIDOKINGS”?"
	done
	
SkateparkNPC8:
	jumptextfaceplayer SkateparkNPC8Text
	
SkateparkNPC8Text:
	text "If you GRIND TURN"
	line "on the fountain,"
	cont "you can grind"
	cont "forever!"
	done
	
SkateparkNPC9:
	checktmhm TM_RAPID_SPIN
	iftrue .yes
	jumptextfaceplayer SkateparkNPC9Text1
.yes
	jumptextfaceplayer SkateparkNPC9Text2
	
SkateparkNPC9Text1:
	text "…"
	
	para "You ain't"
	line "RAPID SPIN!"
	
	para "You didn't say our"
	line "iconic greeting!"
	done
	
SkateparkNPC9Text2:
	text "What up,"
	line "RAPID SPIN?"
	
	para "As you know,"
	line "that's our iconic"
	cont "greeting!"
	done
	
SkateparkRail1:
	callasm SkateparkRail1Asm
	end
	
SkateparkRail2:
	callasm SkateparkRail2Asm
	end
	
SkateparkRail3:
	callasm SkateparkRail3Asm
	end
	
SkateparkRail4:
	callasm SkateparkRail4Asm
	end
	
SkateparkRail5:
	callasm SkateparkRail5Asm
	end
	
SkateparkFlowerBed1:
	callasm SkateparkFlowerBed1Asm
	end
	
SkateparkFlowerBed2:
	callasm SkateparkFlowerBed2Asm
	end
	
SkateparkFlowerBed3:
	callasm SkateparkFlowerBed3Asm
	end
	
SkateparkFlowerBed4:
	callasm SkateparkFlowerBed4Asm
	end
	
SkateparkFlowerBed5:
	callasm SkateparkFlowerBed5Asm
	end
	
SkateparkFlowerBed6:
	callasm SkateparkFlowerBed6Asm
	end
	
SkateparkFlowerBed7:
	callasm SkateparkFlowerBed7Asm
	end
	
SkateparkFountain:
	callasm SkateparkFountainAsm
	end
	
SkateparkRail1Asm:
	ld a, SKATEPARK_RAIL_1
	jr SkateparkTrickAsm
	
SkateparkRail2Asm:
	ld a, SKATEPARK_RAIL_2
	jr SkateparkTrickAsm
	
SkateparkRail3Asm:
	ld a, SKATEPARK_RAIL_3
	jr SkateparkTrickAsm
	
SkateparkRail4Asm:
	ld a, SKATEPARK_RAIL_4
	jr SkateparkTrickAsm
	
SkateparkRail5Asm:
	ld a, SKATEPARK_RAIL_5
	jr SkateparkTrickAsm
	
SkateparkFlowerBed1Asm:
	ld a, SKATEPARK_FLOWERBED_1
	jr SkateparkTrickAsm
	
SkateparkFlowerBed2Asm:
	ld a, SKATEPARK_FLOWERBED_2
	jr SkateparkTrickAsm
	
SkateparkFlowerBed3Asm:
	ld a, SKATEPARK_FLOWERBED_3
	jr SkateparkTrickAsm
	
SkateparkFlowerBed4Asm:
	ld a, SKATEPARK_FLOWERBED_4
	jr SkateparkTrickAsm
	
SkateparkFlowerBed5Asm:
	ld a, SKATEPARK_FLOWERBED_5
	jr SkateparkTrickAsm
	
SkateparkFlowerBed6Asm:
	ld a, SKATEPARK_FLOWERBED_6
	jr SkateparkTrickAsm
	
SkateparkFlowerBed7Asm:
	ld a, SKATEPARK_FLOWERBED_7
	jr SkateparkTrickAsm
	
SkateparkFountainAsm:
	ld a, SKATEPARK_FOUNTAIN
	
SkateparkTrickAsm:
	push af
	ld a, [wSkateparkCurTrick]
	cp 0
	jr nz, .nope
	pop af
	ld [wSkateparkCurTrick], a
	ret
.nope
	pop af
	ret
	
SkateparkTMNpc:
	faceplayer
	opentext
	checkevent EVENT_DONE_SKATEBOARD_CONTEST_TODAY
	iftrue .done_today
	checkevent EVENT_SKATEPARK_CONTEST_TIMER
	iftrue .contest_happening
	checkevent EVENT_SKATEPARK_SAID_NO
	iftrue .talked
	writetext SkateparkTMNPCText1
	jump .yesorno
.talked
	writetext SkateparkTMNPCText4
.yesorno
	yesorno
	iffalse .no
	writetext SkateparkTMNPCText5
.ask_understand
	yesorno
	iftrue .rules_done
	writetext SkateparkTMNPCText6
	jump .ask_understand
.rules_done
	writetext SkateparkTMNPCText7
	waitbutton
	closetext
	pause 5
	special Special_FadeOutMusic
	special FadeOutPalettes
	special Special_ForceSkateboard
	setevent EVENT_SKATEPARK_NPCS_GONE
	setevent EVENT_SKATEPARK_GUARDS_GONE
	dotrigger $1
	warp2 DOWN, SKATEPARK, $13, $22
	end
.no
	writetext SkateparkTMNpcTextNo
	waitbutton
	closetext
	setevent EVENT_SKATEPARK_SAID_NO
	end
.contest_happening
	writetext SkateparkTMNpcText3
	waitbutton
	closetext
	end
.done_today
	writetext SkateparkTMNPCText9
	waitbutton
	closetext
	end
	
SkateparkTimesUp::
	clearevent EVENT_SKATEPARK_CONTEST_TIMER
	special MapCallbackSprites_LoadUsedSpritesGFX
	opentext
	writetext SkateparkDoneText
	pause 80
	closetext
	pause 5
	special Special_FadeOutMusic
	special FadeOutPalettes
	special Special_ForceSkateboard
	clearevent EVENT_SKATEPARK_NPCS_GONE
	dotrigger $3	
	warp2 UP, SKATEPARK, $10, $19
	end

SkateparkTMNPCText1:
	text "So you got past"
	line "my boys."
	
	para "You think you're"
	line "pretty big, huh?"
	
	para "Think you're bad"
	line "enough to hang"
	cont "with RAPID SPIN?"
	
	para "How about a little"
	line "competition, then?"
	
	para "If you beat my"
	line "score, I'll let"
	cont "you hang with us."
	
	para "You may even get"
	line "something good."
	
	para "How about it?"
	done
	
SkateparkTMNPCText2:
	text "YOU WIN!"
	line "PLACEHOLDER TEXT"
	
	para "Alright, alright."
	
	para "I gotta admit,"
	line "that wasn't too"
	cont "bad."
	
	para "You seem cool.<WAIT_S>"
	line "You can hang."
	
	para "Here."
	done
	
SkateparkTMNpcText3:
	text "Go!"
	
	para "Time is running"
	line "out!"
	done
	
SkateparkTMNPCText4:
	text "Changed your"
	line "mind?"
	
	para "Think you're bad"
	line "enough to hang"
	cont "with RAPID SPIN?"
	done
	
SkateparkTMNPCText5:
	text "Alright!"
	
	para "It's on like"
	line "KANGASKHAN!"
	
	para "Here are the"
	line "rules:"
	
	para "You get 60 seconds"
	line "to nail as many"
	cont "tricks as you can."
	
	para "Hit the fountain,"
	line "the flowerbeds,"
	cont "and the rails."
	
	para "Each will give"
	line "different point"
	cont "amounts."
	
	para "You can earn more"
	line "points by hopping"
	cont "rail to rail,"
	cont "or by going for"
	cont "GRIND TURNs."
	
	para "You'll earn less"
	line "points if you hit"
	cont "the same lines"
	cont "over and over."
	
	para "Oh, and if you eat"
	line "dirt, you'll lose"
	cont "half of the points"
	cont "you've earned."
	
	para "You got all that?"
	done
	
SkateparkTMNPCText6:
	text "I'll say it one"
	line "more time."
	
	para "You get 60 seconds"
	line "to nail as many"
	cont "tricks as you can."
	
	para "Hit the fountain,"
	line "the flowerbeds,"
	cont "and the rails."
	
	para "Each will give"
	line "different point"
	cont "amounts."
	
	para "You can earn more"
	line "points by hopping"
	cont "rail to rail, or"
	cont "by doing GRIND"
	cont "TURNs."
	
	para "If you keeping"
	line "hitting the same"
	cont "line, you'll earn"
	cont "less points."
	
	para "Oh, and if you eat"
	line "dirt, you'll lose"
	cont "half of the points"
	cont "you've earned."
	
	para "You got all that?"
	done
	
SkateparkTMNPCText7:
	text "Good."
	
	para "I'll tell you"
	line "your score when"
	cont "you're done."
	
	para "Just focus on"
	line "nailing tricks."
	
	para "Let's get this"
	line "going!"
	done
	
SkateparkTMNPCText8:
	text "That TM contains"
	line "RAPID SPIN."
	
	para "It's our signature"
	line "move!"
	
	para "It'll raise your"
	cont "speed and clear"
	cont "the field of any"
	cont "hazards!"
	
	para "Come back tomorrow"
	line "if you want to do"
	cont "another round."
	
	para "You might get"
	line "something good if"
	cont "you tear it up!"
	done
	
SkateparkTMNPCText9:
	text "Come back tomorrow"
	line "if you want to do"
	cont "another round."
	
	para "You might get"
	line "something good if"
	cont "you tear it up!"
	done
	
SkateparkTMNPCText10:
	text "YOU LOSE"
	line "PLACEHOLDER TEXT"
	
	para "Ha! <WAIT_S> I knew you"
	line "were a poser."
	
	para "Tell you what, I'll"
	line "give you another"
	cont "shot."
	
	para "Or are you gonna"
	line "run home to mommy?"
	done
	
SkateparkTMNpcTextNo:
	text "Well, at least you"
	line "know your place."
	done
	
SkateparkDoneText:
	text "TIME'S UP!"
	done
