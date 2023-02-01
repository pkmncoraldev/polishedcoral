VariantSpeciesTable:
	db EXEGGCUTE
	db EXEGGUTOR
	db -1

VariantAnimPointerTable:
	dbbww EXEGGCUTE, BANK(ExeggcuteAnimations), ExeggcuteAnimationPointers, ExeggcuteAnimationExtraPointers
	dbbww EXEGGUTOR, BANK(ExeggutorAnimations), ExeggutorAnimationPointers, ExeggutorAnimationExtraPointers
	dbbww -1, BANK(PicAnimations), AnimationPointers, AnimationExtraPointers

VariantFramesPointerTable:
	dbbba EXEGGCUTE, BANK(ExeggcutesFrames), ExeggcuteFramesPointers
	dbbba EXEGGUTOR, BANK(ExeggutorsFrames), ExeggutorFramesPointers
	dbbba -1, BANK(PokemonFrames), FramesPointers

VariantBitmasksPointerTable:
	dbba EXEGGCUTE, ExeggcuteBitmasksPointers
	dbba EXEGGUTOR, ExeggutorBitmasksPointers
	dbba -1, BitmasksPointers