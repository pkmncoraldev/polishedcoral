TrainerClassAttributes: ; 3959c

; Cory
	db 0, 0 ; items
	db 30 ; base reward
	dw AI_BASIC + AI_SMART + AI_TYPES + AI_SETUP + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE
	
; Cora
	db 0, 0 ; items
	db 30 ; base reward
	dw AI_BASIC + AI_TYPES + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE
	
; Pippi
	db 0, 0 ; items
	db 30 ; base reward
	dw AI_BASIC + AI_TYPES + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE
	
; Red
	db 0, 0 ; items
	db 30 ; base reward
	dw AI_BASIC + AI_TYPES + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE
	
; Leaf
	db 0, 0 ; items
	db 30 ; base reward
	dw AI_BASIC + AI_TYPES + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE
	
; Gold
	db 0, 0 ; items
	db 30 ; base reward
	dw AI_BASIC + AI_TYPES + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE
	
; Kris
	db 0, 0 ; items
	db 30 ; base reward
	dw AI_BASIC + AI_TYPES + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE

; Stanley
	db 0, 0 ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SMART + AI_STATUS + AI_SETUP + AI_TYPES
	dw CONTEXT_USE

; Rodney
	db FULL_HEAL, 0 ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SMART + AI_STATUS + AI_SETUP + AI_TYPES
	dw CONTEXT_USE

; Wendy
	db 0, 0 ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SMART + AI_SETUP + AI_TYPES + AI_OPPORTUNIST + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE

; Charlie
	db HYPER_POTION, 0 ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SMART + AI_STATUS + AI_SETUP + AI_TYPES
	dw CONTEXT_USE

; Polly
	db FULL_HEAL, 0 ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_OPPORTUNIST + AI_AGGRESSIVE + AI_STATUS + AI_RISKY + AI_SMART
	dw CONTEXT_USE

; Leilani
	db SUNSHINE_TEA, 0 ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SMART + AI_SETUP + AI_TYPES + AI_OPPORTUNIST + AI_AGGRESSIVE + AI_STATUS
	dw CONTEXT_USE

; Rocky
	db MAX_POTION, 0 ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_OPPORTUNIST + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Darcy
	db FULL_HEAL, MAX_POTION ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_OPPORTUNIST + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Will
	db MAX_POTION, 0 ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_OPPORTUNIST + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Koga
	db FULL_HEAL, FULL_RESTORE ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_OPPORTUNIST + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Bruno
	db MAX_POTION, 0 ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_OPPORTUNIST + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Karen
	db FULL_HEAL, MAX_POTION ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_OPPORTUNIST + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Champion
	db FULL_HEAL, FULL_RESTORE ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_OPPORTUNIST + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Rival
	db 0, 0 ; items
	db 15 ; base reward
	dw AI_BASIC + AI_SMART + AI_SETUP + AI_TYPES + AI_OPPORTUNIST + AI_AGGRESSIVE + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES
	
; Rivals
	db 0, 0 ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SMART + AI_SETUP + AI_TYPES + AI_OPPORTUNIST + AI_AGGRESSIVE + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Youngster
	db 0, 0 ; items
	db 4 ; base reward
	dw AI_BASIC + AI_STATUS
	dw CONTEXT_USE + SWITCH_RARELY

; Bug Catcher
	db 0, 0 ; items
	db 4 ; base reward
	dw AI_BASIC + AI_SETUP + AI_STATUS
	dw CONTEXT_USE + SWITCH_RARELY

; Camper
	db 0, 0 ; items
	db 5 ; base reward
	dw AI_BASIC + AI_TYPES + AI_CAUTIOUS + AI_STATUS
	dw CONTEXT_USE + SWITCH_RARELY

; Picnicker
	db 0, 0 ; items
	db 5 ; base reward
	dw AI_BASIC + AI_TYPES + AI_CAUTIOUS + AI_STATUS
	dw CONTEXT_USE + SWITCH_RARELY

; Twins
	db 0, 0 ; items
	db 5 ; base reward
	dw NO_AI
	dw CONTEXT_USE + SWITCH_OFTEN

; Fisher
	db 0, 0 ; items
	db 6 ; base reward
	dw AI_BASIC + AI_TYPES + AI_OPPORTUNIST + AI_CAUTIOUS + AI_STATUS
	dw CONTEXT_USE + SWITCH_RARELY

; Bird Keeper
	db 0, 0 ; items
	db 6 ; base reward
	dw AI_BASIC + AI_TYPES + AI_OFFENSIVE + AI_OPPORTUNIST + AI_STATUS
	dw CONTEXT_USE + SWITCH_RARELY

; Hiker
	db 0, 0 ; items
	db 8 ; base reward
	dw AI_BASIC + AI_OFFENSIVE + AI_STATUS
	dw CONTEXT_USE + SWITCH_RARELY

; Gruntm
	db 0, 0 ; items
	db 7 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_OPPORTUNIST + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_RARELY

