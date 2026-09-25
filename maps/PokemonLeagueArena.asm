PokemonLeagueArena_MapScriptHeader:
	db 1 ; scene scripts
	scene_script PokemonLeagueArenaTrigger0

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, PokemonLeagueArenaCallback

	db 1 ; warp events
	warp_def  8, 12, 1, POKEMON_LEAGUE_INSIDE

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events


PokemonLeagueArenaTrigger0:
	special Special_UpdatePalsInstant
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