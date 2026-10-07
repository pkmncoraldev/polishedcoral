PokemonLeagueArena_MapScriptHeader:
	db 6 ; scene scripts
	scene_script PokemonLeagueArenaTrigger0
	scene_script PokemonLeagueArenaTrigger1
	scene_script PokemonLeagueArenaTrigger2
	scene_script PokemonLeagueArenaTrigger3
	scene_script PokemonLeagueArenaTrigger4
	scene_script PokemonLeagueArenaTrigger5

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, PokemonLeagueArenaCallback

	db 1 ; warp events
	warp_def  5, 12, 1, POKEMON_LEAGUE_INSIDE

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	person_event SPRITE_PLAYER_CUTSCENE, 10, 12, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ALWAYS_SET
	person_event SPRITE_GENERAL_VARIABLE_1, 10, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ALWAYS_SET
	person_event SPRITE_MOM,  7,  2, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_SPRUCE,  7,  3, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_MISC_PALM,  1,  9, SPRITEMOVEDATA_TILE_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_FAT_GUY,  1,  10, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1

PokemonLeagueArenaTrigger0:
	special Special_UpdatePalsInstant
	end

PokemonLeagueArenaTrigger1:
PokemonLeagueArenaTrigger2:
PokemonLeagueArenaTrigger3:
PokemonLeagueArenaTrigger4:
PokemonLeagueArenaTrigger5:
	priorityjump ArenaEntryScene
	end

ArenaEntryScene:
	applyonemovement PLAYER, hide_person
	callasm LoadMapPals
	special FadeInPalettes
	pause 100
	opentext
	writetext ArenaText1
	waitbutton
	closetext
	pause 25
	special FadeOutPalettesBlack
	warp_stealth RIGHT, POKEMON_LEAGUE_ARENA, 0, 10
	closetext
	callasm LoadMapPals
	special FadeInPalettes
	pause 25
	applymovement PLAYER, Movement_ArenaWalk1
	special Special_UpdatePalsInstant
	applymovement PLAYER, Movement_ArenaWalk1_2
	pause 25
	special FadeOutPalettesBlack
	warp_stealth LEFT, POKEMON_LEAGUE_ARENA, 25, 10
	refreshscreen
	closetext
	callasm PokemonLeagueArenaSetOppSprite
	special MapCallbackSprites_LoadUsedSpritesGFX
	variablesprite2 SPRITE_GENERAL_VARIABLE_1
	appear 1
	writebyte (1 << 7) | (PAL_OW_SILVER << 4)
	special Special_SetPlayerPalette
	applyonemovement PLAYER, remove_fixed_facing
	callasm LoadMapPals
	special FadeInPalettes
	pause 25
	applymovement PLAYER, Movement_ArenaWalk2
	special Special_UpdatePalsInstant
	applymovement PLAYER, Movement_ArenaWalk2_2
	pause 25
	appear 2
	applyonemovement PLAYER, remove_fixed_facing
	applyonemovement PLAYER, hide_person
	applyonemovement PLAYER, slow_step_left
;	spriteface PLAYER, RIGHT
	writecode VAR_MOVEMENT, PLAYER_NORMAL
	special MapCallbackSprites_LoadUsedSpritesGFX
	writebyte (1 << 7) | (PAL_OW_PINK << 4)
	special Special_SetPlayerPalette
;	applyonemovement PLAYER, show_person
;	applyonemovement PLAYER, remove_fixed_facing
;	disappear 1
;	setlasttalked 2
	opentext
	writetext ArenaText2
	waitbutton
	closetext
	applymovement PLAYER, Movement_ArenaWalk3
	pause 25
	opentext
	writetext ArenaText3
	waitbutton
	closetext
	waitsfx
	setevent EVENT_BIG_OW_MON_BATTLE
	winlosstext ArenaText3, ArenaText3
	loadtrainer STANLEY, 1
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	special Special_RestorePlayerPalette
	startbattle
	writebyte (1 << 7) | (PAL_OW_PINK << 4)
	special Special_SetPlayerPalette
	special FadeOutPalettes
	warp_stealth RIGHT, POKEMON_LEAGUE_ARENA, 12, 10
	clearevent EVENT_BIG_OW_MON_BATTLE
	dontrestartmapmusic
	reloadmapafterbattle
	callasm ArenaIncTrigger
	end

