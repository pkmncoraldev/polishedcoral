DEF BASEMON_BASE_STATS    EQUS "(BaseData + wBaseStats - wCurBaseData)"
DEF BASEMON_BASE_HP       EQUS "(BaseData + wBaseHP - wCurBaseData)"
DEF BASEMON_BASE_ATK      EQUS "(BaseData + wBaseAttack - wCurBaseData)"
DEF BASEMON_BASE_DEF      EQUS "(BaseData + wBaseDefense - wCurBaseData)"
DEF BASEMON_BASE_SPD      EQUS "(BaseData + wBaseSpeed - wCurBaseData)"
DEF BASEMON_BASE_SAT      EQUS "(BaseData + wBaseSpecialAttack - wCurBaseData)"
DEF BASEMON_BASE_SDF      EQUS "(BaseData + wBaseSpecialDefense - wCurBaseData)"
DEF BASEMON_TYPES         EQUS "(BaseData + wBaseType - wCurBaseData)"
DEF BASEMON_TYPE_1        EQUS "(BaseData + wBaseType1 - wCurBaseData)"
DEF BASEMON_TYPE_2        EQUS "(BaseData + wBaseType2 - wCurBaseData)"
DEF BASEMON_CATCH_RATE    EQUS "(BaseData + wBaseCatchRate - wCurBaseData)"
DEF BASEMON_BASE_EXP      EQUS "(BaseData + wBaseExp - wCurBaseData)"
DEF BASEMON_ITEMS         EQUS "(BaseData + wBaseItems - wCurBaseData)"
DEF BASEMON_ITEM_1        EQUS "(BaseData + wBaseItems - wCurBaseData)"
DEF BASEMON_ITEM_2        EQUS "(BaseData + wBaseItems + 1 - wCurBaseData)"
DEF BASEMON_GENDER        EQUS "(BaseData + wBaseGender - wCurBaseData)"
DEF BASEMON_EGG_STEPS     EQUS "(BaseData + wBaseEggSteps - wCurBaseData)"
DEF BASEMON_PIC_SIZE      EQUS "(BaseData + wBasePicSize - wCurBaseData)"
DEF BASEMON_ABILITIES     EQUS "(BaseData + wBaseAbility1 - wCurBaseData)"
DEF BASEMON_ABILITY_1     EQUS "(BaseData + wBaseAbility1 - wCurBaseData)"
DEF BASEMON_ABILITY_2     EQUS "(BaseData + wBaseAbility2 - wCurBaseData)"
DEF BASEMON_ABILITY_3     EQUS "(BaseData + wBaseHiddenAbility - wCurBaseData)"
DEF BASEMON_GROWTH_RATE   EQUS "(BaseData + wBaseGrowthRate - wCurBaseData)"
DEF BASEMON_EGG_GROUPS    EQUS "(BaseData + wBaseEggGroups - wCurBaseData)"
DEF BASEMON_EV_YIELD_1    EQUS "(BaseData + wBaseEVYield1 - wCurBaseData)"
DEF BASEMON_EV_YIELD_2    EQUS "(BaseData + wBaseEVYield2 - wCurBaseData)"
DEF BASEMON_TMHM          EQUS "(BaseData + wBaseTMHM - wCurBaseData)"
DEF BASEMON_STRUCT_LENGTH EQUS "(BaseData1 - BaseData0)"

; growth rate
	const_def
	const MEDIUM_FAST
	const MEDIUM_SLOW
	const FAST
	const SLOW

; gender ratios
	const_def
	const ALL_MALE
	const FEMALE_12_5
	const FEMALE_25
	const FEMALE_37_5
	const FEMALE_50
	const FEMALE_62_5
	const FEMALE_75
	const FEMALE_87_5
	const ALL_FEMALE

DEF GENDERLESS EQU %1111

