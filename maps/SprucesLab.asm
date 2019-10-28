SprucesLab_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, SpruceLabUnlockDoor

	db 3 ; warp events
	warp_def 7, 4, 6, SUNBEAM_ISLAND
	warp_def 7, 5, 6, SUNBEAM_ISLAND
	warp_def 0, 5, 10, SUNBEAM_ISLAND

	db 1 ; coord events
	xy_trigger 2, 1, 5, 0, SpruceLabComeBackInside, 0, 0

	db 4 ; bg events
	signpost 0, 5, SIGNPOST_READ, SpruceLabDoor
	signpost 0, 4, SIGNPOST_READ, SpruceLabOpenWindow
	signpost 1, 2, SIGNPOST_READ, SpruceLabPC
	signpost 3, 9, SIGNPOST_READ, SpruceLabTrashcan

	db 5 ; object events
	person_event SPRITE_SPRUCE, 3, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SpruceLabSpruce, EVENT_SPRUCELAB_SPRUCE1_GONE
	person_event SPRITE_SNES, 5, 9, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SpruceLabMunchlaxSleep, EVENT_SPRUCELAB_MUNCH1_GONE
	person_event SPRITE_SPRUCE, 0, 5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SpruceLabSpruce, EVENT_SPRUCELAB_SPRUCE2_GONE
	person_event SPRITE_MUNCHLAX, 5, 9, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SpruceLabMunchlax, EVENT_SPRUCELAB_MUNCH2_GONE
	person_event SPRITE_MUNCHLAX, 4, 0, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SpruceLabMunchlax, EVENT_SPRUCELAB_MUNCH3_GONE

	const_def 1 ; object constants
	const SPRUCELAB_SPRUCE1
	const SPRUCELAB_MUNCHLAX1
	const SPRUCELAB_SPRUCE2
	const SPRUCELAB_MUNCHLAX2
	const SPRUCELAB_MUNCHLAX3

SpruceLabUnlockDoor:
	checkevent EVENT_TALKED_TO_SPRUCE
	iftrue .UnlockThatBitch
	return
.UnlockThatBitch
	changeblock $4, $0, $24
	return
	
SpruceLabSpruce:
	checkevent EVENT_TALKED_TO_SPRUCE
	iftrue .alreadytalked
	setevent EVENT_TALKED_TO_SPRUCE
	setevent EVENT_SPRUCELAB_SPRUCE1_GONE
	faceplayer
	opentext
	writetext SpruceLabSpruceText1
	waitbutton
	closetext
	checkcode VAR_FACING
	if_equal LEFT, .YouAreFacingLeft
	follow SPRUCELAB_SPRUCE1, PLAYER
	applymovement SPRUCELAB_SPRUCE1, Movement_SpruceLabSpruce1
	jump .cont
.YouAreFacingLeft
	applymovement SPRUCELAB_SPRUCE1, Movement_SpruceLabSpruce2
	follow SPRUCELAB_SPRUCE1, PLAYER
	applymovement SPRUCELAB_SPRUCE1, Movement_SpruceLabSpruce3
.cont
	stopfollow
	spriteface PLAYER, UP
	pause 7
	playsound SFX_WALL_OPEN
	pause 7
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_SPRUCE
	faceplayer
	opentext
	writetext SpruceLabSpruceText2
	waitbutton
	closetext
	dotrigger $1
	changeblock $5, $0, $24
	applymovement SPRUCELAB_SPRUCE1, Movement_SpruceLabSpruce4
	spriteface SPRUCELAB_SPRUCE1, LEFT
	applymovement PLAYER, Movement_SpruceLabPlayer1
	domaptrigger SUNBEAM_ISLAND, $4
	warpcheck
	end
.alreadytalked
	faceplayer
	opentext
	checkitem POKE_FLUTE
	iftrue .gotflute
	checkflag ENGINE_THIRDBADGE
	iftrue .getflutecutscene
	writetext SpruceLabSpruceText12
	waitbutton
	closetext
	end
