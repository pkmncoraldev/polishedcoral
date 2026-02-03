RadiantField_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, RadiantFieldCallback

	db 2 ; warp events
	warp_def  5, 20, 2, RADIANT_TOWNSHIP
	warp_def  5, 21, 3, RADIANT_TOWNSHIP

	db 0 ; coord events

	db 5 ; bg events
	signpost 13, 32, SIGNPOST_READ, RadiantTownshipSunflower
	signpost 13, 33, SIGNPOST_READ, RadiantTownshipSunflower
	signpost 13, 34, SIGNPOST_READ, RadiantTownshipSunflower
	signpost 28, 17, SIGNPOST_READ, RadiantTownshipSunflower
	signpost 27, 15, SIGNPOST_READ, RadiantFieldPicnic

	db 11 ; object events
	person_event SPRITE_PIGTAILS, 11, 32, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, RadiantFieldRose, EVENT_SAVED_ROSE
	person_event SPRITE_PIGTAILS, 22, 34, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, RadiantFieldIris, EVENT_SAVED_IRIS
	person_event SPRITE_PIGTAILS, 18,  9, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, RadiantFieldViolet, EVENT_SAVED_VIOLET
	person_event SPRITE_GENERAL_VARIABLE_1, 28, 16, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, RadiantFieldMina, EVENT_RADIANT_FIELD_MINA_GONE
	person_event SPRITE_PAINTINGS, 27, 16, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, RadiantFieldEasel, EVENT_RADIANT_FIELD_MINA_GONE
	person_event SPRITE_LEAVES, 27, 16, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, RadiantFieldEasel, EVENT_RADIANT_FIELD_MINA_GONE
	person_event SPRITE_PICNIC, 27, 15, SPRITEMOVEDATA_TILE_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, RadiantFieldPicnic, EVENT_RADIANT_FIELD_MINA_GONE
	person_event SPRITE_AROMA_LADY, 12, 19, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_GENERICTRAINER, 2, RadiantFieldTrainer1, -1
	person_event SPRITE_AROMA_LADY, 22, 13, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_GENERICTRAINER, 2, RadiantFieldTrainer2, -1
	person_event SPRITE_AROMA_LADY, 18, 21, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_GENERICTRAINER, 3, RadiantFieldTrainer3, -1
	person_event SPRITE_AROMA_LADY, 20, 29, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_GENERICTRAINER, 3, RadiantFieldTrainer4, -1
	
	
	const_def 1 ; object constants
	const RADIANT_FIELD_ROSE
	const RADIANT_FIELD_IRIS
	const RADIANT_FIELD_VIOLET
	const RADIANT_FIELD_MINA
	
	
RadiantFieldCallback:
	checkevent EVENT_RADIANT_FIELD_MINA_GONE
	iftrue .mina_gone
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_MINA
	return
.mina_gone
	changeblock $c, $1a, $9c
	changeblock $e, $1a, $a5
	changeblock $c, $1c, $9e
	changeblock $e, $1c, $a6
	return
	
RadiantFieldMina:
	special Special_FadeOutMusic
	wait 5
	playmusic MUSIC_MINA
	applyonemovement RADIANT_FIELD_MINA, turn_step_up
	opentext TEXTBOX_MINA
	writetext RadiantFieldMinaText1
	waitbutton
	closetext
	pause 15
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, RADIANT_FIELD_MINA, 15
	faceplayer
	opentext TEXTBOX_MINA
	writetext RadiantFieldMinaText2
	waitbutton
	closetext
	checkcode VAR_FACING
	if_equal RIGHT, .yourefacingright
	follow RADIANT_FIELD_MINA, PLAYER
	applyonemovement RADIANT_FIELD_MINA, step_left
	spriteface RADIANT_FIELD_MINA, RIGHT
	jump .cont
.yourefacingright
	follow PLAYER, RADIANT_FIELD_MINA
	applyonemovement PLAYER, step_right
	spriteface RADIANT_FIELD_MINA, RIGHT
	spriteface PLAYER, UP
.cont
	stopfollow
	pause 40
	opentext TEXTBOX_MINA
	writetext RadiantFieldMinaText3
	spriteface RADIANT_FIELD_MINA, DOWN
	farwritetext StdBlankText
	pause 6
	writetext RadiantFieldMinaText4
	waitbutton
	closetext
	pause 40
	faceplayer
	spriteface PLAYER, LEFT
	opentext TEXTBOX_MINA
	writetext RadiantFieldMinaText5
	yesorno
	iftrue .yes
	writetext RadiantFieldMinaText6
	waitbutton
