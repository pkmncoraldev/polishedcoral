ObscuraFortuneHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, ObscuraFortuneHouseCallback

	db 2 ; warp events
	warp_def  6,  2, 5, OBSCURA_CITY
	warp_def  6,  3, 5, OBSCURA_CITY

	db 0 ; coord events

	db 1 ; bg events
	signpost  3,  2, SIGNPOST_READ, ObscuraFortuneHouseTeller

	db 5 ; object events
	person_event SPRITE_ARTIFACTS,  3,  3, SPRITEMOVEDATA_DEALER_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, ObscuraFortuneHouseTeller, EVENT_HIDE_OW_OBJECTS_PURPLE
	person_event SPRITE_ARTIFACTS,  3,  3, SPRITEMOVEDATA_DEALER_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, ObscuraFortuneHouseTeller, EVENT_HIDE_OW_OBJECTS_TEAL
	person_event SPRITE_GENERAL_VARIABLE_1,  2,  3, SPRITEMOVEDATA_LEMONADE, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObscuraFortuneHouseTeller, -1
	object_event  1,  2, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, MEOWTH, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, ALOLAN_FORM, ObscuraFortuneHouseMoewth, -1
	object_event  4,  2, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, PERSIAN, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, ALOLAN_FORM, ObscuraFortuneHousePersian, -1
	
	
ObscuraFortuneHouseCallback:
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_BREEDER
	readvar VAR_PLAYER_COLOR
	if_equal 4, .purple
	setevent EVENT_HIDE_OW_OBJECTS_TEAL
	clearevent EVENT_HIDE_OW_OBJECTS_BLUE
	clearevent EVENT_HIDE_OW_OBJECTS_BROWN
	clearevent EVENT_HIDE_OW_OBJECTS_PURPLE
	clearevent EVENT_HIDE_OW_OBJECTS_PINK
	clearevent EVENT_HIDE_OW_OBJECTS_RED
	return
.purple
	clearevent EVENT_HIDE_OW_OBJECTS_TEAL
	clearevent EVENT_HIDE_OW_OBJECTS_BLUE
	clearevent EVENT_HIDE_OW_OBJECTS_BROWN
	setevent EVENT_HIDE_OW_OBJECTS_PURPLE
	clearevent EVENT_HIDE_OW_OBJECTS_PINK
	clearevent EVENT_HIDE_OW_OBJECTS_RED
	return
	
ObscuraFortuneHouseMoewth:
	opentext TEXTBOX_POKEMON, MEOWTH
	writetext ObscuraFortuneHouseMoewthText
	cry MEOWTH
	waitsfx
	waitbutton
	endtext
	
ObscuraFortuneHouseMoewthText:
	text "Mee-OW!"
	done
	
ObscuraFortuneHousePersian:
	opentext TEXTBOX_POKEMON, PERSIAN
	writetext ObscuraFortuneHousePersianText
	cry PERSIAN
	waitsfx
	waitbutton
	endtext
	
ObscuraFortuneHousePersianText:
	text "Purrrr…"
	done
	
ObscuraFortuneHouseTeller:
	checkcode VAR_FACING
	if_equal UP, .YouAreFacingUp
	jumptext ObscuraFortuneHouseTellerBallText
.YouAreFacingUp
	opentext
	checkevent EVENT_TALKED_TO_FORTUNE_TELLER
	iftrue .talked_once
	setevent EVENT_TALKED_TO_FORTUNE_TELLER
	writetext ObscuraFortuneHouseTellerText1
	special PlaceMoneyTopRight
	yesorno
	iffalse .no
	checkmoney $0, 1500
	if_equal $2, .nomoney
	writetext ObscuraFortuneHouseTellerText2
	jump .cont
.talked_once
	writetext ObscuraFortuneHouseTellerText3
	special PlaceMoneyTopRight
	yesorno
	iffalse .no
	checkmoney $0, 1500
	if_equal $2, .nomoney
	writetext ObscuraFortuneHouseTellerText2
.cont
	loadmenu .ObscuraFortuneHouseTellerMenuData
	verticalmenu
	closewindow
	if_equal $1, .tms
	if_equal $2, .tapes
	if_equal $3, .decos
	if_equal $4, .encounters
.tms
	playsound SFX_TRANSACTION
	takemoney $0, 1500
	special PlaceMoneyTopRight
	pause 15
	refreshscreen $0
	pause 5
	scall ObscuraFortuneHouseTellerCutscene
	callasm ObscuraFortuneHouseTellerSetupTMsAsm
	if_equal $69, .no_more
	waitbutton
	closetext
	end
.tapes
	playsound SFX_TRANSACTION
	takemoney $0, 1500
	special PlaceMoneyTopRight
	pause 15
	refreshscreen $0
	pause 5
	scall ObscuraFortuneHouseTellerCutscene
	callasm ObscuraFortuneHouseTellerSetupTapesAsm
	if_equal $69, .no_more
	waitbutton
	closetext
	end
.decos
	playsound SFX_TRANSACTION
	takemoney $0, 1500
	special PlaceMoneyTopRight
	pause 15
	refreshscreen $0
	pause 5
	scall ObscuraFortuneHouseTellerCutscene
	callasm ObscuraFortuneHouseTellerSetupDecosAsm
	if_equal $69, .no_more
	waitbutton
	closetext
	end
.encounters
	playsound SFX_TRANSACTION
	takemoney $0, 1500
	special PlaceMoneyTopRight
	pause 15
	refreshscreen $0
	pause 5
	scall ObscuraFortuneHouseTellerCutscene
	callasm ObscuraFortuneHouseTellerSetupUniqueEncountersAsm
	if_equal $69, .no_more
	waitbutton
	closetext
	end
.no
	closetext
	end
