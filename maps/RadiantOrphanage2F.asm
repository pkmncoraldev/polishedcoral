RadiantOrphanage2F_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, RadiantOrphanage2FCallback

	db 1 ; warp events
	warp_def  3, 15, 4, RADIANT_ORPHANAGE_1F

	db 0 ; coord events

	db 16 ; bg events
	signpost  2, 12, SIGNPOST_READ, RadiantOrphanage2FPhoto
	signpost  2,  6, SIGNPOST_JUMPTEXT, RadiantOrphanage2FRoseBedText
	signpost  3,  6, SIGNPOST_JUMPTEXT, RadiantOrphanage2FRoseBedText
	signpost  2,  8, SIGNPOST_JUMPTEXT, RadiantOrphanage2FLilyBedText
	signpost  3,  8, SIGNPOST_JUMPTEXT, RadiantOrphanage2FLilyBedText
	signpost  2, 10, SIGNPOST_JUMPTEXT, RadiantOrphanage2FIrisBedText
	signpost  3, 10, SIGNPOST_JUMPTEXT, RadiantOrphanage2FIrisBedText
	signpost  6,  6, SIGNPOST_JUMPTEXT, RadiantOrphanage2FPoppyBedText
	signpost  7,  6, SIGNPOST_JUMPTEXT, RadiantOrphanage2FPoppyBedText
	signpost  6, 10, SIGNPOST_JUMPTEXT, RadiantOrphanage2FVioletBedText
	signpost  7, 10, SIGNPOST_JUMPTEXT, RadiantOrphanage2FVioletBedText
	signpost  6, 12, SIGNPOST_JUMPTEXT, RadiantOrphanage2FCloverBedText
	signpost  7, 12, SIGNPOST_JUMPTEXT, RadiantOrphanage2FCloverBedText
	signpost  6,  8, SIGNPOST_JUMPTEXT, RadiantOrphanage2FFeliciaBedText
	signpost  7,  8, SIGNPOST_JUMPTEXT, RadiantOrphanage2FFeliciaBedText
	signpost  3,  4, SIGNPOST_UP, RadiantOrphanage2FBookshelf

	db 7 ; object events
	object_event  7,  2, SPRITE_PIGTAILS, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, RadiantOrphanage2FRose, EVENT_RADIANT_GYM_ACTIVE
	object_event  9,  6, SPRITE_PIGTAILS, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, RadiantOrphanage2FLily, EVENT_RADIANT_GYM_ACTIVE
	object_event 11,  3, SPRITE_PIGTAILS, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, RadiantOrphanage2FIris, EVENT_RADIANT_GYM_ACTIVE
	object_event  1,  4, SPRITE_PIGTAILS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, RadiantOrphanage2FPoppy, EVENT_RADIANT_GYM_ACTIVE
	object_event 11,  7, SPRITE_PIGTAILS, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, RadiantOrphanage2FViolet, EVENT_RADIANT_GYM_ACTIVE
	object_event  0,  6, SPRITE_PIGTAILS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, RadiantOrphanage2FClover, EVENT_RADIANT_GYM_ACTIVE
	object_event  3,  4, SPRITE_PIGTAILS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, RadiantOrphanage2FFelicia, EVENT_RADIANT_GYM_ACTIVE


	const_def 1 ; object constants
	const RADIANT_ORPHANAGE_2F_ROSE
	const RADIANT_ORPHANAGE_2F_LILY
	const RADIANT_ORPHANAGE_2F_IRIS
	const RADIANT_ORPHANAGE_2F_POPPY
	const RADIANT_ORPHANAGE_2F_VIOLET
	const RADIANT_ORPHANAGE_2F_CLOVER
	const RADIANT_ORPHANAGE_2F_FELICIA

RadiantOrphanage2FCallback:
	checkevent EVENT_SAVED_ALL_LOST_GIRLS
	iftrue .end
	moveperson RADIANT_ORPHANAGE_2F_ROSE, -5, -5
	moveperson RADIANT_ORPHANAGE_2F_LILY, -5, -5
	moveperson RADIANT_ORPHANAGE_2F_IRIS, -5, -5
	moveperson RADIANT_ORPHANAGE_2F_POPPY, -5, -5
	moveperson RADIANT_ORPHANAGE_2F_VIOLET, -5, -5
	moveperson RADIANT_ORPHANAGE_2F_CLOVER, -5, -5
	moveperson RADIANT_ORPHANAGE_2F_FELICIA, -5, -5
.end
	return
	
RadiantOrphanage2FBookshelf:
	jumptext RadiantOrphanage2FBookshelfText
	
RadiantOrphanage2FBookshelfText:
	text "Children's books."
	
	para "Among them is a"
	line "single automotive"
	cont "magazine."
	done
	
