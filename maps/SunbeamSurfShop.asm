SunbeamSurfShop_MapScriptHeader:
	db 2 ; scene scripts
	scene_script SunbeamSurfShopTrigger0
	scene_script SunbeamSurfShopTrigger1

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, SunbeamSurfShopCounter

	db 3 ; warp events
	warp_def 7, 4, 9, SUNBEAM_ISLAND
	warp_def 7, 3, 9, SUNBEAM_ISLAND
	warp_def  7,  7, 14, SUNBEAM_ISLAND

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	person_event SPRITE_FISHING_GURU, 5, 7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SunbeamIslandSurfShopNPC1, -1
	person_event SPRITE_ROCKER, 3, 0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunbeamIslandSurfShopNPC2, -1

	const_def 1 ; object constants
	const SUNBEAM_SURF_SHOP_CLERK
	const SUNBEAM_SURF_SHOP_SURFER
	
SunbeamSurfShopTrigger0:
	end
	
SunbeamSurfShopTrigger1:
	opentext 
	writetext SunbeamIslandSurfShopNPC1Text5
	waitbutton
	checkevent EVENT_BIKINIP
	iffalse .lilacwon
	checkevent EVENT_BIKINIBL
	iffalse .asterwon
	checkevent EVENT_BIKINIBR
	iffalse .hazelwon
.lilacwon
	verbosegiveitem RARE_CANDY
	jump .end
.asterwon
	verbosegiveitem PP_UP
	jump .end
.hazelwon
	verbosegiveitem NUGGET
.end
	writetext SunbeamIslandSurfShopNPC1Text6
	waitbutton
	closetext
	dotrigger $0
	end
	
SunbeamSurfShopCounter:
	checkevent EVENT_SUNBEAM_SURF_SHOP_COUNTER
	iftrue .doitshraggy
	return
.doitshraggy
	changeblock $6, $6, $33
	return
	
SunbeamIslandSurfShopNPC1:
	checkcode VAR_FACING
	if_equal UP, .pleaseleave
	faceplayer
	opentext
	
	checkevent EVENT_FIRST_BIKINI_CONTEST
	iffalse .in_progress
	
	checkflag ENGINE_DAILY_BIKINI_CONTEST
	iftrue .donebikinicontest
	writetext SunbeamIslandSurfShopNPC1Text1
	yesorno
	iffalse .saidnotocontest
	writetext SunbeamIslandSurfShopNPC1Text2
	waitbutton
	closetext
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	setevent EVENT_SUNBEAM_BIKINIS_GONE
	warpfacing UP, SUNBEAM_BIKINI_CONTEST, $6, $5
	end
.saidnotocontest:
	writetext SunbeamIslandSurfShopNPC1Text3
	waitbutton
	closetext
	end
.donebikinicontest:
	writetext SunbeamIslandSurfShopNPC1Text4
	waitbutton
	closetext
	end
.in_progress:
	writetext SunbeamIslandSurfShopNPC1Text7
	waitbutton
	closetext
	end
.pleaseleave
	setevent EVENT_SUNBEAM_SURF_SHOP_COUNTER
	playsound SFX_PAY_DAY
	spriteface SUNBEAM_SURF_SHOP_CLERK, DOWN
	showemote EMOTE_SHOCK, SUNBEAM_SURF_SHOP_CLERK, 15
	opentext
	checkevent EVENT_PLAYER_IS_CORA
	iftrue .girl
	checkevent EVENT_PLAYER_IS_PIPPI
	iftrue .girl
	checkevent EVENT_PLAYER_IS_LEAF
	iftrue .girl
	checkevent EVENT_PLAYER_IS_KRIS
	iftrue .girl
	writetext SunbeamIslandSurfShopNPC1Text8
	jump .cont
.girl
	writetext SunbeamIslandSurfShopNPC1Text8_girl
.cont
	waitbutton
	closetext
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	special Special_StopRunning
	waitsfx
	warp2 DOWN, SUNBEAM_ISLAND, $11, $2c
	end
	
SunbeamIslandSurfShopNPC2:
	checktmhm TM_THUNDER
	iftrue .got_thunder
	faceplayer
	opentext
	writetext SunbeamIslandSurfShopNPC2Text1
	waitbutton
	callasm SunbeamIslandSurfShopRaichuAsm
	ifequal 4, .wrong_raichu
	ifequal 3, .cancel
	iffalse .no
	writetext SunbeamIslandSurfShopNPC2Text2
	waitbutton
	verbosegivetmhm TM_THUNDER
	writetext SunbeamIslandSurfShopNPC2Text3
	waitbutton
	closetext
	end
