LusterMallElectronicsShop_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def  7,  6, 7, LUSTER_MALL
	warp_def  7,  7, 8, LUSTER_MALL

	db 0 ; coord events

	db 0 ; bg events

	db 8 ; object events
	object_event  2,  5, SPRITE_SNES, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, GameConsole, -1
	object_event  2,  5, SPRITE_SNES, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GameConsole, -1
	object_event  1,  5, SPRITE_SNES, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, GameConsole, -1
	object_event  1,  5, SPRITE_SNES, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GameConsole, -1
	person_event SPRITE_CHILD,  6,  1, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LusterMallElectronicsShop_NPC1, -1
	person_event SPRITE_SUPER_NERD,  5,  0, SPRITEMOVEDATA_WANDER, 0, 1, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, LusterMallElectronicsShop_NPC2, -1
	person_event SPRITE_CUTE_GIRL,  2,  6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, LusterMallElectronicsShop_NPC3, -1
	person_event SPRITE_CLERK,  4,  9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LusterMallElectronicsShop_Clerk, -1

	
LusterMallElectronicsShop_NPC1:
LusterMallElectronicsShop_NPC2:
LusterMallElectronicsShop_NPC3:
LusterMallElectronicsShop_Clerk:
	end
