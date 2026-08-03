NettBuildingTop_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 0 ; warp events

	db 1 ; coord events
	coord_event  8, 13, -1, NettBuildingTopTeleporter

	db 0 ; bg events

	db 6 ; object events
	person_event SPRITE_ELI,  6, 14, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, NettBuildingTopEli, EVENT_NETT_TOP_ELI_GONE
	person_event SPRITE_PLAYER_CUTSCENE,  6, 13, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, EVENT_PLAYER_CUTSCENE_SILVER
	person_event SPRITE_CLOTHES_RACKS,  6,  3, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_CLOTHES_RACKS,  6, 20, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_CLOTHES_RACKS, 15, 20, SPRITEMOVEDATA_TILE_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_CLOTHES_RACKS, 15,  3, SPRITEMOVEDATA_TILE_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	
	
NettBuildingTopTeleporter:
	teleporter NETT_BUILDING_OFFICE, 1, 2
	end
	
NettBuildingTopEli:
	applyonemovement PLAYER, remove_fixed_facing
	opentext TEXTBOX_ELI
	writetext NettBuildingTopEliText1
	waitbutton
	closetext
	pause 20
	applyonemovement 1, turn_step_up
	applyonemovement PLAYER, remove_fixed_facing
	opentext TEXTBOX_ELI
	writetext NettBuildingTopEliText2
	waitbutton
	closetext
	pause 10
	checkcode VAR_FACING
	if_equal LEFT, .youarefacingleft
	if_equal UP, .youarefacingup
	if_equal DOWN, .youarefacingdown
	applyonemovement PLAYER, turn_step_up
	jump .cont
.youarefacingleft
	applymovement PLAYER, Movement_NettBuildingTopPlayerLeft
	jump .cont
.youarefacingup
	applymovement PLAYER, Movement_NettBuildingTopPlayerUp
	jump .cont
.youarefacingdown
	applymovement PLAYER, Movement_NettBuildingTopPlayerDown
.cont
	applyonemovement PLAYER, remove_fixed_facing
	appear 2
	pause 10
	applyonemovement PLAYER, hide_person
	applymovement PLAYER, Movement_NettBuildingCutscene1
	pause 10
	opentext TEXTBOX_ELI
	writetext NettBuildingTopEliText3
	waitbutton
	closetext
	pause 20
	
	applymovement PLAYER, Movement_NettBuildingCutscene2
	spriteface PLAYER, UP
	applyonemovement PLAYER, show_person
	
	applyonemovement 1, turn_step_left
	applyonemovement PLAYER, remove_fixed_facing
	opentext TEXTBOX_ELI
	writetext NettBuildingTopEliText4
	waitbutton
	closetext
	disappear 2
	pause 10
	applyonemovement PLAYER, turn_step_right
	applyonemovement PLAYER, remove_fixed_facing
	opentext TEXTBOX_ELI
	writetext NettBuildingTopEliText5
	waitbutton
	closetext
	applyonemovement 1, turn_step_up
	applyonemovement PLAYER, remove_fixed_facing
	pause 20
	applyonemovement 1, slow_step_up
	applyonemovement PLAYER, turn_step_up
	applyonemovement PLAYER, remove_fixed_facing
	pause 20
	opentext TEXTBOX_ELI
	writetext NettBuildingTopEliText6
	waitbutton
	closetext
	pause 10
	applyonemovement 1, turn_step_down
	applyonemovement PLAYER, remove_fixed_facing
	opentext TEXTBOX_ELI
	writetext NettBuildingTopEliText7
	waitbutton
	closetext
	pause 10
	applyonemovement 1, slow_step_down
	spriteface PLAYER, RIGHT
	applyonemovement 1, turn_step_left
	applyonemovement PLAYER, remove_fixed_facing
	opentext TEXTBOX_ELI
	writetext NettBuildingTopEliText8
	waitbutton
	closetext
	waitsfx
	winlosstext NettBuildingTopEliWinText, NettBuildingTopEliLoseText
	loadtrainer SNARE_BOSS, 1
	startbattle
	reloadmapafterbattle
	opentext TEXTBOX_ELI
	writetext NettBuildingTopEliText9
	waitbutton
	closetext
	pause 10
	applyonemovement 1, turn_step_up
	applyonemovement PLAYER, remove_fixed_facing
	pause 20
	opentext TEXTBOX_ELI
	writetext NettBuildingTopEliText10
	waitbutton
	closetext
	pause 60
	applyonemovement 1, slow_step_up
	applyonemovement PLAYER, remove_fixed_facing
	spriteface PLAYER, UP
	pause 60
	opentext TEXTBOX_ELI
	writetext NettBuildingTopEliText11
	waitbutton
	closetext
	pause 120
	applyonemovement 1, slow_step_down
	spriteface PLAYER, RIGHT
	applyonemovement 1, slow_step_down
	spriteface PLAYER, DOWN
	applymovement 1, Movement_NettBuildingEliLeaves
	pause 5
	disappear 1
	clearevent EVENT_NETT_BUILDING_DUNGEON
	clearevent EVENT_NETT_OFFICER_MOVED
	clearevent EVENT_NETT_ELEVATOR_BROKEN
	specialphonecall SPECIALCALL_POKEMONLEAGUETIME
	end
	
