;mon_cry: MACRO
; index, pitch, length
;	dw \1, \2, \3
;ENDM

mon_cry: MACRO
IF _NARG == 3
	db \1
	dw \2, \3
ELSE
	db $ff
	dba \2 ; bank/address
	db \1 - 1 ; species (padding)
ENDC
	ENDM

CryHeaders::
; entries correspond to constants/pokemon_constants.asm
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Bulbasaur
	mon_cry CRY_BULBASAUR,   $020,  $100 	; Ivysaur
	mon_cry CRY_BULBASAUR,   $000,  $140 	; Venusaur
	mon_cry CRY_CHARMANDER,  $060,  $0c0 	; Charmander
	mon_cry CRY_CHARMANDER,  $020,  $0c0 	; Charmeleon
	mon_cry CRY_CHARMANDER,  $000,  $100 	; Charizard
	mon_cry CRY_SQUIRTLE,    $060,  $0c0 	; Squirtle
	mon_cry CRY_SQUIRTLE,    $020,  $0c0 	; Wartortle
	mon_cry CRY_BLASTOISE,   $000,  $100 	; Blastoise
	mon_cry CRY_PIDGEY,      $0df,  $084 	; Pidgey
	mon_cry CRY_PIDGEOTTO,   $028,  $140 	; Pidgeotto
	mon_cry CRY_PIDGEOTTO,   $011,  $17f 	; Pidgeot
	mon_cry CRY_RATTATA,     $000,  $100 	; Rattata
	mon_cry CRY_RATTATA,     $020,  $17f 	; Raticate
	mon_cry CRY_BULBASAUR,   $0ee,  $081 	; Pikachu
	mon_cry CRY_RAICHU,      $0ee,  $088 	; Raichu
	mon_cry CRY_NIDORAN_M,   $020,  $0c0 	; Sandshrew
	mon_cry CRY_NIDORAN_M,   $0ff,  $17f 	; Sandslash
	mon_cry CRY_NIDORAN_F,   $000,  $100 	; NidoranF
	mon_cry CRY_NIDORAN_F,   $02c,  $160 	; Nidorina
	mon_cry CRY_NIDOQUEEN,   $000,  $100 	; Nidoqueen
	mon_cry CRY_NIDORAN_M,   $000,  $100 	; NidoranM
	mon_cry CRY_NIDORAN_M,   $02c,  $140 	; Nidorino
	mon_cry CRY_RAICHU,      $000,  $100 	; Nidoking
	mon_cry CRY_CLEFAIRY,    $0cc,  $081 	; Clefairy
	mon_cry CRY_CLEFAIRY,    $0aa,  $0a0 	; Clefable
	mon_cry CRY_PIDGEY,      $0ff,  $0b5 	; Jigglypuff
	mon_cry CRY_PIDGEY,      $068,  $0e0 	; Wigglytuff
	mon_cry CRY_SQUIRTLE,    $0e0,  $100 	; Zubat
	mon_cry CRY_SQUIRTLE,    $0fa,  $100 	; Golbat
	mon_cry CRY_ODDISH,      $0dd,  $081 	; Oddish
	mon_cry CRY_ODDISH,      $0aa,  $0c0 	; Gloom
	mon_cry CRY_VILEPLUME,   $022,  $17f 	; Vileplume
	mon_cry CRY_CLEFAIRY,    $077,  $090 	; Meowth
	mon_cry CRY_CLEFAIRY,    $099,  $17f 	; Persian
	mon_cry CRY_GROWLITHE,   $020,  $0c0 	; Growlithe
	mon_cry CRY_WEEDLE,      $000,  $100 	; Arcanine
	mon_cry CRY_PIDGEY,      $0ff,  $17f 	; Poliwag
	mon_cry CRY_PIDGEY,      $077,  $0e0 	; Poliwhirl
	mon_cry CRY_PIDGEY,      $000,  $17f 	; Poliwrath
	mon_cry CRY_ABRA,   	 $0c0,  $081 	; Abra
	mon_cry CRY_ABRA,   	 $0a8,  $140 	; Kadabra
	mon_cry CRY_ABRA,   	 $098,  $17f 	; Alakazam
	mon_cry CRY_GROWLITHE,   $0ee,  $081 	; Machop
	mon_cry CRY_GROWLITHE,   $048,  $0e0 	; Machoke
	mon_cry CRY_GROWLITHE,   $008,  $140 	; Machamp
	mon_cry CRY_GEODUDE,     $0f0,  $090 	; Geodude
	mon_cry CRY_GEODUDE,     $000,  $100 	; Graveler
	mon_cry CRY_GOLEM,       $0e0,  $0c0 	; Golem
	mon_cry CRY_PONYTA,      $000,  $100 	; Ponyta
	mon_cry CRY_PONYTA,  	 $020,  $140 	; Rapidash
	mon_cry CRY_SLOWPOKE,    $000,  $100 	; Slowpoke
	mon_cry CRY_GROWLITHE,   $000,  $100 	; Slowbro
	mon_cry CRY_ABRA,     	 $080,  $0e0 	; Magnemite
	mon_cry CRY_ABRA,    	 $020,  $140 	; Magneton
	mon_cry CRY_DODUO,   	 $0bb,  $081 	; Doduo
	mon_cry CRY_DODUO,   	 $099,  $0a0 	; Dodrio
	mon_cry CRY_GRIMER,      $000,  $100    ; Grimer
	mon_cry CRY_MUK,         $0ef,  $17f    ; Muk
	mon_cry CRY_ABRA,  		 $000,  $100 	; Gastly
	mon_cry CRY_ABRA,     	 $030,  $0c0 	; Haunter
	mon_cry CRY_MUK,         $000,  $17f 	; Gengar
	mon_cry CRY_EKANS,       $0ff,  $140 	; Onix
	mon_cry CRY_VOLTORB,     $0ed,  $100 	; Voltorb
	mon_cry CRY_VOLTORB,     $0a8,  $110 	; Electrode
	mon_cry CRY_DODUO,   	 $000,  $100 	; Exeggcute
	mon_cry CRY_EXEGGUTOR,   $000,  $100 	; Exeggutor
	mon_cry CRY_CLEFAIRY,    $000,  $100 	; Cubone
	mon_cry CRY_ODDISH,      $04f,  $0e0 	; Marowak
	mon_cry CRY_GOLEM,       $0e6,  $15d 	; Koffing
	mon_cry CRY_GOLEM,       $0ff,  $17f 	; Weezing
	mon_cry CRY_PIDGEOTTO,   $00a,  $140 	; Chansey
	mon_cry CRY_CLEFAIRY,    $099,  $090 	; Horsea
	mon_cry CRY_CLEFAIRY,    $03c,  $081 	; Seadra
	mon_cry CRY_STARYU,      $002,  $0a0 	; Staryu
	mon_cry CRY_STARYU,      $000,  $100 	; Starmie
	mon_cry CRY_SCYTHER,     $000,  $100 	; Scyther
	mon_cry CRY_VOLTORB,     $08f,  $17f 	; Electabuzz
	mon_cry CRY_CHARMANDER,  $0ff,  $0b0 	; Magmar
	mon_cry CRY_SQUIRTLE,    $011,  $0c0 	; Tauros
	mon_cry CRY_EKANS,       $080,  $080 	; Magikarp
	mon_cry CRY_EKANS,       $000,  $100 	; Gyarados
	mon_cry CRY_LAPRAS,      $000,  $100 	; Lapras
	mon_cry CRY_PIDGEY,      $0ff,  $17f 	; Ditto
	mon_cry CRY_EEVEE,  	 $088,  $0e0 	; Eevee
	mon_cry CRY_EEVEE,   	 $0aa,  $17f 	; Vaporeon
	mon_cry CRY_EEVEE,    	 $03d,  $100 	; Jolteon
	mon_cry CRY_EEVEE,    	 $010,  $0a0 	; Flareon
	mon_cry CRY_PONYTA,  	 $0aa,  $17f 	; Porygon
	mon_cry CRY_VILEPLUME,   $020,  $170 	; Aerodactyl
	mon_cry CRY_GRIMER,      $055,  $081 	; Snorlax
	mon_cry CRY_BULBASAUR,   $060,  $0c0 	; Dratini
	mon_cry CRY_BULBASAUR,   $040,  $100 	; Dragonair
	mon_cry CRY_BULBASAUR,   $03c,  $140 	; Dragonite
	mon_cry CRY_CHIKORITA,  -$010,  $0b0 	; Chikorita
	mon_cry CRY_CHIKORITA,  -$022,  $120 	; Bayleef
	mon_cry CRY_CHIKORITA,  -$0b7,  $200 	; Meganium
	mon_cry CRY_CYNDAQUIL,   $347,  $080 	; Cyndaquil
	mon_cry CRY_CYNDAQUIL,   $321,  $120 	; Quilava
	mon_cry CRY_TYPHLOSION,  $f00,  $0d4 	; Typhlosion
	mon_cry CRY_TOTODILE,    $46c,  $0e8 	; Totodile
	mon_cry CRY_TOTODILE,    $440,  $110 	; Croconaw
	mon_cry CRY_TOTODILE,    $3fc,  $180 	; Feraligatr
	mon_cry CRY_LEDYBA,      $000,  $0de 	; Ledyba
	mon_cry CRY_LEDYBA,     -$096,  $138 	; Ledian
	mon_cry CRY_SQUIRTLE,   -$010,  $140 	; Crobat
	mon_cry CRY_CYNDAQUIL,   $3c9,  $140 	; Chinchou
	mon_cry CRY_CYNDAQUIL,   $2d0,  $110 	; Lanturn
	mon_cry CRY_TOGEPI,      $010,  $100 	; Togepi
	mon_cry CRY_TOGETIC,     $03b,  $038 	; Togetic
	mon_cry CRY_NATU,       -$067,  $100 	; Natu
	mon_cry CRY_NATU,       -$0a7,  $168 	; Xatu
	mon_cry CRY_MAREEP,      $022,  $0d8 	; Mareep
	mon_cry CRY_MAREEP,     -$007,  $180 	; Flaaffy
	mon_cry CRY_AMPHAROS,   -$07c,  $0e8 	; Ampharos
	mon_cry CRY_BELLOSSOM,   $084,  $150 	; Bellossom
	mon_cry CRY_MARILL,      $11b,  $120 	; Marill
	mon_cry CRY_MARILL,      $0b6,  $180 	; Azumarill
	mon_cry CRY_BELLOSSOM,   $f40,  $180 	; Sudowoodo
	mon_cry CRY_BELLOSSOM,  -$2a3,  $1c8 	; Politoed
	mon_cry CRY_WOOPER,      $093,  $0af 	; Wooper
	mon_cry CRY_WOOPER,     -$0c6,  $140 	; Quagsire
	mon_cry CRY_ESPEON,   	 $0a2,  $140 	; Espeon
	mon_cry CRY_EEVEE,   	-$0e9,  $0f0 	; Umbreon
	mon_cry CRY_MARILL,     -$01f,  $180 	; Murkrow
	mon_cry CRY_SLOWKING,    $104,  $200 	; Slowking
	mon_cry CRY_SLOWKING,    $080,  $100 	; Pineco
	mon_cry CRY_SLOWKING,    $000,  $180 	; Forretress
	mon_cry CRY_GLIGAR,     -$102,  $100 	; Gligar
	mon_cry CRY_TYPHLOSION,  $0ef,  $0f7 	; Steelix
	mon_cry CRY_SNUBBULL,  	 $112,  $0e8 	; Snubbull
	mon_cry CRY_SNUBBULL,  	 $000,  $180 	; Granbull
	mon_cry CRY_AMPHAROS,    $000,  $160 	; Scizor
	mon_cry CRY_AMPHAROS,    $035,  $0e0 	; Heracross
	mon_cry CRY_WOOPER,      $053,  $0af 	; Sneasel
	mon_cry CRY_TEDDIURSA,   $7a2,  $06e 	; Teddiursa
	mon_cry CRY_TEDDIURSA,   $640,  $0d8 	; Ursaring
	mon_cry CRY_SLUGMA,     -$1d8,  $140 	; Slugma
	mon_cry CRY_MAGCARGO,   -$20d,  $1c0 	; Magcargo
	mon_cry CRY_CYNDAQUIL,   $1fe,  $140 	; Swinub
	mon_cry CRY_MAGCARGO,   -$109,  $100 	; Piloswine
	mon_cry CRY_MAGCARGO,    $0a1,  $0e8 	; Corsola
	mon_cry CRY_AMPHAROS,    $8a9,  $180 	; Skarmory
	mon_cry CRY_CYNDAQUIL,   $039,  $140 	; Houndour
	mon_cry CRY_TOTODILE,   -$10a,  $100 	; Houndoom
	mon_cry CRY_SLUGMA,      $2fb,  $100 	; Kingdra
	mon_cry CRY_PHANPY,    	 $048,  $230 	; Phanpy
	mon_cry CRY_DONPHAN,     $000,  $1a0 	; Donphan
	mon_cry CRY_PORYGON2,  	 $073,  $240 	; Porygon2
	mon_cry CRY_ESPEON,     -$160,  $180 	; Stantler
	mon_cry CRY_SMEARGLE,   -$21a,  $1f0 	; Smeargle
	mon_cry CRY_ELEKID,  	-$2d8,  $0b4 	; Elekid
	mon_cry CRY_TEDDIURSA,   $176,  $03a 	; Magby
	mon_cry CRY_GLIGAR,     -$1cd,  $1a0 	; Miltank
	mon_cry CRY_SLOWKING,    $293,  $140 	; Blissey
	mon_cry CRY_LARVITAR,    $05f,  $0d0 	; Larvitar
	mon_cry CRY_PUPITAR,   	-$1db,  $150 	; Pupitar
	mon_cry CRY_LARVITAR,   -$100,  $180 	; Tyranitar
	mon_cry WINGULL,	WingullDEDData		; Wingull
	mon_cry PELIPPER,	PelipperDEDData		; Pelipper
	mon_cry RALTS,   	RaltsDEDData	 	; Ralts
	mon_cry KIRLIA,		KirliaDEDData	 	; Kirlia
	mon_cry GARDEVOIR,  GardevoirDEDData 	; Gardevoir
	mon_cry SHROOMISH,  ShroomishDEDData 	; Shroomish
	mon_cry BRELOOM,   	BreloomDEDData	 	; Breloom
	mon_cry ARON,   	AronDEDData		 	; Aron
	mon_cry LAIRON, 	LaironDEDData	 	; Lairon
	mon_cry AGGRON,   	AggronDEDData	 	; Aggron
	mon_cry MEDITITE,   MedititeDEDData	 	; Meditite
	mon_cry MEDICHAM,   MedichamDEDData	 	; Medicham
	mon_cry CARVANHA,   CarvanhaDEDData	 	; Carvanha
	mon_cry SHARPEDO,   SharpedoDEDData	 	; Sharpedo
	mon_cry NUMEL,   	NumelDEDData	 	; Numel
	mon_cry CAMERUPT,   CameruptDEDData	 	; Camerupt
	mon_cry CACNEA,   	CacneaDEDData	 	; Cacnea
	mon_cry CACTURNE,  	CacturneDEDData	 	; Cacturne
	mon_cry SWABLU,   	SwabluDEDData	 	; Swablu
	mon_cry ALTARIA,   	AltariaDEDData	 	; Altaria
	mon_cry SNORUNT,   	SnoruntDEDData	 	; Snorunt
	mon_cry GLALIE,   	GlalieDEDData	 	; Glalie
	mon_cry BUIZEL,   	BuizelDEDData	 	; Buizel
	mon_cry FLOATZEL,   FloatzelDEDData	 	; Floatzel
	mon_cry DRIFLOON,   DrifloonDEDData	 	; Drifloon
	mon_cry DRIFBLIM,   DrifblimDEDData	 	; Drifblim
	mon_cry BUNEARY,   	BunearyDEDData	 	; Buneary
	mon_cry LOPUNNY,   	LopunnyDEDData	 	; Lopunny
	mon_cry HONCHKROW,  HonchkrowDEDData 	; Honchkrow
	mon_cry SPIRITOMB,  SpiritombDEDData 	; Spiritomb
	mon_cry MUNCHLAX,   MunchlaxDEDData	 	; Munchlax
	mon_cry RIOLU,		RioluDEDData		; Riolu
	mon_cry LUCARIO,	LucarioDEDData		; Lucario
	mon_cry CROAGUNK,	CroagunkDEDData		; Croagunk
	mon_cry TOXICROAK,	ToxicroakDEDData	; Toxicroak
	mon_cry SNOVER,   	SnoverDEDData	 	; Snover
	mon_cry ABOMASNOW,  AbomasnowDEDData	; Abomasnow
	mon_cry WEAVILE,   	WeavileDEDData	 	; Weavile
	mon_cry MAGNEZONE,  MagnezoneDEDData 	; Magnezone
	mon_cry ELECTIVIRE, ElectivireDEDData 	; Electivire
	mon_cry MAGMORTAR,  MagmortarDEDData 	; Magmortar
	mon_cry TOGEKISS,   TogekissDEDData	 	; Togekiss
	mon_cry LEAFEON,   	LeafeonDEDData	 	; Leafeon
	mon_cry GLACEON,   	GlaceonDEDData	 	; Glaceon
	mon_cry GLISCOR,   	GliscorDEDData	 	; Gliscor
	mon_cry MAMOSWINE,  MamoswineDEDData 	; Mamoswine
	mon_cry PORYGON_Z,  PorygonZDEDData	 	; PorygonZ
	mon_cry GALLADE,   	GalladeDEDData	 	; Gallade
	mon_cry FROSLASS,  	FroslassDEDData	 	; Froslass
	mon_cry DRILBUR,	DrilburDEDData		; Drilbur
	mon_cry EXCADRILL,	ExcadrillDEDData	; Excadrill
	mon_cry VENIPEDE,  	VenipedeDEDData	 	; Venipede
	mon_cry WHIRLIPEDE, WhirlipedeDEDData	; Whirlipede
	mon_cry SCOLIPEDE,	ScolipedeDEDData	; Scolipede
	mon_cry COTTONEE,   CottoneeDEDData	 	; Cottonee
	mon_cry WHIMSICOTT, WhimsicottDEDData 	; Whimsicott
	mon_cry SANDILE,	SandileDEDData 		; Sandile
	mon_cry KROKOROK,	KrokorokDEDData 	; Krokorok
	mon_cry KROOKODILE, KrookodileDEDData 	; Krookodile
	mon_cry MARACTUS,	MaractusDEDData		; Maractus
	mon_cry DWEBBLE,   	DwebbleDEDData	 	; Dwebble
	mon_cry CRUSTLE,   	CrustleDEDData	 	; Crustle
	mon_cry SCRAGGY,    ScraggyDEDData	 	; Scraggy
	mon_cry SCRAFTY,   	ScraftyDEDData	 	; Scrafty
	mon_cry TIRTOUGA, 	TirtougaDEDData 	; Tirtouga
	mon_cry CARRACOSTA, CarracostaDEDData 	; Carracosta
	mon_cry ARCHEN,		ArchenDEDData		; Archen
	mon_cry ARCHEOPS,	ArcheopsDEDData		; Archeops
	mon_cry MINCCINO,   MinccinoDEDData	 	; Minccino
	mon_cry CINCCINO,   CinccinoDEDData	 	; Cinccino
	mon_cry JOLTIK,   	JoltikDEDData	 	; Joltik
	mon_cry GALVANTULA, GalvantulaDEDData 	; Galvantula
	mon_cry LITWICK,   	LitwickDEDData	 	; Litwick
	mon_cry LAMPENT,   	LampentDEDData	 	; Lampent
	mon_cry CHANDELURE, ChandelureDEDData 	; Chandelure
	mon_cry LARVESTA,   LarvestaDEDData	 	; Larvesta
	mon_cry VOLCARONA,  VolcaronaDEDData 	; Volcarona
	mon_cry SYLVEON,   	SylveonDEDData	 	; Sylveon
	mon_cry PHANTUMP,	PhantumpDEDData		; Phantump
	mon_cry TREVENANT,	TrevenantDEDData	; Trevenant
	mon_cry NOIBAT,   	NoibatDEDData	 	; Noibat
	mon_cry NOIVERN,   	NoivernDEDData	 	; Noivern
	mon_cry PIKIPEK,   	PikipekDEDData	 	; Pikipek
	mon_cry	TRUMBEAK,  	TrumbeakDEDData	 	; Trumbeak
	mon_cry	TOUCANNON, 	ToucannonDEDData 	; Toucannon
	mon_cry MAREANIE,	MareanieDEDData		; Mareanie
	mon_cry TOXAPEX,	ToxapexDEDData		; Toxapex
	mon_cry WYRDEER,    WyrdeerDEDData		; Wyrdeer
	mon_cry CRY_RAICHU,      $0ee,  $088 	; Raichu_A
	mon_cry CRY_DODUO,   	 $000,  $100 	; Exeggcute_A
	mon_cry CRY_EXEGGUTOR,   $000,  $100 	; Exeggutor_A
	mon_cry CRY_ODDISH,      $04f,  $0e0 	; Marowak_A
	mon_cry CRY_GRIMER,      $000,  $100    ; Grimer_A
	mon_cry CRY_MUK,         $0ef,  $17f    ; Muk_A
	mon_cry CRY_NIDORAN_M,      0,     0 	; Egg
	mon_cry CRY_NIDORAN_M,      0,     0 	; 255
	