.no_more
	writetext NoMoreFortunesText
	special PlaceMoneyTopRight
	callasm BGMapAnchorTopLeft
	pause 5
	playsound SFX_TRANSACTION
	givemoney $0, 1500
	special PlaceMoneyTopRight
	pause 15
	refreshscreen $0
	pause 5
	end
.nomoney
	writetext ObscuraFortuneHouseTellerTextNoMoney
	waitbutton
	closetext
	end

.ObscuraFortuneHouseTellerMenuData
	db $40 ; flags
	db 04, 00 ; start coords
	db 11, 19 ; end coords
	dw .MenuDataObscuraFortuneHouseTeller
	db 1 ; default option
; 0x48e04

.MenuDataObscuraFortuneHouseTeller: ; 0x48e04
	db $80 ; flags
	db 3 ; items
	db "TMs@"
	db "AUDIO CASSETTES@"
	db "ROOM DECOR@"
	db "UNIQUE ENCOUNTERS@"	;dummied out
	
ObscuraFortuneHouseTellerCutscene:
	closetext
	pause 20
	special Special_FadeOutMusic
	pause 15
	callasm ObscuraFortuneTellerPalettesAsm2
	special FadeInPalettes
	pause 20
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_FORTUNE_TELLER
	pause 15
	playsound SFX_FORESIGHT
	callasm ObscuraFortuneTellerPalettesAsm1
	special FadeInPalettes
	waitsfx
	pause 10
	playmusic MUSIC_CRYSTAL_BALL
	pause 10
	opentext
	writetext ObscuraFortuneHouseTellerCutsceneText1
	changeaction 3, PERSON_ACTION_TILE_HALFWAY_LEFT
	pause 15
	changeaction 3, PERSON_ACTION_LEMONADE
	pause 3
	changeaction 3, PERSON_ACTION_TILE_HALFWAY_RIGHT
	pause 15
	changeaction 3, PERSON_ACTION_LEMONADE
	pause 3
	changeaction 3, PERSON_ACTION_TILE_HALFWAY_LEFT
	pause 15
	changeaction 3, PERSON_ACTION_LEMONADE
	pause 3
	changeaction 3, PERSON_ACTION_TILE_HALFWAY_RIGHT
	pause 7
	changeaction 3, PERSON_ACTION_LEMONADE
	pause 1
	changeaction 3, PERSON_ACTION_TILE_HALFWAY_LEFT
	pause 7
	changeaction 3, PERSON_ACTION_LEMONADE
	pause 1
	changeaction 3, PERSON_ACTION_TILE_HALFWAY_RIGHT
	pause 3
	changeaction 3, PERSON_ACTION_LEMONADE
	changeaction 3, PERSON_ACTION_TILE_HALFWAY_LEFT
	pause 3
	changeaction 3, PERSON_ACTION_LEMONADE
	changeaction 3, PERSON_ACTION_TILE_HALFWAY_RIGHT
	pause 3
	changeaction 3, PERSON_ACTION_LEMONADE
	changeaction 3, PERSON_ACTION_LEMONADE_UP
	playmusic MUSIC_NONE
	playsound SFX_RAGE
	callasm ObscuraFortuneTellerPalettesAsm3
	special FadeInPalettes
	writetext ObscuraFortuneHouseTellerCutsceneText2
	pause 35
	closetext
	changeaction 3, PERSON_ACTION_LEMONADE
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_BREEDER
	callasm LoadMapPals
	special FadeInPalettes
	pause 20
	playmapmusic
	opentext
	end
	
ObscuraFortuneHouseTellerCutsceneText1:
	text "ABRA! KADABRA!"
	done
	
ObscuraFortuneHouseTellerCutsceneText2:
	text "ALAKAZAM!"
	done
	
ObscuraFortuneTellerPalettesAsm1:
	ld hl, ObscuraFortuneTellerDarkCrystalBallPalette
	jr ObscuraFortuneTellerGetBallPalette
	
ObscuraFortuneTellerPalettesAsm3:
	ld hl, ObscuraFortuneTellerDarkCrystalBallPalette2
ObscuraFortuneTellerGetBallPalette:
	ld a, [wPlayerPalette]
	cp 4
	jr z, .purple
	ld de, wUnknOBPals + 4 palettes
	jr .cont
.purple
	ld de, wUnknOBPals + 5 palettes
.cont
	ld bc, 1 palettes
	ld a, $5 ; BANK(UnknOBPals)
	jp FarCopyWRAM
	
ObscuraFortuneTellerPalettesAsm2:
	ld hl, ObscuraFortuneTellerDarkPalette
	ld a, $5
	ld de, wUnknBGPals
	ld bc, 7 palettes
	call FarCopyWRAM
	scf
	ld hl, ObscuraFortuneTellerDarkPalette
	ld de, wUnknOBPals + 7 palettes
	ld bc, 1 palettes
	ld a, $5 ; BANK(UnknOBPals)
	jp FarCopyWRAM
	
ObscuraFortuneTellerDarkPalette:
INCLUDE "maps/palettes/bgpals/darkcave.pal"

ObscuraFortuneTellerDarkCrystalBallPalette:
INCLUDE "maps/palettes/obpals/candle.pal"

ObscuraFortuneTellerDarkCrystalBallPalette2:
	RGB 30, 28, 26
	RGB 30, 28, 26
	RGB 30, 28, 26
	RGB 30, 28, 26
	
