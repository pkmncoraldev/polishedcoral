ObscuraMuseum3F_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, ObscuraMuseum3FCallback

	db 1 ; warp events
	warp_def 10,  1, 4, OBSCURA_MUSEUM_2F

	db 4 ; coord events
	coord_event  8, 10, 0, ObscuraMuseum3FStopYou
	coord_event  9, 10, 0, ObscuraMuseum3FStopYouR
	coord_event  8,  4, 1, ObscuraMuseum3FDragonStoneScene
	coord_event  9,  4, 1, ObscuraMuseum3FDragonStoneSceneR

	db 6 ; bg events
	signpost  5,  6, SIGNPOST_READ, ObscuraMuseumClayPotSign
	signpost  5, 11, SIGNPOST_READ, ObscuraMuseumBlackPearlSign
	signpost 10,  6, SIGNPOST_JUMPTEXT, ObscuraMuseumRainbowWingSignText
	signpost 10, 11, SIGNPOST_JUMPTEXT, ObscuraMuseumSilverWingSignText
	signpost  2,  7, SIGNPOST_JUMPTEXT, ObscuraMuseumDragonStoneSignText
	signpost 10,  0, SIGNPOST_JUMPTEXT, ObscuraMuseum3FSign

	db 12 ; object events
	person_event SPRITE_LOCKE,  2,  9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_SNARE_GONE_FROM_MUSEUM
	person_event SPRITE_COLBY,  2,  8, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_MUSEUM_COLBY_GONE
	person_event SPRITE_ROCKY,  8,  8, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObscuraMuseum3FRocky, EVENT_SNARE_GONE_FROM_MUSEUM
	person_event SPRITE_SNARE,  7,  8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObscuraMuseum3FCutsceneSnare1, EVENT_SNARE_GONE_FROM_MUSEUM
	person_event SPRITE_SNARE,  8,  9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObscuraMuseum3FCutsceneSnare2, EVENT_SNARE_GONE_FROM_MUSEUM
	person_event SPRITE_ARTIFACTS,  5, 10, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, ObscuraMuseum3FPearl, EVENT_HIDE_OW_OBJECTS_PURPLE
	person_event SPRITE_ARTIFACTS,  5, 10, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, ObscuraMuseum3FPearl, EVENT_HIDE_OW_OBJECTS_TEAL
	person_event SPRITE_RAINBOW_SILVER_WING, 10,  7, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObscuraMuseum3FRainbowWing, -1
	person_event SPRITE_RAINBOW_SILVER_WING, 10, 10, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, ObscuraMuseum3FSilverWing, EVENT_HIDE_OW_OBJECTS_PURPLE
	person_event SPRITE_RAINBOW_SILVER_WING, 10, 10, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, ObscuraMuseum3FSilverWing, EVENT_HIDE_OW_OBJECTS_TEAL
	person_event SPRITE_ARTIFACTS,  5,  7, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObscuraMuseum3FPot, EVENT_MUSEUM_NO_CLAY_POT
	person_event SPRITE_ARTIFACTS,  1,  9, SPRITEMOVEDATA_DEALER_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_MUSEUM_NO_DRAGON_STONE
	
	
	const_def 1 ; object constants
	const OBSCURA_MUSEUM_3F_LOCKE
	const OBSCURA_MUSEUM_3F_COLBY
	const OBSCURA_MUSEUM_3F_ROCKY
	const OBSCURA_MUSEUM_3F_CUTSCENE_SNARE_1
	const OBSCURA_MUSEUM_3F_CUTSCENE_SNARE_2
	const OBSCURA_MUSEUM_3F_BLACK_PEARL_PURPLE
	const OBSCURA_MUSEUM_3F_BLACK_PEARL_TEAL
	
ObscuraMuseum3FCallback:
	domaptrigger OBSCURA_MUSEUM_2F, $0
	readvar VAR_PLAYER_COLOR
	if_equal 4, .purple
	setevent EVENT_HIDE_OW_OBJECTS_TEAL
	clearevent EVENT_HIDE_OW_OBJECTS_BLUE
	clearevent EVENT_HIDE_OW_OBJECTS_BROWN
	clearevent EVENT_HIDE_OW_OBJECTS_PURPLE
	clearevent EVENT_HIDE_OW_OBJECTS_PINK
	clearevent EVENT_HIDE_OW_OBJECTS_RED
	jump .cont
