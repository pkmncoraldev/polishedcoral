Route23_MapScriptHeader:
	db 1 ; scene scripts
	scene_script Route23Trigger0

	db 0 ; callbacks

	db 0 ; warp events

	db 0 ; coord events

	db 3 ; bg events
	bg_event 41, 49, SIGNPOST_ITEM + TAPE_PLAYER, EVENT_MUSIC_MINIBOSS_BATTLE
	signpost 40, 37, SIGNPOST_ITEM + FULL_RESTORE, EVENT_ROUTE_23_HIDDEN_ITEM
	signpost 48, 24, SIGNPOST_JUMPTEXT, Route23Sign

	db 9 ; object events
	smashrock_event 37, 48
	smashrock_event 38, 49
	tapeball_event 41, 53, MUSIC_MINIBOSS_BATTLE, 2, EVENT_MUSIC_MINIBOSS_BATTLE
	fruittree_event 20, 10, FRUITTREE_ROUTE_23, PERSIM_BERRY
	person_event SPRITE_TEACHER, 13,  9, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 4, TrainerRoute23_1, -1
	person_event SPRITE_GRANNY, 51, 27, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 5, TrainerRoute23_2, -1
	person_event SPRITE_LASS, 39, 36, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 3, TrainerRoute23_3, -1
	person_event SPRITE_PONYTAIL, 21, 28, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route23NPC1, -1
	person_event SPRITE_POKEFAN_F, 38, 27, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route23NPC2, -1
	
	
Route23Trigger0:
	special Special_UpdatePalsInstant
	end
	
Route23Sign:
	text "ROUTE 32"
	
	para "SOUTH:"
	line "CROSSROADS"
	
	para "NORTHWEST:"
	line "ROUTE 11 BRIDGE &"
	cont "EVENTIDE VILLAGE"
	done
	
Route23NPC1:
	jumptextfaceplayer Route23NPC1Text
	
Route23NPC1Text:
	text "That poor SNUBBULL"
	line "at that house up"
	cont "ahead."
	
	para "Forced to sleep"
	line "outside in a tiny"
	cont "doghouse…"
	
	para "I'd be angry too!"
	done
	
Route23NPC2:
	jumptextfaceplayer Route23NPC2Text
	
Route23NPC2Text:
	text "This area is"
	line "pretty rocky."
	
	para "Now that they"
	line "built that bridge"
	cont "up NORTH,"
	
	para "I wonder if this"
	line "area will be paved"
	cont "over, too."
	
	para "I hope they don't"
	line "disrupt the #-"
	cont "MON in that cave"
	cont "to the SOUTHEAST…"
	done
	
TrainerRoute23_1:
	generictrainer TEACHER, WANDA, EVENT_BEAT_ROUTE_23_TRAINER_1, .SeenText, .BeatenText

	text "School is very"
	line "important,"
	
	para "but it's also"
	line "good that you're"
	cont "out exercising."
	done

.SeenText:
	text "Shouldn't you be in"
	line "class right now?"
	done

.BeatenText:
	text "You schooled me!"
	done
	
TrainerRoute23_2:
	generictrainer LADY, MURIEL, EVENT_BEAT_ROUTE_23_TRAINER_2, .SeenText, .BeatenText

	text "I can't stand"
	line "being cooped up"
	cont "inside."
	done

.SeenText:
	text "I'm staying at"
	line "that little inn."
	
	para "I had to get out"
	line "of my room and"
	cont "stretch my legs."
	done

.BeatenText:
	text "Good show!"
	done
	
TrainerRoute23_3:
	generictrainer LASS, DEEDEE, EVENT_BEAT_ROUTE_23_TRAINER_3, .SeenText, .BeatenText
	
	text "Maybe I should"
	line "head up NORTH and"
	cont "catch some more"
	cont "#MON."
	done

.SeenText:
	text "Are you heading up"
	line "to NORTH ONWA?"
	
	para "That's where I"
	line "caught my team!"
	done

.BeatenText:
	text "Aaah!<WAIT_S>"
	line "My team!"
	done
	
Route23StrengthMan:
	faceplayer
	opentext
	checktmhm TM_SUPERPOWER
	iftrue .got_superpower
	checktmhm TM_SELFDESTRUCT ;mr pusher reward
	iffalse .normal
	writetext Route23StrengthManText2
	waitbutton
	verbosegivetmhm TM_SUPERPOWER
	setevent EVENT_TM48
.got_superpower
	writetext Route23StrengthManText3
	waitbutton
	closetext
	end
.normal
	writetext Route23StrengthManText1
	waitbutton
	closetext
	end
	
Route23StrengthManText1:
	text "I'm a huge boulder"
	line "pushing fan."
	
	para "Have you met"
	line "MR. PUSHER?"
	
	para "He's my idol!"
	
	para "I even shave my"
	line "head to look just"
	cont "like him!"
	
	para "I'm just a newbie,"
	line "but I aspire to"
	cont "be a true pusher"
	cont "like MR. PUSHER!"
	
	para "If you ever meet"
	line "him, be sure to"
	cont "come back and"
	cont "tell me about it!"
	done
	
Route23StrengthManText2:
	text "I'm a huge boulder"
	line "pushing fan."
	
	para "Have you met"
	line "MR. PUSHER?"
	
	para "You have!?"
	
	para "He's my idol!"
	
	para "If he said you're"
	line "a true pusher,"
	
	para "then you're my"
	line "idol too!"
	
	para "Here!"
	done
	
Route23StrengthManText3:
	text "SUPERPOWER does"
	line "huge damage, but"
	cont "drops your stats."
	
	para "I wonder if you"
	line "even need a TM"
	cont "like that."
	
	para "A true pusher"
	line "like you probably"
	cont "already has super-"
	cont "powered #MON!"
	done
	