ObscuraFortuneHouseTellerText1:
	text "Welcome to-<WAIT_S><LNBRK><LNBRK>Cough!<WAIT_S> Cough!"
	
	para "Aagh!<WAIT_S> Whew!"
	
	para "Uhhhhgh…"
	
	para "Sorry about that."
	
	para "Welcome to AUNTIE"
	line "ENIGMA'S DISCOUNT"
	cont "HOUSE 'O FORTUNES!"
	
	para "You see my ad on"
	line "ROUTE 22?"
	
	para "Ha!<WAIT_S> That baby pays"
	line "for itself,"
	cont "I swear!"
	
	para "Anyhoo, whatcha"
	line "need, kiddo?"
	
	para "Oh right, you want"
	line "your fortune told."
	
	para "I shoulda known"
	line "on account of me"
	cont "being psychic and"
	cont "all."
	
	para "Well, it'll cost"
	line "ya!"
	
	para "After tax, it'll"
	line "be ¥1500. Deal?"
	done
	
ObscuraFortuneHouseTellerText2:
	text "Well then,"
	line "what do you want"
	cont "to ask about?"
	done
	
ObscuraFortuneHouseTellerText3:
	text "Welcome to AUNTIE"
	line "ENIGMA'S DISCOUNT"
	cont "HOUSE 'O FORTUNES!"
	
	para "You want your"
	line "fortune told?"
	
	para "Well, it'll cost"
	line "ya!"
	
	para "After tax, it'll"
	line "be ¥1500. Deal?"
	done
	
ObscuraFortuneHouseTellerTextNoMoney:
	text "Sorry, kiddo."
	
	para "You ain't got the"
	line "funds…"
	
	para "This ain't a charity,"
	line "ya know!"
	
ObscuraFortuneHouseTellerBallText:
	text "A shiny"
	line "crystal ball."
	done
	
ObscuraFortuneHouseTellerSetupTMsAsm:
	ld a, 58 ;number of tracked TMHMs + 1
	ld hl, TM_FLAGS_START
	jr ObscuraFortuneHouseTellerAsm
	
ObscuraFortuneHouseTellerSetupTapesAsm:
	ld a, NUM_TAPE_PLAYER_SONGS
	ld hl, TAPE_FLAGS_START
	jr ObscuraFortuneHouseTellerAsm

ObscuraFortuneHouseTellerSetupDecosAsm:
	ld a, 4 ;number of tracked decos + 1
	ld hl, DECO_FLAGS_START
	jr ObscuraFortuneHouseTellerAsm
	
ObscuraFortuneHouseTellerSetupUniqueEncountersAsm:
	ld a, 34 ;number of unique encounters + 1
	ld hl, UNIQUE_ENCOUNTER_FLAGS_START
; fallthru
ObscuraFortuneHouseTellerAsm:
	ld [wCurBattleMon], a
	xor a
	ld c, a
	ld a, [wCurBattleMon]
	ld b, a
.loop
	inc c
	push bc
	ld a, c
	cp b
	jr z, .no_more
	xor a
	ld b, a
	push hl
	inc hl
	add hl, bc
	ld e, l
	ld d, h
	ld b, CHECK_FLAG
	call EventFlagAction
	ld a, c
	and a
	pop hl
	pop bc
	jr nz, .loop
	
.loop2
	ld a, [wCurBattleMon]
	dec a
	call RandomRange
	ld [wCurTMHM], a
	ld c, a
	xor a
	ld b, a
	push hl
	inc hl
	add hl, bc
	ld e, l
	ld d, h
	ld b, CHECK_FLAG
	call EventFlagAction
	ld a, c
	and a
	pop hl
	jr nz, .loop2
	ld a, [wCurBattleMon]
	ld a, 58 ;number of tracked TMHMs + 1
	jr z, .tms
	cp 4 ;number of tracked decos + 1
	jr z, .decos
	cp NUM_TAPE_PLAYER_SONGS
	jr z, .tape
	cp 34 ;number of unique encounters + 1
	jr z, .unique_encounters
	
.no_more
	pop hl
	ld a, $69
	ld [wScriptVar], a
	ret
	
.tms
	ld hl, TM_Text
	call PrintText
	ld hl, BlankTextFortune
	call PrintText
	ld c, 12
	call DelayFrames
	ld hl, TellerTMText
	jr .finish
	
.tape
	ld hl, Music_Text
	call PrintText
	ld hl, BlankTextFortune
	call PrintText
	ld c, 12
	call DelayFrames
	ld hl, TellerTapeText
	jr .finish
	
.decos
	ld hl, TellerDecosText
	jr .finish
	
.unique_encounters
	ld hl, TellerUniqueEncounterText
	
.finish
	ld a, [wCurTMHM]
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintText
	ld hl, BlankTextFortune
	call PrintText
	ld c, 12
	call DelayFrames
	ld hl, TellerEndText
	jp PrintText

NoMoreFortunesText:
	text "Hmm…"
	
	para "I can't see"
	line "anything…"
	
	para "I guess I can't"
	line "help you with that"
	cont "anymore…"
	
	para "Here, I'll give"
	line "you your money"
	cont "back."
	done
	
BlankTextFortune:
	text ""
	done
	
TellerEndText:
	text "…<WAIT_S>And that's all"
	line "I can see for now."
	
	para "Come again if you"
	line "need my help."
	
	para "For a modest fee,"
	line "of course…"
	done
	
TellerTMText:
	dw TM01Text
	dw TM02Text
	dw TM03Text
	dw TM04Text
	dw TM05Text
;	dw TM06Text
	dw TM07Text
	dw TM08Text
	dw TM09Text
	dw TM10Text
	dw TM11Text
	dw TM12Text
	dw TM13Text
	dw TM14Text
;	dw TM15Text
;	dw TM16Text
;	dw TM17Text
	dw TM18Text
	dw TM19Text
;	dw TM20Text
	dw TM21Text
;	dw TM22Text
	dw TM23Text
	dw TM24Text
	dw TM25Text
	dw TM26Text
	dw TM27Text
	dw TM28Text
	dw TM29Text
	dw TM30Text
	dw TM31Text
	dw TM32Text