.purple
	clearevent EVENT_HIDE_OW_OBJECTS_TEAL
	clearevent EVENT_HIDE_OW_OBJECTS_BLUE
	clearevent EVENT_HIDE_OW_OBJECTS_BROWN
	setevent EVENT_HIDE_OW_OBJECTS_PURPLE
	clearevent EVENT_HIDE_OW_OBJECTS_PINK
	clearevent EVENT_HIDE_OW_OBJECTS_RED
.cont
	checkevent EVENT_MUSEUM_NO_BLACK_PEARL
	iffalse .skip
	moveperson OBSCURA_MUSEUM_3F_BLACK_PEARL_PURPLE, -5, -5
	moveperson OBSCURA_MUSEUM_3F_BLACK_PEARL_TEAL, -5, -5
.skip
	return

ObscuraMuseum3FDragonStoneSceneR:
	setevent EVENT_MUSEUM_SCENE_2_RIGHT
;fallthru
ObscuraMuseum3FDragonStoneScene:
	special Special_StopRunning
	applyonemovement PLAYER, remove_fixed_facing
	special Special_FadeOutMusic
	pause 10
	playmusic MUSIC_RIVAL_ENCOUNTER
	pause 5
	applyonemovement OBSCURA_MUSEUM_3F_COLBY, turn_step_right
	opentext
	writetext ObscuraMuseum3FColbyText1
	waitbutton
	closetext
	pause 5
	playsound SFX_PAY_DAY
	spriteface OBSCURA_MUSEUM_3F_LOCKE, DOWN
	spriteface OBSCURA_MUSEUM_3F_COLBY, DOWN
	showemote EMOTE_SHOCK, OBSCURA_MUSEUM_3F_COLBY, 15
	pause 10
	checkevent EVENT_MUSEUM_SCENE_2_RIGHT
	iftrue .right
	applyonemovement OBSCURA_MUSEUM_3F_COLBY, step_down
	jump .cont
.right
	applymovement OBSCURA_MUSEUM_3F_COLBY, Movement_ObscuraMuseum3FColby
	spriteface OBSCURA_MUSEUM_3F_COLBY, DOWN
.cont
	opentext
	writetext ObscuraMuseum3FColbyText2
	waitbutton
	closetext
	checkevent EVENT_MUSEUM_SCENE_2_RIGHT
	iftrue .right2
	applyonemovement OBSCURA_MUSEUM_3F_COLBY, step_up
	spriteface OBSCURA_MUSEUM_3F_COLBY, RIGHT
	spriteface OBSCURA_MUSEUM_3F_LOCKE, LEFT
	jump .cont2
.right2
	applyonemovement OBSCURA_MUSEUM_3F_COLBY, turn_step_up
.cont2
	opentext
	checkevent EVENT_PLAYER_IS_CORA
	iftrue .girl
	checkevent EVENT_PLAYER_IS_PIPPI
	iftrue .girl
	checkevent EVENT_PLAYER_IS_LEAF
	iftrue .girl
	checkevent EVENT_PLAYER_IS_KRIS
	iftrue .girl
	writetext ObscuraMuseum3FColbyText3
	jump .cont3
.girl
	writetext ObscuraMuseum3FColbyText3_girl
.cont3
	waitbutton
	closetext
	playsound SFX_WARP_FROM
	applyonemovement OBSCURA_MUSEUM_3F_COLBY, teleport_from
	
	special Special_FadeOutMusic
	pause 10
	playmusic MUSIC_TEAM_SNARE_ENCOUNTER
	
	disappear OBSCURA_MUSEUM_3F_COLBY
	checkevent EVENT_MUSEUM_SCENE_2_RIGHT
	iftrue .right3
	applymovement OBSCURA_MUSEUM_3F_LOCKE, Movement_ObscuraMuseum3FLocke
	spriteface OBSCURA_MUSEUM_3F_LOCKE, LEFT
	spriteface PLAYER, RIGHT
	jump .cont4
.right3
	applyonemovement OBSCURA_MUSEUM_3F_LOCKE, step_down
