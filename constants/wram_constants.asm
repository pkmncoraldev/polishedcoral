; wMonType: ; cf5f
PARTYMON   EQU 0
OTPARTYMON EQU 1
BOXMON     EQU 2
BREEDMON   EQU 3
WILDMON    EQU 4

; Text box flags
; TODO: add the other bits used
NO_LINE_SPACING EQU 2

; wOptions1: text speed
INST_TEXT      EQU $0
FAST_TEXT      EQU $1
MED_TEXT       EQU $2
SLOW_TEXT      EQU $3

; wOptions1: text autoscroll.
; CheckAutoscroll relies on exact bit usage and order
AUTOSCROLL_MASK  EQU %1100
AUTOSCROLL_NONE  EQU %0000
AUTOSCROLL_START EQU %0100
AUTOSCROLL_AANDB EQU %1000
AUTOSCROLL_AORB  EQU %1100

; bits
AUTOSCROLL_ABF EQU 3
DEBUG_MODE	   EQU 4
TURNING_SPEED  EQU 4
NO_TEXT_SCROLL EQU 5
STEREO         EQU 6
BATTLE_EFFECTS EQU 7

; wOptions2:
FONT_MASK      EQU %00000111
NORMAL_FONT    EQU %000
NARROW_FONT    EQU %001
BOLD_FONT      EQU %010
ITALIC_FONT    EQU %011
SERIF_FONT     EQU %100
UNOWN_FONT     EQU %101
; bits
RUNNING_SHOES  EQU 3
CLOCK_FORMAT   EQU 4
POKEDEX_UNITS  EQU 5
BATTLE_SWITCH  EQU 6
BATTLE_PREDICT EQU 7

; wInitialOptions:
NATURES_OPT      EQU 0
ABILITIES_OPT    EQU 1
COLOR_VARY_OPT   EQU 2
PERFECT_IVS_OPT  EQU 3
TRADED_AS_OT_OPT EQU 4
NUZLOCKE_MODE    EQU 5
RESET_INIT_OPTS  EQU 7
ABILITIES_OPTMASK EQU %00000010

; wForgettingMove
FORGETTING_MOVE_F EQU 7
LEARNING_TM_F     EQU 6
FORGETTING_MOVE   EQU 1 << FORGETTING_MOVE_F
LEARNING_TM       EQU 1 << LEARNING_TM_F

; wWalkingDirection: ; d043
STANDING EQU -1
DOWN     EQU 0
UP       EQU 1
LEFT     EQU 2
RIGHT    EQU 3

; wFacingDirection: ; d044
FACE_CURRENT EQU 0
FACE_DOWN  EQU 8
FACE_UP    EQU 4
FACE_LEFT  EQU 2
FACE_RIGHT EQU 1

; wTimeOfDay: ; d269
MORN     EQU 0
DAY      EQU 1
NITE     EQU 2
DUSK EQU 3

; wScriptFlags: ; d434
SCRIPT_RUNNING EQU 2

; wScriptMode: ; d437
SCRIPT_OFF EQU 0
SCRIPT_READ EQU 1
SCRIPT_WAIT_MOVEMENT EQU 2
SCRIPT_WAIT EQU 3

; wCurDay: ; d4cb
SUNDAY    EQU 0
MONDAY    EQU 1
TUESDAY   EQU 2
WEDNESDAY EQU 3
THURSDAY  EQU 4
FRIDAY    EQU 5
SATURDAY  EQU 6

; wMapObjects: ; d71e
PLAYER_OBJECT EQU 0
NUM_OBJECTS EQU $15

; wInputType: ; c2c7
AUTO_INPUT EQU $ff

; wOWState
OWSTATE_STRENGTH        EQU 0
OWSTATE_BIKING_FORCED   EQU 1
OWSTATE_BIKING_DOWNHILL EQU 2
OWSTATE_SURF            EQU 3
OWSTATE_ROCK_SMASH      EQU 4
OWSTATE_HEADBUTT        EQU 5
OWSTATE_WHIRLPOOL       EQU 6
OWSTATE_WATERFALL       EQU 7
OWSTATE_CUT             EQU 8
OWSTATE_BIKE_GEAR       EQU 9
OWSTATE_ROCK_CLIMB      EQU 10

