ObscuraCity_MapScriptHeader:
	db 2 ; scene scripts
	scene_script ObscuraCityTrigger0
	scene_script ObscuraCityTrigger1

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, ObscuraCityFlyPoint
	callback MAPCALLBACK_TILES, ObscuraCityCallback

	db 10 ; warp events
	warp_def 13, 22, 1, OBSCURA_MUSEUM_1F
	warp_def 13, 23, 2, OBSCURA_MUSEUM_1F
	warp_def  9, 29, 1, OBSCURA_MUSEUM_EMPLOYEE_ROOM
	warp_def 10, 29, 2, OBSCURA_MUSEUM_EMPLOYEE_ROOM
	warp_def 31, 17, 1, OBSCURA_FORTUNE_HOUSE
	warp_def 35, 31, 1, OBSCURA_POKECENTER
	warp_def 37, 21, 2, OBSCURA_MART
	warp_def 37, 13, 1, OBSCURA_MACHO_BRACE_HOUSE
	warp_def 29, 29, 1, OBSCURA_GYM_SPEECH_HOUSE
	warp_def 33,  5, 1, OBSCURA_MUSICIAN_HOUSE

	db 0 ; coord events

	db 10 ; bg events
	signpost 33, 28, SIGNPOST_JUMPTEXT, ObscuraCitySign
	signpost 14, 24, SIGNPOST_JUMPTEXT, ObscuraCityMuseumSign
	signpost  9, 32, SIGNPOST_JUMPTEXT, ObscuraCityMuseumBackSign
	signpost 35, 32, SIGNPOST_READ, ObscuraPokeCenterSign
	signpost 37, 22, SIGNPOST_READ, ObscuraMartSign
	signpost 32, 19, SIGNPOST_JUMPTEXT, ObscuraCityBowlsText
	signpost 31, 15, SIGNPOST_JUMPTEXT, ObscuraCityTrashText
	signpost 31, 14, SIGNPOST_JUMPTEXT, ObscuraCityDebrisText
	signpost 33, 16, SIGNPOST_JUMPTEXT, ObscuraCityDebrisText
	bg_event 34, 33, SIGNPOST_ITEM + PP_UP, EVENT_OBSCURA_CITY_HIDDEN_ITEM

	db 20 ; object events
	person_event SPRITE_SNARE, 14, 22, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObscuraCitySnare1, EVENT_SNARE_GONE_FROM_MUSEUM
	person_event SPRITE_SNARE_GIRL, 14, 23, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObscuraCitySnare2, EVENT_SNARE_GONE_FROM_MUSEUM
	person_event SPRITE_ROCKY, 14, 22, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_OBSCURA_CITY_ROCKY_GONE
	tapeball_event 17, 44, MUSIC_OBSCURA_CITY, 1, EVENT_MUSIC_OBSCURA_CITY
	person_event SPRITE_GAMEBOY_KID, 29, 24, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObscuraCityNPC1, -1
	person_event SPRITE_REDS_MOM, 33, 25, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, ObscuraCityNPC2, -1
	person_event SPRITE_POKEMANIAC, 37, 28, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObscuraCityNPC3, -1
	person_event SPRITE_FAT_GUY, 35, 11, SPRITEMOVEDATA_WANDER, 0, 2, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObscuraCityNPC4, -1
	person_event SPRITE_BEAUTY, 27, 15, SPRITEMOVEDATA_WANDER, 3, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObscuraCityNPC5, -1
	person_event SPRITE_SCHOOLGIRL, 40, 17, SPRITEMOVEDATA_STANDING_RIGHT, 3, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, ObscuraCityNPC67, -1
	person_event SPRITE_TWIN, 40, 18, SPRITEMOVEDATA_STANDING_LEFT, 3, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, ObscuraCityNPC67, -1
	person_event SPRITE_POKEFAN_M, 16, 16, SPRITEMOVEDATA_SPINRANDOM_SLOW, 3, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObscuraCityNPC8, -1
	person_event SPRITE_POKEFAN_F, 16, 17, SPRITEMOVEDATA_SPINRANDOM_SLOW, 3, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObscuraCityNPC9, -1
	person_event SPRITE_COOL_DUDE, 17, 24, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, ObscuraCityNPC10, -1
	person_event SPRITE_CUTE_GIRL, 13, 29, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObscuraCityNPC11, -1
	object_event 16, 40, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, MARILL, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, PLAIN_FORM, ObscuraCityMarill, -1
	object_event 19, 40, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, MARILL, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, PLAIN_FORM, ObscuraCityMarill, -1
	object_event 14, 32, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, MEOWTH, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, PLAIN_FORM, ObscuraCityMeowth, -1
	object_event 20, 31, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, MEOWTH, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, PLAIN_FORM, ObscuraCityMeowth, -1
	itemball_event 32, 27, ETHER, 1, EVENT_OBSCURA_CITY_POKE_BALL
	
	
	const_def 1 ; object constants
	const OBSCURA_CITY_SNARE_1
	const OBSCURA_CITY_SNARE_2
	const OBSCURA_CITY_ROCKY
	const OBSCURA_CITY_DARCY
	
