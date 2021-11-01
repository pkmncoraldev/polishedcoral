; pokemon
	const_def 1
	const BULBASAUR
	const IVYSAUR
	const VENUSAUR
	const CHARMANDER
	const CHARMELEON
	const CHARIZARD
	const SQUIRTLE
	const WARTORTLE
	const BLASTOISE
	const PIDGEY
	const PIDGEOTTO
	const PIDGEOT
	const RATTATA
	const RATICATE
	const PIKACHU
	const RAICHU
	const SANDSHREW
	const SANDSLASH
	const NIDORAN_F
	const NIDORINA
	const NIDOQUEEN
	const NIDORAN_M
	const NIDORINO
	const NIDOKING
	const CLEFAIRY
	const CLEFABLE
	const JIGGLYPUFF
	const WIGGLYTUFF
	const ZUBAT
	const GOLBAT
	const ODDISH
	const GLOOM
	const VILEPLUME
	const MEOWTH
	const PERSIAN
	const GROWLITHE
	const ARCANINE
	const POLIWAG
	const POLIWHIRL
	const POLIWRATH
	const ABRA
	const KADABRA
	const ALAKAZAM
	const MACHOP
	const MACHOKE
	const MACHAMP
	const GEODUDE
	const GRAVELER
	const GOLEM
	const PONYTA
	const RAPIDASH
	const SLOWPOKE
	const SLOWBRO
	const MAGNEMITE
	const MAGNETON
	const DODUO
	const DODRIO
	const GRIMER
	const MUK
	const GASTLY
	const HAUNTER
	const GENGAR
	const ONIX
	const VOLTORB
	const ELECTRODE
	const EXEGGCUTE
	const EXEGGUTOR
	const CUBONE
	const MAROWAK
	const KOFFING
	const WEEZING
	const CHANSEY
	const HORSEA
	const SEADRA
	const STARYU
	const STARMIE
	const SCYTHER
	const ELECTABUZZ
	const MAGMAR
	const TAUROS
	const MAGIKARP
	const GYARADOS
	const LAPRAS
	const DITTO
	const EEVEE
	const VAPOREON
	const JOLTEON
	const FLAREON
	const PORYGON
	const AERODACTYL
	const SNORLAX
	const DRATINI
	const DRAGONAIR
	const DRAGONITE
	const CHIKORITA
	const BAYLEEF
	const MEGANIUM
	const CYNDAQUIL
	const QUILAVA
	const TYPHLOSION
	const TOTODILE
	const CROCONAW
	const FERALIGATR
	const LEDYBA
	const LEDIAN
	const CROBAT
	const CHINCHOU
	const LANTURN
	const TOGEPI
	const TOGETIC
	const NATU
	const XATU
	const MAREEP
	const FLAAFFY
	const AMPHAROS
	const BELLOSSOM
	const MARILL
	const AZUMARILL
	const SUDOWOODO
	const POLITOED
	const WOOPER
	const QUAGSIRE
	const ESPEON
	const UMBREON
	const MURKROW
	const SLOWKING
	const PINECO
	const FORRETRESS
	const GLIGAR
	const STEELIX
	const SNUBBULL
	const GRANBULL
	const SCIZOR
	const HERACROSS
	const SNEASEL
	const TEDDIURSA
	const URSARING
	const SLUGMA
	const MAGCARGO
	const SWINUB
	const PILOSWINE
	const CORSOLA
	const SKARMORY
	const HOUNDOUR
	const HOUNDOOM
	const KINGDRA
	const PHANPY
	const DONPHAN
	const PORYGON2
	const STANTLER
	const SMEARGLE
	const ELEKID
	const MAGBY
	const MILTANK
	const BLISSEY
	const LARVITAR
	const PUPITAR
	const TYRANITAR
	const WINGULL ;278
	const PELIPPER ;279
	const RALTS ;280
	const KIRLIA ;281
	const GARDEVOIR ;282
	const SHROOMISH ;285
	const BRELOOM ;286
	const ARON ;304
	const LAIRON ;305
	const AGGRON ;306
	const MEDITITE ;307
	const MEDICHAM ;308
	const CARVANHA ;318
	const SHARPEDO ;319
	const NUMEL ;322
	const CAMERUPT ;323
	const CACNEA ;331
	const CACTURNE ;332
	const SWABLU ;333
	const ALTARIA ;334
	const SNORUNT ;361
	const GLALIE ;362
	const BUIZEL ;418
	const FLOATZEL ;419
	const DRIFLOON ;425
	const DRIFBLIM ;426
	const BUNEARY ;427
	const LOPUNNY ;428
	const HONCHKROW ;430
	const SPIRITOMB ;442
	const MUNCHLAX ;446
	const RIOLU ;447
	const LUCARIO ;448
	const CROAGUNK ;453
	const TOXICROAK ;454
	const SNOVER ;459
	const ABOMASNOW ;460
	const WEAVILE ;461
	const MAGNEZONE ;462
	const ELECTIVIRE ;466
	const MAGMORTAR ;467
	const TOGEKISS ;468
	const LEAFEON ;470
	const GLACEON ;471
	const GLISCOR ;472
	const MAMOSWINE ;473
	const PORYGON_Z ;474
	const GALLADE ;475
	const FROSLASS ;478
	const DRILBUR ;529
	const EXCADRILL ;530
	const VENIPEDE ;543
	const WHIRLIPEDE ;544
	const SCOLIPEDE ;545
	const COTTONEE ;546
	const WHIMSICOTT ;547
	const SANDILE ;551
	const KROKOROK ;552
	const KROOKODILE ;553
	const MARACTUS ;556
	const DWEBBLE ;557
	const CRUSTLE ;558
	const SCRAGGY ;559
	const SCRAFTY ;560
	const TIRTOUGA ;563
	const CARRACOSTA ;564
	const ARCHEN ;565
	const ARCHEOPS ;566
	const MINCCINO ;572
	const CINCCINO ;573
	const JOLTIK ;595
	const GALVANTULA ;596
	const LITWICK ;607
	const LAMPENT ;608
	const CHANDELURE ;609
	const LARVESTA ;636
	const VOLCARONA ;637
	const SYLVEON ;700
	const PHANTUMP ;708
	const TREVENANT ;709
	const NOIBAT ;714
	const NOIVERN ;715
	const PIKIPEK ;731
	const TRUMBEAK ;732
	const TOUCANNON ;733
	const MAREANIE ;747
	const TOXAPEX ;748
	const WYRDEER
