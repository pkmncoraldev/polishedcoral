GlintGrove_MapScriptHeader:
	db 3 ; scene scripts
	scene_script GlintGroveTrigger0
	scene_script GlintGroveTrigger1
	scene_script GlintGroveTrigger2

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, GlintGrovePiles

	db 4 ; warp events
	warp_def 56, 27, 1, GLINT_GROVE_ENTRANCE
	warp_def 56, 26, 2, GLINT_GROVE_ENTRANCE
	warp_def 29, 49, 1, GLINT_GROVE_DEEP
	warp_def 45, 49, 2, GLINT_GROVE_DEEP

	db 7 ; coord events
	xy_trigger 0, 44, 24, 0, GlintGrovePile1, 0, 0
	xy_trigger 0, 38,  9, 0, GlintGrovePile2, 0, 0
	xy_trigger 0, 38, 30, 0, GlintGrovePile3, 0, 0
	xy_trigger 0, 26, 17, 0, GlintGrovePile4, 0, 0
	xy_trigger 0, 22, 26, 0, GlintGrovePile5, 0, 0
	xy_trigger 0, 46, 12, 0, GlintGrovePile6, 0, 0
	xy_trigger 0,  8, 29, 0, GlintGrovePile7, 0, 0

	db 0 ; bg events
;	signpost 50, 22, SIGNPOST_READ, GlintGroveClue

	db 18 ; object events
	person_event SPRITE_LASS, 40, 32, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 1, TrainerGlintGrove_1, -1
	person_event SPRITE_PICNICKER, 46, 6, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 3, TrainerGlintGrove_2, -1
	person_event SPRITE_CAMPER, 17, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 4, TrainerGlintGrove_3, -1
	person_event SPRITE_TWIN, 17, 31, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_GENERICTRAINER, 1, TrainerGlintGrove_4, -1
	person_event SPRITE_TWIN, 16, 31, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_GENERICTRAINER, 1, TrainerGlintGrove_5, -1
	person_event SPRITE_BUG_CATCHER, 8, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, TrainerGlintGrove_6, -1
	person_event SPRITE_STANLEY,  8, 16, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, GlintGroveStanley, EVENT_GLINT_GROVE_STANLEY
	person_event SPRITE_PONYTAIL, 50, 21, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GlintGroveNPC1, -1
	person_event SPRITE_CHILD, 53, 22, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GlintGroveNPC2, -1
	person_event SPRITE_PONYTAIL, 33, 16, SPRITEMOVEDATA_WANDER, 1, 3, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, GlintGroveNPC3, -1
	person_event SPRITE_POKEMANIAC, 52, 31, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, GlintGroveNPC4, -1
	itemball_event 10, 19, AWAKENING, 1, EVENT_GLINT_GROVE_POKE_BALL1
	person_event SPRITE_ELDER, 44, 29, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, GlintGrovePetalMan, -1
	person_event SPRITE_MISC_OVERHEAD, -1, -1, SPRITEMOVEDATA_TILE_DOWN_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_GENERICTRAINER, 1, 0, -1
	tmhmball_event 37, 22, TM_METAL_CLAW, EVENT_GLINT_GROVE_POKE_BALL2
	fruittreeinvis_event 15, 41, FRUITTREE_GLINT_GROVE_1, CHESTO_BERRY
	fruittreeinvis_event 17, 19, FRUITTREE_GLINT_GROVE_2, PECHA_BERRY
	tapeball_event 16, 14, MUSIC_LASS_ENCOUNTER, 2, EVENT_MUSIC_LASS_ENCOUNTER
	
	const_def 1 ; object constants
	const GLINTGROVE_TRAINER1
	const GLINTGROVE_TRAINER2
	const GLINTGROVE_TRAINER3
	const GLINTGROVE_TRAINER4
	const GLINTGROVE_TRAINER5
	const GLINTGROVE_TRAINER6
	const GLINTGROVE_STANLEY
	const GLINTGROVE_NPC1
	const GLINTGROVE_NPC2
	const GLINTGROVE_NPC3
	const GLINTGROVE_NPC4
	const GLINTGROVE_POKEBALL
	const GLINTGROVE_PETALMAN
	const GLINTGROVE_PETALS
	