ObscuraCityTrigger0:
	end
	
ObscuraCityTrigger1:
	priorityjump ObscuraCityPostSnareScene
	end
	
ObscuraCityBowlsText:
	text "A food and water"
	line "bowl."
	done
	
ObscuraCityTrashText:
	text "A pile of trash."
	
	para "Gross!"
	done
	
ObscuraCityDebrisText:
	text "Debris is"
	line "scattered about."
	done
	
ObscuraCityMarill:
	opentext TEXTBOX_POKEMON, MARILL
	writetext ObscuraCityMarillText
	cry MARILL
	waitsfx
	waitbutton
	endtext
	
ObscuraCityMarillText:
	text "Ri ri rii!"
	done
	
ObscuraCityMeowth:
	opentext TEXTBOX_POKEMON, MEOWTH
	writetext ObscuraCityMeowthText
	cry MEOWTH
	waitsfx
	waitbutton
	endtext
	
ObscuraCityMeowthText:
	text "Mee-OW!"
	done
	
ObscuraCityNPC1:
	faceplayer
	opentext
	checkevent EVENT_GOT_LINK_CABLE
	iftrue .gotcable
	writetext ObscuraCityNPC1Text1
	waitbutton
	verbosegiveitem LINK_CABLE
	iffalse .NoRoom
.gotcable
	writetext ObscuraCityNPC1Text2
	waitbutton
	closetext
	setevent EVENT_GOT_LINK_CABLE
	spriteface 5, DOWN
	end
.NoRoom
	writetext ObscuraCityNPC1Text3
	waitbutton
	closetext
	spriteface 5, DOWN
	end
	
ObscuraCityNPC1Text1:
	text "I bought this"
	line "to play with my"
	cont "friends,"
	
	para "but then I remem-"
	line "bered that I don't"
	cont "HAVE any friends…"
	
	para "Here.<WAIT_S> I don't"
	line "need it anymore…"
	done
	
ObscuraCityNPC1Text2:
	text "I hope you can use"
	line "that LINK CABLE"
	cont "more than me…"
	done
	
ObscuraCityNPC1Text3:
	text "Oh!"
	
	para "You seem to be"
	line "carrying too much!"
	
	para "Oh well!"
	done
	
ObscuraCityNPC2:
	jumptextfaceplayer ObscuraCityNPC2Text
	
ObscuraCityNPC2Text:
	text "Have you been to"
	line "AUNTIE ENIGMA'S"
	cont "fortune house?"
	
	para "I didn't used to"
	line "buy into all that"
	cont "mumbo-jumbo, but"
	cont "I don't know…"
	
	para "Her predictions"
	line "have never led"
	cont "me astray!"
	done
	
ObscuraCityNPC3:
	jumptextfaceplayer ObscuraCityNPC3Text
	
ObscuraCityNPC3Text:
	text "The road here from"
	line "BRIGHTBURG is a"
	cont "long one, eh?"
	
	para "It can be pretty"
	line "exhausting without"
	cont "taking a break."
	done
	
ObscuraCityNPC4:
	jumptextfaceplayer ObscuraCityNPC4Text
	
ObscuraCityNPC4Text:
	text "#MON training"
	line "isn't all there is"
	cont "to life."
	
	para "You should slow"
	line "down and enjoy"
	cont "your youth!"
	done
	
ObscuraCityNPC5:
	jumptextfaceplayer ObscuraCityNPC5Text
	