Movement_NettBuildingTopPlayerLeft:
	step_down
	step_left
Movement_NettBuildingTopPlayerUp:
	step_left
	step_up
	step_end
	
Movement_NettBuildingTopPlayerDown:
	step_left
	step_down
	turn_step_up
	step_end
	
Movement_NettBuildingCutscene1:
	slow_step_up
	slow_step_up
	step_end
	
Movement_NettBuildingCutscene2:
	slow_step_down
	slow_step_down
	step_end
	
Movement_NettBuildingEliLeaves:
	slow_step_down
	slow_step_down
	slow_step_left
	slow_step_down
	slow_step_down
	slow_step_down
	step_end
	
NettBuildingTopEliWinText:
	text "Heh…"
	
	para "As if there was"
	line "any other way this"
	cont "was going to end."
	done
	
NettBuildingTopEliLoseText:
	text "I should have"
	line "handled you myself"
	cont "from the start."
	done
	
NettBuildingTopEliText1:
	text "…<WAIT_L>So…"
	
	para "You made it past"
	line "the others…"
	
	para "I figured you"
	line "would."
	
	para "It was inevitable,"
	line "really."
	
	para "From the moment"
	line "I met you in the"
	cont "train station,"
	
	para "I knew it could"
	line "only end this way."
	done
	
NettBuildingTopEliText2:
	text "You see that?"
	done
	
NettBuildingTopEliText3:
	text "All of that out"
	line "there."
	
	para "I don't just mean"
	line "LUSTER CITY, but"
	cont "all of ONWA."
	
	para "Its people and"
	line "its #MON."
	
	para "My father founded"
	line "this company for"
	cont "all of them."
	
	para "The relationship"
	line "between a TRAINER"
	cont "and their #MON…"
	
	para "It mattered more"
	line "than anything else"
	cont "to my father."
	done
	
NettBuildingTopEliText4:
	text "What matters most"
	line "to me, however,"
	cont "is legacy."
	
	para "Not just mine, but"
	line "my father's, too."
	done
	
NettBuildingTopEliText5:
	text "It might not seem"
	line "like it to you,"
	
	para "but TEAM SNARE was"
	line "created to protect"
	cont "that legacy."
	
	para "Times of peace"
	line "make people soft."
	
	para "As old TRAINERS"
	line "retire, less and"
	cont "less new ones step"
	cont "up in their place."
	
	para "They instead keep"
	line "#MON only as"
	cont "companions."
	
	para "As mere pets!"
	
	para "And the ones that"
	line "DO call themselves"
	cont "TRAINERS, treat it"
	cont "like a game."
	
	para "That's not how it"
	line "should be."
	
	para "Humans and #MON"
	line "are meant to be"
	cont "partners, not"
	cont "friends."
	
	para "The less serious"
	line "TRAINERS around,"
	
	para "the less need for"
	line "our products."
	
	para "I will not let"
	line "this company die!"
	done
	