GlintGroveTrigger0:
	end
	
GlintGroveTrigger1:
	end
	
GlintGroveTrigger2:
	end
	
GlintGrovePetalMan:
	jumptextfaceplayer GlintGrovePetalManText
	
GlintGrovePetalManText:
	text "Have you seen"
	line "piles of FLOWER"
	cont "PETALS around?"
	
	para "People collect"
	line "those petals to"
	cont "make into tea."
	
	para "Watch out, though."
	
	para "Sometimes they'll"
	line "blow away before"
	cont "you get the chance"
	cont "to grab any."
	
	para "#MON have also"
	line "been known to hide"
	cont "in them!"
	done
	
PetalsAsm:
	call Random
	cp $7f ; 50 percent
	jr c, PetalsAsmItem
	call Random
	cp $7f ; 50 percent
	jr c, PetalsAsmBattle
	jr PetalsAsmText
	ret
	
PetalsAsm2:
	call Random
	cp $7f ; 50 percent
	jr c, PetalsAsmBattle
	call Random
	cp $7f ; 50 percent
	jr c, PetalsAsmItem
	jr PetalsAsmText
	ret
	
PetalsAsm3:
	call Random
	cp $7f ; 50 percent
	jr c, PetalsAsmText
	call Random
	cp $7f ; 50 percent
	jr c, PetalsAsmBattle
	jr PetalsAsmItem
	ret
	
PetalsAsmBattle:
	farcall PetalMonEncounter
	ld a, BANK(GlintPetalsWildBattleScript)
	ld hl, GlintPetalsWildBattleScript
	call CallScript
	scf
	ret
	
PetalsAsmText:
	ld hl, GroveTestText1
	call PrintText
	ret
	
PetalsAsmItem:
	ld b, BANK(GlintGivePetalScript)
	ld de, GlintGivePetalScript
	push de
	ld hl, wScriptStackSize
	ld e, [hl]
	inc [hl]
	ld d, $0
	ld hl, wScriptStack
	add hl, de
	add hl, de
	add hl, de
	pop de
	ld a, [wScriptBank]
	ld [hli], a
	ld a, [wScriptPos]
	ld [hli], a
	ld a, [wScriptPos + 1]
	ld [hl], a
	ld a, b
	ld [wScriptBank], a
	ld a, e
	ld [wScriptPos], a
	ld a, d
	ld [wScriptPos + 1], a
	ret
	
GroveTestText1: ; 0x6045
	text_jump GlintGrove_TestText
	start_asm
	ld hl, GroveTestText2
	ret
	
GroveTestText2:
	text_waitbutton
	db "@@"
	
GlintGivePetalScript:
	verbosegiveitem FLOWER_PETAL
	end
	
GlintPetalsWildBattleScript:
	copybytetovar wTempWildMonSpecies
	randomwildmon
	startbattle
	reloadmapafterbattle
	end
	
GlintGrove_TestText:
	text "The petals blew"
	line "away…"
	done
	
GlintGrovePile1:
	checkflag ENGINE_GLINT_GROVE_PILE_1
	iftrue .end
	special Special_StopRunning
	disappear GLINTGROVE_PETALS
	refreshscreen
	callasm MakePalPink
	moveperson GLINTGROVE_PETALS, $18, $2c
	appear GLINTGROVE_PETALS
	playsound SFX_POWDER
	changeblock $18, $2c, $2b
	reloadmappart
	pause 3
	disappear GLINTGROVE_PETALS
	opentext
	setflag ENGINE_GLINT_GROVE_PILE_1
	checkevent EVENT_GOT_PETAL_PILE_1
	iffalse GlintGroveFirstPile
	checkevent EVENT_GOT_PETAL_PILE_2
	iffalse GlintGroveSecondPile
	callasm PetalsAsm2
	closetext
	callasm MakePalGreen
