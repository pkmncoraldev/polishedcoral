WriteFinalPkmnText::
	call GetFinalPkmnTextPointer
	jp BattleTextBox

GetFinalPkmnTextPointer::
	ld a, [wOtherTrainerClass]
	ld hl, FinalTextClassList
	call .findinarray
	jr nc, .nothing
	ld a, [wOtherTrainerID]
.loop
	dec a
	cp 0
	jr z, .finish
	inc hl
	inc hl
	jr .loop

.findinarray:
	push de
	ld de, 3
	call IsInArray
	pop de
	ret nc
	inc hl
.finish:
	ld a, [hli]
	ld h, [hl]
	ld l, a
	or h
	jr z, .nothing
.done:
	scf
	ret

.nothing:
	xor a
	ret	

FinalTextClassList:
	dbw STANLEY, .FinalText_Stanley
	dbw RODNEY, .FinalText_Rodney
	dbw WENDY, .FinalText_Wendy
	dbw CHARLIE, .FinalText_Charlie
	dbw POLLY, .FinalText_Polly
	dbw LEILANI, .FinalText_Leilani
	dbw ROCKY, .FinalText_Rocky
	dbw DARCY, .FinalText_Darcy
	dbw RIVAL, .FinalText_Rival
	dbw RIVAL_S, .FinalText_Rival_S
	dbw KAGE, .FinalText_Kage
	dbw LOCKE, .FinalText_Locke
	dbw FRANKIE, .FinalText_Frankie
	dbw MALL_COP, .FinalText_MallCop
	dbw DOJO_MASTER, .FinalText_DojoMaster
	dbw ERIKA, .FinalText_Erika
	dbw LEDIAN_RANGER, .FinalText_LedianRanger
	dbw POLICE_CAPTAIN, .FinalText_PoliceCaptain
	db -1

.FinalText_Stanley:
	dw Stanley_FirstBattleFinalPkmnText
	dw Stanley_RematchFinalPkmnText
	dw Stanley_RematchFinalPkmnText
	dw Stanley_RematchFinalPkmnText
	dw Stanley_RematchFinalPkmnText
	dw Stanley_RematchFinalPkmnText
	dw Stanley_RematchFinalPkmnText
	dw Stanley_RematchFinalPkmnText
	
.FinalText_Rodney:
	dw Rodney_FirstBattleFinalPkmnText
	dw Rodney_RematchFinalPkmnText
	dw Rodney_RematchFinalPkmnText
	dw Rodney_RematchFinalPkmnText
	dw Rodney_RematchFinalPkmnText
	dw Rodney_RematchFinalPkmnText
	dw Rodney_RematchFinalPkmnText
	
.FinalText_Wendy:
	dw Wendy_FirstBattleFinalPkmnText
	dw Wendy_RematchFinalPkmnText
	dw Wendy_RematchFinalPkmnText
	dw Wendy_RematchFinalPkmnText
	dw Wendy_RematchFinalPkmnText
	dw Wendy_RematchFinalPkmnText
	
.FinalText_Charlie:
	dw Charlie_FirstBattleFinalPkmnText
	dw Charlie_RematchFinalPkmnText
	dw Charlie_RematchFinalPkmnText
	dw Charlie_RematchFinalPkmnText
	dw Charlie_RematchFinalPkmnText
	dw Charlie_RematchFinalPkmnText
	
.FinalText_Polly:
	dw Polly_FirstBattleFinalPkmnText
	dw Polly_RematchFinalPkmnText
	dw Polly_RematchFinalPkmnText
	dw Polly_RematchFinalPkmnText
	dw Polly_RematchFinalPkmnText
	
.FinalText_Leilani
	dw Leilani_FirstBattleFinalPkmnText
	dw Leilani_RematchFinalPkmnText
	dw Leilani_RematchFinalPkmnText
	dw Leilani_RematchFinalPkmnText
	
.FinalText_Rocky:
	dw Rocky_FirstBattleFinalPkmnText
	dw Rocky_RematchFinalPkmnText
	dw Rocky_RematchFinalPkmnText
	
.FinalText_Darcy:
	dw Darcy_FirstBattleFinalPkmnText
	dw Darcy_RematchFinalPkmnText

.FinalText_Rival:
	dw -1
	dw -1
	dw -1
	dw -1
	dw -1
	dw -1
	dw Rival_2_FinalPkmnText
	dw Rival_2_FinalPkmnText
	dw Rival_2_FinalPkmnText
	dw Rival_2_FinalPkmnText
	dw Rival_2_FinalPkmnText
	dw Rival_2_FinalPkmnText
	dw Rival_3_FinalPkmnText
	dw Rival_3_FinalPkmnText
	dw Rival_3_FinalPkmnText
	dw Rival_3_FinalPkmnText
	dw Rival_3_FinalPkmnText
	dw Rival_3_FinalPkmnText
	dw Rival_4_FinalPkmnText
	dw Rival_4_FinalPkmnText
	dw Rival_4_FinalPkmnText
	dw Rival_4_FinalPkmnText
	dw Rival_4_FinalPkmnText
	dw Rival_4_FinalPkmnText
	