ObscuraCityNPC5Text:
	text "Where are you"
	line "from?"
	
	para "SUNSET BAY?<WAIT_S> Wow!"
	
	para "It sounds like"
	line "you've been all"
	cont "around ONWA!"
	done
	
ObscuraCityNPC67:
	jumptext ObscuraCityNPC67Text

ObscuraCityNPC67Text:
	text "No, your MARILL"
	line "is cuter!"
	done
	
ObscuraCityNPC8:
	checkevent EVENT_SNARE_AT_MUSEUM
	iffalse .snare_gone
	jumptextfaceplayer ObscuraCityNPC8Text1
.snare_gone
	jumptextfaceplayer ObscuraCityNPC8Text2
	
ObscuraCityNPC8Text1:
	text "We made plans"
	line "for a whole day"
	cont "at the MUSEUM,"
	
	para "but they won't"
	line "let us in!"
	done
	
ObscuraCityNPC8Text2:
	text "Are we finally"
	line "allowed in the"
	cont "MUSEUM?"
	
	para "About time!"
	done
	
ObscuraCityNPC9:
	checkevent EVENT_SNARE_AT_MUSEUM
	iffalse .snare_gone
	jumptextfaceplayer ObscuraCityNPC9Text1
.snare_gone
	jumptextfaceplayer ObscuraCityNPC9Text2
	
ObscuraCityNPC9Text1:
	text "Is something"
	line "happening at the"
	cont "MUSEUM?"
	done

ObscuraCityNPC9Text2:
	text "Did something"
	line "happen at the"
	cont "MUSEUM?"
	done
	
ObscuraCityNPC10:
	jumptextfaceplayer ObscuraCityNPC10Text
	
ObscuraCityNPC10Text:
	text "I think there's a"
	line "special exhibit"
	cont "at the MUSEUM."
	
	para "I saw an ad for"
	line "a thing called a"
	cont "“DRAGON STONE.”"
	done
	
ObscuraCityNPC11:
	jumptextfaceplayer ObscuraCityNPC11Text
	
ObscuraCityNPC11Text:
	text "See that up there?"
	
	para "That's a back"
	line "entrance only for"
	cont "MUSEUM employees."
	
	para "I wonder if I"
	line "could sneak back"
	cont "there…"
	done

ObscuraCityPostSnareScene:
	opentext TEXTBOX_ROCKY
	writetext ObscuraCityRockyText1
	waitbutton
	closetext
	special Special_FadeOutMusic
	pause 10
	opentext TEXTBOX_UNKNOWN
	writetext ObscuraCityDarcyText1
	playmusic MUSIC_ENCOUNTER_GYM_LEADER
	pause 48
	closetext
	disappear 15
	moveperson 15, 22, 19
	appear 15
	loadvar wObject3Sprite, SPRITE_DARCY
	closetext
	applymovement 15, Movement_ObscuraCityDarcy1
	pause 10
	opentext TEXTBOX_ROCKY
	writetext ObscuraCityRockyText2
	waitbutton
	closetext
	pause 2
	applyonemovement OBSCURA_CITY_ROCKY, turn_step_down
	applyonemovement OBSCURA_CITY_ROCKY, remove_fixed_facing
	opentext TEXTBOX_ROCKY
	writetext ObscuraCityRockyText3
	waitbutton
	closetext
	applyonemovement 15, fix_facing
	applymovement 15, Movement_ObscuraCityDarcy2
	playsound SFX_TACKLE
	opentext TEXTBOX_DARCY
	writetext ObscuraCityDarcyText2
	waitbutton
	closetext
	applymovement 15, Movement_ObscuraCityDarcy2
	playsound SFX_TACKLE
	applymovement 15, Movement_ObscuraCityDarcy2
	playsound SFX_TACKLE
	applymovement 15, Movement_ObscuraCityDarcy2
	playsound SFX_TACKLE
	applyonemovement 15, remove_fixed_facing
	opentext TEXTBOX_DARCY
	writetext ObscuraCityDarcyText3
	waitbutton
	closetext
	pause 5
	applyonemovement OBSCURA_CITY_ROCKY, turn_step_down
	applyonemovement OBSCURA_CITY_ROCKY, remove_fixed_facing
	opentext TEXTBOX_ROCKY
	writetext ObscuraCityRockyText4
	waitbutton
	closetext
	pause 5
	applyonemovement 15, turn_step_up
	applyonemovement 15, remove_fixed_facing
	opentext TEXTBOX_DARCY
	writetext ObscuraCityDarcyText4
	waitbutton
	closetext
	pause 5
	applyonemovement OBSCURA_CITY_ROCKY, turn_step_down
	applyonemovement OBSCURA_CITY_ROCKY, remove_fixed_facing
	opentext TEXTBOX_ROCKY
	writetext ObscuraCityRockyText5
	waitbutton
	closetext
	pause 5
	applyonemovement 15, turn_step_up
	applyonemovement 15, remove_fixed_facing
	opentext TEXTBOX_DARCY
	checkevent EVENT_PLAYER_IS_CORA
	iftrue .girl
	checkevent EVENT_PLAYER_IS_PIPPI
	iftrue .girl
	checkevent EVENT_PLAYER_IS_LEAF
	iftrue .girl
	checkevent EVENT_PLAYER_IS_KRIS
	iftrue .girl
	writetext ObscuraCityDarcyText5
	jump .cont
