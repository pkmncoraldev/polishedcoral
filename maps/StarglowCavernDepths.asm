StarglowCavernDepths_MapScriptHeader:
	db 2 ; scene scripts
	scene_script StarglowCavernDepthsTrigger0
	scene_script StarglowCavernDepthsTrigger1

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, StarglowCavernDepths

	db 8 ; warp events
	warp_def 15, 16, 1, ROUTE_1
	warp_def  5, 13, 3, STARGLOW_CAVERN_DEPTHS
	warp_def  3, 23, 2, STARGLOW_CAVERN_DEPTHS
	warp_def  2, 21, 5, STARGLOW_CAVERN_DEPTHS
	warp_def  3, 31, 4, STARGLOW_CAVERN_DEPTHS
	warp_def  2, 33, 7, STARGLOW_CAVERN_DEPTHS
	warp_def 11, 31, 6, STARGLOW_CAVERN_DEPTHS
	warp_def 17, 25, 2, ROUTE_3_STARGLOW_CAVERN_TOP

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_MALL_SIGN, 11, 17, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, StarglowCavernDepthsBag, EVENT_STARGLOW_DEPTHS_GOT_BAG
	
	const_def 1 ; object constants
	const STARGLOW_CAVERN_DEPTHS_BAG


StarglowCavernDepths:
	checkevent EVENT_STARGLOW_DEPTHS_GOT_BAG
	iffalse .end
	changeblock $4, $a, $2a
.end
	return

StarglowCavernDepthsTrigger0:
	pause 20
	opentext
	writetext StarglowCavernDepthsPatchesText1
	waitbutton
	closetext
	pause 10
	special Special_ForcePlayerStateNormal
	pause 35
	spriteface PLAYER, DOWN
	pause 15
	opentext
	writetext StarglowCavernDepthsPatchesText2
	waitbutton
	closetext
	pause 15
	dotrigger $1
	special Special_StartLandmarkTimer
	end
	
StarglowCavernDepthsTrigger1:
	end
	
StarglowCavernDepthsBag:
	opentext
	writetext StarglowCavernDepthsBag1
	playsound SFX_SANDSTORM
	waitsfx
	farwritetext StdBlankText
	pause 6
	writetext StarglowCavernDepthsBag2
	waitsfx
	specialsound
	waitbutton
	closetext
	callasm StarglowDepthsGiveTempBallsASM
	disappear STARGLOW_CAVERN_DEPTHS_BAG
	changeblock $4, $a, $2a
	callasm GenericFinishBridge
	end
	
StarglowDepthsGiveTempBallsASM:
	ld a, 4
	ld [wSafariBallsRemaining], a
	ret
	
StarglowCavernDepthsBag1:
	text "It's a lost bag."
	
	para "<PLAYER> reached"
	line "inside…"
	
	para "Rustle… rustle…"
	done
	
	
StarglowCavernDepthsBag2:
	text "<PLAYER> found"
	line "4 #BALLS!"
	done
	
StarglowCavernDepthsPatchesText1:
	text "AHAHAHA!"
	
	para "Sorry, kiddo!"
	
	para "Your stuff just"
	line "looked too good"
	cont "not to take!"
	
	para "Have fun down"
	line "there!"
	
	para "AHAHAHA!"
	done
	
StarglowCavernDepthsPatchesText2:
	text "He stole your BAG"
	line "with all of your"
	cont "ITEMs and #MON!"
	done