;	dw TM33Text
	dw TM34Text
	dw TM35Text
	dw TM36Text
	dw TM37Text
	dw TM38Text
	dw TM39Text
	dw TM40Text
;	dw TM41Text
	dw TM42Text
	dw TM43Text
;	dw TM44Text
	dw TM45Text
	dw TM46Text
	dw TM47Text
	dw TM48Text
	dw TM49Text
;	dw TM50Text
;	dw TM51Text
;	dw TM52Text
	dw TM53Text
	dw TM54Text
	dw TM55Text
	dw TM56Text
	dw TM57Text
	dw TM58Text
	dw TM59Text
	dw TM60Text
	dw TM61Text
	dw TM62Text
	dw TM63Text
	dw TM64Text
	dw TM65Text
	dw TM66Text
	dw TM67Text
;	dw TM68Text
	dw TM69Text
	dw TM70Text
	
TM_Text:
	text "I see a TM…"
	prompt
	
TM01Text:
	text "There's a man in"
	line "LUSTER CITY."
	
	para "He's outside in the"
	line "BUSINESS DISTRICT."
	
	para "He'll give it to"
	line "you."
	prompt

TM02Text:
	text "It's deep"
	line "underground."
	
	para "Look in a cave"
	line "NORTH of the"
	cont "CROSSROADS INN."
	prompt

TM03Text:
	text "There's a girl in"
	line "LUSTER CITY."
	
	para "She lives in an"
	line "apartment in the"
	cont "HOUSING DISTRICT."
	
	para "She'll give it to"
	line "you."
	prompt

TM04Text:
	text "The MASTER…"
	
	para "You must return to"
	line "his dojo for more"
	cont "training…"
	prompt

TM05Text:
	text "You're on a sunny"
	line "island."
	
	para "Beautiful ladies"
	line "in bikinis walk"
	cont "down a runway."
	
	para "Oh my!"
	prompt

TM07Text:
	text "It's in"
	line "FLICKER PASS."
	
	para "It's close to the"
	line "SOUTH entrance,"
	
	para "but you'll need to"
	line "walk around some"
	cont "rocks."
	prompt

TM08Text:
	text "The MASTER…"
	
	para "You must return to"
	line "his dojo for more"
	cont "training…"
	prompt

TM09Text:
TM11Text:
TM18Text:
TM40Text:
TM46Text:
TM56Text:
TM59Text:
TM63Text:
	text "It's a given to"
	line "you by a strong"
	cont "TRAINER."
	
	para "A GYM LEADER."
	prompt

TM10Text:
	text "It's deep in "
	line "STARGLOW CAVERN."
	
	para "If you're coming"
	line "from GLINT CITY,"
	cont "you can't miss it."
	prompt

TM12Text:
	text "DUSK TURNPIKE is"
	line "where it is."
	
	para "To get behind the"
	line "house, you'll need"
	cont "to go under the"
	cont "highway."
	prompt

TM13Text:
	text "It's underwater."
	
	para "You DIVE into the"
	line "ocean NORTH of"
	cont "SUNBEAM ISLAND."
	prompt

TM14Text:
   text "It's somewhere in"
	line "the snow."
	
	para "It's in a place"
	line "someone was once"
	cont "camping."
	
	para "They're gone now,"
	line "though."
	prompt

TM19Text:
	text "It's in a cave"
	line "above a giant"
	cont "waterfall in the"
	cont "jungle."
	
	para "It's guarded by"
	line "a big… flower?"
	prompt

TM21Text:
	text "It's in the snow."
	
	para "It's NORTH of a"
	line "frozen lake EAST"
	cont "of TWINKLE TOWN."
	prompt

TM23Text:
	text "It's in a house in"
	line "DUSK TURNPIKE."
	
	para "That should narrow"
	line "it down…"
	prompt

TM24Text:
	text "It's floating off"
	line "the coast of"
	cont "SUNBEAM ISLAND."
	
	para "It's in a spot you"
	line "can only reach"
	cont "from the jungle."
	prompt

TM25Text:
	text "There's a man in"
	line "the SURF SHACK on"
	cont "SUNBEAM ISLAND."
	
	para "I think he's a"
	line "surfer."
	prompt

TM26Text:
	text "It's dry and hot."
	
	para "A trailer was once"
	line "on top of it, but"
	cont "it's gone now…"
	prompt

TM27Text:
	text "There's a house on"
	line "ROUTE 3."
	
	para "Go there and prove"
	line "your friendship."
	prompt

TM28Text:
	text "It's on a dry,"
	line "desert route, but…"
	
	para "how do you get up"
	line "there?"
	prompt

TM29Text:
	text "TM29"
	line "TODO"
	prompt

TM30Text:
	text "It's in the ruins"
	line "where a community"
	cont "once gathered."
	
	para "I see dolls and"
	line "fallen leaves from"
	cont "outside."
	
	para "Does that narrow"
	line "it down?"
	prompt

TM31Text:
	text "It's in"
	line "GLINT GROVE."
	
	para "It's in some grass"
	line "SOUTH of a pair of"
	cont "TWINS."
	prompt

TM32Text:
	text "TM32"
	line "TODO"
	prompt

TM34Text:
	text "It's in the grass"
	line "in the hear of"
	cont "the jungle."
	
	para "It's past a"
	line "cave behind the"
	cont "waterfall."
	prompt

TM35Text:
	text "TM35"
	line "TODO"
	prompt

TM36Text:
	text "TM36"
	line "TODO"
	prompt

TM37Text:
	text "It's in a desert"
	line "town."
	
	para "Just climb the"
	line "rocks, and it's"
	cont "yours."
	prompt

TM38Text:
	text "It's on the outside"
	line "of FLICKER PASS."
	
	para "You'll need to move"
	line "a rock from the"
	cont "path."
	prompt

