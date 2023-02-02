VariantSpeciesTable:
	db RAICHU
	db GRIMER
	db MUK
	db EXEGGCUTE
	db EXEGGUTOR
	db MAROWAK
	db -1

VariantAnimPointerTable:
	dbbww RAICHU, BANK(RaichuAnimations), RaichuAnimationPointers, RaichuAnimationExtraPointers
	dbbww GRIMER, BANK(GrimerAnimations), GrimerAnimationPointers, GrimerAnimationExtraPointers
	dbbww MUK, BANK(MukAnimations), MukAnimationPointers, MukAnimationExtraPointers
	dbbww EXEGGCUTE, BANK(ExeggcuteAnimations), ExeggcuteAnimationPointers, ExeggcuteAnimationExtraPointers
	dbbww EXEGGUTOR, BANK(ExeggutorAnimations), ExeggutorAnimationPointers, ExeggutorAnimationExtraPointers
	dbbww MAROWAK, BANK(MarowakAnimations), MarowakAnimationPointers, MarowakAnimationExtraPointers
	dbbww -1, BANK(PicAnimations), AnimationPointers, AnimationExtraPointers

VariantFramesPointerTable:
	dbbba RAICHU, BANK(RaichusFrames), RaichuFramesPointers
	dbbba GRIMER, BANK(GrimersFrames), GrimerFramesPointers
	dbbba MUK, BANK(MuksFrames), MukFramesPointers
	dbbba EXEGGCUTE, BANK(ExeggcutesFrames), ExeggcuteFramesPointers
	dbbba EXEGGUTOR, BANK(ExeggutorsFrames), ExeggutorFramesPointers
	dbbba MAROWAK, BANK(MarowaksFrames), MarowakFramesPointers
	dbbba -1, BANK(PokemonFrames), FramesPointers

VariantBitmasksPointerTable:
	dbba RAICHU, RaichuBitmasksPointers
	dbba GRIMER, GrimerBitmasksPointers
	dbba MUK, MukBitmasksPointers
	dbba EXEGGCUTE, ExeggcuteBitmasksPointers
	dbba EXEGGUTOR, ExeggutorBitmasksPointers
	dbba MAROWAK, MarowakBitmasksPointers
	dbba -1, BitmasksPointers