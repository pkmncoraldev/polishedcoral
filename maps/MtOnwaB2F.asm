MtOnwaB2F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 4 ; warp events
	warp_def 23, 39, 6, MT_ONWA_B1F
	warp_def 7, 11, 7, MT_ONWA_B1F
	warp_def 23,  3, 1, MT_ONWA_B3F
	warp_def  7, 10, 4, MT_ONWA_B3F

	db 1 ; coord events
	coord_event 28, 19, 1, MtOnwaB2FDisguiseManStopsYou

	db 1 ; bg events
	bg_event  2, 24, SIGNPOST_ITEM + REVIVE, EVENT_MT_ONWA_B2F_HIDDEN_REVIVE

	db 2 ; object events
	person_event SPRITE_DISGUISEMAN, 18, 30, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, MtOnwaB2FDisguiseman1, EVENT_MT_ONWA_B2F_POKE_BALL1
	person_event SPRITE_DISGUISEMAN, 19, 31, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, MtOnwaB2FDisguiseman2, EVENT_MT_ONWA_B2F_POKE_BALL2

	const_def 1 ; object constants
	const MT_ONWA_B2F_DISGUISEMAN1
	const MT_ONWA_B2F_DISGUISEMAN2
	

MtOnwaB2FDisguiseman1:
	checkevent EVENT_MT_ONWA_B2F_POKE_BALL2
	iftrue .disguiseman
	dotrigger $1
	setevent EVENT_MT_ONWA_B2F_POKE_BALL1
	callasm MtOnwaB2FSetItemAsm
	farjump FindItemInBallScript

.disguiseman
	dotrigger $0
	variablesprite SPRITE_DISGUISEMAN, SPRITE_FAT_GUY
	special MapCallbackSprites_LoadUsedSpritesGFX
	applymovement MT_ONWA_B2F_DISGUISEMAN1, Movement_StarglowCavern_DisguiseMan1
	opentext
	writetext StarglowCavern_DisguiseMan1Text1
	waitbutton
	closetext
	faceplayer
	opentext
	writetext MtOnwa_DisguiseMan1Text2
	waitbutton
	closetext
	waitsfx
	winlosstext MtOnwaDisguisemanBeatenText, 0
	setlasttalked MT_ONWA_B2F_DISGUISEMAN1
	loadtrainer DISGUISE, MASTER_2
	startbattle
	reloadmapafterbattle
	opentext
	writetext MtOnwa_DisguiseMan1Text3
	waitbutton
	closetext
	applymovement MT_ONWA_B2F_DISGUISEMAN1, Movement_StarglowCavern_DisguiseMan2
	disappear MT_ONWA_B2F_DISGUISEMAN1
	opentext
	writetext StarglowCavern_DisguiseMan1Text4
	waitbutton
	closetext
	setevent EVENT_MT_ONWA_B2F_POKE_BALL1
	end
	
MtOnwaB2FDisguiseman2:
	checkevent EVENT_MT_ONWA_B2F_POKE_BALL1
	iftrue .disguiseman
	dotrigger $1
	setevent EVENT_MT_ONWA_B2F_POKE_BALL2
	callasm MtOnwaB2FSetItemAsm
	farjump FindItemInBallScript

.disguiseman
	dotrigger $0
	variablesprite SPRITE_DISGUISEMAN, SPRITE_FAT_GUY
	special MapCallbackSprites_LoadUsedSpritesGFX
	applymovement MT_ONWA_B2F_DISGUISEMAN2, Movement_StarglowCavern_DisguiseMan1
	opentext
	writetext StarglowCavern_DisguiseMan1Text1
	waitbutton
	closetext
	faceplayer
	opentext
	writetext MtOnwa_DisguiseMan1Text2
	waitbutton
	closetext
	waitsfx
	winlosstext MtOnwaDisguisemanBeatenText, 0
	setlasttalked MT_ONWA_B2F_DISGUISEMAN2
	loadtrainer DISGUISE, MASTER_2
	startbattle
	reloadmapafterbattle
	opentext
	writetext MtOnwa_DisguiseMan1Text3
	waitbutton
	closetext
	applymovement MT_ONWA_B2F_DISGUISEMAN2, Movement_StarglowCavern_DisguiseMan2
	disappear MT_ONWA_B2F_DISGUISEMAN2
	opentext
	writetext StarglowCavern_DisguiseMan1Text4
	waitbutton
	closetext
	setevent EVENT_MT_ONWA_B2F_POKE_BALL2
	end
	