.yes
	closetext
	pause 10
	follow RADIANT_FIELD_MINA, PLAYER
	applyonemovement RADIANT_FIELD_MINA, step_left
	stopfollow
	applyonemovement RADIANT_FIELD_MINA, step_up
	pause 5
	spriteface RADIANT_FIELD_MINA, DOWN
	pause 5
	opentext TEXTBOX_MINA
	writetext RadiantFieldMinaText7
	waitbutton
	closetext
	playsound SFX_POKEBALLS_PLACED_ON_TABLE
	callasm RadiantFieldPlayerSit
	pause 20
	applyonemovement RADIANT_FIELD_MINA, turn_step_right
	opentext
	writetext RadiantFieldMinaTextPour
	pause 20
	closetext
	spriteface RADIANT_FIELD_MINA, DOWN
	pause 10
	opentext TEXTBOX_MINA
	writetext RadiantFieldMinaText8
	pause 20
	closetext
	changeblock $e, $1c, $a7
	applyonemovement RADIANT_FIELD_MINA, turn_step_down
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	closetext
	pause 20
	spriteface RADIANT_FIELD_MINA, RIGHT
	pause 10
	applyonemovement RADIANT_FIELD_MINA, turn_step_right
	opentext
	writetext RadiantFieldMinaTextPour
	pause 20
	closetext
	spriteface RADIANT_FIELD_MINA, DOWN
	pause 10
	opentext TEXTBOX_MINA
	writetext RadiantFieldMinaText9
	pause 20
	closetext
	changeblock $e, $1c, $a2
	applyonemovement RADIANT_FIELD_MINA, turn_step_down
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	closetext
	pause 20
	applymovement RADIANT_FIELD_MINA, Movement_RadiantMina1
	spriteface RADIANT_FIELD_MINA, RIGHT
	pause 10
	playsound SFX_POKEBALLS_PLACED_ON_TABLE
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_MINA_GROUND
	special MapCallbackSprites_LoadUsedSpritesGFX
	pause 20
	opentext TEXTBOX_MINA
	writetext RadiantFieldMinaText10
	waitbutton
	closetext
	pause 10
	changeblock $e, $1c, $a7
	opentext
	writetext RadiantFieldMinaTextSip
	pause 20
	closetext
	pause 40
	opentext TEXTBOX_MINA
	writetext RadiantFieldMinaText11
	waitbutton
	closetext
	pause 20
	special FadeOutPalettesBlack
	pause 10
	changeblock $e, $1c, $a9
	opentext
	checkevent EVENT_PLAYER_IS_CORA
	iftrue .girl
	checkevent EVENT_PLAYER_IS_PIPPI
	iftrue .girl
	checkevent EVENT_PLAYER_IS_LEAF
	iftrue .girl
	checkevent EVENT_PLAYER_IS_KRIS
	iftrue .girl
.boy
	writetext RadiantFieldMinaText12Boy
	jump .cont2
.girl
	writetext RadiantFieldMinaText12Girl