; egg group constants
	const_def 1
	const MONSTER      ; 1
	const AMPHIBIAN    ; 2
	const INSECT       ; 3
	const AVIAN        ; 4
	const FIELD        ; 5
	const FAERY        ; 6
	const PLANT        ; 7
	const HUMANSHAPE   ; 8
	const INVERTEBRATE ; 9
	const INANIMATE    ; a
	const AMORPHOUS    ; b
	const FISH         ; c
	const LADIES_MAN   ; d
	const REPTILE      ; e
	const NO_EGGS      ; f


; pokemon structure in RAM
DEF MON_SPECIES              EQUS "(wPartyMon1Species - wPartyMon1)"
DEF MON_ITEM                 EQUS "(wPartyMon1Item - wPartyMon1)"
DEF MON_MOVES                EQUS "(wPartyMon1Moves - wPartyMon1)"
DEF MON_ID                   EQUS "(wPartyMon1ID - wPartyMon1)"
DEF MON_EXP                  EQUS "(wPartyMon1Exp - wPartyMon1)"
DEF MON_EVS                  EQUS "(wPartyMon1EVs - wPartyMon1)"
DEF MON_HP_EV                EQUS "(wPartyMon1HPEV - wPartyMon1)"
DEF MON_ATK_EV               EQUS "(wPartyMon1AtkEV - wPartyMon1)"
DEF MON_DEF_EV               EQUS "(wPartyMon1DefEV - wPartyMon1)"
DEF MON_SPD_EV               EQUS "(wPartyMon1SpdEV - wPartyMon1)"
DEF MON_SAT_EV               EQUS "(wPartyMon1SatEV - wPartyMon1)"
DEF MON_SDF_EV               EQUS "(wPartyMon1SdfEV - wPartyMon1)"
DEF MON_DVS                  EQUS "(wPartyMon1DVs - wPartyMon1)"
DEF MON_PERSONALITY          EQUS "(wPartyMon1Personality - wPartyMon1)"
DEF MON_SHINY                EQUS "(wPartyMon1Shiny - wPartyMon1)"
DEF MON_ABILITY              EQUS "(wPartyMon1Ability - wPartyMon1)"
DEF MON_NATURE               EQUS "(wPartyMon1Nature - wPartyMon1)"
DEF MON_GENDER               EQUS "(wPartyMon1Gender - wPartyMon1)"
DEF MON_IS_EGG               EQUS "(wPartyMon1IsEgg - wPartyMon1)"
DEF MON_IS_DEAD              EQUS "(wPartyMon1IsDead - wPartyMon1)"
DEF MON_FORM                 EQUS "(wPartyMon1Form - wPartyMon1)"
DEF MON_PP                   EQUS "(wPartyMon1PP - wPartyMon1)"
DEF MON_HAPPINESS            EQUS "(wPartyMon1Happiness - wPartyMon1)"
DEF MON_MULTIMOVES           EQUS "(wPartyMon1MultiMoves - wPartyMon1)"
DEF MON_CAUGHTDATA           EQUS "(wPartyMon1CaughtData - wPartyMon1)"
DEF MON_CAUGHTGENDER         EQUS "(wPartyMon1CaughtGender - wPartyMon1)"
DEF MON_CAUGHTTIME           EQUS "(wPartyMon1CaughtTime - wPartyMon1)"
DEF MON_CAUGHTBALL           EQUS "(wPartyMon1CaughtBall - wPartyMon1)"
DEF MON_CAUGHTLEVEL          EQUS "(wPartyMon1CaughtLevel - wPartyMon1)"
DEF MON_CAUGHTLOCATION       EQUS "(wPartyMon1CaughtLocation - wPartyMon1)"
DEF MON_LEVEL                EQUS "(wPartyMon1Level - wPartyMon1)"
DEF MON_STATUS               EQUS "(wPartyMon1Status - wPartyMon1)"
DEF MON_HP                   EQUS "(wPartyMon1HP - wPartyMon1)"
DEF MON_MAXHP                EQUS "(wPartyMon1MaxHP - wPartyMon1)"
DEF MON_STATS                EQUS "(wPartyMon1Stats - wPartyMon1)"
DEF MON_ATK                  EQUS "(wPartyMon1Attack - wPartyMon1)"
DEF MON_DEF                  EQUS "(wPartyMon1Defense - wPartyMon1)"
DEF MON_SPD                  EQUS "(wPartyMon1Speed - wPartyMon1)"
DEF MON_SAT                  EQUS "(wPartyMon1SpclAtk - wPartyMon1)"
DEF MON_SDF                  EQUS "(wPartyMon1SpclDef - wPartyMon1)"
DEF BOXMON_STRUCT_LENGTH     EQUS "(wPartyMon1End - wPartyMon1)"
DEF PARTYMON_STRUCT_LENGTH   EQUS "(wPartyMon1StatsEnd - wPartyMon1)"