.FinalText_Rival_S:
	dw Rival_S_1_FinalPkmnText
	dw Rival_S_1_FinalPkmnText
	dw Rival_S_1_FinalPkmnText
	dw Rival_S_1_FinalPkmnText
	dw Rival_S_1_FinalPkmnText
	dw Rival_S_1_FinalPkmnText
	dw Rival_S_2_FinalPkmnText
	dw Rival_S_2_FinalPkmnText
	dw Rival_S_2_FinalPkmnText
	dw Rival_S_2_FinalPkmnText
	dw Rival_S_2_FinalPkmnText
	dw Rival_S_2_FinalPkmnText

.FinalText_Kage:
	dw Kage_SunbeamFinalPkmnText
	dw Kage_InnFinalPkmnText
	
.FinalText_Locke:
	dw Locke_TrainFinalPkmnText
	dw Locke_MuseumFinalPkmnText
	
.FinalText_Frankie:
	dw Frankie_FinalPkmnText
	
.FinalText_MallCop:
	dw MallCop_FinalPkmnText
	
.FinalText_DojoMaster:
	dw DojoMaster_FinalPkmnText
	
.FinalText_Erika:
	dw Erika_FinalPkmnText
	
.FinalText_LedianRanger:
	dw LedianRanger_FinalPkmnText
	
.FinalText_PoliceCaptain:
	dw PoliceCaptain_FinalPkmnText
	
Rival_2_FinalPkmnText:
	text "Come on!"
	
	para "What was that,"
	line "SNUBBULL!?"
	prompt
	
Rival_3_FinalPkmnText:
	text "How the-?"
	
	para "Argh!<WAIT_S> Get it"
	line "together!"
	prompt
	
Rival_4_FinalPkmnText:
	text "Maybe he's right"
	line "about you…"
	
	para "Maybe you really"
	line "ARE…"
	prompt
	
Rival_S_1_FinalPkmnText:
	text "Of course…"
	
	para "It's always the"
	line "same with you!"
	prompt
	
Rival_S_2_FinalPkmnText:
	text "This is a waste"
	line "of my time!"
	prompt
	
Stanley_FirstBattleFinalPkmnText:
Stanley_RematchFinalPkmnText:
	text "Interesting…"
	
	para "But it's not"
	line "over yet!"
	done
	
Rodney_FirstBattleFinalPkmnText:
Rodney_RematchFinalPkmnText:
	text "GAH <WAIT_S>HA <WAIT_S>HA!"
	
	para "Here comes the"
	line "tsunami!"
	done
	
Wendy_FirstBattleFinalPkmnText:
Wendy_RematchFinalPkmnText:
	text "Woah, you aren't"
	line "kidding around."
	
	para "I'd better get"
	line "serious!"
	done

Charlie_FirstBattleFinalPkmnText:
Charlie_RematchFinalPkmnText:
	text "Keep it together"
	line "now, kid."
	
	para "Don't let the"
	line "heat get to you!"
	done

Polly_FirstBattleFinalPkmnText:
	text "Uhh… <WAIT_M>Wait.<WAIT_M>"
	line "What's going on?"
	
	para "What's this"
	line "feeling?"
	done
	
Polly_RematchFinalPkmnText:
	text "Yes! <WAIT_M>Yes!"
	
	para "That feeling again!"
	done
	
Leilani_FirstBattleFinalPkmnText:
Leilani_RematchFinalPkmnText:
	text "Settle down."
	
	para "You haven't got"
	line "the best of GRAMMA"
	cont "yet, dear."
	done
	
Rocky_FirstBattleFinalPkmnText:
Rocky_RematchFinalPkmnText:
	text "Not bad!"
	
	para "You really are"
	line "something, huh?"
	done
	
Darcy_FirstBattleFinalPkmnText:
	text "Come on, <PLAYER>!"
	
	para "It's time for"
	line "both of use to"
	cont "prove ourselves!"
	done
	
Darcy_RematchFinalPkmnText:
	text "It's no wonder"
	line "GRANDPA deemed"
	cont "you worthy!"
	done
	
Kage_SunbeamFinalPkmnText:
	text "You got guts, kid."
	line "I'll give you that."
	
	para "Not guts like my"
	line "URSARING, though!"
	prompt
	
Kage_InnFinalPkmnText:
	text "ENOUGH!"
	
	para "I will cut you"
	line "down to size,"
	cont "you brat!"
	done
	
Locke_TrainFinalPkmnText:
	text "Who do you think"
	line "you are?"
	
	para "TEAM SNARE isn't"
	line "to be trifled"
	cont "with!"
	done
	
Locke_MuseumFinalPkmnText:
	text "Is this what"
	line "I'm reduced to?"

	para "Just buying a"
	line "child some time?"
	done
	
Frankie_FinalPkmnText:
	text "GRAAAHHHH!"
	
	para "NIDOKIIIIINGS!"
	done
	
MallCop_FinalPkmnText:
	text "We got a 87-12"
	line "here!"
	
	para "Code blue!"
	line "Code purple!"
	
	para "Requesting"
	line "backup!"
	done
	
DojoMaster_FinalPkmnText:
	text "…"
	done

Erika_FinalPkmnText:
LedianRanger_FinalPkmnText:
	text "Go! <WAIT_S>Go!<WAIT_S>"
	line "LEDIAN RANGER!"
	
	para "Activate HYPER"
	line "MECHA BATTLE MODE!"
	done

PoliceCaptain_FinalPkmnText:
	text "NO! <WAIT_S>NO! <WAIT_S>NO! <WAIT_S>NO! <WAIT_S>NO!"
	
	para "Respect my"
	line "authority!"
	prompt
	