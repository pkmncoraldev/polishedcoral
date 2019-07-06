trainerclass: MACRO
	enum \1
const_value = 1
ENDM

; trainer groups
	enum_start
CHRIS EQU __enum__
	trainerclass TRAINER_NONE ; 0
	const PHONECONTACT_MOM
	const PHONECONTACT_BIKESHOP
	const PHONECONTACT_BILL
	const PHONECONTACT_ELM
	const PHONECONTACT_LYRA
	const PHONECONTACT_BUENA

KRIS EQU __enum__

	trainerclass PLAYER_MALE

	trainerclass PLAYER_FEMALE
	
	trainerclass STANLEY

	trainerclass RODNEY

	trainerclass LEILANI

	trainerclass MORTY

	trainerclass CHUCK

	trainerclass JASMINE

	trainerclass PRYCE

	trainerclass CLAIR

	trainerclass WILL

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

	trainerclass YOUNGSTER


	trainerclass BUG_CATCHER


	trainerclass CAMPER


	trainerclass PICNICKER


	trainerclass TWINS


	trainerclass FISHER


	trainerclass BIRD_KEEPER


	trainerclass HIKER


	trainerclass GRUNTM


	trainerclass GRUNTF


	trainerclass POKEFANM


	trainerclass POKEFANF


	trainerclass OFFICERM


	trainerclass OFFICERF


	trainerclass NURSE


	trainerclass POKEMANIAC


	trainerclass SUPER_NERD


	trainerclass LASS


	trainerclass BEAUTY


	trainerclass FIREBREATHER


	trainerclass JUGGLER


	trainerclass SCHOOLBOY


	trainerclass SCHOOLGIRL


	trainerclass PSYCHIC_T


	trainerclass HEX_MANIAC


	trainerclass COUPLE


	trainerclass GENTLEMAN


	trainerclass RICH_BOY


	trainerclass LADY


	trainerclass SAILOR


	trainerclass SWIMMERM


	trainerclass SWIMMERF


	trainerclass BURGLAR


	trainerclass SCIENTIST


	trainerclass BOARDER


	trainerclass SKIER


	trainerclass BLACKBELT_T


	trainerclass BATTLE_GIRL


	trainerclass TEACHER


	trainerclass GUITARISTM


	trainerclass GUITARISTF


	trainerclass BIKER


	trainerclass CUE_BALL


	trainerclass COOLTRAINERM


	trainerclass COOLTRAINERF


	trainerclass PROF_SPRUCE


	trainerclass TEACHERFAST
	const KATE
	
	
	trainerclass TRIOBROR
	const TRIO_RED
	
	
	trainerclass TRIOBROB
	const TRIO_BLUE

	
	trainerclass TRIOBROY
	const TRIO_YELLOW

	
	trainerclass DISGUISEMAN
	const MASTER1

	
	trainerclass BIKINIP

	
	trainerclass BIKINIR

	
	trainerclass BIKINIY


	trainerclass DELINQUENT_M


	trainerclass DELINQUENT_F


	trainerclass SAFARI


	trainerclass TOWERTYCOON ; 1



NUM_TRAINER_CLASSES EQU __enum__