.girl
	writetext ObscuraCityDarcyText5_girl
.cont
	buttonsound
	farwritetext StdBlankText
	pause 6
	writetext ObscuraCityDarcyText6
	waitbutton
	closetext
	pause 5
	applymovement 15, Movement_ObscuraCityDarcy3
	disappear 15
	moveperson 15, 29, 13
	appear 15
	loadvar wObject3Sprite, SPRITE_CUTE_GIRL
	applyonemovement OBSCURA_CITY_ROCKY, turn_step_down
	applyonemovement OBSCURA_CITY_ROCKY, remove_fixed_facing
	opentext TEXTBOX_ROCKY
	writetext ObscuraCityRockyText6
	waitbutton
	closetext
	special Special_FadeOutMusic
	pause 15
	playmapmusic
	applyonemovement OBSCURA_CITY_ROCKY, turn_step_right
	applyonemovement OBSCURA_CITY_ROCKY, remove_fixed_facing
	opentext TEXTBOX_ROCKY
	writetext ObscuraCityRockyText7
	waitbutton
	closetext
	pause 5
	applyonemovement OBSCURA_CITY_ROCKY, step_up
	playsound SFX_ENTER_DOOR
	disappear OBSCURA_CITY_ROCKY
	pause 10
	dotrigger $0
	end
	
Movement_ObscuraCityDarcy1:
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	step_end
	
Movement_ObscuraCityDarcy2:
	run_step_down
	big_step_up
	step_end
	
Movement_ObscuraCityDarcy3:
	run_step_down
	run_step_down
	run_step_down
	run_step_down
	run_step_down
	step_end
	
ObscuraPokeCenterSign:
	jumpstd pokecentersign
	
ObscuraMartSign:
	jumpstd martsign
	
ObscuraCityRockyText1:
	text "What does that"
	line "kid want with the"
	cont "DRAGON STONE?"
	
	para "Surely he's not"
	line "actually trying"
	cont "to summon the"
	cont "DRAGON, right?"
	
	para "That's just an old"
	line "folktale."
	
	para "Only a crazy"
	line "person like my"
	cont "sister would take"
	cont "it seriously."
	
	para "She's going to be"
	line "really upset that"
	cont "it was stolen."
	
	para "…<WAIT_L>You know the"
	line "kid that took it,"
	cont "right?"
	
	para "Maybe there's a"
	line "chance we can get"
	cont "it back before-"
	done
	
ObscuraCityRockyText2:
	text "…<WAIT_L>she finds out…"
	done
	
ObscuraCityRockyText3:
	text "Hello, DARCY."
	done
	
ObscuraCityRockyText4:
	text "First of all, it's"
	line "not ROCKY, it's"
	cont "ROCKFORD!"
	
	para "Got it!?"
	
	para "And second, how"
	line "was I supposed to"
	cont "know some wackos"
	cont "who believe in"
	cont "fairy tales would"
	cont "come take it?"
	done
	
ObscuraCityRockyText5:
	text "Relax, DARCY."
	
	para "<PLAYER> here"
	line "knows the kid"
	cont "who took it."
	
	para "We'll get it"
	line "back."
	done
	
ObscuraCityRockyText6:
	text "Wait, DARCY!"
	done
	
