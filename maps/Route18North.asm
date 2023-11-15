Route18North_MapScriptHeader:
	db 3 ; scene scripts
	scene_script Route18NorthTrigger0
	scene_script Route18NorthTrigger1
	scene_script Route18NorthTrigger2

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route18NorthCallback

	db 1 ; warp events
	warp_event  7, 19, ROUTE_18_TRAILER, 1

	db 15 ; coord events
	xy_trigger 0, 21,  7, 0, Route18NorthLight, 0, 0
	xy_trigger 0, 22,  8, 0, Route18NorthLight, 0, 0
	xy_trigger 0, 23,  7, 0, Route18NorthLight, 0, 0
	xy_trigger 0, 22,  6, 0, Route18NorthLight, 0, 0
	xy_trigger 0, 23,  8, 0, Route18NorthLight, 0, 0
	xy_trigger 0, 23,  6, 0, Route18NorthLight, 0, 0
	xy_trigger 0, 21,  8, 0, Route18NorthLight, 0, 0
	xy_trigger 0, 21,  6, 0, Route18NorthLight, 0, 0
	xy_trigger 1, 20,  7, 0, Route18NorthDark, 0, 0
	xy_trigger 1, 22,  9, 0, Route18NorthDark, 0, 0
	xy_trigger 1, 20,  6, 0, Route18NorthDark, 0, 0
	xy_trigger 1, 21,  5, 0, Route18NorthDark, 0, 0
	xy_trigger 1, 21,  9, 0, Route18NorthDark, 0, 0
	xy_trigger 1, 20,  8, 0, Route18NorthDark, 0, 0
	xy_trigger 1, 23,  9, 0, Route18NorthDark, 0, 0

	db 0 ; bg events

	db 5 ; object events
	object_event  0,  4, SPRITE_CAMPFIRE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Route18NorthCampfire, EVENT_HIDE_OW_OBJECTS_BROWN
	object_event  0,  4, SPRITE_CAMPFIRE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, Route18NorthCampfire, EVENT_HIDE_OW_OBJECTS_TEAL
	object_event  0,  4, SPRITE_MISC_OVERHEAD, SPRITEMOVEDATA_TILE_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  7, 14, SPRITE_POKEMANIAC, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route18NorthNPC2, -1
	person_event SPRITE_CUEBALL, 32,  8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	
	const_def 1 ; object constants
	const ROUTE_18_NORTH_FIRE_BROWN
	const ROUTE_18_NORTH_FIRE_TEAL
	const ROUTE_18_NORTH_FIREBOTTOM
	
	
Route18NorthTrigger0:
	end
	
Route18NorthTrigger1:
	end
	
Route18NorthTrigger2:
	clearevent EVENT_SANDSTORM_HAPPENING
	loadvar wTimeOfDayPalFlags, $40 | 0
	domaptrigger DESERT_WASTELAND_1, $0
	callasm KillSandstormSound
	callasm LoadEmoteGFX
	dotrigger $0
	end
	
Route18NorthCallback:
	readvar VAR_PLAYER_COLOR
	if_equal 3, .brown
	setevent EVENT_HIDE_OW_OBJECTS_TEAL
	clearevent EVENT_HIDE_OW_OBJECTS_BROWN
	clearevent EVENT_HIDE_OW_OBJECTS_PURPLE
	clearevent EVENT_HIDE_OW_OBJECTS_BLUE
	jump .cont
.brown
	setevent EVENT_HIDE_OW_OBJECTS_BROWN
	clearevent EVENT_HIDE_OW_OBJECTS_TEAL
	clearevent EVENT_HIDE_OW_OBJECTS_PURPLE
	clearevent EVENT_HIDE_OW_OBJECTS_BLUE
.cont
	checktime 1<<NITE
	iftrue .changecampfire
	checktime 1<<DUSK
	iffalse .skip
.changecampfire
	moveperson ROUTE_18_NORTH_FIRE_BROWN, 7, 22
	moveperson ROUTE_18_NORTH_FIRE_TEAL, 7, 22
	moveperson ROUTE_18_NORTH_FIREBOTTOM, 7, 22
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
	
Route18NorthCampfire:
	end
	
Route18NorthLight:
	setflag ENGINE_NEAR_CAMPFIRE
	loadvar wTimeOfDayPalFlags, $40 | 1
	dotrigger $1
	end
	
Route18NorthDark:
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
	
Route18NorthNPC1:
	special SaveMusic
	callasm BrilloSingerTextScrollAsm1
	opentext
	playmusic MUSIC_BRILLO_SONG_BAD
	writetext Route18NorthNPC1Text1
	wait 27
	writetext Route18NorthNPC1Text2
	wait 27
	writetext Route18NorthNPC1Text3
	wait 28
	writetext Route18NorthNPC1Text4
	wait 34
	playmusic MUSIC_NONE
	callasm BrilloSingerTextScrollAsm2
	special RestoreMusic
	special DeleteSavedMusic
	closetext
	
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, ROUTE_18_TRAILER_NPC, 15
	faceplayer
	opentext
	writetext Route18NorthNPC1Text5
	waitbutton
	closetext
	spriteface ROUTE_18_TRAILER_NPC, LEFT
	end
	
Route18NorthNPC2:
	checkevent EVENT_TALKED_TO_ROUTE_18_NORTH_NPC
	iftrue .already_talked
	setevent EVENT_TALKED_TO_ROUTE_18_NORTH_NPC
	jumptextfaceplayer Route18NorthNPC2Text1
.already_talked
	jumptextfaceplayer Route18NorthNPC2Text2
	
Route18NorthNPC1Text1:
	text "They say that once"
	line "there was a guy,"
	done
	
Route18NorthNPC1Text2:
	text "he got some sand"
	line "caught in his eye"
	done
	
Route18NorthNPC1Text3:
	text "But he was hungry"
	line "mumble mumble…"
	done
	
Route18NorthNPC1Text4:
	text "so he baked an"
	line "apple pie!"
	done
	
Route18NorthNPC1Text5:
	text "Oh, sorry about"
	line "that."
	
	para "I just have this"
	line "song I heard in"
	cont "town stuck in"
	cont "my head!"
	done
	
Route18NorthNPC2Text1:
	text "Are you <PLAYER>?"
	
	para "You're the one"
	line "PROF. HILL said"
	cont "found the ruins"
	cont "near TWINKLE TOWN."
	
	para "There's reason to"
	line "believe that there"
	cont "could be more"
	cont "ruins around here."
	
	para "Unfortunately,"
	line "we're at a dead"
	cont "end."
	
	para "There is a wicked"
	line "sandstorm up ahead"
	cont "and it doesn't show"
	cont "signs of stopping…"
	
	para "In fact, according"
	line "to the locals, it's"
	cont "been raging for"
	cont "one hundred years!"
	
	para "Every time we try"
	line "to brave the sand,"
	cont "we somehow end up"
	cont "right back where"
	cont "we started!"
	
	para "It makes no sense…"
	
	para "Maybe you could"
	line "find some more"
	cont "information back"
	cont "in town…"
	done
	
	
Route18NorthNPC2Text2:
	text "Every time we try"
	line "to brave the sand,"
	cont "we somehow end up"
	cont "right back where"
	cont "we started!"
	
	para "It makes no sense…"
	
	para "Maybe you could"
	line "find some more"
	cont "information back"
	cont "in town…"
	done