; wPlayerState: ; d95d
PLAYER_NORMAL    EQU 0
PLAYER_BIKE      EQU 1
PLAYER_SLIP      EQU 2
PLAYER_SURF      EQU 3
PLAYER_DIVE	 EQU 4
PLAYER_RUN       EQU 5
PLAYER_SURF_LAVA EQU 6
PLAYER_DODRIO	 EQU 7
PLAYER_SITTING	 EQU 8
PLAYER_SKATEBOARD	EQU 9
PLAYER_SKATEBOARD_MOVING	EQU 10
PLAYER_SKATEBOARD_GRINDING	EQU 11
PLAYER_FALLING	EQU 12
PLAYER_BATHING	EQU 13
PLAYER_CLOWN	EQU 14
PLAYER_SAND		EQU 15
PLAYER_SCIENTIST	EQU 16
PLAYER_COLBY	EQU 17
PLAYER_INVISIBLE EQU 18
PLAYER_PHOTO_1 EQU 19
PLAYER_PHOTO_2 EQU 20
PLAYER_PHOTO_3 EQU 21
PLAYER_PHOTO_4 EQU 22
PLAYER_SNARE EQU 23

OBJECT_STRUCT_LENGTH EQU 33
NUM_OBJECT_STRUCTS EQU 13
FIRST_VRAM1_OBJECT_STRUCT EQU 8

; After-Champion Spawn
SPAWN_LANCE EQU 1
SPAWN_LEAF EQU 2

; wPokemonWithdrawDepositParameter
PC_WITHDRAW EQU 0
PC_DEPOSIT EQU 1
DAYCARE_WITHDRAW EQU 2
DAYCARE_DEPOSIT EQU 3

; wPalFadeMode
PALFADE_WHICH       EQU %11
PALFADE_FLASH_F     EQU 2
PALFADE_PARTIAL_F   EQU 3
PALFADE_SKIP_LAST_F EQU 4

PALFADE_BOTH      EQU %00
PALFADE_BG        EQU %01
PALFADE_OBJ       EQU %10
PALFADE_FLASH     EQU 1 << PALFADE_FLASH_F
PALFADE_PARTIAL   EQU 1 << PALFADE_PARTIAL_F
PALFADE_SKIP_LAST EQU 1 << PALFADE_SKIP_LAST_F

; wCurrentDexMode
	const_def
	const DEXMODE_NEW
	const DEXMODE_OLD
	const DEXMODE_ABC
	const DEXMODE_UNOWN

; wHiddenGrottoContents
	const_def
	const GROTTO_UNDEFINED
	const GROTTO_POKEMON
	const GROTTO_ITEM
	const GROTTO_HIDDEN_ITEM
	const GROTTO_EMPTY

	const_def
	const FIRSTBADGE
	const SECONDBADGE
	const THIRDBADGE
	const FOURTHBADGE
	const FIFTHBADGE
	const SIXTHBADGE
	const SEVENTHBADGE
	const EIGHTHBADGE
NUM_ONWA_BADGES EQU const_value
NUM_BADGES EQU NUM_ONWA_BADGES

	const_def
	const GOT_ROCK_SMASH
	const GOT_CUT
	const GOT_FLY
	const GOT_ROCK_CLIMB
	const GOT_SURF
	const GOT_DIVE
	const GOT_STRENGTH
NUM_GOT_HM_FLAGS EQU const_value

	const_def
	const MET_STANLEY
	const MET_RODNEY
	const MET_WENDY
	const MET_CHARLIE
	const MET_POLLY
	const JASMINE_JOURNAL ; Olivine Pokémon Center
	const PRYCE_JOURNAL ; Mahogany Pokémon Center
	const CLAIR_JOURNAL ; Blackthorn Pokémon Center
NUM_GYM_LEADERS_MET EQU const_value

	const_def
	const PUNKS_IN_STARGLOW
	const PUNKS_ON_SUNBEAM
	const PUNKS_ON_TRAIN
NUM_SNARE_FLAGS EQU const_value