.cont4
	opentext
	writetext ObscuraMuseum3FLockeText1
	waitbutton
	closetext
	waitsfx
	special SaveMusic
	winlosstext ObscuraMuseum3FLockeWinText, ObscuraMuseum3FLockeLoseText
	setlasttalked OBSCURA_MUSEUM_3F_LOCKE
	loadtrainer LOCKE, MUSEUM_LOCKE
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	reloadmapafterbattle
	special RestoreMusic
	opentext
	writetext ObscuraMuseum3FLockeText2
	waitbutton
	closetext
	pause 5
	playsound SFX_EXIT_BUILDING
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear OBSCURA_MUSEUM_3F_LOCKE
	disappear OBSCURA_MUSEUM_3F_CUTSCENE_SNARE_1
	disappear OBSCURA_MUSEUM_3F_CUTSCENE_SNARE_2
	setevent EVENT_MUSEUM_1F_SNARE_SWAP
	checkevent EVENT_MUSEUM_SCENE_2_RIGHT
	iftrue .right4
	applyonemovement OBSCURA_MUSEUM_3F_ROCKY, big_step_right
	spriteface OBSCURA_MUSEUM_3F_ROCKY, UP
.right4
	setevent EVENT_SNARE_GONE_FROM_MUSEUM
	clearevent EVENT_SNARE_AT_MUSEUM
	special Special_FadeOutMusic
	waitsfx
	special Special_FadeInQuickly
	setlasttalked OBSCURA_MUSEUM_3F_ROCKY
	applymovement OBSCURA_MUSEUM_3F_ROCKY, Movement_ObscuraMuseum3FRocky
	faceplayer
	checkevent EVENT_MUSEUM_SCENE_2_RIGHT
	iffalse .cont5
	spriteface PLAYER, LEFT
.cont5
	opentext
	writetext ObscuraMuseum3FRockyText3
	waitbutton
	closetext
	pause 10
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	special Special_StopRunning
	waitsfx
	dotrigger $2
	domaptrigger OBSCURA_CITY, $1
	clearevent EVENT_OBSCURA_CITY_ROCKY_GONE
	setevent EVENT_MUSEUM_SNARE_GUY_GONE
	warpfacing LEFT, OBSCURA_CITY, $17, $0e
	end
	
ObscuraMuseum3FLockeText1:
	text "As much as I'm"
	line "not thrilled about"
	cont "taking orders from"
	cont "from a child,"
	
	para "I've gotta hand"
	line "it to him."
	
	para "He got the job"
	line "done."
	
	para "And now it's time"
	line "for me to do the"
	cont "same."
	
	para "You're not getting"
	line "away without a"
	cont "fight!"
	done
	
ObscuraMuseum3FLockeText2:
	text "You beat me, but"
	line "it doesn't matter."
	
	para "We got what we"
	line "came for."
	
	para "And I bought the"
	line "kid some time."
	
	para "We have no reason"
	line "to stick around"
	cont "here any longer."
	
	para "We're outta here,"
	line "boys!"
	done
	
ObscuraMuseum3FLockeWinText:
	text "Hmph. Again."
	done
	
ObscuraMuseum3FLockeLoseText:
	text "Hey, that works"
	line "for me!"
	done
	
ObscuraMuseum3FColbyText1:
	text "<RIVAL>: Good job.<WAIT_S>"
	line "We got it!"
	
	para "Not even that"
	line "GYM LEADER could"
	cont "stop us."
	
	para "Go ahead and"
	line "report back to HQ."
	
	para "I won't need you"
	line "for the next part"
	cont "of the plan."
	done
	
ObscuraMuseum3FColbyText2:
	text "<PLAYER>!<WAIT_S>"
	line "You're too late!"
	
	para "Or should I say"
	line "just in time?"
	
	para "Just in time to"
	line "see me make my"
	cont "escape!"
	
	para "I have the DRAGON"
	line "STONE now!"
	
	para "Do you know what"
	line "that means,"
	cont "<PLAYER>?"
	
	para "That's right!<WAIT_S>"
	line "It means I win!"
	
	para "You can't beat me"
	line "again!"
	
	para "All I need now is"
	line "to offer the stone"
	cont "at the alter in"
	cont "ERROR!!"		;TODO come up with town name
	
	para "The dragon will"
	line "recognize me for"
	cont "who I am and show"
	cont "itself."
	
	para "And then we'll"
	line "finally be on even"
	cont "ground!"
	
	para "I'll be wating at"
	line "ERROR!!"		;TODO come up with town name
	
	para "Just try stop me,"
	line "<PLAYER>!"
	done
	
ObscuraMuseum3FColbyText3:
	text "You!"
	
	para "Distract him!"
	
	para "Make sure he can't"
	line "interrupt me"
	cont "summoning the"
	cont "dragon!"
	done
	
