BuyMonDescriptions::
	dw NoBuyMonDesc
	dw HorseaBuyMonDesc
	dw StaryuBuyMonDesc
	dw MagikarpBuyMonDesc
	dw ChinchouBuyMonDesc
	dw CarvanhaBuyMonDesc
	
NoBuyMonDesc:
	db   "ERROR!!!!!"
	next "@"
	
MagikarpBuyMonDesc:
	db   "FISH #MON"
	next "TYPE: WATER@"
	
ChinchouBuyMonDesc:
	db   "ANGLER #MON"
	next "TYPE: WATER/ELEC.@"
	
CarvanhaBuyMonDesc:
	db   "SAVAGE #MON"
	next "TYPE: WATER/DARK@"
	
HorseaBuyMonDesc:
	db   "DRAGON #MON"
	next "TYPE: WATER@"
	
StaryuBuyMonDesc:
	db   "STARSHAPE #MON"
	next "TYPE: WATER@"