TM39Text:
	text "TM39"
	line "TODO"
	prompt

TM42Text:
	text "It's at the top of"
	line "the LIGHTHOUSE."
	
	para "There waits a"
	line "hungry #MON."
	prompt

TM43Text:
	text "It's in the"
	line "CONNECTING CAVERN."
	
	para "You can get there"
	line "from under the"
	cont "LIGHTHOUSE."
	prompt

TM45Text:
	text "It's past the grass"
	line "on ROUTE 6."
	
	para "It's pretty hard"
	line "to miss…"
	prompt

TM47Text:
	text "It's on the airport"
	line "runway."
	
	para "Now if you sneak"
	line "out there, I don't"
	cont "responsibility!"
	prompt

TM48Text:
	text "There's a pusher"
	line "fan on ROUTE 32."
	
	para "Show him how it's"
	line "done, and he'll"
	cont "reward you."
	prompt

TM49Text:
	text "It's in a cave"
	line "under GLINT GROVE."
	
	para "Try going down"
	line "the river."
	prompt

TM53Text:
	text "You'll get it from"
	line "a slightly smelly"
	cont "lady for winning"
	cont "her game."
	
	para "Check the water"
	line "around ROUTE 30."
	prompt

TM54Text:
	text "There's a thirsty"
	line "girl in the"
	cont "ROUTE 5 gate."
	
	para "Help her out!"
	prompt

TM55Text:
	text "It's underwater."
	
	para "Check the ocean"
	line "around ROUTE 13."
	prompt

TM57Text:
	text "It's in LUMINA"
	line "TOWN."
	
	para "It's nearby an"
	line "ELDER's house."
	prompt

TM58Text:
	text "It's EAST of"
	line "BRIGHTBURG."
	
	para "If the way is"
	line "blocked, try a"
	cont "different path."
	prompt

TM60Text:
	text "It's high up a"
	line "hill on ROUTE 29."
	
	para "Try looking for"
	line "spots to climb."
	prompt

TM61Text:
	text "It's guarded by"
	line "some girls at a"
	cont "train's graveyard."
	
	para "Try climbing the"
	line "rocks by FLICKER"
	cont "PASS."
	prompt

TM62Text:
	text "It's hiding behind"
	line "a sunflower in"
	cont "some blue flowers."
	prompt

TM64Text:
	text "Go to ROUTE 28."
	
	para "It's there you'll"
	line "prove your pushing"
	cont "prowess."
	prompt

TM65Text:
	text "It's deep inside"
	line "MT. ONWA."
	
	para "If you see molten"
	line "lava, try looking"
	cont "NORTHWEST."
	prompt

TM66Text:
	text "It's atop the first"
	line "waterfall you saw"
	cont "on your journey."
	
	para "Do you remember"
	line "where that is?"
	prompt

TM67Text:
	text "It's a reward for"
	line "showing your sick"
	cont "SKATEBOARD skills"
	cont "at the SKATEPARK."
	
	para "If you need a"
	line "SKATEBOARD, look"
	cont "NORTHWEST in"
	cont "LUSTER CITY."
	prompt

TM69Text:
	text "It's on ROUTE 8,"
	line "but you can't reach"
	cont "it from ROUTE 8."
	
	para "What on earth does"
	line "THAT mean?"
	prompt

TM70Text:
	text "There's a shady"
	line "character atop"
	cont "STARGLOW CAVERN."
	
	para "You'll need to"
	line "climb from the"
	cont "outside."
	
	para "Check near"
	line "GLINT CITY."
	prompt

TellerTapeText:
	dw Music_TitleScreenText
	dw Music_SunsetBayText
	dw Music_MomText
	dw Music_PokemonCenterText
	dw Music_RivalEncounterText
	dw Music_RivalBattleText
	dw Music_Route1Text
	dw Music_WildBattleText
	dw Music_WildPokemonVictoryText
	dw Music_DayBreakVillageText
	dw Music_Route2Text
	dw Music_YoungsterEncounterText
	dw Music_TrainerBattleText
	dw Music_TrainerVictoryText
	dw Music_DayBreakGrottoText
	dw Music_GlintCityText
	dw Music_GlintGroveText
	dw Music_GymText
	dw Music_GymBattleText
	dw Music_GymLeaderVictoryText
	dw Music_EvolutionText
	dw Music_LassEncounterText
	dw Music_SnareInvasionText
	dw Music_TeamSnareEncounterText
	dw Music_SnareBattleText
	dw Music_SnareVictoryText
	dw Music_EncounterGymLeaderText
	dw Music_StarglowValleyText
	dw Music_Route4Text
	dw Music_HikerEncounterText
	dw Music_LavaText
	dw Music_WildBossBattleText
	dw Music_SunbeamIslandText
	dw Music_GscGameCornerText
	dw Music_SpruceLabText
	dw Music_SnareThemeText
	dw Music_SnareAdminBattleText
	dw Music_EventideText
	dw Music_EventideVillageText
	dw Music_DodrioRaceText
	dw Music_FlickerStationText
	dw Music_PokemaniacEncounterText
	dw Music_Route10Text
	dw Music_TwinkleTownText
	dw Music_LusterSewerText
	dw Music_TrainText
	dw Music_LusterCityText
	dw Music_HardcoreEncounterText
	dw Music_MinibossBattleText
	dw Music_Route12Text
	dw Music_WaterRouteText
	dw Music_ShimmerCityText
	dw Music_BrilloTownText
	dw Music_OasisText
	dw Music_SnareLeaderBattleText
	dw Music_GentlemanEncounterText
	dw Music_BarText
	dw Music_DarknessText
	dw Music_AutumnText
	dw Music_DojoText
	dw Music_UnderwaterText
	dw Music_Route28Text
	dw Music_MinasThemeText
	dw Music_RBYWildBattleText
	dw Music_RivalBattle2Text
	dw Music_ErikaText
	dw Music_ObscuraText
	dw Music_LuminaText
	dw Music_DragonShrine
	dw Music_Unused
	dw Music_Unused
	dw Music_Unused
	dw Music_Unused
	dw Music_Unused
	dw Music_Unused
	dw Music_Unused
	dw Music_Unused
	dw Music_Unused
	dw Music_Unused
	dw Music_Unused
	dw Music_Unused
	dw Music_Unused
	dw Music_Unused
	dw Music_Unused
	dw Music_Unused
	dw Music_Unused
	dw Music_Unused
	dw Music_Unused
	