ObscuraMuseum3FColbyText3_girl:
	text "You!"
	
	para "Distract her!"
	
	para "Make sure she can't"
	line "interrupt me"
	cont "summoning the"
	cont "dragon!"
	done
	
Movement_ObscuraMuseum3FLocke:
	step_down
	step_down
	step_end
	
Movement_ObscuraMuseum3FColby:
	step_down
	step_right
	step_end

ObscuraMuseum3FStopYouR:
	setevent EVENT_MUSEUM_SCENE_1_RIGHT
;fallthru
ObscuraMuseum3FStopYou:
	special Special_StopRunning
	pause 5
	applyonemovement OBSCURA_MUSEUM_3F_ROCKY, turn_step_up
	opentext
	writetext ObscuraMuseum3FRockyText1
	waitbutton
	closetext
	checkevent EVENT_MUSEUM_SCENE_1_RIGHT
	iftrue .right
	applyonemovement PLAYER, step_up
	jump .cont
.right
	applymovement PLAYER, Movement_ObscuraMuseum3FStopYouR
	spriteface PLAYER, UP
.cont
	pause 10
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, OBSCURA_MUSEUM_3F_ROCKY, 15
	spriteface OBSCURA_MUSEUM_3F_ROCKY, DOWN
	opentext
	writetext ObscuraMuseum3FRockyText2
	waitbutton
	closetext
	spriteface OBSCURA_MUSEUM_3F_ROCKY, UP
	dotrigger $1
	end
	
Movement_ObscuraMuseum3FStopYouR:
	step_up
	step_left
	step_end
	
ObscuraMuseum3FRockyText1:
	text "ROCKY: Outta the"
	line "way!"
	
	para "You guys can't"
	line "just come on here"
	cont "and take whatever"
	cont "you want!"
	done
	
ObscuraMuseum3FRockyText2:
	text "Ah, you finally"
	line "showed up!"
	
	para "There's more of"
	line "them up ahead."
	
	para "I think they're"
	line "trying to take"
	cont "the DRAGON STONE."
	
	para "It's said it can"
	line "summon a great and"
	cont "powerful #MON."
	
	para "They don't really"
	line "believe that old"
	cont "legend, though,"
	cont "do they?"
	
	para "Whatever they want"
	line "with it, they can't"
	cont "have it!"
	
	para "I'll hold these"
	line "two off, you keep"
	cont "moving."
	done
	
ObscuraMuseum3FRockyText3:
	text "Well, they got"
	line "away…"
	
	para "You did good, but"
	line "they were just one"
	cont "step ahead."
	
	para "Oh, she's never"
	line "going to let me"
	cont "hear the end of"
	cont "this…"
	
	para "Anyway, let's head"
	line "outside for now."
	done
	
Movement_ObscuraMuseum3FRocky:
	step_up
	step_up
	step_up
	step_up
	step_end
	
ObscuraMuseum3FRocky:
	faceplayer
	opentext
	writetext ObscuraMuseum3FRockyText
	waitbutton
	closetext
	spriteface OBSCURA_MUSEUM_3F_ROCKY, UP
	end
	
ObscuraMuseum3FRockyText:
	text "I'm kinda busy"
	line "right now!"
	
	para "Keep moving!"
	done
	
ObscuraMuseum3FCutsceneSnare1:
	faceplayer
	opentext
	writetext ObscuraMuseum3FCutsceneSnare1Text
	waitbutton
	closetext
	spriteface OBSCURA_MUSEUM_3F_CUTSCENE_SNARE_1, DOWN
	end
	
ObscuraMuseum3FCutsceneSnare1Text:
	text "I'm fighting for"
	line "my life here!"
	done
	
ObscuraMuseum3FCutsceneSnare2:
	faceplayer
	opentext
	writetext ObscuraMuseum3FCutsceneSnare2Text
	waitbutton
	closetext
	spriteface OBSCURA_MUSEUM_3F_CUTSCENE_SNARE_2, LEFT
	end
	
ObscuraMuseum3FCutsceneSnare2Text:
	text "Even two-on-one,"
	line "we're no match"
	cont "for a GYM LEADER!"
	done
	
ObscuraMuseumClayPotSign:
	checkevent EVENT_MUSEUM_NO_CLAY_POT
	iftrue .no_clay_pot
	jumptext ObscuraMuseumClayPotSignText
.no_clay_pot
	jumptext ObscuraMuseumEmptyExhibitText
	