.end
	end
	
GlintGrovePile2:
	checkflag ENGINE_GLINT_GROVE_PILE_2
	iftrue .end
	special Special_StopRunning
	disappear GLINTGROVE_PETALS
	refreshscreen
	callasm MakePalPink
	moveperson GLINTGROVE_PETALS, $9, $26
	appear GLINTGROVE_PETALS
	playsound SFX_POWDER
	changeblock $8, $26, $2b
	reloadmappart
	pause 3
	disappear GLINTGROVE_PETALS
	opentext
	setflag ENGINE_GLINT_GROVE_PILE_2
	checkevent EVENT_GOT_PETAL_PILE_1
	iffalse GlintGroveFirstPile
	checkevent EVENT_GOT_PETAL_PILE_2
	iffalse GlintGroveSecondPile
	callasm PetalsAsm
	closetext
	callasm MakePalGreen
.end
	end
	
GlintGrovePile3:
	checkflag ENGINE_GLINT_GROVE_PILE_3
	iftrue .end
	special Special_StopRunning
	disappear GLINTGROVE_PETALS
	refreshscreen
	callasm MakePalPink
	moveperson GLINTGROVE_PETALS, $1e, $26
	appear GLINTGROVE_PETALS
	playsound SFX_POWDER
	changeblock $1e, $26, $2b
	reloadmappart
	pause 3
	disappear GLINTGROVE_PETALS
	opentext
	verbosegiveitem FLOWER_PETAL
	closetext
	setflag ENGINE_GLINT_GROVE_PILE_3
	checkevent EVENT_GOT_PETAL_PILE_1
	iffalse GlintGroveFirstPile2
	checkevent EVENT_GOT_PETAL_PILE_2
	iffalse GlintGroveSecondPile2
	callasm MakePalGreen
.end
	end
	
GlintGrovePile4:
	checkflag ENGINE_GLINT_GROVE_PILE_4
	iftrue .end
	special Special_StopRunning
	disappear GLINTGROVE_PETALS
	refreshscreen
	callasm MakePalPink
	moveperson GLINTGROVE_PETALS, $11, $1a
	appear GLINTGROVE_PETALS
	playsound SFX_POWDER
	changeblock $10, $1a, $2b
	reloadmappart
	pause 3
	disappear GLINTGROVE_PETALS
	opentext
	setflag ENGINE_GLINT_GROVE_PILE_4
	checkevent EVENT_GOT_PETAL_PILE_1
	iffalse GlintGroveFirstPile
	checkevent EVENT_GOT_PETAL_PILE_2
	iffalse GlintGroveSecondPile
	callasm PetalsAsm3
	closetext
	callasm MakePalGreen
.end
	end
	
GlintGrovePile5:
	checkflag ENGINE_GLINT_GROVE_PILE_5
	iftrue .end
	special Special_StopRunning
	disappear GLINTGROVE_PETALS
	refreshscreen
	callasm MakePalPink
	moveperson GLINTGROVE_PETALS, $1a, $16
	appear GLINTGROVE_PETALS
	playsound SFX_POWDER
	changeblock $1a, $16, $2b
	reloadmappart
	pause 3
	disappear GLINTGROVE_PETALS
	opentext
	verbosegiveitem FLOWER_PETAL
	closetext
	setflag ENGINE_GLINT_GROVE_PILE_5
	checkevent EVENT_GOT_PETAL_PILE_1
	iffalse GlintGroveFirstPile2
	checkevent EVENT_GOT_PETAL_PILE_2
	iffalse GlintGroveSecondPile2
	callasm MakePalGreen
.end
	end
	
