BossTrainers:
	db STANLEY
	db RODNEY
	db WENDY
	db CHARLIE
	db POLLY
	db LEILANI
	db ROCKY
	db DARCY
	db -1
	
SnareTrainers:
	db GRUNTM
	db GRUNTF
	db KAGE
	db LOCKE
	db RIVAL_S
	db SNARE_BOSS
	db -1
	
TourneyTrainers:
	db STANLEY_TOURNEY
	db RODNEY_TOURNEY
	db WENDY_TOURNEY
	db CHARLIE_TOURNEY
	db POLLY_TOURNEY
	db LEILANI_TOURNEY
	db ROCKY_TOURNEY
	db DARCY_TOURNEY
	db MINA_TOURNEY
	db ERIKA_TOURNEY
	db DISGUISE_TOURNEY
	db FRANKIE_TOURNEY
	db LEDIAN_RANGER_TOURNEY
	db POLICE_CAPTAIN_TOURNEY
	db DOJO_MASTER_TOURNEY
	db -1
	
SetOrderTrainers:
	db STANLEY
	db RODNEY
	db WENDY
	db CHARLIE
	db POLLY
	db LEILANI
	db ROCKY
	db DARCY
	db KAGE
	db LOCKE
	db DOJO_MASTER
	db SNARE_BOSS
	db -1
	
IsTourneyTrainer:
	ld hl, TourneyTrainers
	jr IsCertainTrainer
	
IsBossTrainer:
	ld hl, BossTrainers
	jr IsCertainTrainer

IsSnareTrainer:
	ld hl, SnareTrainers
IsCertainTrainer:
	push de
	ld a, [wOtherTrainerClass]
	ld de, $1
	call IsInArray
	pop de
	ret
	
IsSetOrderTrainerTrainer:
	eventflagcheck EVENT_USED_ROAR
	ret nz
	ld a, [wOtherTrainerClass]
	cp DELINQUENT_M
	jr nz, .not_beau
	ld a, [wOtherTrainerID]
	cp BEAU
	jr nz, .not_beau
	scf
	ret
.not_beau
	ld hl, SetOrderTrainers
	push de
	ld de, $1
	call IsInArray
	pop de
	ret