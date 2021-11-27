Route10RestHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def  9,  1, 3, ROUTE_10
	warp_def  9,  2, 3, ROUTE_10

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  4, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, Route10RestHouseNPC, -1

	const_def 1 ; object constants
	const ROUTE_10_REST_HOUSE_NPC
	
	
Route10RestHouseNPC:
	faceplayer
	opentext
	writetext Route10RestHouseNPCText1
.return
	yesorno
	iffalse .no
	closetext
	special FadeOutPalettesBlack
	special HealParty
	special SaveMusic
	playmusic MUSIC_HEAL
	pause 60
	special RestoreMusic
	callasm LoadMapPals
	special FadeInPalettes
	pause 10
	opentext
	writetext Route10RestHouseNPCText3
	jump .return
.no
	writetext Route10RestHouseNPCText2
	waitbutton
	closetext
	spriteface ROUTE_10_REST_HOUSE_NPC, LEFT
	end
	
Route10RestHouseNPCText1:
	text "Oh it's freezing"
	line "cold out there!"
	
	para "You must be"
	line "exhausted, child!"
	
	para "Why dont you rest"
	line "a while here?"
	done
	
Route10RestHouseNPCText2:
	text "Oh my!"
	
	para "Well, suit"
	line "yourself…"
	done
	
Route10RestHouseNPCText3:
	text "You still look"
	line "so tired!"
	
	para "Why don't you"
	line "rest some more?"
	done