MtOnwaB2FDisguiseManStopsYou:
	special Special_StopRunning
	variablesprite SPRITE_DISGUISEMAN, SPRITE_FAT_GUY
	special MapCallbackSprites_LoadUsedSpritesGFX
	checkevent EVENT_MT_ONWA_B2F_POKE_BALL1
	iftrue .alt
	applymovement MT_ONWA_B2F_DISGUISEMAN1, Movement_StarglowCavern_DisguiseMan2
	disappear MT_ONWA_B2F_DISGUISEMAN1
	moveperson MT_ONWA_B2F_DISGUISEMAN1, $1d, $13
	opentext
	writetext StarglowCavern_DisguiseMan1Text4
	waitbutton
	closetext
	appear MT_ONWA_B2F_DISGUISEMAN1
	spriteface PLAYER, RIGHT
	applymovement MT_ONWA_B2F_DISGUISEMAN1, Movement_StarglowCavern_DisguiseMan1
	opentext
	writetext StarglowCavern_DisguiseMan1Text5
	waitbutton
	closetext
	spriteface MT_ONWA_B2F_DISGUISEMAN1, LEFT
	opentext
	writetext MtOnwa_DisguiseMan1Text4
	waitbutton
	closetext
	applymovement MT_ONWA_B2F_DISGUISEMAN1, Movement_StarglowCavern_DisguiseMan2
	disappear MT_ONWA_B2F_DISGUISEMAN1
	jump .end
.alt
	applymovement MT_ONWA_B2F_DISGUISEMAN2, Movement_StarglowCavern_DisguiseMan2
	disappear MT_ONWA_B2F_DISGUISEMAN2
	moveperson MT_ONWA_B2F_DISGUISEMAN2, $1d, $13
	opentext
	writetext StarglowCavern_DisguiseMan1Text4
	waitbutton
	closetext
	appear MT_ONWA_B2F_DISGUISEMAN2
	spriteface PLAYER, RIGHT
	applymovement MT_ONWA_B2F_DISGUISEMAN2, Movement_StarglowCavern_DisguiseMan1
	opentext
	writetext StarglowCavern_DisguiseMan1Text5
	waitbutton
	closetext
	spriteface MT_ONWA_B2F_DISGUISEMAN2, LEFT
	opentext
	writetext MtOnwa_DisguiseMan1Text4
	waitbutton
	closetext
	applymovement MT_ONWA_B2F_DISGUISEMAN2, Movement_StarglowCavern_DisguiseMan2
	disappear MT_ONWA_B2F_DISGUISEMAN2
.end
	opentext
	writetext StarglowCavern_DisguiseMan1Text4
	waitbutton
	closetext
	pause 7
	dotrigger $0
	setevent EVENT_MT_ONWA_B2F_POKE_BALL1
	setevent EVENT_MT_ONWA_B2F_POKE_BALL2
	variablesprite SPRITE_DISGUISEMAN, SPRITE_BALL_CUT_FRUIT
	end
	
MtOnwa_DisguiseMan1Text2:
	text "Hello! Hello!"
	line "It's me again!"
	
	para "Are you surprised,"
	line "my greedy friend?"
	
	para "To take one ball"
	line "and cut your loss,"
	
	para "would mean our"
	line "paths would never"
	cont "cross."
	
	para "You chose to take"
	line "not one, but two."
	
	para "That wasn't very"
	line "smart of you!"
	
	para "But now, alas, I'll"
	line "stop the prattle."
	
	para "So here we go!"
	line "Prepare to battle!"
	done
	
MtOnwa_DisguiseMan1Text3:
	text "Fantastic battle,"
	line "greedy TRAINER!"
	
	para "I knew you'd win!"
	line "What a no-brainer!"
	
	para "We'll meet again."
	line "I tell no lies,"
	
	para "for I'm the MASTER"
	line "OF DISGUISE!"
	done
	
MtOnwa_DisguiseMan1Text4:
	text "You saw two balls"
	line "but took just one!"
	
	para "Your test of"
	line "courtesy is done."
	
	para "A simple choice,"
	line "you had your"
	cont "druthers…"
	
	para "You chose to"
	line "leave one there"
	cont "for others!"
	
	para "A kind and noble,"
	line "selfless act,"
	
	para "that shows you're"
	line "one with grace and"
	cont "tact."
	
	para "We'll meet again."
	line "I tell no lies,"
	
	para "for I'm the MASTER"
	line "OF DISGUISE!"
	done
	
MtOnwaDisguisemanBeatenText:
	text "Well, I guess that"
	line "that is that"
	
	para "It seems that I"
	line "have fallen flat…"
	done
	
MtOnwaB2FSetItemAsm:
	ld a, SUPER_REPEL
	ld [wCurItemBallContents], a
	ld a, 1
	ld [wCurItemBallQuantity], a
	ret