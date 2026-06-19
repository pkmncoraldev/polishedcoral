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
	
IsBossTrainer:
	ld hl, BossTrainers
	push de
	ld a, [wOtherTrainerClass]
	ld de, $1
	call IsInArray
	pop de
	ret

IsSnareTrainer:
	ld hl, SnareTrainers
	push de
	ld a, [wOtherTrainerClass]
	ld de, $1
	call IsInArray
	pop de
	ret
	
IsSetOrderTrainerTrainer:
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