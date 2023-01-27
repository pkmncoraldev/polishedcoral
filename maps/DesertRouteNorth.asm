DesertRouteNorth_MapScriptHeader:
	db 3 ; scene scripts
	scene_script DesertRouteNorthTrigger0
	scene_script DesertRouteNorthTrigger1
	scene_script DesertRouteNorthTrigger2

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, DesertRouteNorthCallback

	db 1 ; warp events
	warp_event  7, 19, DESERT_ROUTE_TENT, 1

	db 15 ; coord events
	xy_trigger 0, 21,  7, 0, DesertRouteNorthLight, 0, 0
	xy_trigger 0, 22,  8, 0, DesertRouteNorthLight, 0, 0
	xy_trigger 0, 23,  7, 0, DesertRouteNorthLight, 0, 0
	xy_trigger 0, 22,  6, 0, DesertRouteNorthLight, 0, 0
	xy_trigger 0, 23,  8, 0, DesertRouteNorthLight, 0, 0
	xy_trigger 0, 23,  6, 0, DesertRouteNorthLight, 0, 0
	xy_trigger 0, 21,  8, 0, DesertRouteNorthLight, 0, 0
	xy_trigger 0, 21,  6, 0, DesertRouteNorthLight, 0, 0
	xy_trigger 1, 20,  7, 0, DesertRouteNorthDark, 0, 0
	xy_trigger 1, 22,  9, 0, DesertRouteNorthDark, 0, 0
	xy_trigger 1, 20,  6, 0, DesertRouteNorthDark, 0, 0
	xy_trigger 1, 21,  5, 0, DesertRouteNorthDark, 0, 0
	xy_trigger 1, 21,  9, 0, DesertRouteNorthDark, 0, 0
	xy_trigger 1, 20,  8, 0, DesertRouteNorthDark, 0, 0
	xy_trigger 1, 23,  9, 0, DesertRouteNorthDark, 0, 0

	db 0 ; bg events

	db 4 ; object events
	object_event  0,  4, SPRITE_CAMPFIRE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, DesertRouteNorthCampfire, EVENT_HIDE_OW_OBJECTS_BROWN
	object_event  0,  4, SPRITE_CAMPFIRE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, DesertRouteNorthCampfire, EVENT_HIDE_OW_OBJECTS_TEAL
	object_event  0,  4, SPRITE_MISC_OVERHEAD, SPRITEMOVEDATA_TILE_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 12, 13, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, DesertRouteNorthNPC1, -1
	
	const_def 1 ; object constants
	const DESERT_ROUTE_NORTH_FIRE_BROWN
	const DESERT_ROUTE_NORTH_FIRE_TEAL
	const DESERT_ROUTE_NORTH_FIREBOTTOM
	const DESERT_ROUTE_NORTH_NPC1
	
	
DesertRouteNorthTrigger0:
	end
	
DesertRouteNorthTrigger1:
	end
	
DesertRouteNorthTrigger2:
	clearevent EVENT_SANDSTORM_HAPPENING
	loadvar wTimeOfDayPalFlags, $40 | 0
	domaptrigger DESERT_WASTELAND_1, $0
	callasm KillSandstormSound
	callasm LoadEmoteGFX
	dotrigger $0
	end
	
DesertRouteNorthCallback:
	readvar VAR_PLAYER_COLOR
	if_equal 3, .brown
	setevent EVENT_HIDE_OW_OBJECTS_TEAL
	clearevent EVENT_HIDE_OW_OBJECTS_BROWN
	clearevent EVENT_HIDE_OW_OBJECTS_PURPLE
	jump .cont
.brown
	setevent EVENT_HIDE_OW_OBJECTS_BROWN
	clearevent EVENT_HIDE_OW_OBJECTS_TEAL
	clearevent EVENT_HIDE_OW_OBJECTS_PURPLE
.cont
	checktime 1<<NITE
	iftrue .changecampfire
	checktime 1<<DUSK
	iffalse .skip
.changecampfire
	moveperson DESERT_ROUTE_NORTH_FIRE_BROWN, 7, 22
	moveperson DESERT_ROUTE_NORTH_FIRE_TEAL, 7, 22
	moveperson DESERT_ROUTE_NORTH_FIREBOTTOM, 7, 22
	changeblock $6, $14, $4e
	changeblock $8, $14, $4f
	changeblock $6, $16, $52
	changeblock $8, $16, $53
.skip
	checkevent EVENT_SANDSTORM_HAPPENING
	iffalse .end
	dotrigger $2
.end
	return
	
DesertRouteNorthCampfire:
	end
	
DesertRouteNorthLight:
	setflag ENGINE_NEAR_CAMPFIRE
	loadvar wTimeOfDayPalFlags, $40 | 1
	dotrigger $1
	end
	
DesertRouteNorthDark:
	clearflag ENGINE_NEAR_CAMPFIRE
	loadvar wTimeOfDayPalFlags, $40 | 0
	dotrigger $0
	end
	
KillSandstormSound:
	ld a, [wMapNumber]
	cp MAP_DESERT_WASTELAND_OASIS
	ret z
	call KillSFX
	ret
	
DesertRouteNorthNPC1:
	special SaveMusic
	callasm BrilloSingerTextScrollAsm1
	opentext
	playmusic MUSIC_BRILLO_SONG_BAD
	writetext DesertRouteNorthNPC1Text1
	wait 27
	writetext DesertRouteNorthNPC1Text2
	wait 27
	writetext DesertRouteNorthNPC1Text3
	wait 28
	writetext DesertRouteNorthNPC1Text4
	wait 34
	playmusic MUSIC_NONE
	callasm BrilloSingerTextScrollAsm2
	special RestoreMusic
	special DeleteSavedMusic
	closetext
	
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, DESERT_ROUTE_NORTH_NPC1, 15
	faceplayer
	opentext
	writetext DesertRouteNorthNPC1Text5
	waitbutton
	closetext
	spriteface DESERT_ROUTE_NORTH_NPC1, UP
	end
	
DesertRouteNorthNPC1Text1:
	text "They say that once"
	line "there was this guy"
	done
	
DesertRouteNorthNPC1Text2:
	text "he got some sand"
	line "caught in his eye"
	done
	
DesertRouteNorthNPC1Text3:
	text "But he was hungry"
	line "mumble mumble…"
	done
	
DesertRouteNorthNPC1Text4:
	text "so he baked an"
	line "apple pie!"
	done
	
DesertRouteNorthNPC1Text5:
	text "Oh sorry about"
	line "that."
	
	para "I just have this"
	line "song I heard in"
	cont "town stuck in"
	cont "my head!"
	done