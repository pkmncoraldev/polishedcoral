VariantSpeciesTable:
	db RAICHU
;	db PIKACHU
;	db PICHU
;	db ARBOK
;	db MAGIKARP
;	db GYARADOS
;	db MEWTWO
	db -1

VariantAnimPointerTable:
	dbbww RAICHU, BANK(RaichuAnimations), RaichuAnimationPointers, RaichuAnimationExtraPointers
	dbbww -1, BANK(PicAnimations), AnimationPointers, AnimationExtraPointers

VariantFramesPointerTable:
	dbbba RAICHU, BANK(RaichuFrames), RaichuFramesPointers
	dbbba -1, BANK(PokemonFrames), FramesPointers

VariantBitmasksPointerTable:
	dbba RAICHU, RaichuBitmasksPointers
	dbba -1, BitmasksPointers