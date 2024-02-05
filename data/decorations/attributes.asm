decoration: MACRO
	; type, name, command, event flag, tile/sprite
	db \1, \2, \3
	dw \4
	db \5
ENDM

DecorationAttributes:
	decoration DECO_PLANT,    $00,               $0,                 EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1,         $00
	decoration DECO_PLANT,    PUT_IT_AWAY,       PUT_AWAY_BED,       EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1,         $00
	decoration DECO_BED,      FEATHERY_BED,      SET_UP_BED,         EVENT_DECO_BED_1,                  $07
	decoration DECO_BED,      PINK_BED,          SET_UP_BED,         EVENT_DECO_BED_2,                  $0b
	decoration DECO_BED,      BLUE_BED,    		 SET_UP_BED,         EVENT_DECO_BED_3,                  $0f
	decoration DECO_BED,      YELLOW_BED,        SET_UP_BED,         EVENT_DECO_BED_4,                  $13
	decoration DECO_BED,      GREEN_BED,     	 SET_UP_BED,         EVENT_DECO_BED_5,                  $17
	decoration DECO_BED,      CHECKER_BED,       SET_UP_BED,         EVENT_DECO_BED_6,                  $1b
	decoration DECO_PLANT,    PUT_IT_AWAY,       PUT_AWAY_CARPET,    EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1,         $00
	decoration DECO_CARPET,   RED_CARPET,        SET_UP_CARPET,      EVENT_DECO_CARPET_1,               $08
	decoration DECO_CARPET,   BLUE_CARPET,       SET_UP_CARPET,      EVENT_DECO_CARPET_2,               $0c
	decoration DECO_CARPET,   YELLOW_CARPET,     SET_UP_CARPET,      EVENT_DECO_CARPET_3,               $10
	decoration DECO_CARPET,   GREEN_CARPET,      SET_UP_CARPET,      EVENT_DECO_CARPET_4,               $14
	decoration DECO_CARPET,   CHECKER_CARPET,    SET_UP_CARPET,      EVENT_DECO_CARPET_5,               $18
	decoration DECO_PLANT,    PUT_IT_AWAY,       PUT_AWAY_PLANT,     EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1,         $00
	decoration DECO_PLANT,    MAGNAPLANT,        SET_UP_PLANT,       EVENT_DECO_PLANT_1,                $24
	decoration DECO_PLANT,    TROPICPLANT,       SET_UP_PLANT,       EVENT_DECO_PLANT_2,                $25
	decoration DECO_PLANT,    JUMBOPLANT,        SET_UP_PLANT,       EVENT_DECO_PLANT_3,                $26
	decoration DECO_PLANT,    SPIKEYPLANT,       SET_UP_PLANT,       EVENT_DECO_PLANT_4,                $27
	decoration DECO_PLANT,    PUT_IT_AWAY,       PUT_AWAY_POSTER,    EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1,         $00
	decoration DECO_PLANT,    POKEBALL_POSTER,   SET_UP_POSTER,      EVENT_DECO_POSTER_1,               $29
	decoration DECO_POSTER,   PIKACHU,           SET_UP_POSTER,      EVENT_DECO_POSTER_2,               $2a
	decoration DECO_POSTER,   CLEFAIRY,          SET_UP_POSTER,      EVENT_DECO_POSTER_3,               $2c
	decoration DECO_POSTER,   JIGGLYPUFF,        SET_UP_POSTER,      EVENT_DECO_POSTER_4,               $2c
	decoration DECO_POSTER,   EEVEE,      		 SET_UP_POSTER,      EVENT_DECO_POSTER_5,               $2d
	decoration DECO_POSTER,   MARILL,     		 SET_UP_POSTER,      EVENT_DECO_POSTER_6,               $2e
	decoration DECO_PLANT,    TOWN_MAP,        	 SET_UP_POSTER,      EVENT_DECO_POSTER_7,               $2f
	decoration DECO_PLANT,    MINAS_PAINTING,    SET_UP_POSTER,      EVENT_DECO_POSTER_8,               $30
	decoration DECO_PLANT,    PUT_IT_AWAY,       PUT_AWAY_CONSOLE,   EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1,         $00
	decoration DECO_PLANT,    SUPER_NES,         SET_UP_CONSOLE,     EVENT_DECO_SNES,                   SPRITE_SNES
	decoration DECO_PLANT,    NINTENDO_64,       SET_UP_CONSOLE,     EVENT_DECO_N64,                    SPRITE_N64
	decoration DECO_PLANT,    PUT_IT_AWAY,       PUT_AWAY_BIG_DOLL,  EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1,         $00
	decoration DECO_BIGDOLL,  SNORLAX,           SET_UP_BIG_DOLL,    EVENT_DECO_BIG_SNORLAX_DOLL,       SPRITE_BIG_SNORLAX
	decoration DECO_BIGDOLL,  ONIX,              SET_UP_BIG_DOLL,    EVENT_DECO_BIG_ONIX_DOLL,          SPRITE_BIG_ONIX
	decoration DECO_BIGDOLL,  LAPRAS,            SET_UP_BIG_DOLL,    EVENT_DECO_BIG_LAPRAS_DOLL,        SPRITE_BIG_LAPRAS
	decoration DECO_BIGDOLL,  MAMOSWINE,         SET_UP_BIG_DOLL,    EVENT_DECO_BIG_MAMOSWINE_DOLL,     SPRITE_BIG_MAMOSWINE
	decoration DECO_BIGDOLL,  GYARADOS,          SET_UP_BIG_DOLL,    EVENT_DECO_BIG_GYARADOS_DOLL,      SPRITE_BIG_GYARADOS
	decoration DECO_BIGDOLL,  MUK,   	         SET_UP_BIG_DOLL,    EVENT_DECO_BIG_MUK_DOLL,    	    SPRITE_BIG_MUK
	decoration DECO_PLANT,    PUT_IT_AWAY,       PUT_AWAY_DOLL,      EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1,         $00
	decoration DECO_DOLL,     PIKACHU,           SET_UP_DOLL,        EVENT_DECO_PIKACHU_DOLL,           SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     RAICHU,            SET_UP_DOLL,        EVENT_DECO_RAICHU_DOLL,            SPRITE_MON_DOLL_1
	decoration DECO_PLANT,    SURF_PIKA_DOLL,    SET_UP_DOLL,        EVENT_DECO_SURFING_PIKACHU_DOLL,   SPRITE_SURFING_PIKACHU
	decoration DECO_DOLL,     CLEFAIRY,          SET_UP_DOLL,        EVENT_DECO_CLEFAIRY_DOLL,          SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     JIGGLYPUFF,        SET_UP_DOLL,        EVENT_DECO_JIGGLYPUFF_DOLL,        SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     BULBASAUR,         SET_UP_DOLL,        EVENT_DECO_BULBASAUR_DOLL,         SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     CHARMANDER,        SET_UP_DOLL,        EVENT_DECO_CHARMANDER_DOLL,        SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     SQUIRTLE,          SET_UP_DOLL,        EVENT_DECO_SQUIRTLE_DOLL,          SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     CHIKORITA,         SET_UP_DOLL,        EVENT_DECO_CHIKORITA_DOLL,         SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     CYNDAQUIL,         SET_UP_DOLL,        EVENT_DECO_CYNDAQUIL_DOLL,         SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     TOTODILE,          SET_UP_DOLL,        EVENT_DECO_TOTODILE_DOLL,          SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     POLIWAG,           SET_UP_DOLL,        EVENT_DECO_POLIWAG_DOLL,           SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     MAREEP,            SET_UP_DOLL,        EVENT_DECO_MAREEP_DOLL,            SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     TOGEPI,            SET_UP_DOLL,        EVENT_DECO_TOGEPI_DOLL,            SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     MAGIKARP,          SET_UP_DOLL,        EVENT_DECO_MAGIKARP_DOLL,          SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     ODDISH,            SET_UP_DOLL,        EVENT_DECO_ODDISH_DOLL,            SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     GENGAR,            SET_UP_DOLL,        EVENT_DECO_GENGAR_DOLL,            SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     MARACTUS,         SET_UP_DOLL,        EVENT_DECO_MARACTUS_DOLL,         SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     DITTO,             SET_UP_DOLL,        EVENT_DECO_DITTO_DOLL,             SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     VOLTORB,           SET_UP_DOLL,        EVENT_DECO_VOLTORB_DOLL,           SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     STANTLER,              SET_UP_DOLL,        EVENT_DECO_STANTLER_DOLL,              SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     COTTONEE,             SET_UP_DOLL,        EVENT_DECO_COTTONEE_DOLL,             SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     GEODUDE,           SET_UP_DOLL,        EVENT_DECO_GEODUDE_DOLL,           SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     PINECO,            SET_UP_DOLL,        EVENT_DECO_PINECO_DOLL,            SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     EXEGGCUTE,            SET_UP_DOLL,        EVENT_DECO_EXEGGCUTE_DOLL,            SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     TEDDIURSA,         SET_UP_DOLL,        EVENT_DECO_TEDDIURSA_DOLL,         SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     MEOWTH,            SET_UP_DOLL,        EVENT_DECO_MEOWTH_DOLL,            SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     BUIZEL,            SET_UP_DOLL,        EVENT_DECO_BUIZEL_DOLL,            SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     GROWLITHE,         SET_UP_DOLL,        EVENT_DECO_GROWLITHE_DOLL,         SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     EEVEE,             SET_UP_DOLL,        EVENT_DECO_EEVEE_DOLL,             SPRITE_MON_DOLL_1
	decoration DECO_PLANT,    GOLD_TROPHY,       SET_UP_DOLL,        EVENT_DECO_GOLD_TROPHY,            SPRITE_N64
	decoration DECO_PLANT,    MAGNAPLANT,     SET_UP_DOLL,        EVENT_DECO_SILVER_TROPHY,          SPRITE_N64