ObscuraCityRockyText7:
	text "She's really upset"
	line "this time."
	
	para "What a headache"
	line "today has been."
	
	para "Well, anyway,"
	line "a deal's a deal."
	
	para "You helped me out"
	line "with those goons,"
	cont "so I'll give you"
	cont "your GYM battle."
	
	para "Come on inside"
	line "and let's get"
	cont "to it."
	done
	
ObscuraCityDarcyText1:
	text "ROOOCKYYY!!!"
	done
	
ObscuraCityDarcyText2:
	text "Don't you “hello,"
	line "DARCY” me!"
	done
	
ObscuraCityDarcyText3:
	text "I told you this"
	line "would happen if"
	cont "we let you display"
	cont "the DRAGON STONE"
	cont "here!"
	
	para "You assured me"
	line "nothing would"
	cont "happen to it!"
	
	para "Oh, I knew I"
	line "shouldn't have"
	cont "believed you…"
	
	para "I'll never forgive"
	line "you for this,"
	cont "ROCKY!"
	done
	
ObscuraCityDarcyText4:
	text "They aren't fairy"
	line "tales, ROCKY!"
	
	para "There's obviously"
	line "truth to the myth"
	cont "if a group like"
	cont "TEAM SNARE wants"
	cont "the DRAGON STONE!"
	done
	
ObscuraCityDarcyText5:
	text "You'd better!"
	done
	
ObscuraCityDarcyText5_girl:
	text "You'd better!"
	done
	
ObscuraCityDarcyText6:
	text "Legend or not,"
	line "you know as well"
	cont "as I do how impor-"
	cont "tant that stone is"
	cont "to our family!"
	
	para "To the people of"
	line "LUMINA TOWN!"
	
	para "You do remember"
	line "LUMINA TOWN,"
	cont "don't you ROCKY?"
	
	para "You were only born"
	line "and raised there!"
	
	para "You may not care"
	line "anymore, but I do,"
	cont "“ROCKFORD”!"
	done
	
ObscuraCityFlyPoint:
	setflag ENGINE_FLYPOINT_OBSCURA
	return
	
ObscuraCityCallback:
	setevent EVENT_BRIGHTBURG_PLAYER_DUPE
	callasm MusuemKeyboardAsm3
	clearevent EVENT_MUSEUM_FAILED_TERMINAL
	checkevent EVENT_SNARE_AT_MUSEUM
	iftrue .skip
	domaptrigger OBSCURA_MUSEUM_1F, $0
.skip
	return
	
ObscuraCitySign:
	text "OBSCURA CITY"
	
	para "ONWA's beacon of"
	line "knowledge."
	done
	
ObscuraCityMuseumSign:
	text "OBSCURA CITY"
	line "MUSEUM OF SCIENCE"
	cont "& #MON GYM"
	done
	
ObscuraCityMuseumBackSign:
	text "EMPLOYEE ENTRANCE"
	done
	
ObscuraCitySnare1:
	faceplayer
	opentext
	writetext ObscuraCitySnare1Text
	waitbutton
;	callasm TilesetTest
	closetext
	spriteface OBSCURA_CITY_SNARE_1, DOWN
	end
	
TilesetTest:
	ld a, TILESET_DESERT
	ld [wTileset], a
	farcall DeferredLoadGraphics
	farcall DecompressMetatiles
	farjp ActivateMapAnims
	
ObscuraCitySnare2:
	faceplayer
	opentext
	checkevent EVENT_PLAYER_IS_CORA
	iftrue .girl
	checkevent EVENT_PLAYER_IS_PIPPI
	iftrue .girl
	checkevent EVENT_PLAYER_IS_LEAF
	iftrue .girl
	checkevent EVENT_PLAYER_IS_KRIS
	iftrue .girl
	writetext ObscuraCitySnare2TextBoy
	jump .cont
.girl
	writetext ObscuraCitySnare2TextGirl
.cont
	waitbutton
	closetext
	spriteface OBSCURA_CITY_SNARE_2, DOWN
	end

ObscuraCitySnare1Text:
	text "The MUSEUM is"
	line "closed today."
	
	para "Run along."
	done
	
ObscuraCitySnare2TextBoy:
	text "We were told not"
	line "to let a kid named"
	cont "<PLAYER> in."
	
	para "You are him."
	done
	
ObscuraCitySnare2TextGirl:
	text "We were told not"
	line "to let a kid named"
	cont "<PLAYER> in."
	
	para "You are her."
	done
