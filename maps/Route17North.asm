Route17North_MapScriptHeader:
	db 3 ; scene scripts
	scene_script Route17NorthTrigger0
	scene_script Route17NorthTrigger1
	scene_script Route17NorthTrigger2

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route17NorthCallback

	db 1 ; warp events
	warp_event  7, 19, ROUTE_17_TENT, 1

	db 15 ; coord events
	xy_trigger 0, 21,  7, 0, Route17NorthLight, 0, 0
	xy_trigger 0, 22,  8, 0, Route17NorthLight, 0, 0
	xy_trigger 0, 23,  7, 0, Route17NorthLight, 0, 0
	xy_trigger 0, 22,  6, 0, Route17NorthLight, 0, 0
	xy_trigger 0, 23,  8, 0, Route17NorthLight, 0, 0
	xy_trigger 0, 23,  6, 0, Route17NorthLight, 0, 0
	xy_trigger 0, 21,  8, 0, Route17NorthLight, 0, 0
	xy_trigger 0, 21,  6, 0, Route17NorthLight, 0, 0
	xy_trigger 1, 20,  7, 0, Route17NorthDark, 0, 0
	xy_trigger 1, 22,  9, 0, Route17NorthDark, 0, 0
	xy_trigger 1, 20,  6, 0, Route17NorthDark, 0, 0
	xy_trigger 1, 21,  5, 0, Route17NorthDark, 0, 0
	xy_trigger 1, 21,  9, 0, Route17NorthDark, 0, 0
	xy_trigger 1, 20,  8, 0, Route17NorthDark, 0, 0
	xy_trigger 1, 23,  9, 0, Route17NorthDark, 0, 0

	db 0 ; bg events

	db 4 ; object events
	object_event  0,  4, SPRITE_CAMPFIRE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Route17NorthCampfire, EVENT_HIDE_OW_OBJECTS_BROWN
	object_event  0,  4, SPRITE_CAMPFIRE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, Route17NorthCampfire, EVENT_HIDE_OW_OBJECTS_TEAL
	object_event  0,  4, SPRITE_MISC_OVERHEAD, SPRITEMOVEDATA_TILE_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  7, 14, SPRITE_POKEMANIAC, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route17NorthNPC1, -1
	
	const_def 1 ; object constants
	const ROUTE_17_NORTH_FIRE_BROWN
	const ROUTE_17_NORTH_FIRE_TEAL
	const ROUTE_17_NORTH_FIREBOTTOM
	const ROUTE_17_NORTH_NPC1
	
	
Route17NorthTrigger0:
	end
	
Route17NorthTrigger1:
	end
	
Route17NorthTrigger2:
	clearevent EVENT_SANDSTORM_HAPPENING
	loadvar wTimeOfDayPalFlags, $40 | 0
	domaptrigger DESERT_WASTELAND_1, $0
	callasm KillSandstormSound
	callasm LoadEmoteGFX
	dotrigger $0
	end
	
Route17NorthCallback:
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
	moveperson ROUTE_17_NORTH_FIRE_BROWN, 7, 22
	moveperson ROUTE_17_NORTH_FIRE_TEAL, 7, 22
	moveperson ROUTE_17_NORTH_FIREBOTTOM, 7, 22
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
	
Route17NorthCampfire:
	end
	
Route17NorthLight:
	setflag ENGINE_NEAR_CAMPFIRE
	loadvar wTimeOfDayPalFlags, $40 | 1
	dotrigger $1
	end
	
Route17NorthDark:
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
	
Route17NorthNPC1:
	special SaveMusic
	callasm BrilloSingerTextScrollAsm1
	opentext
	playmusic MUSIC_BRILLO_SONG_BAD
	writetext Route17NorthNPC1Text1
	wait 27
	writetext Route17NorthNPC1Text2
	wait 27
	writetext Route17NorthNPC1Text3
	wait 28
	writetext Route17NorthNPC1Text4
	wait 34
	playmusic MUSIC_NONE
	callasm BrilloSingerTextScrollAsm2
	special RestoreMusic
	special DeleteSavedMusic
	closetext
	
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, ROUTE_17_NORTH_NPC1, 15
	faceplayer
	opentext
	writetext Route17NorthNPC1Text5
	waitbutton
	closetext
	end
	
Route17NorthNPC1Text1:
	text "They say that once"
	line "there was a guy,"
	done
	
Route17NorthNPC1Text2:
	text "he got some sand"
	line "caught in his eye"
	done
	
Route17NorthNPC1Text3:
	text "But he was hungry"
	line "mumble mumble…"
	done
	
Route17NorthNPC1Text4:
	text "so he baked an"
	line "apple pie!"
	done
	
Route17NorthNPC1Text5:
	text "Oh, sorry about"
	line "that."
	
	para "I just have this"
	line "song I heard in"
	cont "town stuck in"
	cont "my head!"
	done