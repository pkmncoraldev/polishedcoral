sprite_movement_data: macro
	db \1, \2, \3, \4, \5
	dn \6, 0
endm

SpriteMovementData::
	; function,                                              facing, action,                        	flags1, flags2, palette flags
	sprite_movement_data SPRITEMOVEFN_00,                    DOWN,   PERSON_ACTION_STAND,           	$02,    $00,    %0000 ; SPRITEMOVEDATA_00
	sprite_movement_data SPRITEMOVEFN_STANDING,              DOWN,   PERSON_ACTION_STAND,           	$0c,    $00,    %0000 ; SPRITEMOVEDATA_DOLL
	sprite_movement_data SPRITEMOVEFN_RANDOM_WALK_XY,        DOWN,   PERSON_ACTION_STAND,           	$00,    $00,    %0000 ; SPRITEMOVEDATA_WANDER
	sprite_movement_data SPRITEMOVEFN_SLOW_RANDOM_SPIN,      DOWN,   PERSON_ACTION_STAND,           	$00,    $00,    %0000 ; SPRITEMOVEDATA_SPINRANDOM_SLOW
	sprite_movement_data SPRITEMOVEFN_RANDOM_WALK_Y,         DOWN,   PERSON_ACTION_STAND,           	$00,    $00,    %0000 ; SPRITEMOVEDATA_WALK_UP_DOWN
	sprite_movement_data SPRITEMOVEFN_RANDOM_WALK_X,         DOWN,   PERSON_ACTION_STAND,           	$00,    $00,    %0000 ; SPRITEMOVEDATA_WALK_LEFT_RIGHT
	sprite_movement_data SPRITEMOVEFN_STANDING,              DOWN,   PERSON_ACTION_STAND,           	$00,    $00,    %0000 ; SPRITEMOVEDATA_STANDING_DOWN
	sprite_movement_data SPRITEMOVEFN_STANDING,              UP,     PERSON_ACTION_STAND,           	$00,    $00,    %0000 ; SPRITEMOVEDATA_STANDING_UP
	sprite_movement_data SPRITEMOVEFN_STANDING,              LEFT,   PERSON_ACTION_STAND,           	$00,    $00,    %0000 ; SPRITEMOVEDATA_STANDING_LEFT
	sprite_movement_data SPRITEMOVEFN_STANDING,              RIGHT,  PERSON_ACTION_STAND,           	$00,    $00,    %0000 ; SPRITEMOVEDATA_STANDING_RIGHT
	sprite_movement_data SPRITEMOVEFN_FAST_RANDOM_SPIN,      DOWN,   PERSON_ACTION_STAND,           	$00,    $00,    %0000 ; SPRITEMOVEDATA_SPINRANDOM_FAST
	sprite_movement_data SPRITEMOVEFN_OBEY_DPAD,             DOWN,   PERSON_ACTION_STAND,           	$02,    $00,    %0000 ; SPRITEMOVEDATA_PLAYER
	sprite_movement_data SPRITEMOVEFN_CUT_TREE,              DOWN,   PERSON_ACTION_CUT_TREE,        	$0c,    $00,    %0000 ; SPRITEMOVEDATA_CUTTABLE_TREE
	sprite_movement_data SPRITEMOVEFN_FOLLOW,                DOWN,   PERSON_ACTION_STAND,           	$02,    $00,    %0000 ; SPRITEMOVEDATA_FOLLOWING
	sprite_movement_data SPRITEMOVEFN_SCRIPTED,              DOWN,   PERSON_ACTION_STAND,           	$02,    $00,    %0000 ; SPRITEMOVEDATA_SCRIPTED
	sprite_movement_data SPRITEMOVEFN_BIG_SNORLAX,           DOWN,   PERSON_ACTION_BIG_SNORLAX,     	$2e,    $01,    %1100 ; SPRITEMOVEDATA_SNORLAX
	sprite_movement_data SPRITEMOVEFN_BOUNCE,                DOWN,   PERSON_ACTION_BOUNCE,          	$2e,    $00,    %0000 ; SPRITEMOVEDATA_POKEMON
	sprite_movement_data SPRITEMOVEFN_STANDING,              DOWN,   PERSON_ACTION_STAND,           	$0c,    $00,    %0000 ; SPRITEMOVEDATA_SUDOWOODO
	sprite_movement_data SPRITEMOVEFN_STANDING,              UP,     PERSON_ACTION_STAND,           	$2e,    $10,    %0000 ; SPRITEMOVEDATA_SMASHABLE_ROCK
	sprite_movement_data SPRITEMOVEFN_STRENGTH,              DOWN,   PERSON_ACTION_STAND,           	$2e,    $00,    %0100 ; SPRITEMOVEDATA_STRENGTH_BOULDER
	sprite_movement_data SPRITEMOVEFN_FOLLOWNOTEXACT,        DOWN,   PERSON_ACTION_STAND,           	$02,    $00,    %0000 ; SPRITEMOVEDATA_FOLLOWNOTEXACT
	sprite_movement_data SPRITEMOVEFN_SHADOW,                DOWN,   PERSON_ACTION_00,              	$8e,    $01,    %0000 ; SPRITEMOVEDATA_SHADOW
	sprite_movement_data SPRITEMOVEFN_EMOTE,                 DOWN,   PERSON_ACTION_EMOTE,           	$8e,    $02,    %0000 ; SPRITEMOVEDATA_EMOTE
	sprite_movement_data SPRITEMOVEFN_SCREENSHAKE,           DOWN,   PERSON_ACTION_00,              	$82,    $00,    %0000 ; SPRITEMOVEDATA_SCREENSHAKE
	sprite_movement_data SPRITEMOVEFN_SPIN_COUNTERCLOCKWISE, LEFT,   PERSON_ACTION_STAND,           	$00,    $00,    %0000 ; SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE
	sprite_movement_data SPRITEMOVEFN_SPIN_CLOCKWISE,        RIGHT,  PERSON_ACTION_STAND,           	$00,    $00,    %0000 ; SPRITEMOVEDATA_SPINCLOCKWISE
	sprite_movement_data SPRITEMOVEFN_STRENGTH,              DOWN,   PERSON_ACTION_BIG_DOLL,        	$2e,    $01,    %1100 ; SPRITEMOVEDATA_BIGDOLL
	sprite_movement_data SPRITEMOVEFN_BOULDERDUST,           DOWN,   PERSON_ACTION_BOULDER_DUST,    	$8e,    $01,    %0000 ; SPRITEMOVEDATA_BOULDERDUST
	sprite_movement_data SPRITEMOVEFN_GRASS,                 DOWN,   PERSON_ACTION_GRASS_SHAKE,     	$8e,    $02,    %0000 ; SPRITEMOVEDATA_GRASS
	sprite_movement_data SPRITEMOVEFN_PUDDLE,                DOWN,   PERSON_ACTION_PUDDLE_SPLASH,   	$8e,    $02,    %0000 ; SPRITEMOVEDATA_PUDDLE
	sprite_movement_data SPRITEMOVEFN_RANDOM_WALK_XY,        DOWN,   PERSON_ACTION_STAND,           	$00,    $00,    %0010 ; SPRITEMOVEDATA_SWIM_AROUND
	sprite_movement_data SPRITEMOVEFN_RANDOM_WALK_Y,         DOWN,   PERSON_ACTION_STAND,           	$00,    $00,    %0010 ; SPRITEMOVEDATA_SWIM_UP_DOWN
	sprite_movement_data SPRITEMOVEFN_RANDOM_WALK_X,         DOWN,   PERSON_ACTION_STAND,           	$00,    $00,    %0010 ; SPRITEMOVEDATA_SWIM_LEFT_RIGHT
	sprite_movement_data SPRITEMOVEFN_BIG_GYARADOS,          DOWN,   PERSON_ACTION_BIG_GYARADOS,    	$2e,    $01,    %1100 ; SPRITEMOVEDATA_BIG_GYARADOS
	sprite_movement_data SPRITEMOVEFN_STANDING_FLIP,         DOWN,   PERSON_ACTION_STAND_FLIP,      	$00,    $00,    %0000 ; SPRITEMOVEDATA_STANDING_DOWN_FLIP
	sprite_movement_data SPRITEMOVEFN_STANDING_FLIP,         UP,     PERSON_ACTION_STAND_FLIP,      	$00,    $00,    %0000 ; SPRITEMOVEDATA_STANDING_UP_FLIP
	sprite_movement_data SPRITEMOVEFN_TILE_DOWN,         	 DOWN,   PERSON_ACTION_TILE_DOWN,   		$7c,    $00,    %0000 ; SPRITEMOVEDATA_TILE_DOWN
	sprite_movement_data SPRITEMOVEFN_TILE_UP,         		 UP,  	 PERSON_ACTION_TILE_UP,   			$7c,    $00,    %0000 ; SPRITEMOVEDATA_TILE_UP
	sprite_movement_data SPRITEMOVEFN_TILE_LEFT,         	 LEFT,   PERSON_ACTION_TILE_LEFT,   		$7c,    $00,    %0000 ; SPRITEMOVEDATA_TILE_LEFT
	sprite_movement_data SPRITEMOVEFN_TILE_RIGHT,         	 RIGHT,  PERSON_ACTION_TILE_RIGHT,   		$7c,    $00,    %0000 ; SPRITEMOVEDATA_TILE_RIGHT
	sprite_movement_data SPRITEMOVEFN_TILE_DOWN,         	 DOWN,   PERSON_ACTION_TILE_DOWN,   		$00,    $00,    %0000 ; SPRITEMOVEDATA_TILE_DOWN_SOLID
	sprite_movement_data SPRITEMOVEFN_TILE_UP,         		 UP,  	 PERSON_ACTION_TILE_UP,   			$00,    $00,    %0000 ; SPRITEMOVEDATA_TILE_UP_SOLID
	sprite_movement_data SPRITEMOVEFN_TILE_LEFT,         	 LEFT,   PERSON_ACTION_TILE_LEFT,   		$00,    $00,    %0000 ; SPRITEMOVEDATA_TILE_LEFT_SOLID
	sprite_movement_data SPRITEMOVEFN_TILE_RIGHT,         	 RIGHT,  PERSON_ACTION_TILE_RIGHT,   		$00,    $00,    %0000 ; SPRITEMOVEDATA_TILE_RIGHT_SOLID
	sprite_movement_data SPRITEMOVEFN_TILE_DOWN,         	 DOWN,   PERSON_ACTION_TILE_DOWN,   		$7c,    $02,    %0000 ; SPRITEMOVEDATA_TILE_DOWN_PRIORITY
	sprite_movement_data SPRITEMOVEFN_TILE_UP,         		 UP,	 PERSON_ACTION_TILE_UP,   			$7c,    $02,    %0000 ; SPRITEMOVEDATA_TILE_UP_PRIORITY
	sprite_movement_data SPRITEMOVEFN_TILE_LEFT,         	 LEFT,   PERSON_ACTION_TILE_LEFT,   		$7c,    $02,    %0000 ; SPRITEMOVEDATA_TILE_LEFT_PRIORITY
	sprite_movement_data SPRITEMOVEFN_TILE_RIGHT,         	 RIGHT,  PERSON_ACTION_TILE_RIGHT,   		$7c,    $02,    %0000 ; SPRITEMOVEDATA_TILE_RIGHT_PRIORITY
	sprite_movement_data SPRITEMOVEFN_ARCH_TREE,             DOWN,   PERSON_ACTION_ARCH_TREE,       	$8e,    $02,    %0000 ; SPRITEMOVEDATA_ARCH_TREE_DOWN
	sprite_movement_data SPRITEMOVEFN_ARCH_TREE,             UP,     PERSON_ACTION_ARCH_TREE,       	$8e,    $02,    %0000 ; SPRITEMOVEDATA_ARCH_TREE_UP
	sprite_movement_data SPRITEMOVEFN_ARCH_TREE,             LEFT,   PERSON_ACTION_ARCH_TREE,       	$8e,    $02,    %0000 ; SPRITEMOVEDATA_ARCH_TREE_LEFT
	sprite_movement_data SPRITEMOVEFN_ARCH_TREE,             RIGHT,  PERSON_ACTION_ARCH_TREE,       	$8e,    $02,    %0000 ; SPRITEMOVEDATA_ARCH_TREE_RIGHT
	sprite_movement_data SPRITEMOVEFN_SAILBOAT_TOP,          DOWN,   PERSON_ACTION_SAILBOAT_TOP,    	$7c,    $02,    %0000 ; SPRITEMOVEDATA_SAILBOAT_TOP
	sprite_movement_data SPRITEMOVEFN_SAILBOAT_BOTTOM,       DOWN,   PERSON_ACTION_SAILBOAT_BOTTOM, 	$7c,    $02,    %0000 ; SPRITEMOVEDATA_SAILBOAT_BOTTOM
	sprite_movement_data SPRITEMOVEFN_UMBRELLA_LEFT,         DOWN,   PERSON_ACTION_UMBRELLA_LEFT,   	$8e,    $02,    %0000 ; SPRITEMOVEDATA_UMBRELLA_LEFT
	sprite_movement_data SPRITEMOVEFN_UMBRELLA_RIGHT,        UP,     PERSON_ACTION_UMBRELLA_RIGHT,  	$8e,    $02,    %0000 ; SPRITEMOVEDATA_UMBRELLA_RIGHT
	sprite_movement_data SPRITEMOVEFN_BOAT_BOB,              DOWN,   PERSON_ACTION_BOAT_BOB,        	$2e,    $00,    %0000 ; SPRITEMOVEDATA_BOAT_BOB
	sprite_movement_data SPRITEMOVEFN_VALVE,                 DOWN,   PERSON_ACTION_VALVE,           	$0c,    $00,    %0000 ; SPRITEMOVEDATA_VALVE
	sprite_movement_data SPRITEMOVEFN_MALL_SIGN_1,    	     DOWN,   PERSON_ACTION_MALL_SIGN_1,			$00,    $00,    %0000 ; SPRITEMOVEDATA_MALL_SIGN_1
	sprite_movement_data SPRITEMOVEFN_MALL_SIGN_2,    	     DOWN,   PERSON_ACTION_MALL_SIGN_2,			$00,    $00,    %0000 ; SPRITEMOVEDATA_MALL_SIGN_2
	sprite_movement_data SPRITEMOVEFN_MALL_SIGN_3,    	     DOWN,   PERSON_ACTION_MALL_SIGN_3,			$00,    $00,    %0000 ; SPRITEMOVEDATA_MALL_SIGN_3
	sprite_movement_data SPRITEMOVEFN_MALL_SIGN_4,    	     DOWN,   PERSON_ACTION_MALL_SIGN_4,			$00,    $00,    %0000 ; SPRITEMOVEDATA_MALL_SIGN_4
	sprite_movement_data SPRITEMOVEFN_HANGAR_LEFT,    	     DOWN,   PERSON_ACTION_HANGAR_LEFT,			$8e,    $00,    %0000 ; SPRITEMOVEDATA_HANGAR_LEFT
	sprite_movement_data SPRITEMOVEFN_HANGAR_RIGHT,    	     UP,	 PERSON_ACTION_HANGAR_RIGHT,		$8e,    $00,    %0000 ; SPRITEMOVEDATA_HANGAR_RIGHT
	sprite_movement_data SPRITEMOVEFN_LIGHTHOUSE_1,    	     DOWN,	 PERSON_ACTION_LIGHTHOUSE_1,		$8e,    $00,    %0000 ; SPRITEMOVEDATA_LIGHTHOUSE_1
	sprite_movement_data SPRITEMOVEFN_LIGHTHOUSE_2,    	     DOWN,	 PERSON_ACTION_LIGHTHOUSE_2,		$8e,    $00,    %0000 ; SPRITEMOVEDATA_LIGHTHOUSE_2
	sprite_movement_data SPRITEMOVEFN_LIGHTHOUSE_3,    	     DOWN,	 PERSON_ACTION_LIGHTHOUSE_3,		$8e,    $00,    %0000 ; SPRITEMOVEDATA_LIGHTHOUSE_3
	sprite_movement_data SPRITEMOVEFN_HALFPIPE_1,    	     DOWN,	 PERSON_ACTION_HALFPIPE_1,			$8e,    $00,    %0000 ; SPRITEMOVEDATA_HALFPIPE_1
	sprite_movement_data SPRITEMOVEFN_HALFPIPE_2,    	     DOWN,	 PERSON_ACTION_HALFPIPE_2,			$8e,    $00,    %0000 ; SPRITEMOVEDATA_HALFPIPE_2
	sprite_movement_data SPRITEMOVEFN_TOP_HALF, 	   	     DOWN,	 PERSON_ACTION_TOP_HALF,			$7c,    $00,    %0000 ; SPRITEMOVEDATA_TOP_HALF
	sprite_movement_data SPRITEMOVEFN_BOTTOM_HALF,    	     DOWN,	 PERSON_ACTION_BOTTOM_HALF,			$7c,    $00,    %0000 ; SPRITEMOVEDATA_BOTTOM_HALF
	sprite_movement_data SPRITEMOVEFN_SUNBEAM_VIEW_1,    	 DOWN,	 PERSON_ACTION_SUNBEAM_VIEW_1,		$7c,    $00,    %0000 ; SPRITEMOVEDATA_SUNBEAM_VIEW_1
	sprite_movement_data SPRITEMOVEFN_SUNBEAM_VIEW_2,    	 DOWN,	 PERSON_ACTION_SUNBEAM_VIEW_2,		$7c,    $00,    %0000 ; SPRITEMOVEDATA_SUNBEAM_VIEW_2
	sprite_movement_data SPRITEMOVEFN_SUNBEAM_VIEW_3,    	 DOWN,	 PERSON_ACTION_SUNBEAM_VIEW_3,		$7c,    $00,    %0000 ; SPRITEMOVEDATA_SUNBEAM_VIEW_3
	sprite_movement_data SPRITEMOVEFN_SUNBEAM_VIEW_4,    	 DOWN,	 PERSON_ACTION_SUNBEAM_VIEW_4,		$7c,    $00,    %0000 ; SPRITEMOVEDATA_SUNBEAM_VIEW_4
	sprite_movement_data SPRITEMOVEFN_SUNBEAM_VIEW_5,    	 DOWN,	 PERSON_ACTION_SUNBEAM_VIEW_5,		$7c,    $00,    %0000 ; SPRITEMOVEDATA_SUNBEAM_VIEW_5
	sprite_movement_data SPRITEMOVEFN_SUNBEAM_VIEW_6,    	 DOWN,	 PERSON_ACTION_SUNBEAM_VIEW_6,		$7c,    $00,    %0000 ; SPRITEMOVEDATA_SUNBEAM_VIEW_6
	sprite_movement_data SPRITEMOVEFN_BATHER,                LEFT,   PERSON_ACTION_BATHER,          	$00,    $00,    %0000 ; SPRITEMOVEDATA_BATHER
	sprite_movement_data SPRITEMOVEFN_STEAM,                 LEFT,   PERSON_ACTION_STAND,           	$7c,    $02,    %0000 ; SPRITEMOVEDATA_STEAM
	sprite_movement_data SPRITEMOVEFN_ICESKATER,			 LEFT,   PERSON_ACTION_STAND,           	$00,    $00,    %0000 ; SPRITEMOVEDATA_ICESKATER
	sprite_movement_data SPRITEMOVEFN_CANDLE,                DOWN,   PERSON_ACTION_CANDLE,          	$7c,    $00,    %0000 ; SPRITEMOVEDATA_CANDLE
	sprite_movement_data SPRITEMOVEFN_WALK_IN_PLACE,         DOWN,   PERSON_ACTION_WALK_IN_PLACE,   	$2e,    $00,    %0000 ; SPRITEMOVEDATA_WALK_IN_PLACE
	sprite_movement_data SPRITEMOVEFN_BIG_MUK,  		     DOWN,   PERSON_ACTION_BIG_MUK,   			$2e,    $00,    %0000 ; SPRITEMOVEDATA_BIG_MUK
	sprite_movement_data SPRITEMOVEFN_BIG_MUK_2,  		     DOWN,   PERSON_ACTION_BIG_MUK_2,   		$2e,    $00,    %0000 ; SPRITEMOVEDATA_BIG_MUK_2
	sprite_movement_data SPRITEMOVEFN_BIG_MUK_3,  		     DOWN,   PERSON_ACTION_BIG_MUK_3,   		$2e,    $00,    %0000 ; SPRITEMOVEDATA_BIG_MUK_3
	sprite_movement_data SPRITEMOVEFN_STALL,  	  		     DOWN,   PERSON_ACTION_STALL,   			$7c,    $02,    %0000 ; SPRITEMOVEDATA_STALL
	sprite_movement_data SPRITEMOVEFN_BINOCULARS_1,		     DOWN,   PERSON_ACTION_BINOCULARS_1, 		$7c,    $02,    %0000 ; SPRITEMOVEDATA_BINOCULARS_1
	sprite_movement_data SPRITEMOVEFN_BINOCULARS_2,		     DOWN,   PERSON_ACTION_BINOCULARS_2, 		$7c,    $02,    %0000 ; SPRITEMOVEDATA_BINOCULARS_2
	sprite_movement_data SPRITEMOVEFN_BALLOONS_1,            DOWN,   PERSON_ACTION_BALLOONS_1,      	$7c,    $02,    %0000 ; SPRITEMOVEDATA_BALLOONS_1
	sprite_movement_data SPRITEMOVEFN_BALLOONS_2,            DOWN,   PERSON_ACTION_BALLOONS_2,      	$7c,    $02,    %0000 ; SPRITEMOVEDATA_BALLOONS_2
	sprite_movement_data SPRITEMOVEFN_FOSSIL_MACHINE,  		 DOWN,   PERSON_ACTION_FOSSIL_MACHINE,		$7c,    $02,    %0000 ; SPRITEMOVEDATA_FOSSIL_MACHINE
	sprite_movement_data SPRITEMOVEFN_PC_SIGN,	    	     DOWN,   PERSON_ACTION_PC_SIGN,				$00,    $00,    %0000 ; SPRITEMOVEDATA_PC_SIGN
	sprite_movement_data SPRITEMOVEFN_CARD_TABLE_1,	    	 DOWN,   PERSON_ACTION_CARD_TABLE_1,		$7c,    $00,    %0000 ; SPRITEMOVEDATA_CARD_TABLE_1
	sprite_movement_data SPRITEMOVEFN_CARD_TABLE_2,	    	 DOWN,   PERSON_ACTION_CARD_TABLE_2,		$7c,    $00,    %0000 ; SPRITEMOVEDATA_CARD_TABLE_2
	sprite_movement_data SPRITEMOVEFN_CARD_TABLE_3,	    	 DOWN,   PERSON_ACTION_CARD_TABLE_3,		$7c,    $00,    %0000 ; SPRITEMOVEDATA_CARD_TABLE_3
	sprite_movement_data SPRITEMOVEFN_CARD_TABLE_4,	    	 DOWN,   PERSON_ACTION_CARD_TABLE_4,		$7c,    $00,    %0000 ; SPRITEMOVEDATA_CARD_TABLE_4
	sprite_movement_data SPRITEMOVEFN_DEALER_DOWN,           DOWN,   PERSON_ACTION_DEALER_DOWN,         $7c,    $02,    %0000 ; SPRITEMOVEDATA_DEALER_DOWN
	sprite_movement_data SPRITEMOVEFN_DEALER_LEFT,           LEFT,   PERSON_ACTION_DEALER_LEFT,         $00,    $00,    %0000 ; SPRITEMOVEDATA_DEALER_LEFT
	sprite_movement_data SPRITEMOVEFN_DEALER_RIGHT,          RIGHT,  PERSON_ACTION_DEALER_RIGHT,        $00,    $00,    %0000 ; SPRITEMOVEDATA_DEALER_RIGHT
	sprite_movement_data SPRITEMOVEFN_SAILBOAT_TOP_RIGHT,    DOWN,   PERSON_ACTION_SAILBOAT_TOP_RIGHT, 	$7c,    $02,    %0000 ; SPRITEMOVEDATA_SAILBOAT_TOP_RIGHT
	sprite_movement_data SPRITEMOVEFN_BAGGAGE,  		     LEFT,   PERSON_ACTION_STAND,           	$8e,    $00,    %0000 ; SPRITEMOVEDATA_BAGGAGE
	sprite_movement_data SPRITEMOVEFN_CASINO_1,         	 DOWN,   PERSON_ACTION_CASINO_1,   			$7c,    $00,    %0000 ; SPRITEMOVEDATA_CASINO_1
	sprite_movement_data SPRITEMOVEFN_CASINO_2,         	 UP,	 PERSON_ACTION_CASINO_2,   			$7c,    $00,    %0000 ; SPRITEMOVEDATA_CASINO_2
	sprite_movement_data SPRITEMOVEFN_FLOWER,                 DOWN,   PERSON_ACTION_FLOWER_SHAKE,     	$8e,    $02,    %0000 ; SPRITEMOVEDATA_FLOWER
