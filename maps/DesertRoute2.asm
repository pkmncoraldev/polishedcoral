DesertRoute2_MapScriptHeader:
	db 2 ; scene scripts
	scene_script Route16Trigger0
	scene_script Route16Trigger1

	db 0 ; callbacks

	db 0 ; warp events

	db 1 ; coord events
	coord_event 23, 23, 0, Route16ChangeDisguiseman1

	db 0 ; bg events

	db 2 ; object events
	object_event  8, 22, SPRITE_FAT_GUY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route16Disguiseman, EVENT_ROUTE_16_DISGUISEMAN1
	object_event  8, 22, SPRITE_DISGUISEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route16Disguiseman, EVENT_ROUTE_16_DISGUISEMAN2

	const_def 1 ; object constants
	const ROUTE_16_DISGUISEMAN1
	const ROUTE_16_DISGUISEMAN2
	

Route16Trigger0:
	variablesprite SPRITE_DISGUISEMAN, SPRITE_BALL_CUT_FRUIT
	end
	
Route16Trigger1:
	variablesprite SPRITE_DISGUISEMAN, SPRITE_BALL_CUT_FRUIT
	end

Route16ChangeDisguiseman1:
	disappear ROUTE_16_DISGUISEMAN1
	appear ROUTE_16_DISGUISEMAN2
	dotrigger $1
	end


Route16Disguiseman:
	variablesprite SPRITE_DISGUISEMAN, SPRITE_FAT_GUY
	special MapCallbackSprites_LoadUsedSpritesGFX
	applymovement ROUTE_16_DISGUISEMAN2, Movement_StarglowCavern_DisguiseMan1
	opentext
	writetext StarglowCavern_DisguiseMan1Text1
	waitbutton
	closetext
	faceplayer
	opentext
	writetext Route16_DisguiseMan1Text2
	waitbutton
	closetext
	waitsfx
	winlosstext Route16DisguisemanBeatenText, 0
	setlasttalked ROUTE_16_DISGUISEMAN2
	loadtrainer DISGUISE, MASTER_4
	startbattle
	reloadmapafterbattle
	opentext
	writetext Route16_DisguiseMan1Text3
	waitbutton
	closetext
	applymovement ROUTE_16_DISGUISEMAN2, Movement_StarglowCavern_DisguiseMan2
	disappear ROUTE_16_DISGUISEMAN2
	opentext
	writetext StarglowCavern_DisguiseMan1Text4
	waitbutton
	closetext
	setevent EVENT_ROUTE_16_DISGUISEMAN1
	setevent EVENT_ROUTE_16_DISGUISEMAN2
	end
	
Route16_DisguiseMan1Text2:
	text "TEXT 2"
	done
	
Route16_DisguiseMan1Text3:
	text "TEXT 3"
	done

Route16DisguisemanBeatenText:
	text "The battle's done."
	line "You win, of course."
	
	para "What an awesome"
	line "show of force!"
	done
