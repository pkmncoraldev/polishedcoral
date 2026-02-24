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
	dw Rival_1_1_FinalPkmnText
	dw Rival_1_2_FinalPkmnText
	dw Rival_1_3_FinalPkmnText
	dw Rival_1_4_FinalPkmnText
	dw Rival_1_5_FinalPkmnText
	dw Rival_1_6_FinalPkmnText
	dw Rival_2_1_FinalPkmnText
	dw Rival_2_2_FinalPkmnText
	dw Rival_2_3_FinalPkmnText
	dw Rival_2_4_FinalPkmnText
	dw Rival_2_5_FinalPkmnText
	dw Rival_2_6_FinalPkmnText
	dw Rival_3_1_FinalPkmnText
	dw Rival_3_2_FinalPkmnText
	dw Rival_3_3_FinalPkmnText
	dw Rival_3_4_FinalPkmnText
	dw Rival_3_5_FinalPkmnText
	dw Rival_3_6_FinalPkmnText
	dw Rival_4_1_FinalPkmnText
	dw Rival_4_2_FinalPkmnText
	dw Rival_4_3_FinalPkmnText
	dw Rival_4_4_FinalPkmnText
	dw Rival_4_5_FinalPkmnText
	dw Rival_4_6_FinalPkmnText
	
.FinalText_Rival_S:
	dw Rival_S_1_1_FinalPkmnText
	dw Rival_S_1_2_FinalPkmnText
	dw Rival_S_1_3_FinalPkmnText
	dw Rival_S_1_4_FinalPkmnText
	dw Rival_S_1_5_FinalPkmnText
	dw Rival_S_1_6_FinalPkmnText
	dw Rival_S_2_1_FinalPkmnText
	dw Rival_S_2_2_FinalPkmnText
	dw Rival_S_2_3_FinalPkmnText
	dw Rival_S_2_4_FinalPkmnText
	dw Rival_S_2_5_FinalPkmnText
	dw Rival_S_2_6_FinalPkmnText

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

Kage_SunbeamFinalPkmnText:
	text "You got guts, kid."
	line "I'll give you that."
	
	para "Not guts like my"
	line "URSARING, though!"
	prompt
	
Stanley_FirstBattleFinalPkmnText:
Stanley_RematchFinalPkmnText:
Rodney_FirstBattleFinalPkmnText:
Rodney_RematchFinalPkmnText:
Wendy_FirstBattleFinalPkmnText:
Wendy_RematchFinalPkmnText:
Charlie_FirstBattleFinalPkmnText:
Charlie_RematchFinalPkmnText:
Polly_FirstBattleFinalPkmnText:
Polly_RematchFinalPkmnText:
Leilani_FirstBattleFinalPkmnText:
Leilani_RematchFinalPkmnText:
Rocky_FirstBattleFinalPkmnText:
Rocky_RematchFinalPkmnText:
Darcy_FirstBattleFinalPkmnText:
Darcy_RematchFinalPkmnText:
Rival_1_1_FinalPkmnText:
Rival_1_2_FinalPkmnText:
Rival_1_3_FinalPkmnText:
Rival_1_4_FinalPkmnText:
Rival_1_5_FinalPkmnText:
Rival_1_6_FinalPkmnText:
Rival_2_1_FinalPkmnText:
Rival_2_2_FinalPkmnText:
Rival_2_3_FinalPkmnText:
Rival_2_4_FinalPkmnText:
Rival_2_5_FinalPkmnText:
Rival_2_6_FinalPkmnText:
Rival_3_1_FinalPkmnText:
Rival_3_2_FinalPkmnText:
Rival_3_3_FinalPkmnText:
Rival_3_4_FinalPkmnText:
Rival_3_5_FinalPkmnText:
Rival_3_6_FinalPkmnText:
Rival_4_1_FinalPkmnText:
Rival_4_2_FinalPkmnText:
Rival_4_3_FinalPkmnText:
Rival_4_4_FinalPkmnText:
Rival_4_5_FinalPkmnText:
Rival_4_6_FinalPkmnText:
Rival_S_1_1_FinalPkmnText:
Rival_S_1_2_FinalPkmnText:
Rival_S_1_3_FinalPkmnText:
Rival_S_1_4_FinalPkmnText:
Rival_S_1_5_FinalPkmnText:
Rival_S_1_6_FinalPkmnText:
Rival_S_2_1_FinalPkmnText:
Rival_S_2_2_FinalPkmnText:
Rival_S_2_3_FinalPkmnText:
Rival_S_2_4_FinalPkmnText:
Rival_S_2_5_FinalPkmnText:
Rival_S_2_6_FinalPkmnText:
Kage_InnFinalPkmnText:
Locke_TrainFinalPkmnText:
Locke_MuseumFinalPkmnText:
Frankie_FinalPkmnText:
MallCop_FinalPkmnText:
DojoMaster_FinalPkmnText:
Erika_FinalPkmnText:
LedianRanger_FinalPkmnText:
PoliceCaptain_FinalPkmnText:
	text "FINAL #MON"
	prompt
	