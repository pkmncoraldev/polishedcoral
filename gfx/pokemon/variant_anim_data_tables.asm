VariantSpeciesTable:
	db RAICHU
	db MAROWAK
	db EXEGGUTOR
	db -1

VariantAnimPointerTable:
	dbbww RAICHU, BANK(RaichuAnimations), RaichuAnimationPointers, RaichuAnimationExtraPointers
	dbbww MAROWAK, BANK(MarowakAnimations), MarowakAnimationPointers, MarowakAnimationExtraPointers
	dbbww EXEGGUTOR, BANK(ExeggutorAnimations), ExeggutorAnimationPointers, ExeggutorAnimationExtraPointers
	dbbww -1, BANK(PicAnimations), AnimationPointers, AnimationExtraPointers

VariantFramesPointerTable:
	dbbba RAICHU, BANK(RaichuFrames), RaichuFramesPointers
	dbbba MAROWAK, BANK(MarowakFrames), MarowakFramesPointers
	dbbba EXEGGUTOR, BANK(ExeggutorFrames), ExeggutorFramesPointers
	dbbba -1, BANK(PokemonFrames), FramesPointers

VariantBitmasksPointerTable:
	dbba RAICHU, RaichuBitmasksPointers
	dbba MAROWAK, MarowakBitmasksPointers
	dbba EXEGGUTOR, ExeggutorBitmasksPointers
	dbba -1, BitmasksPointers