GlintGrovePile6:
	checkflag ENGINE_GLINT_GROVE_PILE_6
	iftrue .end
	special Special_StopRunning
	disappear GLINTGROVE_PETALS
	refreshscreen
	callasm MakePalPink
	moveperson GLINTGROVE_PETALS, $c, $2e
	appear GLINTGROVE_PETALS
	playsound SFX_POWDER
	changeblock $c, $2e, $2b
	reloadmappart
	pause 3
	disappear GLINTGROVE_PETALS
	opentext
	setflag ENGINE_GLINT_GROVE_PILE_6
	checkevent EVENT_GOT_PETAL_PILE_1
	iffalse GlintGroveFirstPile
	checkevent EVENT_GOT_PETAL_PILE_2
	iffalse GlintGroveSecondPile
	callasm PetalsAsm3
	closetext
	callasm MakePalGreen
.end
	end
	
GlintGrovePile7:
	checkflag ENGINE_GLINT_GROVE_PILE_7
	iftrue .end
	special Special_StopRunning
	disappear GLINTGROVE_PETALS
	refreshscreen
	callasm MakePalPink
	moveperson GLINTGROVE_PETALS, $1d, $8
	appear GLINTGROVE_PETALS
	playsound SFX_POWDER
	changeblock $1c, $8, $2b
	reloadmappart
	pause 3
	disappear GLINTGROVE_PETALS
	opentext
	setflag ENGINE_GLINT_GROVE_PILE_7
	checkevent EVENT_GOT_PETAL_PILE_1
	iffalse GlintGroveFirstPile
	checkevent EVENT_GOT_PETAL_PILE_2
	iffalse GlintGroveSecondPile
	callasm PetalsAsm
	closetext
	callasm MakePalGreen
.end
	end
	
GlintGroveFirstPile:
	setevent EVENT_GOT_PETAL_PILE_1
	jump GlintGroveGivePetal
GlintGroveSecondPile:
	setevent EVENT_GOT_PETAL_PILE_2
GlintGroveGivePetal:
	verbosegiveitem FLOWER_PETAL
	closetext
	callasm MakePalGreen
	end
	
GlintGroveFirstPile2:
	setevent EVENT_GOT_PETAL_PILE_1
	end
	
GlintGroveSecondPile2:
	setevent EVENT_GOT_PETAL_PILE_2
	end
	
GlintGrovePiles:
	domaptrigger GLINT_GROVE_EAST, $1
	setevent EVENT_GLINT_GROVE_EAST_ROCKS_BROWN
	checkflag ENGINE_GLINT_GROVE_PILE_1
	iftrue .GlintGrovePile1
.cont1
	checkflag ENGINE_GLINT_GROVE_PILE_2
	iftrue .GlintGrovePile2
.cont2
	checkflag ENGINE_GLINT_GROVE_PILE_3
	iftrue .GlintGrovePile3
.cont3
	checkflag ENGINE_GLINT_GROVE_PILE_4
	iftrue .GlintGrovePile4
.cont4
	checkflag ENGINE_GLINT_GROVE_PILE_5
	iftrue .GlintGrovePile5
.cont5
	checkflag ENGINE_GLINT_GROVE_PILE_6
	iftrue .GlintGrovePile6
.cont6
	checkflag ENGINE_GLINT_GROVE_PILE_7
	iftrue .GlintGrovePile7
	return

.GlintGrovePile1:
	changeblock $18, $2c, $2b
	jump .cont1

.GlintGrovePile2:
	changeblock $8, $26, $2b
	jump .cont2
	
.GlintGrovePile3:
	changeblock $1e, $26, $2b
	jump .cont3
	
.GlintGrovePile4:
	changeblock $10, $1a, $2b
	jump .cont4
	
.GlintGrovePile5:
	changeblock $1a, $16, $2b
	jump .cont5
	
.GlintGrovePile6:
	changeblock $c, $2e, $2b
	jump .cont6
	
.GlintGrovePile7:
	changeblock $1c, $8, $2b
	return
	