NUM_SPECIES EQU const_value - 1
	const RAICHU_A
	const EXEGGCUTE_A
	const EXEGGUTOR_A
	const MAROWAK_A
	const GRIMER_A
	const MUK_A
NUM_POKEMON EQU const_value +- 1
	const EGG        ; $fe
	const CANCEL     ; $ff

; form values

; generic
NO_FORM EQU 0
PLAIN_FORM EQU 1
ALOLAN_FORM EQU 2

; unown
	const_def 1
	const UNOWN_A_FORM
	const UNOWN_B_FORM
	const UNOWN_C_FORM
	const UNOWN_D_FORM
	const UNOWN_E_FORM
	const UNOWN_F_FORM
	const UNOWN_G_FORM
	const UNOWN_H_FORM
	const UNOWN_I_FORM
	const UNOWN_J_FORM
	const UNOWN_K_FORM
	const UNOWN_L_FORM
	const UNOWN_M_FORM
	const UNOWN_N_FORM
	const UNOWN_O_FORM
	const UNOWN_P_FORM
	const UNOWN_Q_FORM
	const UNOWN_R_FORM
	const UNOWN_S_FORM
	const UNOWN_T_FORM
	const UNOWN_U_FORM
	const UNOWN_V_FORM
	const UNOWN_W_FORM
	const UNOWN_X_FORM
	const UNOWN_Y_FORM
	const UNOWN_Z_FORM
	const UNOWN_EXCLAMATION_FORM
	const UNOWN_QUESTION_FORM
NUM_UNOWN EQU const_value +- 1

; pikachu
	const_def 1
	const PIKACHU_PLAIN_FORM
	const PIKACHU_FLY_FORM
	const PIKACHU_SURF_FORM
	const PIKACHU_RED_FORM
	const PIKACHU_YELLOW_FORM
	const PIKACHU_SPARK_FORM

; pichu
	const_def 1
	const PICHU_PLAIN_FORM
	const PICHU_SPIKY_EARED_FORM

; magikarp
	const_def 1
	const MAGIKARP_PLAIN_FORM
	const MAGIKARP_SKELLY_FORM
	const MAGIKARP_CALICO1_FORM
	const MAGIKARP_CALICO2_FORM
	const MAGIKARP_CALICO3_FORM
	const MAGIKARP_TWO_TONE_FORM
	const MAGIKARP_ORCA_FORM
	const MAGIKARP_DAPPLES_FORM
	const MAGIKARP_TIGER_FORM
	const MAGIKARP_ZEBRA_FORM
	const MAGIKARP_STRIPE_FORM
	const MAGIKARP_BUBBLES_FORM
	const MAGIKARP_FOREHEAD_FORM
	const MAGIKARP_MASK_FORM
NUM_MAGIKARP EQU const_value +- 1

; gyarados
	const_def 1
	const GYARADOS_PLAIN_FORM
GYARADOS_RED_FORM EQU NUM_MAGIKARP + 1

; mewtwo
	const_def 1
	const MEWTWO_PLAIN_FORM
	const MEWTWO_ARMORED_FORM
