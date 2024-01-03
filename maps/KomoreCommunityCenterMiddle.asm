KomoreCommunityCenterMiddle_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, KomoreCommunityCenterMiddleCallback

	db 4 ; warp events
	warp_def  4,  5, 3, KOMORE_COMMUNITY_CENTER_RIGHT
	warp_def  5,  5, 4, KOMORE_COMMUNITY_CENTER_RIGHT
	warp_def  4,  0, 1, KOMORE_COMMUNITY_CENTER_LEFT
	warp_def  5,  0, 2, KOMORE_COMMUNITY_CENTER_LEFT

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	person_event SPRITE_MIMIKYU_DOLL,  4,  2, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, KomoreCommunityCenterPikachu2, EVENT_MIMIKYU_GONE
	object_event  1,  3, SPRITE_MON_ICON, SPRITEMOVEDATA_STANDING_DOWN, 0, WOOPER, -1, -1, PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, KomoreCommunityCenterWooper, -1
	object_event  4,  2, SPRITE_MON_ICON, SPRITEMOVEDATA_STANDING_DOWN, 0, CLEFAIRY, -1, -1, PAL_NPC_PINK, PERSONTYPE_SCRIPT, 0, KomoreCommunityCenterClefairy, -1
	object_event  2,  6, SPRITE_MON_ICON, SPRITEMOVEDATA_STANDING_DOWN, 0, EEVEE, -1, -1, PAL_NPC_BROWN, PERSONTYPE_SCRIPT, 0, KomoreCommunityCenterEevee, -1
	

KomoreCommunityCenterMiddleCallback:
	clearevent EVENT_MIMIKYU_WILL_GO_LEFT
	clearevent EVENT_MIMIKYU_WILL_GO_RIGHT
	checkevent EVENT_MIMIKYU_MIDDLE
	iftrue .end
	moveperson 1, -5, -5
.end
	return

KomoreCommunityCenterWooper:
	jumptext KomoreCommunityCenterWooperText
	
KomoreCommunityCenterClefairy:
	jumptext KomoreCommunityCenterClefairyText
	
KomoreCommunityCenterEevee:
	jumptext KomoreCommunityCenterEeveeText

KomoreCommunityCenterPikachu:
	jumptext KomoreCommunityCenterPikachuText
	
KomoreCommunityCenterPikachu2:
	opentext
	writetext KomoreCommunityCenterPikachuText2
	yesorno
	iffalse .no
	closetext
	pause 60
	opentext
	writetext KomoreCommunityCenterPikachuText3
	yesorno
	iffalse .no
	closetext
	pause 60
	applymovement 1, Movement_KomoroMimikyu1
	spriteface 1, LEFT
	pause 20
	opentext
	writetext KomoreCommunityCenterPikachuText3
	yesorno
	iffalse .no
	closetext
	pause 40
	special Special_FadeOutMusic
	pause 40
	applymovement 1, Movement_KomoroMimikyu1
	spriteface 1, LEFT
	pause 20
	applymovement 1, Movement_KomoroMimikyu1
	applymovement 1, Movement_KomoroMimikyu1
	spriteface 1, LEFT
	pause 20
	applymovement 1, Movement_KomoroMimikyu2
	spriteface 1, DOWN
	pause 20
	spriteface 1, LEFT
	opentext
	writetext KomoreCommunityCenterPikachuText4
	cry MIMIKYU
	waitbutton
	closetext
	waitsfx
	loadwildmon MIMIKYU, 20
	writecode VAR_BATTLETYPE, BATTLETYPE_LEGENDARY
	startbattle
	disappear 1
	reloadmapafterbattle
	playmusic MUSIC_FLICKER_STATION
	setevent EVENT_MIMIKYU_GONE
	checkcode VAR_MONJUSTCAUGHT
	if_equal MIMIKYU, .CaughtMimikyu
	opentext
	writetext KomoreCommunityCenterMimikyuTextGone
	waitbutton
.no
	closetext
	spriteface 1, LEFT
.CaughtMimikyu
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	end

KomoreCommunityCenterWooperText:
	text "A dusty old"
	line "WOOPER doll."
	done
	
KomoreCommunityCenterClefairyText:
	text "A dusty old"
	line "CLEFAIRY doll."
	done
	
KomoreCommunityCenterEeveeText:
	text "A dusty old"
	line "EEVEE doll."
	done
	
KomoreCommunityCenterPikachuText:
	text "A shabby looking"
	line "PIKACHU doll…"
	done
	
KomoreCommunityCenterPikachuText2:
	text "A shabby looking"
	line "PIKACHU doll…"
	
	para "…"
	
	para "It seems to be"
	line "staring…"
	
	para "Stare back?"
	done
	
KomoreCommunityCenterPikachuText3:
	text "…"
	
	para "Keep staring?"
	done
	
KomoreCommunityCenterPikachuText4:
	text "The doll"
	line "attacked!"
	done
	
KomoreCommunityCenterMimikyuTextGone:
	text "MIMIKYU slinked"
	line "away sadly…"
	done
	
Movement_KomoroMimikyu1:
	turn_head_up
	turn_head_up
	turn_head_down
	turn_head_down
	step_end
	
Movement_KomoroMimikyu2:
rept 20
	turn_head_up
	turn_head_up
	turn_head_down
	turn_head_down
endr
	step_end
	