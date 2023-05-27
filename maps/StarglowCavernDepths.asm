StarglowCavernDepths_MapScriptHeader:
	db 2 ; scene scripts
	scene_script StarglowCavernDepthsTrigger0
	scene_script StarglowCavernDepthsTrigger1

	db 0 ; callbacks

	db 1 ; warp events
	warp_def  5,  4, 1, ROUTE_1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events

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
