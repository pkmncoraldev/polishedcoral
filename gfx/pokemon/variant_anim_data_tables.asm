VariantSpeciesTable:
	db PIDGEY
	db RATTATA
	db RATICATE
	db RAICHU
	db MEOWTH
	db PERSIAN
	db GRIMER
	db MUK
	db EXEGGCUTE
	db EXEGGUTOR
	db MAROWAK
	db GYARADOS
	db WOOPER
	db CORSOLA
	db SMEARGLE
	db CHERRIM
	db VOLCARONA
	db MIMIKYU
	db -1

VariantAnimPointerTable:
	dbbww PIDGEY, BANK(PidgeyAnimations), PidgeyAnimationPointers, PidgeyAnimationExtraPointers
	dbbww RATTATA, BANK(RattataAnimations), RattataAnimationPointers, RattataAnimationExtraPointers
	dbbww RATICATE, BANK(RaticateAnimations), RaticateAnimationPointers, RaticateAnimationExtraPointers
	dbbww RAICHU, BANK(RaichuAnimations), RaichuAnimationPointers, RaichuAnimationExtraPointers
	dbbww MEOWTH, BANK(MeowthAnimations), MeowthAnimationPointers, MeowthAnimationExtraPointers
	dbbww PERSIAN, BANK(PersianAnimations), PersianAnimationPointers, PersianAnimationExtraPointers
	dbbww GRIMER, BANK(GrimerAnimations), GrimerAnimationPointers, GrimerAnimationExtraPointers
	dbbww MUK, BANK(MukAnimations), MukAnimationPointers, MukAnimationExtraPointers
	dbbww EXEGGCUTE, BANK(ExeggcuteAnimations), ExeggcuteAnimationPointers, ExeggcuteAnimationExtraPointers
	dbbww EXEGGUTOR, BANK(ExeggutorAnimations), ExeggutorAnimationPointers, ExeggutorAnimationExtraPointers
	dbbww MAROWAK, BANK(MarowakAnimations), MarowakAnimationPointers, MarowakAnimationExtraPointers
	dbbww GYARADOS, BANK(GyaradosAnimations), GyaradosAnimationPointers, GyaradosAnimationExtraPointers
	dbbww WOOPER, BANK(WooperAnimations), WooperAnimationPointers, WooperAnimationExtraPointers
	dbbww CORSOLA, BANK(CorsolaAnimations), CorsolaAnimationPointers, CorsolaAnimationExtraPointers
	dbbww SMEARGLE, BANK(SmeargleAnimations), SmeargleAnimationPointers, SmeargleAnimationExtraPointers
	dbbww CHERRIM, BANK(CherrimAnimations), CherrimAnimationPointers, CherrimAnimationExtraPointers
	dbbww VOLCARONA, BANK(VolcaronaAnimations), VolcaronaAnimationPointers, VolcaronaAnimationExtraPointers
	dbbww MIMIKYU, BANK(MimikyuAnimations), MimikyuAnimationPointers, MimikyuAnimationExtraPointers
	dbbww -1, BANK(PicAnimations), AnimationPointers, AnimationExtraPointers

VariantFramesPointerTable:
	dbbba PIDGEY, BANK(PidgeysFrames), PidgeyFramesPointers
	dbbba RATTATA, BANK(RattatasFrames), RattataFramesPointers
	dbbba RATICATE, BANK(RaticatesFrames), RaticateFramesPointers
	dbbba RAICHU, BANK(RaichusFrames), RaichuFramesPointers
	dbbba MEOWTH, BANK(MeowthsFrames), MeowthFramesPointers
	dbbba PERSIAN, BANK(PersiansFrames), PersianFramesPointers
	dbbba GRIMER, BANK(GrimersFrames), GrimerFramesPointers
	dbbba MUK, BANK(MuksFrames), MukFramesPointers
	dbbba EXEGGCUTE, BANK(ExeggcutesFrames), ExeggcuteFramesPointers
	dbbba EXEGGUTOR, BANK(ExeggutorsFrames), ExeggutorFramesPointers
	dbbba MAROWAK, BANK(MarowaksFrames), MarowakFramesPointers
	dbbba GYARADOS, BANK(GyaradossFrames), GyaradosFramesPointers
	dbbba WOOPER, BANK(WoopersFrames), WooperFramesPointers
	dbbba CORSOLA, BANK(CorsolasFrames), CorsolaFramesPointers
	dbbba SMEARGLE, BANK(SmearglesFrames), SmeargleFramesPointers
	dbbba CHERRIM, BANK(CherrimsFrames), CherrimFramesPointers
	dbbba VOLCARONA, BANK(VolcaronaFrames), VolcaronaFramesPointers
	dbbba MIMIKYU, BANK(MimikyusFrames), MimikyuFramesPointers
	dbbba -1, BANK(PokemonFrames), FramesPointers

VariantBitmasksPointerTable:
	dbba PIDGEY, PidgeyBitmasksPointers
	dbba RATTATA, RattataBitmasksPointers
	dbba RATICATE, RaticateBitmasksPointers
	dbba RAICHU, RaichuBitmasksPointers
	dbba MEOWTH, MeowthBitmasksPointers
	dbba PERSIAN, PersianBitmasksPointers
	dbba GRIMER, GrimerBitmasksPointers
	dbba MUK, MukBitmasksPointers
	dbba EXEGGCUTE, ExeggcuteBitmasksPointers
	dbba EXEGGUTOR, ExeggutorBitmasksPointers
	dbba MAROWAK, MarowakBitmasksPointers
	dbba GYARADOS, GyaradosBitmasksPointers
	dbba WOOPER, WooperBitmasksPointers
	dbba CORSOLA, CorsolaBitmasksPointers
	dbba SMEARGLE, SmeargleBitmasksPointers
	dbba CHERRIM, CherrimBitmasksPointers
	dbba VOLCARONA, VolcaronaBitmasksPointers
	dbba MIMIKYU, MimikyuBitmasksPointers
	dbba -1, BitmasksPointers