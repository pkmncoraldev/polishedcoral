GlintGrove_MapScriptHeader:
	db 3 ; scene scripts
	scene_script GlintGroveTrigger0
	scene_script GlintGroveTrigger1
	scene_script GlintGroveTrigger2

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, GlintGrovePiles

	db 5 ; warp events
	warp_def 58, 27, 1, GLINT_GROVE_ENTRANCE
	warp_def 58, 26, 2, GLINT_GROVE_ENTRANCE
	warp_def  1, 16, 1, GLINT_GROVE_NORTH
	warp_def  1, 17, 2, GLINT_GROVE_NORTH
	warp_def 45, 53, 1, GLINT_GROVE_UNDERGROUND

	db 7 ; coord events
	xy_trigger 0, 46, 24, 0, GlintGrovePile1, 0, 0
	xy_trigger 0, 40,  9, 0, GlintGrovePile2, 0, 0
	xy_trigger 0, 40, 30, 0, GlintGrovePile3, 0, 0
	xy_trigger 0, 28, 17, 0, GlintGrovePile4, 0, 0
	xy_trigger 0, 24, 26, 0, GlintGrovePile5, 0, 0
	xy_trigger 0, 48, 12, 0, GlintGrovePile6, 0, 0
	xy_trigger 0, 10, 29, 0, GlintGrovePile7, 0, 0

	db 8 ; bg events
	signpost  7, 15, SIGNPOST_JUMPTEXT, GlintGroveBigTreeText
	signpost  7, 16, SIGNPOST_JUMPTEXT, GlintGroveBigTreeText
	signpost  7, 17, SIGNPOST_JUMPTEXT, GlintGroveBigTreeText
	signpost  8, 15, SIGNPOST_JUMPTEXT, GlintGroveBigTreeText
	signpost  8, 17, SIGNPOST_JUMPTEXT, GlintGroveBigTreeText
	signpost  9, 15, SIGNPOST_JUMPTEXT, GlintGroveBigTreeText
	signpost  9, 16, SIGNPOST_JUMPTEXT, GlintGroveBigTreeText
	signpost  9, 17, SIGNPOST_JUMPTEXT, GlintGroveBigTreeText

	db 20 ; object events
	person_event SPRITE_LASS, 42, 32, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 1, TrainerGlintGrove_1, -1
	person_event SPRITE_PICNICKER, 48,  6, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 3, TrainerGlintGrove_2, -1
	person_event SPRITE_CAMPER, 19,  7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 4, TrainerGlintGrove_3, -1
	person_event SPRITE_TWIN, 19, 31, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_GENERICTRAINER, 1, TrainerGlintGrove_4, -1
	person_event SPRITE_TWIN, 18, 31, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_GENERICTRAINER, 1, TrainerGlintGrove_5, -1
	person_event SPRITE_BUG_CATCHER, 10,  4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, TrainerGlintGrove_6, -1
	person_event SPRITE_DISGUISEMAN,  5, 16, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GlintGroveMina, EVENT_GLINT_GROVE_POKE_BALL
	person_event SPRITE_SNUBBULL_SHRINK,  5, 17, SPRITEMOVEDATA_POKEMON_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, GlintGroveSnubbull, EVENT_GLINT_GROVE_MINA_GONE
	person_event SPRITE_PONYTAIL, 52, 21, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GlintGroveNPC1, -1
	person_event SPRITE_PONYTAIL, 35, 16, SPRITEMOVEDATA_WANDER, 1, 3, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, GlintGroveNPC3, -1
	person_event SPRITE_POKEMANIAC, 54, 31, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, GlintGroveNPC4, -1
	itemball_event 10, 21, AWAKENING, 1, EVENT_GLINT_GROVE_POKE_BALL1
	person_event SPRITE_ELDER, 46, 29, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, GlintGrovePetalMan, -1
	person_event SPRITE_ICESKATER_VARIABLE,  4, 17, SPRITEMOVEDATA_TILE_DOWN_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_GENERICTRAINER, 1, 0, -1
	strengthboulder_event 52, 49, EVENT_GLINT_GROVE_BOULDER_1
	strengthboulder_event 53, 50, EVENT_GLINT_GROVE_BOULDER_2
	tmhmball_event 37, 24, TM_METAL_CLAW, EVENT_TM31
	fruittreeinvis_event 15, 63, FRUITTREE_GLINT_GROVE_1, CHESTO_BERRY
	fruittreeinvis_event 17, 41, FRUITTREE_GLINT_GROVE_2, PECHA_BERRY
	tapeball_event 17, 36, MUSIC_LASS_ENCOUNTER, 2, EVENT_MUSIC_LASS_ENCOUNTER
	
	
	const_def 1 ; object constants
	const GLINTGROVE_TRAINER1
	const GLINTGROVE_TRAINER2
	const GLINTGROVE_TRAINER3
	const GLINTGROVE_TRAINER4
	const GLINTGROVE_TRAINER5
	const GLINTGROVE_TRAINER6
	const GLINTGROVE_MINA
	const GLINTGROVE_SNUBBULL
	const GLINTGROVE_NPC1
	const GLINTGROVE_NPC3
	const GLINTGROVE_NPC4
	const GLINTGROVE_POKEBALL
	const GLINTGROVE_PETALMAN
	const GLINTGROVE_PETALS
	
