BarInside_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, BarInsideCallback

	db 2 ; warp events
	warp_event  5,  7, DUSK_TURNPIKE, 18
	warp_event  6,  7, DUSK_TURNPIKE, 19

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	person_event SPRITE_JUKEBOX,  1,  9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, BarInsideJukebox, -1
	person_event SPRITE_PORYGON_SCREEN,  2,  4, SPRITEMOVEDATA_TILE_DOWN_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, BarInsideJukebox, -1
	person_event SPRITE_PORYGON_SCREEN,  2,  4, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, BarInsideJukebox, EVENT_HIDE_OW_OBJECTS_TEAL
	person_event SPRITE_PORYGON_SCREEN,  2,  4, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, BarInsideJukebox, EVENT_HIDE_OW_OBJECTS_PURPLE
	person_event SPRITE_JUKEBOX,  0,  6, SPRITEMOVEDATA_TILE_UP_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, BarInsideJukebox, EVENT_HIDE_OW_OBJECTS_TEAL
	person_event SPRITE_JUKEBOX,  0,  6, SPRITEMOVEDATA_TILE_UP_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, BarInsideJukebox, EVENT_HIDE_OW_OBJECTS_PURPLE
	
	
BarInsideCallback:
	readvar VAR_PLAYER_COLOR
	if_equal 4, .purple
	setevent EVENT_HIDE_OW_OBJECTS_TEAL
	clearevent EVENT_HIDE_OW_OBJECTS_BLUE
	clearevent EVENT_HIDE_OW_OBJECTS_BROWN
	clearevent EVENT_HIDE_OW_OBJECTS_PURPLE
	return
.purple
	clearevent EVENT_HIDE_OW_OBJECTS_TEAL
	clearevent EVENT_HIDE_OW_OBJECTS_BLUE
	clearevent EVENT_HIDE_OW_OBJECTS_BROWN
	setevent EVENT_HIDE_OW_OBJECTS_PURPLE
	return
	
BarInsideJukebox:
	opentext
	special PlaceMoneyTopRight
	callasm CheckJukeboxSong
	if_equal 0, .default
	if_equal 1, .wild
	if_equal 2, .starglow
	if_equal 3, .leader
.default
	writetext BarInsideJukeboxTextDefault
	jump .got_text
.wild
	writetext BarInsideJukeboxTextWild
	jump .got_text
.starglow
	writetext BarInsideJukeboxTextStarglow
	jump .got_text
.leader
	writetext BarInsideJukeboxTextLeader
.got_text
	buttonsound
	farwritetext StdBlankText
	pause 6
	writetext BarInsideJukeboxText
	yesorno
	iffalse .end
	checkmoney $0, 1
	if_equal $2, .no_money
	playsound SFX_TRANSACTION
	takemoney $0, 1
	special PlaceMoneyTopRight
	callasm UpdateJukeboxSong
	waitsfx
	closetext
	pause 10
	special Special_FadeOutMusic
	pause 20
	callasm CheckJukeboxSong
	if_equal 0, .default2
	if_equal 1, .wild2
	if_equal 2, .starglow2
	if_equal 3, .leader2
.default2
	playmusic MUSIC_BAR
	end
.wild2
	playmusic MUSIC_WILD_BATTLE_OLD
	end
.starglow2
	playmusic MUSIC_STARGLOW_OLD
	end
.leader2
	playmusic MUSIC_GYM_BATTLE_OLD
	end
.end
	closetext
	end
.no_money
	writetext BarInsideJukeboxNoMoneyText
	waitbutton
	closetext
	end

BarInsideJukeboxText:
	text "Put in ¥1?"
	done
	
BarInsideJukeboxNoMoneyText:
	text "Too rich for your"
	line "blood!"
	done
	
BarInsideJukeboxTextDefault:
	text "MOO MOO BLUES"
	line "is playing."
	done
	
BarInsideJukeboxTextStarglow:
	text "ECHOES OF STARGLOW"
	line "is playing."
	done
	
BarInsideJukeboxTextWild:
	text "DRAMATIC BATTLE"
	line "is playing."
	done
	
BarInsideJukeboxTextLeader:
	text "LEADER'S SONATA"
	line "is playing."
	done
	
CheckJukeboxSong:
	ld a, [wJukeboxSong]
	ld [wScriptVar], a
	ret
	
UpdateJukeboxSong:
	ld a, [wJukeboxSong]
	inc a
	ld [wJukeboxSong], a
	cp 4
	ret nz
	xor a
	ld [wJukeboxSong], a
	ret