.cont2
	waitbutton
	closetext
	pause 10
	playsound SFX_POTION
	waitsfx
	pause 20
	opentext
	writetext RadiantFieldMinaText13
	waitbutton
	closetext
	pause 20
	special FadeInTextboxPalettes
	pause 30
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_MINA
	playsound SFX_JUMP_OVER_LEDGE
	applymovement RADIANT_FIELD_MINA, Movement_Radiant_Mina_jump
	opentext TEXTBOX_MINA
	writetext RadiantFieldMinaText14
	waitbutton
	closetext
	playsound SFX_JUMP_OVER_LEDGE
	special Special_ForcePlayerStateNormal
	applymovement PLAYER, Movement_Radiant_Mina_jump
	pause 10
	applyonemovement RADIANT_FIELD_MINA, step_right
	pause 5
	opentext TEXTBOX_MINA
	writetext RadiantFieldMinaText15
	waitbutton
	closetext
	waitsfx
	winlosstext RadiantMinaWinText, 0
	setlasttalked RADIANT_FIELD_MINA
	loadtrainer MINA, 2
	startbattle
	dontrestartmapmusic
	reloadmap
	playmusic MUSIC_MINA
	opentext TEXTBOX_MINA
	writetext RadiantFieldMinaText16
	waitbutton
	closetext
	applymovement RADIANT_FIELD_MINA, Movement_RadiantMina2
	spriteface PLAYER, RIGHT
	pause 5
	playsound SFX_UNKNOWN_61
	disappear 5
	pause 25
	playsound SFX_SWITCH_POCKETS
	disappear 6
	pause 10
	applyonemovement RADIANT_FIELD_MINA, step_up
	spriteface RADIANT_FIELD_MINA, LEFT
	pause 10
	playsound SFX_GOT_SAFARI_BALLS
	special FadeOutPalettes
	changeblock $c, $1a, $9c
	changeblock $e, $1a, $a5
	changeblock $c, $1c, $9e
	changeblock $e, $1c, $a6
	disappear 7
	waitsfx
	reloadmappart
	special FadeInTextboxPalettes
	pause 25
	applyonemovement RADIANT_FIELD_MINA, step_down
	spriteface RADIANT_FIELD_MINA, LEFT
	pause 10
	opentext TEXTBOX_MINA
	special Special_MinaGoodbye
	waitbutton
	closetext
	applymovement RADIANT_FIELD_MINA, Movement_RadiantMina3
	disappear RADIANT_FIELD_MINA
	setevent EVENT_RADIANT_FIELD_MINA_GONE
	setevent EVENT_DONE_RADIANT_FIELD_MINA
	setevent EVENT_UNIQUE_ENCOUNTER_MINA_RADIANT_FIELD
	setflag ENGINE_MINA_RADIANT_FIELD
	special Special_FadeOutMusic
	pause 5
	playmapmusic
	end
	
Movement_Radiant_Mina_jump:
	fix_facing
	jump_in_place
	remove_fixed_facing
	step_end
	
Movement_RadiantMina1:
	step_left
	step_down
	step_end
	
Movement_RadiantMina2:
	step_down
	step_right
	step_right
	step_up
	step_end
	
Movement_RadiantMina3:
	step_down
	step_right
	step_right
	step_up
	step_right
	step_right
	step_right
	step_end
	
RadiantFieldPlayerSit:
	ld a, PLAYER_SITTING
	ld [wPlayerState], a
	call ReplaceKrisSprite
	ret
	
RadiantMinaWinText:
	text "Not this time"
	line "either, huh?"
	done
	
RadiantFieldMinaTextPour:
	text "Pour… pour…"
	done
	
RadiantFieldMinaTextSip:
	text "Sip… sip…"
	done
	
RadiantFieldMinaText1:
	text "Ahh! <WAIT_S>"
	line "Finally done!"
	
	para "Now I can take a"
	line "break with some"
	cont "tea."
	done
	
RadiantFieldMinaText2:
	text "Oh! <WAIT_S><PLAYER>!<WAIT_S>"
	
	para "You snuck up on"
	line "me."
	
	para "It's good to see"
	line "you again."
	
	para "I just finished up"
	line "my newest piece."
	
	para "Here, <WAIT_S>take a"
	line "look."
	done
	
RadiantFieldMinaText3:
	text "Well?"
	
	para "What do you think?"
	
	para "I guess I'll"
	line "call it:<WAIT_L>"
	done
	
RadiantFieldMinaText4:
	text "“The Sea of"
	line "Sunshine”."
	done
	
RadiantFieldMinaText5:
	text "Anyway…"
	
	para "I came here"
	line "because I heard"
	cont "how beautiful it"
	cont "was."
	
	para "And boy, it sure"
	line "didn't disappoint!"
	
	para "I figured this was"
	line "the perfect spot"
	cont "for a picnic."
	
	para "I was just about"
	line "to have some tea."
	
	para "Care to join me?"
	done
	
RadiantFieldMinaText6:
	text "Nonsense! <WAIT_M>"
	line "I insist!"
	done
	
RadiantFieldMinaText7:
	text "Have a seat and"
	line "I'll pour us some"
	cont "SUNSHINE TEA."
	done
	
RadiantFieldMinaText8:
	text "One for you…"
	done
	
RadiantFieldMinaText9:
	text "…and one for me!"
	done
	
RadiantFieldMinaText10:
	text "I'm glad you came"
	line "along."
	
	para "Tea tastes better"
	line "with company!"
	
	para "…"
	
	para "Folks around here"
	line "brew this tea from"
	cont "sunflower petals."
	
	para "It's supposed to"
	line "have a smooth and"
	cont "mellow taste."
	done
	
RadiantFieldMinaText11:
	text "Ah, tasty!"
	
	para "Go on. <WAIT_S>"
	line "Try it!"
	done
	
