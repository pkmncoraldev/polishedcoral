VariantSpeciesTable:
	db RAICHU
	db SANDSHREW
	db SANDSLASH
	db MEOWTH
	db PERSIAN
	db GRIMER
	db MUK
	db EXEGGCUTE
	db EXEGGUTOR
	db MAROWAK
	db CORSOLA
	db CHERRIM
	db MIMIKYU
	db -1

VariantAnimPointerTable:
	dbbww RAICHU, BANK(RaichuAnimations), RaichuAnimationPointers, RaichuAnimationExtraPointers
	dbbww SANDSHREW, BANK(SandshrewAnimations), SandshrewAnimationPointers, SandshrewAnimationExtraPointers
	dbbww SANDSLASH, BANK(SandslashAnimations), SandslashAnimationPointers, SandslashAnimationExtraPointers
	dbbww MEOWTH, BANK(MeowthAnimations), MeowthAnimationPointers, MeowthAnimationExtraPointers
	dbbww PERSIAN, BANK(PersianAnimations), PersianAnimationPointers, PersianAnimationExtraPointers
	dbbww GRIMER, BANK(GrimerAnimations), GrimerAnimationPointers, GrimerAnimationExtraPointers
	dbbww MUK, BANK(MukAnimations), MukAnimationPointers, MukAnimationExtraPointers
	dbbww EXEGGCUTE, BANK(ExeggcuteAnimations), ExeggcuteAnimationPointers, ExeggcuteAnimationExtraPointers
	dbbww EXEGGUTOR, BANK(ExeggutorAnimations), ExeggutorAnimationPointers, ExeggutorAnimationExtraPointers
	dbbww MAROWAK, BANK(MarowakAnimations), MarowakAnimationPointers, MarowakAnimationExtraPointers
	dbbww CORSOLA, BANK(CorsolaAnimations), CorsolaAnimationPointers, CorsolaAnimationExtraPointers
	dbbww CHERRIM, BANK(CherrimAnimations), CherrimAnimationPointers, CherrimAnimationExtraPointers
	dbbww MIMIKYU, BANK(MimikyuAnimations), MimikyuAnimationPointers, MimikyuAnimationExtraPointers
	dbbww -1, BANK(PicAnimations), AnimationPointers, AnimationExtraPointers

VariantFramesPointerTable:
	dbbba RAICHU, BANK(RaichusFrames), RaichuFramesPointers
	dbbba SANDSHREW, BANK(SandshrewsFrames), SandshrewFramesPointers
	dbbba SANDSLASH, BANK(SandslashsFrames), SandslashFramesPointers
	dbbba MEOWTH, BANK(MeowthsFrames), MeowthFramesPointers
	dbbba PERSIAN, BANK(PersiansFrames), PersianFramesPointers
	dbbba GRIMER, BANK(GrimersFrames), GrimerFramesPointers
	dbbba MUK, BANK(MuksFrames), MukFramesPointers
	dbbba EXEGGCUTE, BANK(ExeggcutesFrames), ExeggcuteFramesPointers
	dbbba EXEGGUTOR, BANK(ExeggutorsFrames), ExeggutorFramesPointers
	dbbba MAROWAK, BANK(MarowaksFrames), MarowakFramesPointers
	dbbba CORSOLA, BANK(CorsolasFrames), CorsolaFramesPointers
	dbbba CHERRIM, BANK(CherrimsFrames), CherrimFramesPointers
	dbbba MIMIKYU, BANK(MimikyusFrames), MimikyuFramesPointers
	dbbba -1, BANK(PokemonFrames), FramesPointers

VariantBitmasksPointerTable:
	dbba RAICHU, RaichuBitmasksPointers
	dbba SANDSHREW, SandshrewBitmasksPointers
	dbba SANDSLASH, SandslashBitmasksPointers
	dbba MEOWTH, MeowthBitmasksPointers
	dbba PERSIAN, PersianBitmasksPointers
	dbba GRIMER, GrimerBitmasksPointers
	dbba MUK, MukBitmasksPointers
	dbba EXEGGCUTE, ExeggcuteBitmasksPointers
	dbba EXEGGUTOR, ExeggutorBitmasksPointers
	dbba MAROWAK, MarowakBitmasksPointers
	dbba CORSOLA, CorsolaBitmasksPointers
	dbba CHERRIM, CherrimBitmasksPointers
	dbba MIMIKYU, MimikyuBitmasksPointers
	dbba -1, BitmasksPointers