GlintGroveTrigger0:
GlintGroveTrigger1:
GlintGroveTrigger2:
	special Special_UpdatePalsInstant
	end
	
GlintGroveBigTreeText:
	text "A huge tree!"
	
	para "It gives off a"
	line "pleasant aura."
	
	para "Its thick roots"
	line "stretch deep"
	cont "underground."
	done
	
GlintGrovePetalMan:
	jumptextfaceplayer GlintGrovePetalManText
	
GlintGrovePetalManText:
	text "Have you seen the"
	line "piles of FLOWER"
	cont "PETALS around?"
	
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
	
GlintGroveSecret:
	dw EVENT_GOT_GLINT_GROVE_SECRET
	opentext
	loadvar wScriptVar, CHERISH_BALL
	itemtotext $0, $0
	writetext .found_text
	giveitem ITEM_FROM_MEM
	iffalse .bag_full
	setevent EVENT_GOT_GLINT_GROVE_SECRET
	specialsound
	itemnotify
	endtext
	special Special_IncSecretCounter
.bag_full
	buttonsound
	pocketisfull
	endtext
.found_text
	; found @ !
	text_jump UnknownText_0x1c0a1c
	db "@"
	
GlintGroveAnimatePetals:
	special Special_StopRunning
	disappear GLINTGROVE_PETALS
	refreshscreen
	callasm MakePalPink
	variablesprite SPRITE_ICESKATER_VARIABLE, SPRITE_MISC_OVERHEAD
	callasm GlintGroveMovePetalsAsm
	appear GLINTGROVE_PETALS
	playsound SFX_POWDER
	callasm GlintGroveClearGroundPetalsAsm
	reloadmappart
	pause 1
	applyonemovement GLINTGROVE_PETALS, turn_step_down
	pause 1
	disappear GLINTGROVE_PETALS
	applyonemovement PLAYER, remove_fixed_facing
	checkevent EVENT_GLINT_GROVE_MINA_GONE
	iftrue .mina_gone
	variablesprite SPRITE_ICESKATER_VARIABLE, SPRITE_BOULDER_ROCK_FOSSIL
	moveperson GLINTGROVE_PETALS, 17, 4
	jump .cont
.mina_gone
	moveperson GLINTGROVE_PETALS, -1, -1
.cont
	appear GLINTGROVE_PETALS
	end
	
GlintGroveClearGroundPetalsAsm:
	ld a, [wXCoord]
	add 4
	ld d, a
	ld a, [wYCoord]
	add 4
	ld e, a
	call GetBlockLocation
	ld a, $2b
	ld [hl], a
	call BufferScreen
	jp GetMovementPermissions
	
GlintGroveMovePetalsAsm:
	ld b, GLINTGROVE_PETALS
	ld a, [wXCoord]
	add 4
	ld d, a
	ld a, [wYCoord]
	add 4
	ld e, a
	farjp CopyDECoordsToMapObject
	