TrainerGlintGrove_1:
	generictrainer LASS, VERONICA, EVENT_BEAT_GLINT_GROVE_TRAINER_1, .SeenText, .BeatenText
	
	text "Even when it"
	line "loses,"
	
	para "my CLEFAIRY is"
	line "still super cute."
	done

.SeenText:
	text "My CLEFAIRY is so"
	line "cute!"
	
	para "Look!"
	done

.BeatenText:
	text "Aww…"
	
	para "Why didn't you let"
	line "me win?"
	done
	
TrainerGlintGrove_2:
	generictrainer PICNICKER, MOLLY, EVENT_BEAT_GLINT_GROVE_TRAINER_2, .SeenText, .BeatenText
	
	text "I hope my boy-"
	line "friend is alright."
	done

.SeenText:
	text "Have you seen my"
	line "boyfriend?"
	
	para "He wandered off by"
	line "himself."
	
	para "I'm afraid he might"
	line "be lost."
	done

.BeatenText:
	text "Where could he be?"
	done
	
TrainerGlintGrove_3:
	generictrainer CAMPER, BART, EVENT_BEAT_GLINT_GROVE_TRAINER_3, .SeenText, .BeatenText
	
	text "Do you know which"
	line "way is the exit?"
	done

.SeenText:
	text "I think I'm lost."
	
	para "I lost track of my"
	line "girlfriend,"
	
	para "and now I can't"
	line "find my way back."
	done

.BeatenText:
	text "Now I'm lost AND"
	line "upset."
	done
	
TrainerGlintGrove_4:
	generictrainer TWINS, JENJAN, EVENT_BEAT_GLINT_GROVE_TRAINER_4, .SeenText, .BeatenText
	
	text "You can't win all"
	line "the time."
	done

.SeenText:
	text "JEN: Come on, JAN."
	
	para "JAN: Alright, JEN."
	done

.BeatenText:
	text "JEN: Oh well…"
	
	para "JAN: We'll do"
	line "better next time."
	done
	
TrainerGlintGrove_5:
	generictrainer TWINS, JANJEN, EVENT_BEAT_GLINT_GROVE_TRAINER_4, .SeenText, .BeatenText

	text "We're still kids."
	
	para "We'll be better"
	line "when we're older."
	done

.SeenText:
	text "JAN: Come on, JEN."
	
	para "JEN: Alright, JAN."
	done

.BeatenText:
	text "JAN: Oh well…"
	
	para "JEN: We'll do"
	line "better next time."
	done
	
TrainerGlintGrove_6:
	generictrainer BUG_CATCHER, BARNEY, EVENT_BEAT_GLINT_GROVE_TRAINER_6, .SeenText, .BeatenText
	
	text "The BUG CATCHER'S"
	line "life is not an"
	cont "easy one…"
	done

.SeenText:
	text "I figured I could"
	line "catch a bunch of"
	cont "different BUG-type"
	cont "#MON in this"
	cont "grove,"
	
	para "but all I can find"
	line "are VENIPEDE!"
	done

.BeatenText:
	text "GAHH!<WAIT_M>"
	line "VENIPEDE!"
	done

GlintGroveStanley:
	setevent EVENT_GLINT_GROVE_STANLEY
	opentext TEXTBOX_UNKNOWN
	writetext GlintGroveStanleyText1
	waitbutton
	closetext
	pause 10
	faceplayer
	opentext TEXTBOX_UNKNOWN
	writetext GlintGroveStanleyText2
	waitbutton
	closetext
	spriteface GLINTGROVE_STANLEY, DOWN
	pause 40
	faceplayer
	opentext TEXTBOX_UNKNOWN
	writetext GlintGroveStanleyText3
	buttonsound
	verbosegiveitem LIBRARY_CARD
	setevent EVENT_MET_STANLEY
;	callasm .MetStanley
	writetext GlintGroveStanleyText4
	buttonsound
	closetext
	checkcode VAR_FACING
	if_equal LEFT, .YouAreFacingLeft
	applymovement GLINTGROVE_STANLEY, Movement_GlintGroveStanley1
	disappear GLINTGROVE_STANLEY
	end
	