.cancel
	writetext SunbeamIslandSurfShopNPC2Text4
	waitbutton
	closetext
	end
.no
	writetext SunbeamIslandSurfShopNPC2Text5
	waitbutton
	closetext
	end
.wrong_raichu
	writetext SunbeamIslandSurfShopNPC2Text6
	waitbutton
	closetext
	end
.got_thunder
	jumptextfaceplayer SunbeamIslandSurfShopNPC2Text7
	
SunbeamIslandSurfShopRaichuAsm:
	farcall SelectEncounterHouseMon
	jr c, .cancel
	ld a, [wCurPartySpecies]
	cp RAICHU
	jr nz, .no
	ld a, [wCurForm]
	cp ALOLAN_FORM
	jr nz, .wrong_raichu
	ld a, TRUE
	ld [wScriptVar], a
	ret
.no
	ld a, FALSE
	ld [wScriptVar], a
	ret
.cancel
	ld a, 3
	ld [wScriptVar], a
	ret
.wrong_raichu
	ld a, 4
	ld [wScriptVar], a
	ret
	
SunbeamIslandSurfShopNPC1Text1:
	text "Hey dude!"
	
	para "We're looking for"
	line "judges for the"
	cont "BEACH BATTLE"
	cont "BEAUTY CONTEST!"
	
	para "You'll fight some"
	line "tough TRAINERS"
	cont "and get a prize"
	cont "for participating!"
	
	para "So, what do you"
	line "say?"
	
	para "Wanna be a judge?"
	done
	
SunbeamIslandSurfShopNPC1Text2:
	text "Great!"
	
	para "The contest is"
	line "about to start!"
	done
	
SunbeamIslandSurfShopNPC1Text3:
	text "Bummer…"
	done
	
SunbeamIslandSurfShopNPC1Text4:
	text "Hey dude!"
	
	para "Today's contest is"
	line "already over."
	
	para "If you want to be"
	line "a judge, come back"
	cont "tomorrow."
	done
	
SunbeamIslandSurfShopNPC1Text5:
	text "Nice!"
	
	para "That was great!"
	
	para "Here's your reward"
	line "as promised."
	done
	
SunbeamIslandSurfShopNPC1Text6:
	text "Make sure to come"
	line "back tomorrow to"
	cont "judge the next"
	cont "contest!"	
	done
	
SunbeamIslandSurfShopNPC1Text7:
	text "Hey dude!"
	
	para "The contest is"
	line "already happening."
	
	para "If you want to be"
	line "a judge, come back"
	cont "later."
	done
	
SunbeamIslandSurfShopNPC1Text8:
	text "Sir!"
	
	para "You are not allow-"
	line "ed back here!"
	
	para "I'm going to have"
	line "to ask you to"
	cont "leave."
	done
	
SunbeamIslandSurfShopNPC1Text8_girl:
	text "Ma'am!"
	
	para "You are not allow-"
	line "ed back here!"
	
	para "I'm going to have"
	line "to ask you to"
	cont "leave."
	done
	
SunbeamIslandSurfShopNPC2Text1:
	text "I've heard stories"
	line "of a RAICHU that"
	cont "rides its tail"
	cont "like a surfboard."
	
	para "I'd sure love to"
	line "see that myself."
	done
	
SunbeamIslandSurfShopNPC2Text2:
	text "Woah!<WAIT_M>"
	line "Look at that!"
	
	para "Hang ten little"
	line "RAICHU!"
	
	para "Thanks for showing"
	line "me such a gnarly"
	cont "#MON!"
	
	para "Here, take this."
	done
	
SunbeamIslandSurfShopNPC2Text3:
	text "THUNDER is a real"
	line "rightous move!"
	
	para "It does serious"
	line "damage, but can"
	cont "miss, so watch it."
	
	para "You and your"
	line "RAICHU stay cool!"
	done
	
SunbeamIslandSurfShopNPC2Text4:
	text "Maybe it's just a"
	line "myth…"
	done
	
SunbeamIslandSurfShopNPC2Text5:
	text "Maybe it's just a"
	line "myth…"
	done
	
SunbeamIslandSurfShopNPC2Text6:
	text "That's a RAICHU,"
	line "but it's tail is"
	cont "too small to ride!"
	
	para "Maybe it's just a"
	line "myth…"
	done
	
SunbeamIslandSurfShopNPC2Text7:
	text "You and your"
	line "RAICHU stay cool!"
	done