.getflutecutscene
	writetext SpruceLabSpruceText13
	waitbutton
	closetext
	follow SPRUCELAB_SPRUCE1, PLAYER
	applymovement SPRUCELAB_SPRUCE1, Movement_SpruceLabSpruce10
	stopfollow
	spriteface PLAYER, DOWN
	spriteface SPRUCELAB_SPRUCE1, UP
	opentext
	writetext SpruceLabSpruceText11
	waitbutton
	closetext
	spriteface PLAYER, RIGHT
	spriteface SPRUCELAB_SPRUCE1, RIGHT
	pause 20
	opentext
	writetext SpruceLabPokeFluteText1
	playsound SFX_POKEFLUTE
	waitsfx
	buttonsound
	writetext SpruceLabPokeFluteText2
	appear SPRUCELAB_MUNCHLAX2
	waitbutton
	closetext
	wait 5
	disappear SPRUCELAB_MUNCHLAX1
	opentext
	writetext SpruceLabMunchlaxText2
	cry SNORLAX
	waitsfx
	buttonsound
	writetext SpruceLabPokeFluteText3
	waitbutton
	closetext
	pause 5
	spriteface PLAYER, DOWN
	spriteface SPRUCELAB_SPRUCE1, UP
	pause 5
	opentext
	writetext SpruceLabSpruceText6
	waitbutton
	closetext
	spriteface SPRUCELAB_SPRUCE1, DOWN
	pause 70
	spriteface SPRUCELAB_SPRUCE1, UP
	opentext
	writetext SpruceLabSpruceText7
	waitbutton
	verbosegiveitem POKE_FLUTE
	closetext
	follow SPRUCELAB_SPRUCE1, PLAYER
	applymovement SPRUCELAB_SPRUCE1, Movement_SpruceLabSpruce7
	spriteface SPRUCELAB_SPRUCE1, DOWN
	stopfollow
	pause 5
	opentext
	writetext SpruceLabSpruceText8
	waitbutton
	special ProfOaksPCBoot
	writetext SpruceLabSpruceText9
	waitbutton
	closetext
	setevent EVENT_SPRUCELAB_MUNCH1_GONE
	setevent EVENT_SPRUCELAB_MUNCH2_GONE
	clearevent EVENT_SPRUCELAB_MUNCH3_GONE
	setevent EVENT_GOT_POKEFLUTE
	end
	
.gotflute
	writetext SpruceLabDexCheckText
	waitbutton
	special ProfOaksPCBoot
	writetext SpruceLabSpruceText9
	waitbutton
	closetext
	end
	
SpruceLabComeBackInside:
	applymovement PLAYER, Movement_SpruceLabPlayer2
	pause 14
	playsound SFX_ENTER_DOOR
	appear SPRUCELAB_SPRUCE2
	spriteface PLAYER, UP
	pause 7
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_ELDER
	applymovement SPRUCELAB_SPRUCE2, Movement_SpruceLabSpruce5
	spriteface PLAYER, DOWN
	spriteface SPRUCELAB_SPRUCE2, UP
	opentext
	writetext SpruceLabSpruceText3
	waitbutton
	closetext
	spriteface SPRUCELAB_SPRUCE2, LEFT
	pause 20
	spriteface SPRUCELAB_SPRUCE2, RIGHT
	pause 20
	spriteface SPRUCELAB_SPRUCE2, DOWN
	pause 20
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, SPRUCELAB_SPRUCE2, 15
	pause 7
	opentext
	writetext SpruceLabSpruceText4
	waitbutton
	closetext
	follow SPRUCELAB_SPRUCE2, PLAYER
	applymovement SPRUCELAB_SPRUCE2, Movement_SpruceLabSpruce6
	stopfollow
	spriteface SPRUCELAB_SPRUCE2, RIGHT
	pause 5
	opentext
	writetext SpruceLabSpruceText5
	waitbutton
	closetext
	spriteface PLAYER, DOWN
	applymovement SPRUCELAB_SPRUCE2, Movement_SpruceLabSpruce8
	pause 30
	applymovement SPRUCELAB_SPRUCE2, Movement_SpruceLabSpruce9
	spriteface SPRUCELAB_SPRUCE2, UP
	opentext
	checkflag ENGINE_THIRDBADGE
	iftrue .havebadge
	writetext SpruceLabSpruceText12
	waitbutton
	closetext
	setevent EVENT_SUNBEAM_SPRUCE_GONE
	setevent EVENT_SPRUCELAB_SPRUCE2_GONE
	setevent EVENT_SPRUCELAB_MUNCH2_GONE
	clearevent EVENT_SPRUCELAB_SPRUCE1_GONE
	domaptrigger SUNBEAM_ISLAND, $2
	dotrigger $1
	end