RadiantFieldMinaText12Boy:
	text "<PLAYER> closed"
	line "his eyes and took"
	cont "a sip…"
	done
	
RadiantFieldMinaText12Girl:
	text "<PLAYER> closed"
	line "her eyes and took"
	cont "a sip…"
	done
	
RadiantFieldMinaText13:
	text "…<WAIT_L>It tastes"
	line "pleasantly plain."
	
	para "A neutral flavor"
	line "with a hint of"
	cont "sweetness."
	
	para "It goes down"
	line "smooth!"
	done
	
RadiantFieldMinaText14:
	text "Alright, that was"
	line "nice, but it's"
	cont "battle time!"
	done
	
RadiantFieldMinaText15:
	text "Whaddaya say,"
	line "<PLAYER>?"
	
	para "This time I'll"
	line "win for sure!"
	done
	
RadiantFieldMinaText16:
	text "Haha!"
	
	para "One of these days"
	line "I'll get you!"
	
	para "Or maybe not!"
	
	para "Anyway, thanks"
	line "for dropping in."
	
	para "I had fun."
	
	para "I'll be seeing"
	line "you."
	done
	
RadiantFieldEasel:
	jumptext RadiantFieldEaselText
	
RadiantFieldEaselText:
	text "MINA's easel."
	done
	
RadiantFieldPicnic:
	jumptext RadiantFieldPicnicText
	
RadiantFieldPicnicText:
	text "A picnic basket."
	done
	
RadiantFieldTrainer1:
	generictrainer AROMA_LADY, TAYLOR, EVENT_BEAT_RADIANT_FIELD_TRAINER_1, .SeenText, .BeatenText

	text "Ahhh!"
	
	para "Our battle kicked"
	line "up so much pollen!"
	done

.SeenText:
	text "A beautiful field"
	line "of flowers."
	
	para "Is there anywhere"
	line "better for a #-"
	cont "MON battle?"
	done

.BeatenText:
	text "Whoops."
	done
	
RadiantFieldTrainer2:
	generictrainer AROMA_LADY, CAROL, EVENT_BEAT_RADIANT_FIELD_TRAINER_2, .SeenText, .BeatenText

	text "Your fierce"
	line "#MON beat mine"
	cont "fair and square."
	done

.SeenText:
	text "My GRASS-type"
	line "#MON thrive in"
	cont "this environment."
	
	para "There's no way"
	line "we'll lose!"
	done

.BeatenText:
	text "My GRASS-type"
	line "#MON!"
	done
	
RadiantFieldTrainer3:
	generictrainer AROMA_LADY, AMBER, EVENT_BEAT_RADIANT_FIELD_TRAINER_3, .SeenText, .BeatenText

	text "Join me!"
	
	para "Let's dance among"
	line "the flowers toget-"
	cont "her!"
	done

.SeenText:
	text "Hehehe!"
	
	para "I love dancing"
	line "among the flowers!"
	done

.BeatenText:
	text "Woo!"
	done
	
RadiantFieldTrainer4:
	generictrainer AROMA_LADY, JODI, EVENT_BEAT_RADIANT_FIELD_TRAINER_4, .SeenText, .BeatenText

	text "Did you know the"
	line "brown part of a"
	cont "sunflower is made"
	cont "up of many tiny"
	cont "flowers called"
	cont "florets?"
	
	para "Aren't sunflowers"
	line "fascinating?"
	done

.SeenText:
	text "If you can beat me"
	line "I'll tell you an"
	cont "interesting fact"
	cont "about sunflowers!"
	done

.BeatenText:
	text "Ok! You won!"
	done
	
RadiantFieldRose:
	checkevent EVENT_LOST_GIRLS_QUEST_ACTIVE
	iftrue .time_to_save
	jumptextfaceplayer RadiantFieldRoseText1
.time_to_save
	faceplayer
	opentext TEXTBOX_ROSE
	writetext RadiantFieldRoseText2
	waitbutton
	closetext	
	checkcode VAR_FACING
	if_equal LEFT, .YouAreFacingLeft
	applymovement RADIANT_FIELD_ROSE, Movement_Rose
	jump .skip
.YouAreFacingLeft
	applymovement RADIANT_FIELD_ROSE, Movement_Rose2
.skip
	disappear RADIANT_FIELD_ROSE
	setevent EVENT_SAVED_ROSE
	callasm RoseSetNameAsm
	special Special_SaveLostGirl
.end
	end
	
RoseSetNameAsm:
	ld hl, .rosestring
	ld bc, PKMN_NAME_LENGTH
	ld de, wStringBuffer1
	rst CopyBytes
	ret
	
