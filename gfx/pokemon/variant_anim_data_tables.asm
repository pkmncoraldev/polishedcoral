VariantSpeciesTable:
	db RAICHU
	db SANDSHREW
	db SANDSLASH
	db GRIMER
	db MUK
	db EXEGGCUTE
	db EXEGGUTOR
	db MAROWAK
	db CORSOLA
	db -1

VariantAnimPointerTable:
	dbbww RAICHU, BANK(RaichuAnimations), RaichuAnimationPointers, RaichuAnimationExtraPointers
	dbbww SANDSHREW, BANK(SandshrewAnimations), SandshrewAnimationPointers, SandshrewAnimationExtraPointers
	dbbww SANDSLASH, BANK(SandslashAnimations), SandslashAnimationPointers, SandslashAnimationExtraPointers
	dbbww GRIMER, BANK(GrimerAnimations), GrimerAnimationPointers, GrimerAnimationExtraPointers
	dbbww MUK, BANK(MukAnimations), MukAnimationPointers, MukAnimationExtraPointers
	dbbww EXEGGCUTE, BANK(ExeggcuteAnimations), ExeggcuteAnimationPointers, ExeggcuteAnimationExtraPointers
	dbbww EXEGGUTOR, BANK(ExeggutorAnimations), ExeggutorAnimationPointers, ExeggutorAnimationExtraPointers
	dbbww MAROWAK, BANK(MarowakAnimations), MarowakAnimationPointers, MarowakAnimationExtraPointers
	dbbww CORSOLA, BANK(CorsolaAnimations), CorsolaAnimationPointers, CorsolaAnimationExtraPointers
	dbbww -1, BANK(PicAnimations), AnimationPointers, AnimationExtraPointers

VariantFramesPointerTable:
	dbbba RAICHU, BANK(RaichusFrames), RaichuFramesPointers
	dbbba SANDSHREW, BANK(SandshrewsFrames), SandshrewFramesPointers
	dbbba SANDSLASH, BANK(SandslashsFrames), SandslashFramesPointers
	dbbba GRIMER, BANK(GrimersFrames), GrimerFramesPointers
	dbbba MUK, BANK(MuksFrames), MukFramesPointers
	dbbba EXEGGCUTE, BANK(ExeggcutesFrames), ExeggcuteFramesPointers
	dbbba EXEGGUTOR, BANK(ExeggutorsFrames), ExeggutorFramesPointers
	dbbba MAROWAK, BANK(MarowaksFrames), MarowakFramesPointers
	dbbba CORSOLA, BANK(CorsolasFrames), CorsolaFramesPointers
	dbbba -1, BANK(PokemonFrames), FramesPointers

VariantBitmasksPointerTable:
	dbba RAICHU, RaichuBitmasksPointers
	dbba SANDSHREW, SandshrewBitmasksPointers
	dbba SANDSLASH, SandslashBitmasksPointers
	dbba GRIMER, GrimerBitmasksPointers
	dbba MUK, MukBitmasksPointers
	dbba EXEGGCUTE, ExeggcuteBitmasksPointers
	dbba EXEGGUTOR, ExeggutorBitmasksPointers
	dbba MAROWAK, MarowakBitmasksPointers
	dbba CORSOLA, CorsolaBitmasksPointers
	dbba -1, BitmasksPointers