.YouAreFacingLeft
	applymovement GLINTGROVE_STANLEY, Movement_GlintGroveStanley2
	disappear GLINTGROVE_STANLEY
	end
	
;.MetStanley
;	ld hl, wMetGymLeaderFlags
;	set 0, [hl] ; metstanley
;	ret
	
GlintGroveNPC1:
	jumptextfaceplayer GlintGroveNPC1Text
	
GlintGroveNPC2:
	jumptextfaceplayer GlintGroveNPC2Text
	
GlintGroveNPC3:
	jumptextfaceplayer GlintGroveNPC3Text
	
GlintGroveNPC4:
	faceplayer
	opentext
;	checkevent EVENT_TRIO_BROS2
;	iffalse .NPC4_2
	writetext GlintGroveNPC4Text1
	waitbutton
	spriteface GLINTGROVE_NPC4, RIGHT
	closetext
	end
	
.NPC4_2
	writetext GlintGroveNPC4Text2
	waitbutton
	spriteface GLINTGROVE_NPC4, RIGHT
	closetext
	end
	
Movement_GlintGroveStanley1:
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end
	
Movement_GlintGroveStanley2:
	step_down
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end
	
GlintGroveStanleyText1:
	text "I see…<WAIT_L>"
	line "Interesting…"
	done
	
GlintGroveStanleyText2:
	text "I came here to"
	line "study this tree."
	
	para "It seems to radi-"
	line "ate some sort of"
	cont "strange energy."
	
	para "I believe that"
	line "energy is what"
	cont "attracts FAIRY-"
	cont "type #MON to"
	cont "this forest."
	done
	
GlintGroveStanleyText3:
	text "You're taking the"
	line "GYM CHALLENGE,"
	cont "correct?"
	
	para "You should visit "
	line "the #MON GYM in"
	cont "GLINT CITY."
	
	para "They won't let you"
	line "in without one of"
	cont "these."
	done
	
GlintGroveStanleyText4:
	text "Good luck at the"
	line "GYM, <WAIT_S>TRAINER."
	
	para "I've heard the"
	line "LEADER is an"
	cont "excellent battler."
	done
	
GlintGroveNPC1Text:
	text "You didn't hear it"
	line "from me,"
	
	para "but they say"
	line "there's a secret"
	cont "spot somewhere in"
	cont "this forest."
	
	para "Where?"
	
	para "Oh, I have no"
	line "idea."
	
	para "It's probably just"
	line "a rumor."
	done
	
GlintGroveNPC2Text:
	text "I saw a #MON"
	line "with a long, gooey"
	cont "tail in the grass!"
	
	para "My mom won't"
	line "believe me,"
	cont "but I saw it!"
	
	para "Honest!"
	done
	
GlintGroveNPC3Text:
	text "This grove is such"
	line "a pleasant place"
	cont "for a hike."
	
	para "I can see why the"
	line "FAIRY #MON"
	cont "are drawn here."
	done
	
GlintGroveNPC4Text1:
	text "I think I see a"
	line "clearing in the" 
	cont "trees down river."
	
	para "I wish I could"
	line "explore it,"
	cont "but I can't swim!"
	done
	
GlintGroveNPC4Text2:
	text "So what was over"
	line "there?"
	
	para "A nest of"
	line "SMEARGLE and"
	cont "three weird guys?"
	
	para "Man."
	
	para "I really need to"
	line "learn how to swim."
	done
	
;GlintGroveClue:
;	checkitem CLUE_2
;	iffalse .end
;	checkitem CLUE_3
;	iftrue .end
;	opentext
;	writetext GlintGroveClueText
;	waitbutton
;	verbosegiveitem CLUE_3
;	closetext
;	end
;.end
;	killsfx
;	end
	
;GlintGroveClueText:
;	text "You find something"
;	line "under the bench…"
	
;	para "It's another clue!"
;	done