.rosestring:
	db "ROSE@@@@@@@"
	
RadiantFieldIris:
	checkevent EVENT_LOST_GIRLS_QUEST_ACTIVE
	iftrue .time_to_save
	jumptextfaceplayer RadiantFieldIrisText1
.time_to_save
	faceplayer
	opentext TEXTBOX_IRIS
	writetext RadiantFieldIrisText2
	waitbutton
	closetext
	checkcode VAR_FACING
	if_equal UP, .YouAreFacingUp
	applymovement RADIANT_FIELD_IRIS, Movement_Iris
	jump .skip
.YouAreFacingUp
	applymovement RADIANT_FIELD_IRIS, Movement_Iris2
	applymovement RADIANT_FIELD_IRIS, Movement_Iris3
.skip
	disappear RADIANT_FIELD_IRIS
	setevent EVENT_SAVED_IRIS
	callasm IrisSetNameAsm
	special Special_SaveLostGirl
.end
	end
	
IrisSetNameAsm:
	ld hl, .irisstring
	ld bc, PKMN_NAME_LENGTH
	ld de, wStringBuffer1
	rst CopyBytes
	ret
	
.irisstring:
	db "IRIS@@@@@@@"
	
RadiantFieldViolet:
	checkevent EVENT_LOST_GIRLS_QUEST_ACTIVE
	iftrue .time_to_save
	faceplayer 
	opentext
	writetext RadiantFieldVioletText1
	farwritetext StdBlankText
	pause 6
	writetext RadiantFieldVioletText2
	waitbutton
	closetext
	end
.time_to_save
	faceplayer
	opentext TEXTBOX_VIOLET
	writetext RadiantFieldVioletText2
	farwritetext StdBlankText
	pause 6
	writetext RadiantFieldVioletText3
	waitbutton
	closetext
	playsound SFX_JUMP_OVER_LEDGE
	applymovement RADIANT_FIELD_VIOLET, Movement_Violet
	disappear RADIANT_FIELD_VIOLET
	setevent EVENT_SAVED_VIOLET
	callasm VioletSetNameAsm
	special Special_SaveLostGirl
.end
	end
	
VioletSetNameAsm:
	ld hl, .violetstring
	ld bc, PKMN_NAME_LENGTH
	ld de, wStringBuffer1
	rst CopyBytes
	ret
	
.violetstring:
	db "VIOLET@@@@@"
	
RadiantFieldRoseText1:
	text "I just love the"
	line "sunflowers!"
	
	para "They're so pretty!"
	done
	
RadiantFieldRoseText2:
	text "I just love"
	line "the sunflowers!"
	
	para "They're so pretty!"
	
	para "What?"
	
	para "MS. ERIKA wants us"
	line "to come home?"
	
	para "Ok! <WAIT_S>Bye bye!"
	done
	
RadiantFieldIrisText1:
	text "La <WAIT_S>la <WAIT_S>la!"
	
	para "I'm collecting"
	line "flowers for GRAMMA"
	cont "LEILANI."
	done
	
RadiantFieldIrisText2:
	text "La <WAIT_S>la <WAIT_S>la!"
	
	para "I'm collecting"
	line "flowers for GRAMMA"
	cont "LEILANI."
	
	para "Oh!"
	
	para "GRAMMA is worried"
	line "about me?"
	
	para "I didn't mean to"
	line "make her worry…"
	done
	
RadiantFieldVioletText1:
	text "I love the smell"
	line "of these flowers!"
	
	para "I wish I could"
	line "smell them forev-<WAIT_S>"
	done
	
RadiantFieldVioletText2:	
	text "Ah…<WAIT_M> AH!<WAIT_L> …CHOO!"
	done
	
RadiantFieldVioletText3:
	text "Ah…<WAIT_M> AH!<WAIT_L> …CHOO!"
	
	para "I better go home"
	line "before GRAMMA"
	cont "worries about me…"
	done
	
Movement_Rose2:
	step_down
	step_right
	step_right
	step_right
	step_down
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end
	
Movement_Rose:
	step_right
	step_down
	step_right
	step_right
	step_down
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end
	
Movement_Iris2:
	step_right
	
Movement_Iris:
	step_down
	step_down
	step_down
	step_down
	step_left
	step_left
	step_left
	step_left
	step_end
	
Movement_Iris3:
	step_left
	step_left
	step_end
	
Movement_Violet:
	jump_step_down
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end
