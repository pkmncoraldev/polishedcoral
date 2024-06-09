trainerclass: MACRO
	enum \1
const_value = 1
ENDM

; trainer groups
	enum_start
PLAYER_M EQU __enum__
	trainerclass TRAINER_NONE ; 0
	const PHONECONTACT_MOM
	const PHONECONTACT_SPRUCE
	const PHONECONTACT_WENDY
	const PHONECONTACT_AUTO

PLAYER_F EQU __enum__

	trainerclass PLAYER_CORY

	trainerclass PLAYER_CORA
	
	trainerclass PLAYER_PIPPI
	
	trainerclass PLAYER_RED
	
	trainerclass PLAYER_LEAF
	
	trainerclass PLAYER_GOLD
	
	trainerclass PLAYER_KRIS
	
	trainerclass STANLEY

	trainerclass RODNEY

	trainerclass WENDY

	trainerclass CHARLIE

	trainerclass POLLY

	trainerclass LEILANI

	trainerclass PRYCE

	trainerclass CLAIR

	trainerclass WILL_OLD

	trainerclass KOGA

	trainerclass BRUNO

	trainerclass KAREN

	trainerclass CHAMPION

	trainerclass RIVAL
	const RIVAL1_1
	const RIVAL1_2
	const RIVAL1_3
	const RIVAL1_4
	const RIVAL1_5
	const RIVAL1_6
	const RIVAL2_1
	const RIVAL2_2
	const RIVAL2_3
	const RIVAL2_4
	const RIVAL2_5
	const RIVAL2_6
	const RIVAL3_1
	const RIVAL3_2
	const RIVAL3_3
	const RIVAL3_4
	const RIVAL3_5
	const RIVAL3_6
	const RIVAL4_1
	const RIVAL4_2
	const RIVAL4_3
	const RIVAL4_4
	const RIVAL4_5
	const RIVAL4_6
	
	trainerclass RIVAL_S
	const RIVAL_S_1_1
	const RIVAL_S_1_2
	const RIVAL_S_1_3
	const RIVAL_S_1_4
	const RIVAL_S_1_5
	const RIVAL_S_1_6

	trainerclass YOUNGSTER
	const JOEY
	const BILLY
	const CHRIS
	const TOMMY
	const JIMMY
	const KYLE

	trainerclass BUG_CATCHER
	const BARNEY
	const JOSH
	const ARNOLD
	const DANNY
	const TURK
	const JOEL

	trainerclass CAMPER
	const BART
	const DENNY
	const TREVOR
	const VINCENT
	const DANTE
	const JERRY

	trainerclass PICNICKER
	const MOLLY
	const ERIN
	const TRISTA
	const SHAUNA
	const BETH
	const TINA
	const LES
	const BAILEY

	trainerclass TWINS
	const JENJAN
	const JANJEN
	const TIAMIA
	const MIATIA


	trainerclass FISHER
	const DAVE
	const GERALD_2
	const GERALD_3
	const GERALD_4
	const GERALD_5
	const GERALD_6
	const GERALD_7
	const GERALD_8
	const WALTER_2
	const WALTER_3
	const WALTER_4
	const WALTER_5
	const WALTER_6
	const WALTER_7
	const WALTER_8
	const BORRIS_2
	const BORRIS_3
	const BORRIS_4
	const BORRIS_5
	const BORRIS_6
	const BORRIS_7
	const BORRIS_8
	const CLINT_2
	const CLINT_3
	const CLINT_4
	const CLINT_5
	const CLINT_6
	const CLINT_7
	const CLINT_8
	const HOMER
	const HUE
	const DARREN
	const LESLIE
	const DICK
	const ROBBY
	const ERIC
	const HARRELSON
	const MIKE


	trainerclass BIRD_KEEPER
	const TED
	const BRYANT
	const TODD
	const RANDY
	const JAZZ
	const RICKY_3
	const RICKY_4
	const RICKY_5
	const RICKY_6
	const RICKY_7
	const RICKY_8
	const VERN_3
	const VERN_4
	const VERN_5
	const VERN_6
	const VERN_7
	const VERN_8
	const ROY_3
	const ROY_4
	const ROY_5
	const ROY_6
	const ROY_7
	const ROY_8
	const CHANCE_3
	const CHANCE_4
	const CHANCE_5
	const CHANCE_6
	const CHANCE_7
	const CHANCE_8
	const CALEB_3
	const CALEB_4
	const CALEB_5
	const CALEB_6
	const CALEB_7
	const CALEB_8
	const SIDNEY


	trainerclass HIKER
	const DOUG
	const WILL
	const ROB
	const BENJAMIN
	const LANDON
	const SIMON
	const STEVEN
	const GILL
	const HARVEY
	const LEROY
	const DARRYL
	const HENRY
	

	trainerclass GRUNTM
	const STARGLOW_GRUNTM_1
	const STARGLOW_GRUNTM_2
	const STARGLOW_GRUNTM_3
	const SUNBEAM_GRUNTM_1
	const SUNBEAM_GRUNTM_2
	const SUNBEAM_GRUNTM_3
	const SUNBEAM_GRUNTM_4
	const TRAIN_GRUNTM_1
	const TRAIN_GRUNTM_2
	const TRAIN_GRUNTM_3
	const TRAIN_GRUNTM_4
	const TRAIN_GRUNTM_5
	const LUSTER_GRUNTM


	trainerclass GRUNTF
	const STARGLOW_GRUNTF_1
	const SUNBEAM_GRUNTF_1
	const SUNBEAM_GRUNTF_2
	const TRAIN_GRUNTF_1
	const TRAIN_GRUNTF_2


	trainerclass KAGE
	const SUNBEAM_KAGE
	
	
	trainerclass LOCKE
	const TRAIN_LOCKE

	
	trainerclass POKEFANM
	const RON
	const SID
	const REG
	const RICK
	

	trainerclass POKEFANF
	const SUSAN
	const JILL
	const NICHOLE
	const URSALA
	const YVONNE


	trainerclass OFFICER
	const SANCHEZ
	const HARTWELL


	trainerclass POKEMANIAC
	const PAUL
	const DEREK
	const CARLOS
	const TRISTEN
	const SIMION
	const THOMAS


	trainerclass SUPER_NERD
	const CHESTER
	const PEDRO
	const REMY
	const GREG
	const MARIO


	trainerclass LASS
	const LIBBY
	const VERONICA
	const CHARLOTTE
	const JUNE
	const MELANIE
	const SARAH
	const MARSHA
	const KATHY_5
	const KATHY_6
	const KATHY_7
	const KATHY_8
	const HARLEY_5
	const HARLEY_6
	const HARLEY_7
	const HARLEY_8
	const LENA


	trainerclass BEAUTY
	const BRITNEY
	const SANDRA
	const CLAIRE_5
	const CLAIRE_6
	const CLAIRE_7
	const CLAIRE_8
	const SAM_5
	const SAM_6
	const SAM_7
	const SAM_8
	const MANDY
	const TRIXIE


	trainerclass FIREBREATHER
	const MORT
	const FRITZ
	const MEL
	const DOM
	const JOB
	const WIZ
	const GARTH
	const ART
	const TEX


	trainerclass JUGGLER
	const ERNIE
	const WILLY
	const QUINN
	const RYAN
	const RONNIE


	trainerclass SCHOOLBOY
	const TIMMY_1
	const TIMMY_2
	const TIMMY_3
	const TIMMY_4
	const TIMMY_5
	const TIMMY_6
	const TIMMY_7
	const TIMMY_8
	const DAMIAN_1
	const DAMIAN_2
	const DAMIAN_3
	const DAMIAN_4
	const DAMIAN_5
	const DAMIAN_6
	const DAMIAN_7
	const DAMIAN_8
	const FREDDY
	const FLYNN


	trainerclass PSYCHIC_T
	const RALPH
	const NELSON
	const DAVID
	const LINUS


	trainerclass COUPLE
	const JDMEG


	trainerclass GENTLEMAN
	const DURWOOD
	const HOWARD
	const ELWARD
	const VICTOR


	trainerclass LADY
	const RUTH
	const GRETCHEN
	const LYDIA


	trainerclass SAILOR
	const RANDALL
	const SHAWN
	const SCOTT
	const PETEY


	trainerclass SWIMMERM
	const MARK
	const PABLO
	const GARY
	const DEVIN
	const IAN
	const DEON
	const RICH
	const DAVY


	trainerclass SWIMMERF
	const BECKY
	const SHAE
	const PEGGY
	const RACHEL
	const ROSA
	const CONNIE
	const MARIA
	const GISELE
	const SHANNON


	trainerclass BURGLAR
	const ZEDAKI
	const CHASE
	const JULIAN


	trainerclass SCIENTIST


	trainerclass BOARDER
	const TOBY
	const FRANK
	const JOSE
	const PETER
	const GLENN
	const GEORGE


	trainerclass SKIER
	const DEBBIE
	const RHONDA
	const KIM
	const SHERRY
	const LEXI


	trainerclass BLACKBELT_T
	const HIRO
	const NAKA
	const TOSHI
	const ZERO
	const SHINZO
	const KIYO
	const YUJI


	trainerclass TEACHER


	trainerclass GUITARIST
	const LARRY
	const TITO
	const VINNY


	trainerclass BIKER
	const HANK
	const GARRET
	const DALE
	const REX
	const JAMES
	const HERB
	const SHINTO


	trainerclass CUEBALL
	const CURLY
	const BONGO
	const BUBBA
	const DESMOND


	trainerclass COOLTRAINERM
	const CODY
	const SAMMY
	const ANDY
	const TRIPP


	trainerclass COOLTRAINERF
	const CASEY
	const SALLY
	const JULES
	const MARY
	const JANE
	const LOIS


	trainerclass PROF_SPRUCE


	trainerclass TEACHERFAST
	const KATE
	
	
	trainerclass TRIOBROR
	const TRIO_RED
	
	
	trainerclass TRIOBROB
	const TRIO_BLUE

	
	trainerclass TRIOBROY
	const TRIO_YELLOW

	
	trainerclass DISGUISE
	const MASTER_1
	const MASTER_2
	const MASTER_3
	const MASTER_4
	const MASTER_5

	
	trainerclass BIKINIBR

	
	trainerclass BIKINIBL

	
	trainerclass BIKINIP


	trainerclass DELINQUENT_M
	const SPIKE
	const IGGY
	const MAO


	trainerclass DELINQUENT_F
	const HELGA
	const MERTLE
	const REGINA
	const LIZ_5
	const LIZ_6
	const LIZ_7
	const LIZ_8
	const MEGAN_5
	const MEGAN_6
	const MEGAN_7
	const MEGAN_8
	
	trainerclass BUNEARY_M
	const BOY_1
	const BOY_2
	const BOY_3
	const BOY_4
	const BOY_5


	trainerclass BUNEARY_F
	const GAL_1
	const GAL_2
	
	trainerclass FRANKIE
	
	trainerclass MALL_COP
	const PHIL
	
	trainerclass SKATER
	const TONY
	const CHAD
	
	trainerclass SPA_TRAINER
	const DENNIS_3
	const DENNIS_4
	const DENNIS_5
	const DENNIS_6
	const DENNIS_7
	const DENNIS_8
	const SHAYMUS_3
	const SHAYMUS_4
	const SHAYMUS_5
	const SHAYMUS_6
	const SHAYMUS_7
	const SHAYMUS_8
	const CHUCK_3
	const CHUCK_4
	const CHUCK_5
	const CHUCK_6
	const CHUCK_7
	const CHUCK_8
	const SEYMOUR_3
	const SEYMOUR_4
	const SEYMOUR_5
	const SEYMOUR_6
	const SEYMOUR_7
	const SEYMOUR_8
	const MAC_3
	const MAC_4
	const MAC_5
	const MAC_6
	const MAC_7
	const MAC_8
	
	trainerclass SPA_TRAINER_F
	const LAURA_3
	const LAURA_4
	const LAURA_5
	const LAURA_6
	const LAURA_7
	const LAURA_8
	const BETTY_3
	const BETTY_4
	const BETTY_5
	const BETTY_6
	const BETTY_7
	const BETTY_8
	
	trainerclass AROMA_LADY
	const LINDA
	const MARTHA
	const TAYLOR
	const CAROL
	const AMBER
	const JODI
	
	trainerclass TUBER
	const SAMANTHA
	const BEBE
	const KERRI
	const SOFIE
	
	trainerclass SHAOLIN
	const KIMIKO
	const SAYORI
	const MAI
	const SHOO
	
	trainerclass DOJO_MASTER
	
	trainerclass ROSE
	
	trainerclass LILY
	
	trainerclass IRIS
	
	trainerclass POPPY
	
	trainerclass FELICIA
	
	trainerclass VIOLET
	
	trainerclass CLOVER
	
	trainerclass ERIKA
	
	trainerclass MINA
	
	trainerclass LEDIAN_RANGER

	trainerclass TOWERTYCOON ; 1



NUM_TRAINER_CLASSES EQU __enum__