GlintGrovePile1:
	checkflag ENGINE_GLINT_GROVE_PILE_1
	iftrue .end
	scall GlintGroveAnimatePetals
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
	scall GlintGroveAnimatePetals
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
	scall GlintGroveAnimatePetals
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
	scall GlintGroveAnimatePetals
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
	scall GlintGroveAnimatePetals
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
	scall GlintGroveAnimatePetals
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
	scall GlintGroveAnimatePetals
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
	variablesprite SPRITE_DISGUISEMAN, SPRITE_MINA
	variablesprite SPRITE_ICESKATER_VARIABLE, SPRITE_BOULDER_ROCK_FOSSIL
	checkevent EVENT_GLINT_GROVE_MINA_GONE
	iffalse .skip_mina
	variablesprite SPRITE_DISGUISEMAN, SPRITE_MISC_PALM
	variablesprite SPRITE_ICESKATER_VARIABLE, SPRITE_MISC_OVERHEAD
	moveperson GLINTGROVE_MINA, 50, 52
.skip_mina
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
	changeblock 24, 46, $2b
	jump .cont1

.GlintGrovePile2:
	changeblock 9, 40, $2b
	jump .cont2
	
.GlintGrovePile3:
	changeblock 30, 40, $2b
	jump .cont3
	
.GlintGrovePile4:
	changeblock 17, 28, $2b
	jump .cont4
	
.GlintGrovePile5:
	changeblock 26, 24, $2b
	jump .cont5
	
.GlintGrovePile6:
	changeblock 12, 48, $2b
	jump .cont6
	
.GlintGrovePile7:
	changeblock 29, 10, $2b
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
	
GlintGroveNPC1:
	jumptextfaceplayer GlintGroveNPC1Text
	
GlintGroveNPC2:
	jumptextfaceplayer GlintGroveNPC2Text
	
GlintGroveNPC3:
	jumptextfaceplayer GlintGroveNPC3Text
	
GlintGroveNPC4:
	faceplayer
	opentext
	writetext GlintGroveNPC4Text
	waitbutton
	spriteface GLINTGROVE_NPC4, RIGHT
	closetext
	end
	
GlintGroveNPC1Text:
	text "You didn't hear"
	line "it from me,"
	
	para "but they say"
	line "there's a secret"
	cont "spot somewhere"
	cont "in these woods."
	
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
	
GlintGroveNPC4Text:
	text "I think I see a"
	line "clearing in the" 
	cont "trees downriver."
	
	para "I wish I could"
	line "explore it,"
	cont "but I can't swim!"
	done

GlintGroveSnubbull:
	opentext TEXTBOX_POKEMON, SNUBBULL
	writetext GlintGroveSnubbullText1
	cry SNUBBULL
	waitsfx
	buttonsound
	writetext GlintGroveSnubbullText2
	waitbutton
	closetext
	end
	
GlintGroveSnubbullText1:
	text "…<WAIT_S>Snub…"
	done
	
GlintGroveSnubbullText2:
	text "It's panting…"
	done

GlintGroveShinyStone:
	loadvar wCurItemBallContents, SHINY_STONE
	loadvar wCurItemBallQuantity, 1
	farscall FindItemInBallScript
	iffalse .end
	disappear GLINTGROVE_MINA
.end
	end

GlintGroveMina:
	checkevent EVENT_GLINT_GROVE_MINA_GONE
	iftrue GlintGroveShinyStone
	waitsfx
	playmusic MUSIC_MINA
	pause 5
	checkevent EVENT_TALKED_TO_MINA_ONCE
	iftrue .talked
	setevent EVENT_TALKED_TO_MINA_ONCE
	opentext TEXTBOX_UNKNOWN
	writetext GlintGroveMinaText10
	waitbutton
	closetext
	pause 10
	faceplayer
	opentext TEXTBOX_UNKNOWN
	writetext GlintGroveMinaText1
	waitbutton
	closetext
	spriteface GLINTGROVE_MINA, DOWN
	pause 40
	faceplayer
	opentext TEXTBOX_MINA
	writetext GlintGroveMinaText2
	buttonsound
	farwritetext StdBlankText
	pause 6
	spriteface GLINTGROVE_MINA, UP
	writetext GlintGroveMinaText3
	buttonsound
	farwritetext StdBlankText
	pause 6
	faceplayer
	writetext GlintGroveMinaText4
	waitbutton
	checkitem BLOSSOM_TEA
	iftrue .have_tea
	spriteface GLINTGROVE_MINA, UP
	closetext
	special Special_FadeOutMusic
	pause 5
	playmapmusic
	end
