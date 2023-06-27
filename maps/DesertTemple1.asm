DesertTemple1_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event 12, 27, PLAYER_HOUSE_2F, 14
	warp_event 13, 27, PLAYER_HOUSE_2F, 14

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 11,  7, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, MARACTUS, -1, -1, PAL_NPC_GREEN, PERSONTYPE_SCRIPT, 0, DesertTemple1TextNPC, -1


DesertTemple1TextNPC:
	callasm DesertTemple1SetTimerAsm
	end
	
DesertTemple1SetTimerAsm:
	ld hl, wStatusFlags2
	set 2, [hl] ; ENGINE_BUG_CONTEST_TIMER
	farjp StartTempleTimer