ObscuraMuseumBlackPearlSign:
	checkevent EVENT_MUSEUM_NO_BLACK_PEARL
	iftrue .no_black_pearl
	jumptext ObscuraMuseumBlackPearlSignText
.no_black_pearl
	jumptext ObscuraMuseumEmptyExhibitText
	
ObscuraMuseumEmptyExhibitText:
	text "New exhibit:"
	line "coming soon!"
	done
	
ObscuraMuseumGymSign:
	text "OBSCURA CITY"
	line "#MON GYM"
	cont "LEADER: ROCKFORD"

	para "ERROR!!"		;TODO come up with leader description
	done
	
ObscuraMuseumDragonStoneSignText:
	text "DRAGON STONE"
	line "ERROR!!"		;TODO come up with description
	done
	
ObscuraMuseumClayPotSignText:
	text "An artifact that"
	line "was recently found"
	cont "by researchers at"
	cont "the PORT SHIMMER"
	cont "RESEARCH LAB."
	
	para "Discovered in an"
	line "ancient temple"
	cont "underground near"
	cont "TWINKLE TOWN."
	done
	
ObscuraMuseumBlackPearlSignText:
	text "An artifact that"
	line "was recently found"
	cont "by researchers at"
	cont "the PORT SHIMMER"
	cont "RESEARCH LAB."
	
	para "Discovered in an "
	line "ancient temple in"
	cont "the desert near"
	cont "PUEBLO BRILLO."
	done
	
ObscuraMuseumRainbowWingSignText:
	text "RAINBOW WING"
	
	para "There's a legend in"
	line "the JOHTO region"
	cont "of a fire that"
	cont "burned down one of"
	cont "two sacred towers."
	
	para "3 #MON died in"
	line "the fire, but were"
	cont "revived as great"
	cont "beasts by a large"
	cont "rainbow-colored"
	cont "bird #MON."
	
	para "This feather is"
	line "said to come from"
	cont "that #MON."
	done
	
ObscuraMuseumSilverWingSignText:
	text "SILVER WING"
	
	para "There's a legend in"
	line "the JOHTO region"
	cont "of a fire that"
	cont "burned down one of"
	cont "two sacred towers."
	
	para "The silver-colored"
	line "bird #MON that"
	cont "perched on the"
	cont "burned tower fled"
	cont "to live under the"
	cont "sea."
	
	para "This feather is"
	line "said to come from"
	cont "that #MON."
	done
	
ObscuraMuseumFossilFactText:
	text "While many people"
	line "associate the word"
	cont "fossil with bones,"
	
	para "a fossil can"
	line "actually be any"
	cont "trace of ancient"
	cont "life preserved to"
	cont "the modern day."
	
	para "Bones can indeed"
	line "be fossils, but a"
	cont "fossil could also"
	cont "be hair, an object"
	cont "trapped in amber,"
	cont "or a preserved DNA"
	cont "sample."
	
	para "Even an impression"
	line "in stone with no"
	cont "biological matter"
	cont "would count as a"
	cont "fossil!"
	done
	
ObscuraMuseumWoodFactText:
	text "Petrified wood"
	line "forms when wood is"
	cont "submerged in water"
	cont "or ash for long"
	cont "periods of time."
	
	para "A lack of oxygen"
	line "causes the wood to"
	cont "decay, and over"
	cont "time, surrounding"
	cont "minerals begin to"
	cont "replace the empty"
	cont "space left behind."
	
	para "This creates a"
	line "fossil in the"
	cont "shape of the wood,"
	cont "but made entirely"
	cont "of stone."
	done
	
ObscuraMuseum3FRainbowWing:
	jumptext ObscuraMuseum3FRainbowWingText
	
ObscuraMuseum3FRainbowWingText:
	text "A mystical feather"
	line "of rainbow colors."
	done

ObscuraMuseum3FSilverWing:
	jumptext ObscuraMuseum3FSilverWingText
	
ObscuraMuseum3FSilverWingText:
	text"A strange, silver-"
	line "colored feather."
	done
	
ObscuraMuseum3FPot:
	jumptext ObscuraMuseum3FPotText
	
ObscuraMuseum3FPotText:
	text "The CLAY POT you"
	line "found in the"
	cont "ICE TEMPLE."
	done
	
ObscuraMuseum3FPearl:
	jumptext ObscuraMuseum3FPearlText
	
ObscuraMuseum3FPearlText:
	text "The BLACK PEARL"
	line "you found in the"
	cont "DESERT TEMPLE."
	done
	