; Gruntf
	db 0, 0 ; items
	db 7 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_OPPORTUNIST + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_RARELY
	
; Kage
	db 0, 0 ; items
	db 15 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_OPPORTUNIST + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_RARELY
	
; Locke
	db 0, 0 ; items
	db 15 ; base reward
	dw AI_BASIC + AI_SMART + AI_SETUP + AI_TYPES + AI_OPPORTUNIST + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_RARELY

; Pokefanm
	db 0, 0 ; items
	db 7 ; base reward
	dw AI_BASIC + AI_TYPES + AI_STATUS
	dw CONTEXT_USE + SWITCH_RARELY

; Pokefanf
	db 0, 0 ; items
	db 7 ; base reward
	dw AI_BASIC + AI_TYPES + AI_STATUS
	dw CONTEXT_USE + SWITCH_RARELY

; Officer
	db FRESH_WATER, 0 ; items
	db 10 ; base reward
	dw AI_BASIC + AI_TYPES + AI_OPPORTUNIST + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Pokemaniac
	db X_SPEED, 0 ; items
	db 7 ; base reward
	dw AI_BASIC + AI_SETUP + AI_OFFENSIVE + AI_AGGRESSIVE + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Super Nerd
	db DIRE_HIT, 0 ; items
	db 10 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_OPPORTUNIST + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Lass
	db 0, 0 ; items
	db 5 ; base reward
	dw AI_BASIC + AI_TYPES + AI_OPPORTUNIST + AI_CAUTIOUS + AI_STATUS
	dw CONTEXT_USE + SWITCH_RARELY

; Beauty
	db 0, 0 ; items
	db 7 ; base reward
	dw AI_BASIC + AI_TYPES + AI_OPPORTUNIST + AI_CAUTIOUS + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Firebreather
	db 0, 0 ; items
	db 7 ; base reward
	dw AI_BASIC + AI_SETUP + AI_OFFENSIVE + AI_OPPORTUNIST + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Juggler
	db 0, 0 ; items
	db 7 ; base reward
	dw AI_BASIC + AI_TYPES + AI_STATUS
	dw CONTEXT_USE + SWITCH_OFTEN

; Schoolboy
	db SODA_POP, 0 ; items
	db 10 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_OPPORTUNIST + AI_CAUTIOUS + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Psychic T
	db 0, 0 ; items
	db 10 ; base reward
	dw AI_BASIC + AI_TYPES + AI_OPPORTUNIST + AI_CAUTIOUS + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Couple
	db LEMONADE, 0 ; items
	db 10 ; base reward
	dw AI_BASIC + AI_TYPES + AI_OPPORTUNIST + AI_CAUTIOUS + AI_STATUS
	dw CONTEXT_USE + SWITCH_OFTEN

; Gentleman
	db 0, 0 ; items
	db 10 ; base reward
	dw AI_BASIC + AI_SETUP + AI_AGGRESSIVE + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Lady
	db MAX_POTION, 0 ; items
	db 10 ; base reward
	dw AI_BASIC + AI_TYPES + AI_OPPORTUNIST + AI_CAUTIOUS + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Sailor
	db 0, 0 ; items
	db 10 ; base reward
	dw AI_BASIC + AI_OFFENSIVE + AI_OPPORTUNIST + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Swimmerm
	db 0, 0 ; items
	db 5 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_OFFENSIVE + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Swimmerf
	db 0, 0 ; items
	db 5 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_CAUTIOUS + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Burglar
	db 0, 0 ; items
	db 20 ; base reward
	dw AI_BASIC + AI_OFFENSIVE + AI_CAUTIOUS + AI_STATUS
	dw CONTEXT_USE + SWITCH_RARELY

; Scientist
	db FULL_RESTORE, 0 ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_OPPORTUNIST + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Boarder
	db 0, 0 ; items
	db 7 ; base reward
	dw AI_BASIC + AI_TYPES + AI_OPPORTUNIST + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Skier
	db 0, 0 ; items
	db 7 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Blackbelt T
	db 0, 0 ; items
	db 6 ; base reward
	dw AI_BASIC + AI_TYPES + AI_OFFENSIVE + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Teacher
	db 0, 0 ; items
	db 18 ; base reward
	dw AI_BASIC + AI_OPPORTUNIST + AI_AGGRESSIVE + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Guitarist
	db 0, 0 ; items
	db 18 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_AGGRESSIVE + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Biker
	db 0, 0 ; items
	db 18 ; base reward
	dw AI_BASIC + AI_TYPES + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES
	
; Cueball
	db 0, 0 ; items
	db 18 ; base reward
	dw AI_BASIC + AI_TYPES + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Cooltrainerm
	db FULL_HEAL, 0 ; items
	db 10 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_OPPORTUNIST + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Cooltrainerf
	db FULL_HEAL, 0 ; items
	db 10 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_OPPORTUNIST + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Prof Spruce
	db FULL_RESTORE, 0 ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_OPPORTUNIST + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; TeacherFast
	db 0, 0 ; items
	db 10 ; base reward
	dw AI_BASIC + AI_STATUS
	dw CONTEXT_USE + SWITCH_RARELY