Music_Text:
	text "I see an"
	line "AUDIO CASSETTE…"
	prompt
	
Music_TitleScreenText:
	text "TITLE SCREEN"
	line "TODO"
	prompt
	
Music_SunsetBayText:
	text "It's behind a house"
	line "in your hometown,"
	cont "near some trees…"
	prompt
	
Music_MomText:
	text "It's on the table"
	line "at home!"
	
	para "Weren't you even"
	line "paying attention?"
	prompt
	
Music_PokemonCenterText:
	text "It's in a bookcase"
	line "inside a #MON"
	cont "CENTER."
	
	para "No one is around…<WAIT_S>"
	line "How eerie!"
	prompt
	
Music_RivalEncounterText:
 	text "RIVAL ENCOUNTER"
	line "TODO"
	prompt
	
Music_RivalBattleText:
 	text "It's at the foot"
	line "of a skyscraper."
	
	para "You think you can't"
	line "go further EAST,"
	cont "but you can…"
	prompt
	
Music_Route1Text:
 	text "It's hidden in the"
	line "trees on ROUTE 1."
	
	para "It's EAST of a"
	line "ledge."
	prompt
	
Music_WildBattleText:
 	text "It's in the back"
	line "garden of an old"
	cont "woman's house."
	
	para "Between GLINT CITY"
	line "and STARGLOW."
	prompt
	
Music_WildPokemonVictoryText:
 	text "It's behind a"
	line "fence on a ROUTE"
	cont "SOUTH of MOOMOO's."
	prompt
	
Music_DayBreakVillageText:
 	text "It's in a bookcase"
	line "at school."
	prompt
	
Music_Route2Text:
 	text "It's past a pond"
	line "SOUTH of your"
	cont "first GYM BADGE."
	prompt
	
Music_YoungsterEncounterText:
 	text "It's near the rocks"
	line "by a clueless man"
	cont "on ROUTE 2."
	prompt
	
Music_TrainerBattleText:
 	text "TRAINER BATTLE"
	line "TODO"
	prompt
	
Music_TrainerVictoryText:
 	text "TRAINER VICTORY"
	line "TODO"
	prompt
	
Music_DayBreakGrottoText:
 	text "It's in a cave in"
	line "MT. ONWA."
	
	para "A room with many"
	line "stairs nearby"
	cont "DAYBREAK VILLAGE."
	prompt
	
Music_GlintCityText:
 	text "It's in GLINT CITY."
	
	para "Look between two"
	line "tall buildings."
	prompt
	
Music_GlintGroveText:
 	text "It's in a cave"
	line "in a pink forest."
	
	para "I can see many"
	line "painters."
	prompt
	
Music_GymText:
 	text "It's in a bookcase"
	line "in the library."
	
	para "You remember where"
	line "the library was,"
	cont "right?"
	prompt
	
Music_GymBattleText:
 	text "GYM BATTLE"
	line "TODO"
	prompt
	
Music_GymLeaderVictoryText:
 	text "It's in a tackle"
	line "shop."
	
	para "It's in a cooler"
	line "by some fishing"
	cont "rods."
	prompt
	
Music_EvolutionText:
 	text "It's in a cave"
	line "by the sea in"
	cont "SOUTH ONWA."
	
	para "Try getting caught"
	line "in the current."
	prompt
	
Music_LassEncounterText:
 	text "It's in a pink"
	line "forest."
	
	para "Look below a"
	line "very large tree."
	prompt
	
Music_SnareInvasionText:
 	text "It's hidden near"
	line "a tent in a dense"
	cont "jungle."
	prompt
	
Music_TeamSnareEncounterText:
 	text "It's in a house in"
	line "STARGLOW VALLEY."
	
	para "It's on a table."
	prompt
	
Music_SnareBattleText:
 	text "SNARE BATTLE"
	line "TODO"
	prompt
	
Music_SnareVictoryText:
 	text "SNARE VICTORY"
	line "TODO"
	prompt
	
Music_EncounterGymLeaderText:
 	text "It's EAST of"
	line "STARGLOW VALLEY."
	
	para "Try heading up"
	line "the river nearby."
	prompt
	
Music_StarglowValleyText:
 	text "It's by the river"
	line "SOUTH of ROUTE 3."
	
	para "Try using SURF."
	prompt
	
Music_Route4Text:
 	text "It's in the middle"
	line "of a great lake."
	
	para "That should be"
	line "enough info…"
	prompt
	
Music_HikerEncounterText:
 	text "It's inside of"
	line "MT. ONWA."
	
	para "In a room right"
	line "before you get"
	cont "some fresh air."
	prompt
	
Music_LavaText:
 	text "It's deep inside"
	line "MT. ONWA."
	
	para "On a small island"
	line "in the lava."
	prompt
	
Music_WildBossBattleText:
 	text "It's in a cave"
	line "under GLINT GROVE."
	
	para "Try going down"
	line "the river."
	prompt
	
Music_SunbeamIslandText:
 	text "It's on a beach"
	line "on a big island."
	
	para "It's hidden in a"
	line "sandcastle."
	prompt
	