.talked
	opentext TEXTBOX_MINA
	writetext GlintGroveMinaText10
	waitbutton
	closetext
	pause 10
	faceplayer
	checkevent EVENT_DIDNT_GIVE_MINA_TEA
	iftrue .said_no
	checkitem BLOSSOM_TEA
	iftrue .talked_have_tea
.talked_no_tea
	opentext TEXTBOX_MINA
	writetext GlintGroveMinaText4
	waitbutton
	closetext
	spriteface GLINTGROVE_MINA, UP
	end
.talked_have_tea
	opentext TEXTBOX_MINA
;	playmusic MUSIC_MINA
	writetext GlintGroveMinaText4
.have_tea
	farwritetext StdBlankText
	pause 6
	writetext GlintGroveMinaText5
	yesorno
	iffalse .no
	writetext GlintGroveMinaGiveText
	takeitem BLOSSOM_TEA
	playsound SFX_LEVEL_UP 
	waitsfx
	closetext
.return
	pause 5
	spriteface GLINTGROVE_MINA, RIGHT
	opentext TEXTBOX_MINA
	writetext GlintGroveMinaText6
	waitbutton
	closetext
	pause 5
	playsound SFX_POTION
	waitsfx
	pause 10
	opentext TEXTBOX_MINA
	writetext GlintGroveMinaText11
	waitbutton
	closetext
	pause 5
	playsound SFX_JUMP_OVER_LEDGE
	applymovement GLINTGROVE_SNUBBULL, Movement_GlintGroveHops
	playsound SFX_JUMP_OVER_LEDGE
	applymovement GLINTGROVE_SNUBBULL, Movement_GlintGroveHops
	waitsfx
	opentext
	writetext GlintGroveMinaRockSmashText
	waitbutton
	closetext
	waitsfx
	loadvar wBuffer6, SNUBBULL
	copybytetovar wBuffer6
	refreshscreen
	pokepic 0, 0
	cry 0
	waitsfx
	closepokepic
	playsound SFX_STRENGTH
	earthquake 84
	setlasttalked GLINTGROVE_PETALS
	applymovement2 MovementData_Mina_Rock_Smash
	disappear GLINTGROVE_PETALS
	setlasttalked GLINTGROVE_MINA
	pause 5
	opentext TEXTBOX_MINA
	writetext GlintGroveMinaText12
	waitbutton
	closetext
	pause 5
	playsound SFX_BALL_POOF
	changeaction GLINTGROVE_SNUBBULL, PERSON_ACTION_SNUBBULL_SHRINK
	disappear GLINTGROVE_SNUBBULL
	pause 15
	faceplayer
	opentext TEXTBOX_MINA
	writetext GlintGroveMinaText7
	waitbutton
	closetext
	pause 5
	applymovement GLINTGROVE_MINA, Movement_Mina_Walk_Away
	disappear GLINTGROVE_MINA
	setevent EVENT_GLINT_GROVE_MINA_GONE
	setevent EVENT_TALKED_TO_MINA_ONCE
	variablesprite SPRITE_DISGUISEMAN, SPRITE_MISC_PALM
	moveperson GLINTGROVE_MINA, 50, 52
	moveperson GLINTGROVE_PETALS, -1, -1
	appear GLINTGROVE_MINA
	appear GLINTGROVE_PETALS
	pause 15
	special Special_FadeOutMusic
	pause 10
	playmapmusic
	pause 10
	end
.no
	setevent EVENT_DIDNT_GIVE_MINA_TEA
	writetext GlintGroveMinaTextNo
	waitbutton
	closetext
	spriteface GLINTGROVE_MINA, RIGHT
	special Special_FadeOutMusic
	pause 10
	playmapmusic
	end