; TrioBroR
	db 0, 0 ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES
	
; TrioBroB
	db 0, 0 ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES
	
; TrioBroY
	db 0, 0 ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES
	
;DisguiseMan
	db 0, 0 ; items
	db 20 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES
	
;BikiniP
	db 0, 0 ; items
	db 20 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES
	
;BikiniR
	db 0, 0 ; items
	db 20 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES
	
;BikiniY
	db 0, 0 ; items
	db 20 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES
	
;Delinquentm
	db 0, 0 ; items
	db 7 ; base reward
	dw AI_BASIC + AI_TYPES + AI_OPPORTUNIST + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES
	
;Delinquentf
	db 0, 0 ; items
	db 7 ; base reward
	dw AI_BASIC + AI_TYPES + AI_OPPORTUNIST + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES
	
;Bunearym
	db 0, 0 ; items
	db 10 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES
	
;Bunearyf
	db 0, 0 ; items
	db 10 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES
	
;Frankie
	db FULL_HEAL, SODA_POP ; items
	db 30 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_OPPORTUNIST + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES
	
;MallCop
	db 0, 0 ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP
	dw CONTEXT_USE
	
; Skater
	db 0, 0 ; items
	db 7 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES
	
; SpaTrainer
	db 0, 0 ; items
	db 5 ; base reward
	dw AI_BASIC + AI_TYPES + AI_STATUS
	dw CONTEXT_USE + SWITCH_RARELY
	
; SpaTrainerf
	db 0, 0 ; items
	db 5 ; base reward
	dw AI_BASIC + AI_TYPES + AI_STATUS
	dw CONTEXT_USE + SWITCH_RARELY
	
; AromaLady
	db 0, 0 ; items
	db 10 ; base reward
	dw AI_BASIC + AI_TYPES + AI_STATUS
	dw CONTEXT_USE + SWITCH_RARELY
	
; Tuber
	db 0, 0 ; items
	db 7 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_OFFENSIVE + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES
	
; BattleGirl
	db 0, 0 ; items
	db 6 ; base reward
	dw AI_BASIC + AI_TYPES + AI_OFFENSIVE + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES
	
; Dojo Master
	db 0, 0 ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SMART + AI_SETUP + AI_TYPES + AI_OPPORTUNIST + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES
	
; Rose
	db 0, 0 ; items
	db 10 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES
	dw CONTEXT_USE + SWITCH_SOMETIMES
	
; Lily
	db 0, 0 ; items
	db 10 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES
	dw CONTEXT_USE + SWITCH_SOMETIMES
	
; Iris
	db 0, 0 ; items
	db 10 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES
	dw CONTEXT_USE + SWITCH_SOMETIMES
	
; Poppy
	db 0, 0 ; items
	db 10 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES
	dw CONTEXT_USE + SWITCH_SOMETIMES
	
; Felicia
	db 0, 0 ; items
	db 10 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES
	dw CONTEXT_USE + SWITCH_SOMETIMES
	
; Violet
	db 0, 0 ; items
	db 10 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES
	dw CONTEXT_USE + SWITCH_SOMETIMES
	
; Clover
	db 0, 0 ; items
	db 10 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES
	dw CONTEXT_USE + SWITCH_SOMETIMES
	
; Erika
	db 0, 0 ; items
	db 15 ; base reward
	dw AI_BASIC + AI_SMART + AI_SETUP + AI_TYPES + AI_AGGRESSIVE + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES
	
; Mina
	db 0, 0 ; items
	db 15 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_OPPORTUNIST + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES
	
; Ledian Ranger
	db 0, 0 ; items
	db 15 ; base reward
	dw AI_BASIC + AI_SMART + AI_SETUP + AI_TYPES
	dw CONTEXT_USE
	
; Police Captain
	db FULL_RESTORE, FULL_RESTORE ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SMART + AI_SETUP + AI_TYPES + AI_OPPORTUNIST + AI_CAUTIOUS + AI_STATUS
	dw CONTEXT_USE
	
; Museum Guide
	db 0, 0 ; items
	db 20 ; base reward
	dw AI_BASIC + AI_OFFENSIVE + AI_CAUTIOUS + AI_STATUS
	dw CONTEXT_USE + SWITCH_RARELY
	
; Museum Guide 2
	db 0, 0 ; items
	db 20 ; base reward
	dw AI_BASIC + AI_OFFENSIVE + AI_CAUTIOUS + AI_STATUS
	dw CONTEXT_USE + SWITCH_RARELY
	
; TowerTycoon
	db FULL_HEAL, FULL_RESTORE ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_OPPORTUNIST + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; 39771