Music_GscGameCornerText:
 	text "It's on ROUTE 12."
	
	para "Check EAST of"
	line "the SKATEPARK."
	prompt
	
Music_SpruceLabText:
 	text "It's in the"
	line "PROF.'s LAB."
	
	para "Maybe it got"
	line "thrown away?"
	prompt
	
Music_SnareThemeText:
 	text "SNARE THEME"
	line "TODO"
	prompt
	
Music_SnareAdminBattleText:
 	text "SNARE ADMIN"
	line "BATTLE"
	cont "TODO"
	prompt
	
Music_EventideText:
 	text "It's in the yard"
	line "of a big house"
	cont "in the woods."
	
	para "Spooky…"
	prompt
	
Music_EventideVillageText:
 	text "It's in a wheat"
	line "field."
	
	para "You could probably"
	line "see it by plane…"
	prompt
	
Music_DodrioRaceText:
 	text "It's in a spot"
	line "you'll only reach"
	cont "on a big bird."
	
	para "I can see you"
	line "running really"
	cont "fast."
	prompt
	
Music_FlickerStationText:
 	text "It's in a place"
	line "trains go to die."
	
	para "Try climbing the"
	line "rocks by FLICKER"
	cont "PASS."
	prompt
	
Music_PokemaniacEncounterText:
 	text "It's in FLICKER"
	line "PASS."
	
	para "It's as far EAST"
	line "as you can go"
	cont "in there."
	prompt
	
Music_Route10Text:
 	text "It's very deep"
	line "in an icy temple."
	
	para "Check to the EAST"
	line "of ROUTE 10."
	prompt
	
Music_TwinkleTownText:
 	text "It's by some"
	line "firewood in"
	cont "TWINKLE TOWN."
	prompt
	
Music_LusterSewerText:
 	text "It's under"
	line "LUSTER CITY."
	
	para "There's a room"
	line "with a powerful"
	cont "#MON."
	prompt
	
Music_TrainText:
 	text "It's somewhere"
	line "on the train."
	
	para "Have you taken"
	line "a return trip?"
	prompt
	
Music_LusterCityText:
 	text "It's in shop in the"
	line "SHOPPING MALL."
	
	para "CASSETTE TAPES"
	line "are outdated."
	
	para "They got rid of"
	line "some old stock…"
	prompt
	
Music_HardcoreEncounterText:
 	text "It's on ROUTE 9."
	
	para "Try the grass to"
	line "the SOUTH."
	prompt
	
Music_MinibossBattleText:
 	text "It's NORTH of the"
	line "INN but SOUTH of"
	cont "the bridge."
	
	para "Climb some rocks"
	line "and walk down."
	prompt
	
Music_Route12Text:
 	text "It's on ROUTE 19."
	
	para "You can see it"
	line "from the tunnel,"
	
	para "but you can only"
	line "reach it from"
	cont "the flowerbed."
	prompt
	
Music_WaterRouteText:
 	text "It's in the"
	line "ocean SOUTH of"
	cont "LAKE ONWA."
	
	para "Look EAST of the"
	line "LIGHTHOUSE."
	prompt
	
Music_ShimmerCityText:
 	text "It's in SHIMMER"
	line "CITY."
	
	para "It's in a dark,"
	line "wet place."
	
	para "You can hear"
	line "footsteps above."
	prompt
	
Music_BrilloTownText:
 	text "It's in the"
	line "POLICE STATION"
	cont "in a desert town."
	
	para "I think it's in"
	line "the trash can."
	prompt
	
Music_OasisText:
 	text "There's a secret"
	line "spot in the"
	cont "DESERT WASTELAND."
	
	para "Pay attention to"
	line "the flags."
	prompt
	
Music_SnareLeaderBattleText:
 	text "SNARE LEADER"
	line "BATTLE"
	cont "TODO"
	prompt
	
Music_GentlemanEncounterText:
 	text "It's on ROUTE 11."
	
	para "A construction"
	line "barrier blocks"
	cont "the way."
	
	para "Maybe you can hop"
	line "it somehow?"
	prompt
	
Music_BarText:
 	text "It's in a seedy"
	line "bar…"
	
	para "Wherever it is,"
	line "I can hear music…"
	prompt
	
Music_DarknessText:
 	text "It's in the"
	line "CONNECTING CAVERN."
	
	para "You can get there"
	line "from under the"
	cont "LIGHTHOUSE."
	prompt
	
Music_AutumnText:
 	text "It's on ROUTE 27."
	
	para "Try getting into"
	line "the construction"
	cont "plots."
	prompt
	
Music_DojoText:
 	text "DOJO"
	line "TODO"
	prompt
	
Music_UnderwaterText:
 	text "It's on ROUTE 15."
	
	para "Head EAST."
	
	para "It's on a rock"
	line "you can't reach"
	cont "easily."
	prompt
	
Music_Route28Text:
 	text "It's on ROUTE 29."
	
	para "Look SOUTH after"
	line "leaving town."
	prompt
	
Music_MinasThemeText:
 	text "MINAS THEME"
	line "TODO"
	prompt
	
Music_RBYWildBattleText:
 	text "LEGENDARY BIRDS"
	line "TODO"
	prompt
	
Music_RivalBattle2Text:
 	text "RIVAL BATTLE 2"
	line "TODO"
	prompt
	
Music_ErikaText:
 	text "It's in RADIANT"
	line "TOWN."
	
	para "It's inside of"
	line "a radio."
	prompt
	
Music_ObscuraText:
	text "OBSCURA CITY"
	line "TODO"
	prompt
	
Music_LuminaText:
	text "LUMINA TOWN"
	line "TODO"
	prompt
	
Music_DragonShrine:
	text "DRAGON SHRINE"
	line "TODO"
	prompt
	
Music_Unused:
	text "ERROR!!"
	prompt
	