.no_2
	writetext GlintGroveMinaTextNo
	waitbutton
	closetext
	spriteface GLINTGROVE_MINA, RIGHT
	end
.said_no
	checkitem BLOSSOM_TEA
	iffalse .talked_no_tea
	opentext TEXTBOX_MINA
	writetext GlintGroveMinaText8
	yesorno
	iffalse .no_2
	writetext GlintGroveMinaGiveText
	takeitem BLOSSOM_TEA
	playsound SFX_LEVEL_UP 
	waitsfx
	closetext
;	playmusic MUSIC_MINA
	jump .return
	
GlintGroveMinaText1:
	text "Ah, ALOLA!"
	
	para "Oh… <WAIT_S>I guess you"
	line "don't say that"
	cont "around here, huh?"
	
	para "Well anyway…"
	
	para "My name is MINA."
	done
	
GlintGroveMinaText2:
	text "I'm a painter."
	
	para "I'm always on the"
	line "lookout for my"
	cont "next spark of"
	cont "inspiration!"
	
	para "I came here to"
	line "paint this grove"
	cont "and its #MON."
	
	para "It's been fine"
	line "and all, but I'm"
	cont "missing my spark!"
	
	para "There's a rumor of"
	line "a #MON with a"
	cont "long, gooey tail"
	cont "somewhere around"
	cont "here."
	
	para "THAT'S <WAIT_S>what gets"
	line "me all inspired!"
	done
	
GlintGroveMinaText3:
	text "Unfortunately,"
	line "this rock is in"
	cont "the way!"
	done
	
GlintGroveMinaText4:
	text "My SNUBBULL could"
	line "clear the way with"
	cont "ROCK SMASH, but"
	cont "he's too thirsty"
	cont "at the moment."
	
	para "If I had some"
	line "tasty BLOSSOM TEA,"
	cont "I'd be all set!"
	
	para "Sigh…"
	done
	
GlintGroveMinaText5:
	text "… <WAIT_L>… <WAIT_L>… <WAIT_L>!"
	
	para "That smell!"
	
	para "You have"
	line "BLOSSOM TEA!"
	
	para "Please, can I"
	line "have some?"
	done
	
GlintGroveMinaText6:
	text "Here ya go,"
	line "SNUBBULL."
	
	para "Drink up!"
	done
	
GlintGroveMinaText7:
	text "Thanks for the"
	line "help!"
	
	para "What did you say"
	line "your name was?"
	
	para "…"
	
	para "<PLAYER>, huh?"
	
	para "Well, <PLAYER>,"
	line "I'm going to see"
	cont "what's ahead."
	
	para "Something cool,"
	line "I hope!"
	
	para "ALOLA!<WAIT_M>"
	line "Oops, I mean…"
	
	para "Goodbye!"
	done
	
GlintGroveMinaText8:
	text "You have"
	line "BLOSSOM TEA!"
	
	para "Please, can I"
	line "have some?"
	done
	
GlintGroveMinaText9:
	text "My name is MINA."
	done
	
GlintGroveMinaText10:
	text "Come on, SNUBBULL…"
	
	para "Please cooperate!"
	done
	
GlintGroveMinaText11:
	text "OK, buddy!"
	
	para "Let's do it!"
	done
	
GlintGroveMinaText12:
	text "Great job,"
	line "SNUBBULL!"
	
	para "Now, return!"
	done
	
GlintGroveMinaTextNo:
	text "Sigh…"
	done
	
GlintGroveMinaGiveText:
	text "<PLAYER> handed"
	line "over BLOSSOM TEA."
	done

GlintGroveMinaRockSmashText:
	text "SNUBBULL used"
	line "ROCK SMASH!"
	done
	
MovementData_Mina_Rock_Smash:
	rock_smash 10
	step_end

Movement_Mina_Walk_Away:
	step_right
	step_up
	step_up
	step_up
	step_up
	step_end
	
Movement_GlintGroveHops:
	fix_facing
	jump_in_place
	remove_fixed_facing
	step_end
	
GlintGroveRock:
	farjumptext UnknownText_0x1c0906
