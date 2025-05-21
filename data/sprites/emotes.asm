MACRO emote
; graphics pointer, length, starting tile
	dw \1
	db \2 tiles, BANK(\1)
	dw VTiles0 tile \3
ENDM

EmotesPointers:
	emote ShockEmote,      3, $78 ; EMOTE_SHOCK
	emote QuestionEmote,   3, $78 ; EMOTE_QUESTION
	emote HappyEmote,      3, $78 ; EMOTE_HAPPY
	emote SadEmote,        3, $78 ; EMOTE_SAD
	emote HeartEmote,      3, $78 ; EMOTE_HEART
	emote BoltEmote,       3, $78 ; EMOTE_HEART
	emote SleepEmote,      3, $78 ; EMOTE_SLEEP
	emote FishEmote,       3, $78 ; EMOTE_FISH
	emote JumpShadowGFX,   1, $7b ; EMOTE_SHADOW
	emote FishingRodGFX,   2, $7a ; EMOTE_ROD
	emote BoulderDustGFX,  2, $7c ; EMOTE_BOULDER_DUST
	emote ShakingGrassGFX, 1, $7e ; EMOTE_SHAKING_GRASS
	emote PuddleSplashGFX, 1, $7f ; EMOTE_PUDDLE_SPLASH
	emote ShakingSnowGFX,  1, $7e ; EMOTE_SHAKING_SNOW
	emote PuddleSplashGFX, 1, $7f ; EMOTE_PUDDLE_SPLASH_2
	emote ShakingPollenGFX, 1, $7d ; EMOTE_POLLEN_PUFF