TellerDecosText:
	dw MareepDollText
	dw GirafarigDollText
	dw MuseumPhotoText
	
MareepDollText:
	text "MAREEP DOLL"
	line "TODO"
	prompt
	
GirafarigDollText:
	text "GIRAFARIG DOLL"
	line "TODO"
	prompt
	
MuseumPhotoText:
	text "MUSEUM PHOTO"
	line "TODO"
	prompt
	
TellerUniqueEncounterText:
	dw UniqueEncounterTeacherText
	dw UniqueEncounterMinaGlintGroveText
	dw UniqueEncounterLedianBossText
	dw UniqueEncounterDisguiseMasterMtOnwaText
	dw UniqueEncounterMagmarBossText
	dw UniqueEncounterElectabuzzBossText
	dw UniqueEncounterSudowoodoBossText
	dw UniqueEncounterSpiritombBossText
	dw UniqueEncounterMamoswineBossText
	dw UniqueEncounterMinaJournalText
	dw UniqueEncounterMinaRoute6Text
	dw UniqueEncounterMinaRoute11Text
	dw UniqueEncounterMinaRadiantFieldText
	dw UniqueEncounterMinaRoute29Text
	dw UniqueEncounterMinaRoute10Text
	dw UniqueEncounterMallCopText
	dw UniqueEncounterDisguiseMasterLusterSewerText
	dw UniqueEncounterFrankieText
	dw UniqueEncounterMukBossText
	dw UniqueEncounterPorygonBossText
	dw UniqueEncounterPatchesText
	dw UniqueEncounterDisguiseMasterHuntersThicketText
	dw UniqueEncounterLedianRangerText
	dw UniqueEncounterClefableBossText
	dw UniqueEncounterLaprasBossText
	dw UniqueEncounterDrakloakBossText
	dw UniqueEncounterDisguiseMasterRoute18Text
	dw UniqueEncounterVolcaronaBossText
	dw UniqueEncounterCursolaBossText
	dw UniqueEncounterErikaText
	dw UniqueEncounterMimikyuBossText
	dw UniqueEncounterDittoBossText
	dw UniqueEncounterNoivernBossText
	dw UniqueEncounterMarowakBossText
	dw UniqueEncounterVileplumeBossText
	
UniqueEncounterTeacherText:
	text "TEACHER"
	done
	
UniqueEncounterMinaGlintGroveText:
	text "MINA"
	line "GLINT GROVE"
	done
	
UniqueEncounterLedianBossText:
	text "LEDIAN BOSS"
	done
	
UniqueEncounterDisguiseMasterMtOnwaText:
	text "DISGUISE MASTER"
	line "MT OWNA"
	done
	
UniqueEncounterMagmarBossText:
	text "MAGMAR BOSS"
	done
	
UniqueEncounterElectabuzzBossText:
	text "ELECTABUZZ BOSS"
	done
	
UniqueEncounterSudowoodoBossText:
	text "SUDOWOODO BOSS"
	done
	
UniqueEncounterSpiritombBossText:
	text "SPIRITOMB BOSS"
	done
	
UniqueEncounterMamoswineBossText:
	text "MAMOSWINE BOSS"
	done
	
UniqueEncounterMinaJournalText:
	text "MINA"
	line "JOURNAL"
	done
	
UniqueEncounterMinaRoute6Text:
	text "MINA"
	line "ROUTE 6"
	done
	
UniqueEncounterMinaRoute11Text:
	text "MINA"
	line "ROUTE 11"
	done
	
UniqueEncounterMinaRadiantFieldText:
	text "MINA"
	line "RADIANT FIELD"
	done
	
UniqueEncounterMinaRoute29Text:
	text "MINA"
	line "ROUTE 29"
	done
	
UniqueEncounterMinaRoute10Text:
	text "MINA"
	line "ROUTE 10"
	done
	
UniqueEncounterMallCopText:
	text "MALL COP"
	done
	
UniqueEncounterDisguiseMasterLusterSewerText:
	text "DISGUISE MASTER"
	line "LUSTER SEWER"
	done
	
UniqueEncounterFrankieText:
	text "FRANKIE"
	done
	
UniqueEncounterMukBossText:
	text "MUK BOSS"
	done
	
UniqueEncounterPorygonBossText:
	text "PORYGON BOSS"
	done
	
UniqueEncounterPatchesText:
	text "PATCHES"
	done
	
UniqueEncounterDisguiseMasterHuntersThicketText:
	text "DISGUISE MASTER"
	line "HUNTERS THICKET"
	done
	
UniqueEncounterLedianRangerText:
	text "LEDIAN RANGER"
	done
	
UniqueEncounterClefableBossText:
	text "CLEFABLE BOSS"
	done
	
UniqueEncounterLaprasBossText:
	text "LAPRAS BOSS"
	done
	
UniqueEncounterDrakloakBossText:
	text "DRAKLOAK BOSS"
	done
	
UniqueEncounterDisguiseMasterRoute18Text:
	text "DISGUISE MASTER"
	line "ROUTE 18"
	done
	
UniqueEncounterVolcaronaBossText:
	text "VOLCARONA BOSS"
	done
	
UniqueEncounterCursolaBossText:
	text "CURSOLA BOSS"
	done
	
UniqueEncounterErikaText:
	text "ERIKA"
	done
	
UniqueEncounterMimikyuBossText:
	text "MIMIKYU BOSS"
	done
	
UniqueEncounterDittoBossText:
	text "DITTO BOSS"
	done
	
UniqueEncounterNoivernBossText:
	text "NOIVERN BOSS"
	done

UniqueEncounterMarowakBossText:
	text "MAROWAK BOSS"
	done
	
UniqueEncounterVileplumeBossText:
	text "VILEPLUME BOSS"
	done