PokemonLeagueArenaCallback:
	writebyte (1 << 7) | (PAL_OW_PINK << 4)
	special Special_SetPlayerPalette
	checkevent EVENT_PLAYER_IS_FEMALE
	iftrue .girl
	changeblock 10, 4, 52
	jump .cont
.girl
	changeblock 10, 4, 53
.cont
	checkscene
	if_equal 1, .round1
	if_equal 2, .round2
	if_equal 3, .round3
	if_equal 4, .round4
	jump .cont2
.round1
	changeblock 14, 6, 54
	jump .cont2
.round2
	changeblock 14, 6, 55
	jump .cont2
.round3
	changeblock 14, 6, 58
	jump .cont2
.round4
	changeblock 14, 6, 59
	jump .cont2
.cont2
	callasm PokemonLeagueArenaFindNextOppAsm
	if_equal 1, .stanley
	if_equal 2, .rodney
	if_equal 3, .wendy
	if_equal 4, .charlie
	if_equal 5, .polly
	if_equal 6, .leilani
	if_equal 7, .rocky
	if_equal 8, .darcy
	if_equal 9, .mina
	if_equal 10, .erika
	if_equal 11, .disguise
	if_equal 12, .frankie
	if_equal 13, .ledian
	if_equal 14, .armstrong
	if_equal 15, .master
.stanley
	changeblock 14, 4, 36
	return
.rodney
	changeblock 14, 4, 37
	return
.wendy
	changeblock 14, 4, 38
	return
.charlie
	changeblock 14, 4, 39
	return
.polly
	changeblock 14, 4, 40
	return
.leilani
	changeblock 14, 4, 41
	return
.rocky
	changeblock 14, 4, 42
	return
.darcy
	changeblock 14, 4, 43
	return
.mina
	changeblock 14, 4, 44
	return
.erika
	changeblock 14, 4, 45
	return
.disguise
	changeblock 14, 4, 46
	return
.frankie
	changeblock 14, 4, 47
	return
.ledian
	changeblock 14, 4, 48
	return
.armstrong
	changeblock 14, 4, 49
	return
.master
	changeblock 14, 4, 50
	return

PokemonLeagueArenaFindNextOppAsm:
	farcall TourneyFindNextOpp
	ld [wScriptVar], a
	ret
	
PokemonLeagueArenaSetOppSprite:
	farcall TourneyFindNextOpp
	push af
	add 23	;number of player states before PLAYER_STANLEY
	ld [wPlayerState], a
	pop af
	dec a
	ld e, a
	ld d, 0
	ld hl, ArenaOWSprites
	add hl, de
	ld a, [hl]
	ld [wPlaceBallsY], a
	ret
	
ArenaIncTrigger:
	ld a, [wPokemonLeagueArenaTrigger]
	inc a
	ld [wPokemonLeagueArenaTrigger], a
	ret
	
ArenaText1:
	text "TEXT 1"
	done
	
ArenaText2:
	text "TEXT 2"
	done
	
ArenaText3:
	text "Let the battle"
	line "begin!"
	done
	
ArenaOWSprites:
	db SPRITE_STANLEY
	db SPRITE_RODNEY
	db SPRITE_WENDY
	db SPRITE_CHARLIE
	db SPRITE_POLLY
	db SPRITE_LEILANI
	db SPRITE_ROCKY
	db SPRITE_DARCY
	db SPRITE_MINA
	db SPRITE_ERIKA
	db SPRITE_DISGUISE_MASTER
	db SPRITE_FRANKIE
	db SPRITE_LEDIAN_RANGER_MASK
	db SPRITE_SPA_WORKER
	db SPRITE_MASTER
	
Movement_ArenaMoveToScreen:
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	step_end
	
Movement_ArenaWalk1:
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end
Movement_ArenaWalk1_2:
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end
	
Movement_ArenaWalk2:
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end
Movement_ArenaWalk2_2:
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end
	
Movement_ArenaWalk3:
	slow_step_up
	slow_step_up
	slow_step_up
	slow_step_up
	step_end