PokemonLeagueInside_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 4 ; warp events
	warp_def 19,  7, 1, POKEMON_LEAGUE_OUTSIDE
	warp_def 19,  8, 2, POKEMON_LEAGUE_OUTSIDE
	warp_def  3, 12, 1, POKEMON_LEAGUE_ARENA
	warp_def  3, 13, 1, POKEMON_LEAGUE_ARENA

	db 0 ; coord events

	db 1 ; bg events
	signpost  4, 10, SIGNPOST_READ, PokemonLeagueInsideTest

	db 0 ; object events


PokemonLeagueInsideTest:
	callasm DetermineTourneyBracket
	end