RadiantOrphanage2FRoseBedText:
	text "A bed with red"
	line "sheets."
	
	para "The sign over the"
	line "headboard says"
	cont "“ROSE”."
	done
	
RadiantOrphanage2FLilyBedText:
	text "A bed with pink"
	line "sheets."
	
	para "The sign over the"
	line "headboard says"
	cont "“LILY”."
	done
	
RadiantOrphanage2FIrisBedText:
	text "A bed with blue"
	line "sheets."
	
	para "The sign over the"
	line "headboard says"
	cont "“IRIS”."
	done

RadiantOrphanage2FPoppyBedText:
	text "A bed with brown"
	line "sheets."
	
	para "The sign over the"
	line "headboard says"
	cont "“POPPY”."
	done
	
RadiantOrphanage2FVioletBedText:
	text "A bed with purple"
	line "sheets."
	
	para "The sign over the"
	line "headboard says"
	cont "“VIOLET”."
	done
	
RadiantOrphanage2FCloverBedText:
	text "A bed with green"
	line "sheets."
	
	para "The sign over the"
	line "headboard says"
	cont "“CLOVER”."
	done
	
RadiantOrphanage2FFeliciaBedText:
	text "A bed with teal"
	line "sheets."
	
	para "The sign over the"
	line "headboard says"
	cont "“FELICIA”."
	done

RadiantOrphanage2FRose:
	jumptextfaceplayer TEXTBOX_ROSE, RadiantOrphanage2FRoseText
	
RadiantOrphanage2FRoseText:
	text "MS. ERIKA told me"
	line "that they don't"
	cont "have sunflowers"
	cont "where she lives."
	
	para "Isn't that sad?"
	done
	
RadiantOrphanage2FLily:
	jumptextfaceplayer TEXTBOX_LILY, RadiantOrphanage2FLilyText
	
RadiantOrphanage2FLilyText:
	text "GRAMMA is feeling"
	line "better, but now"
	cont "MS. ERIKA is going"
	cont "to leave!"
	
	para "WAHHHH!"
	done
	
RadiantOrphanage2FIris:
	jumptextfaceplayer TEXTBOX_IRIS, RadiantOrphanage2FIrisText
	
RadiantOrphanage2FIrisText:
	text "La <WAIT_S>la <WAIT_S>la!"
	
	para "Oh, hi!"
	
	para "Teehee!"
	done
	
RadiantOrphanage2FPoppy:
	faceplayer 
	opentext TEXTBOX_POPPY
	writetext RadiantOrphanage2FPoppyText
	waitbutton
	closetext
	spriteface RADIANT_ORPHANAGE_2F_POPPY, LEFT
	end
	
RadiantOrphanage2FPoppyText:
	text "Training #MON"
	line "is fun, but I"
	cont "wanna build cars"
	cont "when I grow up!"
	done
	
RadiantOrphanage2FViolet:
	jumptextfaceplayer TEXTBOX_VIOLET, RadiantOrphanage2FVioletText
	
RadiantOrphanage2FVioletText:
	text "I love to sniff"
	line "the flowers in"
	cont "the meadow."
	
	para "But every time I"
	line "do, I sneeze!"
	
	para "I hope I'm not"
	line "allergic…"
	done
	
RadiantOrphanage2FClover:
	jumptextfaceplayer TEXTBOX_CLOVER, RadiantOrphanage2FCloverText
	
RadiantOrphanage2FCloverText:
	text "I shouldn't act out"
	line "if it's going to"
	cont "make GRAMMA worry…"
	done
	
RadiantOrphanage2FFelicia:
	faceplayer 
	opentext TEXTBOX_FELICIA
	writetext RadiantOrphanage2FFeliciaText
	waitbutton
	closetext
	spriteface RADIANT_ORPHANAGE_2F_FELICIA, UP
	end
	
RadiantOrphanage2FFeliciaText:
	text "Hehe!"
	
	para "Watching cartoons"
	line "is fun!"
	
	para "The kitties on TV"
	line "can't scratch me"
	cont "like that mean"
	cont "MEOWTH did!"
	done

RadiantOrphanage2FPhoto:
	checkevent EVENT_LOST_GIRLS_QUEST_ACTIVE
	iftrue .know_erika
	jumptext RadiantOrphanage2FPhotoText1
.know_erika
	jumptext RadiantOrphanage2FPhotoText2
	
RadiantOrphanage2FPhotoText1:
	text "A photo of a"
	line "middle-aged woman"
	cont "and a little girl."
	
	para "They are wearing"
	line "kimonos."
	done
	
RadiantOrphanage2FPhotoText2:
	text "A photo of a much"
	line "younger looking"
	cont "LEILANI and ERIKA."
	
	para "They are wearing"
	line "kimonos."
	done