NettBuildingTopEliText6:
	text "…<WAIT_L>But…"
	
	para "What if there was"
	line "a way to introduce"
	cont "fear into people."
	
	para "A healthy amount"
	line "of fear."
	
	para "Enough to make"
	line "them take training"
	cont "seriously."
	
	para "They wouldn't want"
	line "some crazed thugs"
	cont "taking their"
	cont "precious #MON,"
	cont "now would they?"
	
	para "Thus, TEAM SNARE"
	line "was born."
	
	para "A group that would"
	line "disrupt the peace."
	
	para "Just enough to"
	line "snap ONWA out of"
	cont "complacency."
	
	para "…"
	
	para "And you know what?"
	done
	
NettBuildingTopEliText7:
	text "It worked!"
	
	para "More people are"
	line "training in"
	cont "earnest than have"
	cont "for years!"
	
	para "Profits are up!"
	
	para "The natural order"
	line "is being restored!"
	
	para "It's a good thing!"
	
	para "Can't you see that"
	line "TEAM SNARE is a"
	cont "necessity?"
	done
	
NettBuildingTopEliText8:
	text "No…"
	
	para "Maybe you don't"
	line "see it that way."
	
	para "Well, it doesn't"
	line "matter either way."
	
	para "This is the path"
	line "I chose."
	
	para "And now that you"
	line "know the truth,"
	cont "I can't let you"
	cont "leave."
	
	para "I'll do whatever"
	line "I must to protect"
	cont "this company!"
	done

NettBuildingTopEliText9:
	text "It's over."
	
	para "TEAM SNARE has"
	line "been thoroughly"
	cont "bested."
	
	para "You've beaten KAGE"
	line "and LOCKE,"
	
	para "you've beaten me,"
	
	para "you've even beaten"
	line "our whizkid,"
	cont "<RIVAL>."
	
	para "I really AM sorry"
	line "about what"
	cont "happened to him…"
	
	para "I recruited him"
	line "because I knew he"
	cont "was the only one"
	cont "who stood a chance"
	cont "against you."
		
	para "He was clearly in"
	line "desperate need of"
	cont "a father figure,"
	
	para "and I suppose I"
	line "took advantage of"
	cont "that."
	
	para "Of course, I never"
	line "bought into his"
	cont "“DRAGON STONE”"
	cont "fairytale,"
	
	para "but I figured it"
	line "would give him the"
	cont "drive he needed to"
	cont "take you down."
	
	para "That was a common"
	line "goal for us both."
	
	para "I didn't expect him"
	line "to end up doing"
	cont "something so…"
	
	para "…<WAIT_L>hasty."
	
	para "…"

	para "It's a shame, but"
	line "like I said when"
	cont "we first met,"
	
	para "sometimes"
	line "sacrifices need"
	cont "to be made."
	done
	
NettBuildingTopEliText10:
	text "TEAM SNARE is no"
	line "more."
	
	para "That has become"
	line "painfully clear"
	cont "to me."
	
	para "They will disband"
	line "immediately."
	
	para "…"
		
	para "I will leave NETT"
	line "CORP. to the board"
	cont "of directors, and"
	cont "step down at once."
	
	para "My legacy is in"
	line "ruin."
	
	para "I can only hope"
	line "it won't affect"
	cont "my father's…"
	done
	
NettBuildingTopEliText11:
	text "You know, <WAIT_S>I never"
	line "get tired of the"
	cont "view from up here…"
	done