.havebadge
	writetext SpruceLabSpruceText11
	waitbutton
	closetext
	spriteface PLAYER, RIGHT
	spriteface SPRUCELAB_SPRUCE2, RIGHT
	pause 20
	opentext
	writetext SpruceLabPokeFluteText1
	playsound SFX_POKEFLUTE
	waitsfx
	buttonsound
	writetext SpruceLabPokeFluteText2
	appear SPRUCELAB_MUNCHLAX2
	waitbutton
	closetext
	wait 5
	disappear SPRUCELAB_MUNCHLAX1
	opentext
	writetext SpruceLabMunchlaxText2
	cry SNORLAX
	waitsfx
	buttonsound
	writetext SpruceLabPokeFluteText3
	waitbutton
	closetext
	pause 5
	spriteface PLAYER, DOWN
	spriteface SPRUCELAB_SPRUCE2, UP
	pause 5
	opentext
	writetext SpruceLabSpruceText6
	waitbutton
	closetext
	spriteface SPRUCELAB_SPRUCE2, DOWN
	pause 70
	spriteface SPRUCELAB_SPRUCE2, UP
	opentext
	writetext SpruceLabSpruceText7
	waitbutton
	verbosegiveitem POKE_FLUTE
	closetext
	follow SPRUCELAB_SPRUCE2, PLAYER
	applymovement SPRUCELAB_SPRUCE2, Movement_SpruceLabSpruce7
	spriteface SPRUCELAB_SPRUCE2, DOWN
	stopfollow
	pause 5
	opentext
	writetext SpruceLabSpruceText8
	waitbutton
	special ProfOaksPCBoot
	writetext SpruceLabSpruceText9
	waitbutton
	closetext
	setevent EVENT_SUNBEAM_SPRUCE_GONE
	setevent EVENT_SPRUCELAB_SPRUCE2_GONE
	setevent EVENT_SPRUCELAB_MUNCH1_GONE
	setevent EVENT_SPRUCELAB_MUNCH2_GONE
	clearevent EVENT_SPRUCELAB_MUNCH3_GONE
	clearevent EVENT_SPRUCELAB_SPRUCE1_GONE
	setevent EVENT_GOT_POKEFLUTE
	domaptrigger SUNBEAM_ISLAND, $2
	dotrigger $1
	end

SpruceLabMunchlaxSleep:
	jumptext SpruceLabMunchlaxText1
	
SpruceLabMunchlax:
	opentext
	writetext SpruceLabMunchlaxText2
	cry SNORLAX
	waitsfx
	waitbutton
	closetext
	end
	
SpruceLabDoor:
	checkevent EVENT_TALKED_TO_SPRUCE
	iftrue .unlocked
	jumptext SpruceLabDoorText1
.unlocked
	jumptext SpruceLabDoorText2
	
SpruceLabOpenWindow
	jumptext SpruceLabOpenWindowText
	
SpruceLabPC:
	jumptext SpruceLabPCText
	
SpruceLabTrashcan:
	jumptext SpruceLabTrashcanText
	
SpruceLabSpruceText1:
	text "Ah!"
	
	para "You must be"
	line "<PLAYER>!"
	
	para "I'm so glad you"
	line "made it!"
	
	para "How is the #MON"
	line "I sent for you?"
	
	para "Well, I hope."
	
	para "Anyway, let me"
	line "show you around."
	
	para "Follow me!"
	done
	
SpruceLabSpruceText2:
	text "We'll start outside"
	line "with the #MON"
	cont "habitats."
	
	para "After you."
	done
	
SpruceLabSpruceText3:
	text "Well, that's about"
	line "it."
	
	para "…"
	
	para "Oh!"
	
	para "I almost forgot to"
	line "introduce you to"
	cont "my assistant."
	
	para "Now where could he"
	line "be?"
	done
	
SpruceLabSpruceText4:
	text "Ah!"
	
	para "There he is!"
	done
	
SpruceLabSpruceText5:
	text "Ah ha!"
	
	para "Seems like he's"
	line "fallen asleep,"
	cont "again."
	
	para "I have just the"
	line "thing!"
	
	para "Please wait here"
	line "for a moment."
	done
	
SpruceLabSpruceText6:
	text "What's that?"
	
	para "A SNORLAX is"
	line "sleeping and"
	
	para "blocking the path"
	line "near STARGLOW"
	cont "VALLEY?"
	
	para "The #FLUTE"
	line "would surely wake"
	cont "it and clear the"
	cont "path."
	
	para "Hmm…"
	done
	