; apply to MON_FORM
DEF SHINY_MASK   EQU %10000000
DEF ABILITY_MASK EQU %01100000
DEF NATURE_MASK  EQU %00011111
DEF GENDER_MASK  EQU %10000000
DEF IS_EGG_MASK  EQU %01000000
DEF IS_DEAD_MASK EQU %00100000
DEF FORM_MASK    EQU %00011111

DEF MON_SHINY_F  EQU 7
DEF MON_GENDER_F EQU 7
DEF MON_IS_EGG_F EQU 6

; apply to MON_CAUGHTDATA
DEF CAUGHTGENDER_MASK EQU %10000000
DEF CAUGHTTIME_MASK   EQU %01100000
DEF CAUGHTBALL_MASK   EQU %00011111

; gender values
DEF MALE   EQU %00000000
DEF FEMALE EQU %10000000

DEF BATTLEMON_STRUCT_LENGTH EQUS "(wBattleMonStructEnd - wBattleMonSpecies)"


; evolution types
	const_def 1
	const EVOLVE_LEVEL
	const EVOLVE_ITEM
	const EVOLVE_HOLDING
	const EVOLVE_HAPPINESS
	const EVOLVE_STAT
	const EVOLVE_LOCATION
	const EVOLVE_MOVE
	const EVOLVE_EVS
	const EVOLVE_TRADE
	const EVOLVE_ITEM_MALE
	const EVOLVE_ITEM_FEMALE
	const EVOLVE_CUBONE
	const EVOLVE_HOLDING_DAY
	const EVOLVE_HOLDING_NITE
	const EVOLVE_LOCATION_SPECIFIC

; happiness evolution triggers
DEF HAPPINESS_TO_EVOLVE EQU 220
	const_def 1
	const TR_ANYTIME
	const TR_MORNDAY
	const TR_NITE

DEF EVS_TO_EVOLVE EQU 50

; stat evolution triggers
	const_def 1
	const ATK_GT_DEF
	const ATK_LT_DEF
	const ATK_EQ_DEF


DEF PARTY_LENGTH EQU 6

; boxes
DEF MONS_PER_BOX EQU 20
DEF NUM_BOXES    EQU 14

; hall of fame
DEF HOF_MON_LENGTH = 1 + 2 + 2 + 1 + (PKMN_NAME_LENGTH +- 1) ; species, id, dvs, level, nick
DEF HOF_LENGTH = 1 + HOF_MON_LENGTH * PARTY_LENGTH + 1 ; win count, party, terminator
DEF NUM_HOF_TEAMS = 30


DEF NUM_GRASSMON EQU 7
DEF NUM_WATERMON EQU 7

DEF GRASS_WILDDATA_LENGTH EQU (NUM_GRASSMON * 2 + 1) * 3 + 2
DEF WATER_WILDDATA_LENGTH EQU (NUM_WATERMON * 2 + 1) * 1 + 2


DEF BASE_HAPPINESS        EQU 70
DEF FRIEND_BALL_HAPPINESS EQU 200