CryHeaders2::
; entries correspond to constants/pokemon_constants.asm
; TODO: Replace placeholders
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Bulbasaur
	mon_cry CRY_BULBASAUR,   $020,  $100 	; Ivysaur
	mon_cry CRY_BULBASAUR,   $000,  $140 	; Venusaur
	mon_cry CRY_CHARMANDER,  $060,  $0c0 	; Charmander
	mon_cry CRY_CHARMANDER,  $020,  $0c0 	; Charmeleon
	mon_cry CRY_CHARMANDER,  $000,  $100 	; Charizard
	mon_cry CRY_SQUIRTLE,    $060,  $0c0 	; Squirtle
	mon_cry CRY_SQUIRTLE,    $020,  $0c0 	; Wartortle
	mon_cry CRY_BLASTOISE,   $000,  $100 	; Blastoise
	mon_cry CRY_PIDGEY,      $0df,  $084 	; Pidgey
	mon_cry CRY_PIDGEOTTO,   $028,  $140 	; Pidgeotto
	mon_cry CRY_PIDGEOTTO,   $011,  $17f 	; Pidgeot
	mon_cry CRY_RATTATA,     $000,  $100 	; Rattata
	mon_cry CRY_RATTATA,     $020,  $17f 	; Raticate
	mon_cry CRY_BULBASAUR,   $0ee,  $081 	; Pikachu
	mon_cry CRY_RAICHU,      $0ee,  $088 	; Raichu
	mon_cry CRY_NIDORAN_M,   $020,  $0c0 	; Sandshrew
	mon_cry CRY_NIDORAN_M,   $0ff,  $17f 	; Sandslash
	mon_cry CRY_NIDORAN_F,   $000,  $100 	; NidoranF
	mon_cry CRY_NIDORAN_F,   $02c,  $160 	; Nidorina
	mon_cry CRY_NIDOQUEEN,   $000,  $100 	; Nidoqueen
	mon_cry CRY_NIDORAN_M,   $000,  $100 	; NidoranM
	mon_cry CRY_NIDORAN_M,   $02c,  $140 	; Nidorino
	mon_cry CRY_RAICHU,      $000,  $100 	; Nidoking
	mon_cry CRY_CLEFAIRY,    $0cc,  $081 	; Clefairy
	mon_cry CRY_CLEFAIRY,    $0aa,  $0a0 	; Clefable
	mon_cry CRY_PIDGEY,      $0ff,  $0b5 	; Jigglypuff
	mon_cry CRY_PIDGEY,      $068,  $0e0 	; Wigglytuff
	mon_cry CRY_SQUIRTLE,    $0e0,  $100 	; Zubat
	mon_cry CRY_SQUIRTLE,    $0fa,  $100 	; Golbat
	mon_cry CRY_ODDISH,      $0dd,  $081 	; Oddish
	mon_cry CRY_ODDISH,      $0aa,  $0c0 	; Gloom
	mon_cry CRY_VILEPLUME,   $022,  $17f 	; Vileplume
	mon_cry CRY_CLEFAIRY,    $077,  $090 	; Meowth
	mon_cry CRY_CLEFAIRY,    $099,  $17f 	; Persian
	mon_cry CRY_GROWLITHE,   $020,  $0c0 	; Growlithe
	mon_cry CRY_WEEDLE,      $000,  $100 	; Arcanine
	mon_cry CRY_PIDGEY,      $0ff,  $17f 	; Poliwag
	mon_cry CRY_PIDGEY,      $077,  $0e0 	; Poliwhirl
	mon_cry CRY_PIDGEY,      $000,  $17f 	; Poliwrath
	mon_cry CRY_ABRA,   	 $0c0,  $081 	; Abra
	mon_cry CRY_ABRA,   	 $0a8,  $140 	; Kadabra
	mon_cry CRY_ABRA,   	 $098,  $17f 	; Alakazam
	mon_cry CRY_GROWLITHE,   $0ee,  $081 	; Machop
	mon_cry CRY_GROWLITHE,   $048,  $0e0 	; Machoke
	mon_cry CRY_GROWLITHE,   $008,  $140 	; Machamp
	mon_cry CRY_GEODUDE,     $0f0,  $090 	; Geodude
	mon_cry CRY_GEODUDE,     $000,  $100 	; Graveler
	mon_cry CRY_GOLEM,       $0e0,  $0c0 	; Golem
	mon_cry CRY_PONYTA,      $000,  $100 	; Ponyta
	mon_cry CRY_PONYTA,  	 $020,  $140 	; Rapidash
	mon_cry CRY_SLOWPOKE,    $000,  $100 	; Slowpoke
	mon_cry CRY_GROWLITHE,   $000,  $100 	; Slowbro
	mon_cry CRY_ABRA,     	 $080,  $0e0 	; Magnemite
	mon_cry CRY_ABRA,    	 $020,  $140 	; Magneton
	mon_cry CRY_DODUO,   	 $0bb,  $081 	; Doduo
	mon_cry CRY_DODUO,   	 $099,  $0a0 	; Dodrio
	mon_cry CRY_GRIMER,      $000,  $100    ; Grimer
	mon_cry CRY_MUK,         $0ef,  $17f    ; Muk
	mon_cry CRY_ABRA,  		 $000,  $100 	; Gastly
	mon_cry CRY_ABRA,     	 $030,  $0c0 	; Haunter
	mon_cry CRY_MUK,         $000,  $17f 	; Gengar
	mon_cry CRY_EKANS,       $0ff,  $140 	; Onix
	mon_cry CRY_VOLTORB,     $0ed,  $100 	; Voltorb
	mon_cry CRY_VOLTORB,     $0a8,  $110 	; Electrode
	mon_cry CRY_DODUO,   	 $000,  $100 	; Exeggcute
	mon_cry CRY_EXEGGUTOR,   $000,  $100 	; Exeggutor
	mon_cry CRY_CLEFAIRY,    $000,  $100 	; Cubone
	mon_cry CRY_ODDISH,      $04f,  $0e0 	; Marowak
	mon_cry CRY_GOLEM,       $0e6,  $15d 	; Koffing
	mon_cry CRY_GOLEM,       $0ff,  $17f 	; Weezing
	mon_cry CRY_PIDGEOTTO,   $00a,  $140 	; Chansey
	mon_cry CRY_CLEFAIRY,    $099,  $090 	; Horsea
	mon_cry CRY_CLEFAIRY,    $03c,  $081 	; Seadra
	mon_cry CRY_STARYU,      $002,  $0a0 	; Staryu
	mon_cry CRY_STARYU,      $000,  $100 	; Starmie
	mon_cry CRY_SCYTHER,     $000,  $100 	; Scyther
	mon_cry CRY_VOLTORB,     $08f,  $17f 	; Electabuzz
	mon_cry CRY_CHARMANDER,  $0ff,  $0b0 	; Magmar
	mon_cry CRY_SQUIRTLE,    $011,  $0c0 	; Tauros
	mon_cry CRY_EKANS,       $080,  $080 	; Magikarp
	mon_cry CRY_EKANS,       $000,  $100 	; Gyarados
	mon_cry CRY_LAPRAS,      $000,  $100 	; Lapras
	mon_cry CRY_PIDGEY,      $0ff,  $17f 	; Ditto
	mon_cry CRY_EEVEE,  	 $088,  $0e0 	; Eevee
	mon_cry CRY_EEVEE,   	 $0aa,  $17f 	; Vaporeon
	mon_cry CRY_EEVEE,    	 $03d,  $100 	; Jolteon
	mon_cry CRY_EEVEE,    	 $010,  $0a0 	; Flareon
	mon_cry CRY_PONYTA,  	 $0aa,  $17f 	; Porygon
	mon_cry CRY_VILEPLUME,   $020,  $170 	; Aerodactyl
	mon_cry CRY_GRIMER,      $055,  $081 	; Snorlax
	mon_cry CRY_BULBASAUR,   $060,  $0c0 	; Dratini
	mon_cry CRY_BULBASAUR,   $040,  $100 	; Dragonair
	mon_cry CRY_BULBASAUR,   $03c,  $140 	; Dragonite
	mon_cry CRY_CHIKORITA,  -$010,  $0b0 	; Chikorita
	mon_cry CRY_CHIKORITA,  -$022,  $120 	; Bayleef
	mon_cry CRY_CHIKORITA,  -$0b7,  $200 	; Meganium
	mon_cry CRY_CYNDAQUIL,   $347,  $080 	; Cyndaquil
	mon_cry CRY_CYNDAQUIL,   $321,  $120 	; Quilava
	mon_cry CRY_TYPHLOSION,  $f00,  $0d4 	; Typhlosion
	mon_cry CRY_TOTODILE,    $46c,  $0e8 	; Totodile
	mon_cry CRY_TOTODILE,    $440,  $110 	; Croconaw
	mon_cry CRY_TOTODILE,    $3fc,  $180 	; Feraligatr
	mon_cry CRY_LEDYBA,      $000,  $0de 	; Ledyba
	mon_cry CRY_LEDYBA,     -$096,  $138 	; Ledian
	mon_cry CRY_SQUIRTLE,   -$010,  $140 	; Crobat
	mon_cry CRY_CYNDAQUIL,   $3c9,  $140 	; Chinchou
	mon_cry CRY_CYNDAQUIL,   $2d0,  $110 	; Lanturn
	mon_cry CRY_TOGEPI,      $010,  $100 	; Togepi
	mon_cry CRY_TOGETIC,     $03b,  $038 	; Togetic
	mon_cry CRY_NATU,       -$067,  $100 	; Natu
	mon_cry CRY_NATU,       -$0a7,  $168 	; Xatu
	mon_cry CRY_MAREEP,      $022,  $0d8 	; Mareep
	mon_cry CRY_MAREEP,     -$007,  $180 	; Flaaffy
	mon_cry CRY_AMPHAROS,   -$07c,  $0e8 	; Ampharos
	mon_cry CRY_BELLOSSOM,   $084,  $150 	; Bellossom
	mon_cry CRY_MARILL,      $11b,  $120 	; Marill
	mon_cry CRY_MARILL,      $0b6,  $180 	; Azumarill
	mon_cry CRY_BELLOSSOM,   $f40,  $180 	; Sudowoodo
	mon_cry CRY_BELLOSSOM,  -$2a3,  $1c8 	; Politoed
	mon_cry CRY_WOOPER,      $093,  $0af 	; Wooper
	mon_cry CRY_WOOPER,     -$0c6,  $140 	; Quagsire
	mon_cry CRY_ESPEON,   	 $0a2,  $140 	; Espeon
	mon_cry CRY_EEVEE,   	-$0e9,  $0f0 	; Umbreon
	mon_cry CRY_MARILL,     -$01f,  $180 	; Murkrow
	mon_cry CRY_SLOWKING,    $104,  $200 	; Slowking
	mon_cry CRY_SLOWKING,    $080,  $100 	; Pineco
	mon_cry CRY_SLOWKING,    $000,  $180 	; Forretress
	mon_cry CRY_GLIGAR,     -$102,  $100 	; Gligar
	mon_cry CRY_TYPHLOSION,  $0ef,  $0f7 	; Steelix
	mon_cry CRY_SNUBBULL,  	 $112,  $0e8 	; Snubbull
	mon_cry CRY_SNUBBULL,  	 $000,  $180 	; Granbull
	mon_cry CRY_AMPHAROS,    $000,  $160 	; Scizor
	mon_cry CRY_AMPHAROS,    $035,  $0e0 	; Heracross
	mon_cry CRY_WOOPER,      $053,  $0af 	; Sneasel
	mon_cry CRY_TEDDIURSA,   $7a2,  $06e 	; Teddiursa
	mon_cry CRY_TEDDIURSA,   $640,  $0d8 	; Ursaring
	mon_cry CRY_SLUGMA,     -$1d8,  $140 	; Slugma
	mon_cry CRY_MAGCARGO,   -$20d,  $1c0 	; Magcargo
	mon_cry CRY_CYNDAQUIL,   $1fe,  $140 	; Swinub
	mon_cry CRY_MAGCARGO,   -$109,  $100 	; Piloswine
	mon_cry CRY_MAGCARGO,    $0a1,  $0e8 	; Corsola
	mon_cry CRY_AMPHAROS,    $8a9,  $180 	; Skarmory
	mon_cry CRY_CYNDAQUIL,   $039,  $140 	; Houndour
	mon_cry CRY_TOTODILE,   -$10a,  $100 	; Houndoom
	mon_cry CRY_SLUGMA,      $2fb,  $100 	; Kingdra
	mon_cry CRY_PHANPY,    	 $048,  $230 	; Phanpy
	mon_cry CRY_DONPHAN,     $000,  $1a0 	; Donphan
	mon_cry CRY_PORYGON2,  	 $073,  $240 	; Porygon2
	mon_cry CRY_ESPEON,     -$160,  $180 	; Stantler
	mon_cry CRY_SMEARGLE,   -$21a,  $1f0 	; Smeargle
	mon_cry CRY_ELEKID,  	-$2d8,  $0b4 	; Elekid
	mon_cry CRY_TEDDIURSA,   $176,  $03a 	; Magby
	mon_cry CRY_GLIGAR,     -$1cd,  $1a0 	; Miltank
	mon_cry CRY_SLOWKING,    $293,  $140 	; Blissey
	mon_cry CRY_LARVITAR,    $05f,  $0d0 	; Larvitar
	mon_cry CRY_PUPITAR,   	-$1db,  $150 	; Pupitar
	mon_cry CRY_LARVITAR,   -$100,  $180 	; Tyranitar
	mon_cry CRY_BULBASAUR,   $080,  $081	; Wingull - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081	; Pelipper - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Ralts - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Kirlia - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Gardevoir - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Shroomish - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Breloom - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Aron - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Lairon - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Aggron - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Meditite - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Medicham - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Carvanha - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Sharpedo - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Numel - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Camerupt - PLACEHOLDER
	mon_cry CRY_SCYTHER,    -$096,  $0a0 	; Cacnea
	mon_cry CRY_TOTODILE,   -$1c0,  $170 	; Cacturne
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Swablu - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Altaria - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Snorunt - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Glalie - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Buizel - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Floatzel - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Drifloon - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Drifblim - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Buneary - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Lopunny - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Honchkrow - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Spiritomb - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Munchlax - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081	; Riolu - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081	; Lucario - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081	; Croagunk - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081	; Toxicroak - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Snover - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081	; Abomasnow - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Weavile - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Magnezone - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Electivire - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Magmortar - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Togekiss - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Leafeon - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Glaceon - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Gliscor - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Mamoswine - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; PorygonZ - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Gallade - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Froslass - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081	; Drilbur - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081	; Excadrill - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Venipede - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081	; Whirlipede - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081	; Scolipede - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Cottonee - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081	; Whimsicott - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081	; Sandile - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081	; Krokorok - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Krookodile - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081	; Maractus - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Dwebble - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Crustle - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Scraggy - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Scrafty - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081	; Tirtouga - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Carracosta - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081	; Archen - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081	; Archeops - PLACEHOLDER
	mon_cry CRY_SLOWPOKE,    $1CD,  $140  	; Minccino
	mon_cry CRY_PSYDUCK,     $265,  $170	; Cinccino
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Joltik - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Galvantula - PLACEHOLDER
	mon_cry CRY_WOOPER,     -$010,  $210 	; Litwick
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Lampent - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Chandelure - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Larvesta - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Volcarona - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Sylveon - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081	; Phantump - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081	; Trevenant - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Noibat - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Noivern - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Pikipek - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Trumbeak - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081 	; Toucannon - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081	; Mareanie - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081	; Toxapex - PLACEHOLDER
	mon_cry CRY_BULBASAUR,   $080,  $081	; Wyrdeer - PLACEHOLDER
	mon_cry CRY_RAICHU,      $0ee,  $088 	; Raichu_A
	mon_cry CRY_DODUO,   	 $000,  $100 	; Exeggcute_A
	mon_cry CRY_EXEGGUTOR,   $000,  $100 	; Exeggutor_A
	mon_cry CRY_ODDISH,      $04f,  $0e0 	; Marowak_A
	mon_cry CRY_GRIMER,      $000,  $100    ; Grimer_A
	mon_cry CRY_MUK,         $0ef,  $17f    ; Muk_A
	mon_cry CRY_NIDORAN_M,      0,     0 	; Egg
	mon_cry CRY_NIDORAN_M,      0,     0 	; 255