SpruceLabSpruceText7:
	text "Well!"
	
	para "It's decided!"
	
	para "I'll entrust the"
	line "#FLUTE to you,"
	cont "<PLAYER>!"
	
	para "After all, it was"
	line "I who set your"
	
	para "journey across"
	line "ONWA into motion,"
	cont "was it not?"
	
	para "Surely it would"
	line "fall to me to"
	
	para "assist you in any"
	line "way I can."
	
	para "Use it with care."
	done
	
SpruceLabSpruceText8:
	text "Thank you so much"
	line "for stopping by."
	
	para "Do call me if you"
	line "need anything."
	
	para "While you're here,"
	line "why don't I take a"
	cont "look at your #-"
	cont "DEX?"
	done
	
SpruceLabSpruceText9:
	text "Feel free to"
	line "return any time"
	
	para "you want your"
	line "#DEX reviewed."

	para "Good luck on the"
	line "rest of your"
	cont "adventure."
	done
	
SpruceLabSpruceText11:
	text "Here we are."
	
	para "The #FLUTE."
	
	para "A song played on"
	line "this will wake any"
	
	para "#MON from even"
	line "the deepest"
	cont "slumber."
	done
	
SpruceLabSpruceText12:
	text "Hmm…"
	
	para "I can't seem to"
	line "find what I'm look-"
	cont "ing for."
	
	para "Well, there's no"
	line "need for you to"
	
	para "wait around here"
	line "while I look for"
	cont "it."
	
	para "Why don't you go"
	line "have a look around"
	cont "the rest of the"
	cont "island?"
	
	para "Just come back in"
	line "a while and I'll"
	
	para "introduce you to"
	line "my friend here."
	done
	
SpruceLabSpruceText13:
	text "Ah!"
	
	para "<PLAYER>!"
	
	para "You came at the"
	line "perfect time!"
	
	para "I just found what"
	line "I was looking for."
	
	para "Follow me."
	done
	
SpruceLabDexCheckText:
	text "Ah, <PLAYER>!"
	
	para "How is your #-"
	line "DEX coming?"

	para "Let's see…"
	done
	
SpruceLabPokeFluteText1:
	text "SPRUCE played the"
	line "#FLUTE."
	done
	
SpruceLabPokeFluteText2:
	text "Now that's a"
	line "catchy tune!"
	done
	
SpruceLabPokeFluteText3:
	text "MUNCHLAX is"
	line "wide awake!"
	done
	
SpruceLabMunchlaxText1:
	text "MUNCHLAX: Muuunch…"
	
	para "It's sleeping"
	line "soundly."
	done
	
SpruceLabMunchlaxText2:
	text "MUNCHLAX: Lax!"
	line "Lax!"
	done
	
SpruceLabDoorText1:
	text "It's locked!"
	done
	
SpruceLabDoorText2:
	text "It's unlocked!"
	done
	
SpruceLabOpenWindowText:
	text "The window's open."

	para "A pleasant breeze"
	line "is blowing in."
	done
	
SpruceLabPCText:
	text "OBSERVATIONS ON"
	line "#MON HABITATS"

	para "…It says on the"
	line "screen…"
	done
	
SpruceLabTrashcanText:
	text "It's half full of"
	line "empty purified"
	cont "water bottles."
	done
	
Movement_SpruceLabSpruce1:
	step_right
	step_right
	step_up
	step_up
	step_end
	
Movement_SpruceLabSpruce2:
	step_up
	step_right
	step_end
	
Movement_SpruceLabSpruce3:
	step_right
	step_up
	step_end
	
Movement_SpruceLabSpruce4:
	step_right
	step_end
	
Movement_SpruceLabSpruce5:
	step_down
	step_left
	step_down
	step_down
	step_right
	step_end
	
Movement_SpruceLabSpruce6:
	step_down
	step_right
	step_right
	step_right
	step_down
	step_end
	
Movement_SpruceLabSpruce7:
	step_left
	step_left
	step_left
	step_left
	step_left
	step_up
	step_up
	step_end
	
Movement_SpruceLabSpruce8:
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end
	
Movement_SpruceLabSpruce9:
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end
	
Movement_SpruceLabSpruce10:
	step_right
	step_down
	step_right
	step_right
	step_right
	step_right
	step_down
	step_end
	
Movement_SpruceLabPlayer1:
	step_up
	step_up
	step_end
	
Movement_SpruceLabPlayer2:
	step_down
	step_end