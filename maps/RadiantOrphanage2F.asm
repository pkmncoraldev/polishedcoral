RadiantOrphanage2F_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, RadiantOrphanage2FCallback

	db 1 ; warp events
	warp_def  3, 14, 4, RADIANT_ORPHANAGE_1F

	db 0 ; coord events

	db 1 ; bg events
	signpost  2, 12, SIGNPOST_READ, RadiantOrphanage2FPhoto

	db 7 ; object events
	object_event  7,  2, SPRITE_PIGTAILS, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, RadiantOrphanage2FRose, EVENT_RADIANT_GYM_ACTIVE
	object_event  3,  5, SPRITE_PIGTAILS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, RadiantOrphanage2FLily, EVENT_RADIANT_GYM_ACTIVE
	object_event 11,  3, SPRITE_PIGTAILS, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, RadiantOrphanage2FIris, EVENT_RADIANT_GYM_ACTIVE
	object_event  1,  4, SPRITE_PIGTAILS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, RadiantOrphanage2FPoppy, EVENT_RADIANT_GYM_ACTIVE
	object_event 11,  7, SPRITE_PIGTAILS, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, RadiantOrphanage2FViolet, EVENT_RADIANT_GYM_ACTIVE
	object_event  2,  4, SPRITE_PIGTAILS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, RadiantOrphanage2FClover, EVENT_RADIANT_GYM_ACTIVE
	object_event  9,  6, SPRITE_PIGTAILS, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, RadiantOrphanage2FFelicia, EVENT_RADIANT_GYM_ACTIVE


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

RadiantOrphanage2FRose:
	jumptextfaceplayer RadiantOrphanage2FRoseText
	
RadiantOrphanage2FRoseText:
	text "MS. ERIKA told me"
	line "that they don't"
	cont "have sunflowers"
	cont "where she lives."
	
	para "Isn't that sad?"
	done
	
RadiantOrphanage2FLily:
	faceplayer 
	opentext
	writetext RadiantOrphanage2FLilyText
	waitbutton
	closetext
	spriteface RADIANT_ORPHANAGE_2F_LILY, UP
	end
	
RadiantOrphanage2FLilyText:
	text "GRAMMA is feeling"
	line "better, but now"
	cont "MS. ERIKA is going"
	cont "to leave!"
	
	para "WAHHHH!"
	done
	
RadiantOrphanage2FIris:
	jumptextfaceplayer RadiantOrphanage2FIrisText
	
RadiantOrphanage2FIrisText:
	text "La <WAIT_S>la <WAIT_S>la!"
	
	para "Oh, hi!"
	
	para "Teehee!"
	done
	
RadiantOrphanage2FPoppy:
	faceplayer 
	opentext
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
	jumptextfaceplayer RadiantOrphanage2FVioletText
	
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
	faceplayer 
	opentext
	writetext RadiantOrphanage2FCloverText
	waitbutton
	closetext
	spriteface RADIANT_ORPHANAGE_2F_CLOVER, RIGHT
	end
	
RadiantOrphanage2FCloverText:
	text "I shouldn't act out"
	line "if it's going to"
	cont "make GRAMMA worry…"
	done
	
RadiantOrphanage2FFelicia:
	jumptextfaceplayer RadiantOrphanage2FFeliciaText
	
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
	cont "LEILANI and a"
	cont "little girl."
	
	para "They are wearing"
	line "kimonos."
	done