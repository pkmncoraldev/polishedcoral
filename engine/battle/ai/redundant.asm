AI_Redundant: ; 2c41a
; Check if move effect c will fail because it's already been used.
; Return z if the move is a good choice.
; Return nz if the move is a bad choice.
	ld a, c
	ld de, 3
	ld hl, .Moves
	call IsInArray
	jp nc, .NotRedundant
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Moves: ; 2c42c
	dbw EFFECT_DREAM_EATER,   .DreamEater
	dbw EFFECT_HEAL,          .Heal
	dbw EFFECT_LIGHT_SCREEN,  .LightScreen
	dbw EFFECT_FOCUS_ENERGY,  .FocusEnergy
	dbw EFFECT_CONFUSE,       .Confuse
	dbw EFFECT_TRANSFORM,     .Transform
	dbw EFFECT_REFLECT,       .Reflect
	dbw EFFECT_SUBSTITUTE,    .Substitute
	dbw EFFECT_LEECH_SEED,    .LeechSeed
	dbw EFFECT_DISABLE,       .Disable
	dbw EFFECT_ENCORE,        .Encore
	dbw EFFECT_SNORE,    	  .Snore
	dbw EFFECT_MEAN_LOOK,     .MeanLook
	dbw EFFECT_SPIKES,        .Spikes
	dbw EFFECT_TOXIC_SPIKES,  .ToxicSpikes
	dbw EFFECT_FORESIGHT,     .Foresight
	dbw EFFECT_PERISH_SONG,   .PerishSong
	dbw EFFECT_SANDSTORM,     .Sandstorm
	dbw EFFECT_HAIL,          .Hail
	dbw EFFECT_ATTRACT,       .Attract
	dbw EFFECT_SAFEGUARD,     .Safeguard
	dbw EFFECT_RAIN_DANCE,    .RainDance
	dbw EFFECT_SUNNY_DAY,     .SunnyDay
	dbw EFFECT_TELEPORT,      .Teleport
	dbw EFFECT_HEALING_LIGHT, .HealingLight
	dbw EFFECT_SWAGGER,       .Swagger
	dbw EFFECT_FUTURE_SIGHT,  .FutureSight
	dbw EFFECT_BATON_PASS,    .BatonPass
	dbw EFFECT_ROOST,         .Roost
	dbw EFFECT_FAKE_OUT,	  .FakeOut
	dbw EFFECT_WISH,     	  .Wish
	dbw EFFECT_TAUNT,		  .Taunt
	db -1

.Confuse:
	ld a, [wPlayerSubStatus3]
	bit SUBSTATUS_CONFUSED, a
	ret nz
	ld a, [wPlayerScreens]
	bit SCREENS_SAFEGUARD, a
	ret

.Disable:
	ld a, [wPlayerDisableCount]
	and a
	ret

.Encore:
	ld a, [wPlayerSubStatus2]
	bit SUBSTATUS_ENCORED, a
	ret

.FocusEnergy:
	ld a, [wEnemySubStatus4]
	bit SUBSTATUS_FOCUS_ENERGY, a
	ret

.Foresight:
	ld a, [wPlayerSubStatus1]
	bit SUBSTATUS_IDENTIFIED, a
	ret

.FutureSight:
	ld a, [wEnemyFutureSightCount]
	and a
	ret

.LeechSeed:
	ld a, [wPlayerSubStatus4]
	bit SUBSTATUS_LEECH_SEED, a
	ret

.LightScreen:
	ld a, [wEnemyScreens]
	bit SCREENS_LIGHT_SCREEN, a
	ret

.MeanLook:
	ld a, [wEnemySubStatus2]
	bit SUBSTATUS_CANT_RUN, a
	ret
	
.Taunt:
	ld a, [wPlayerSubStatus2]
	bit SUBSTATUS_TAUNT, a
	ret

.PerishSong:
	ld a, [wPlayerSubStatus1]
	bit SUBSTATUS_PERISH, a
	ret
	
.FakeOut:
	ld a, [wEnemyTurnsTaken]
	cp 0
	jp nz, .Redundant
	jp .NotRedundant

.Reflect:
	ld a, [wEnemyScreens]
	bit SCREENS_REFLECT, a
	ret

.Safeguard:
	ld a, [wEnemyScreens]
	bit SCREENS_SAFEGUARD, a
	ret
	
.Wish:
	ld a, [wEnemyScreens]
	bit SCREENS_WISH, a
	ret

.Substitute:
	ld a, [wEnemySubStatus4]
	bit SUBSTATUS_SUBSTITUTE, a
	ret

.Swagger:
	ld a, [wPlayerSubStatus3]
	bit SUBSTATUS_CONFUSED, a
	ret

.Transform:
	ld a, [wEnemySubStatus2]
	bit SUBSTATUS_TRANSFORMED, a
	ret

.Snore:
	ld a, [wEnemyMonStatus]
	and SLP
	jr .InvertZero

.Spikes:
	ld a, [wPlayerScreens]
	and SCREENS_SPIKES
	cp SCREENS_SPIKES
	jr .InvertZero

.ToxicSpikes:
	ld a, [wPlayerScreens]
	and SCREENS_TOXIC_SPIKES
	cp (SCREENS_TOXIC_SPIKES / 3) * 2
	jr .InvertZero
	
.Sandstorm:
	ld a, [wWeather]
	cp WEATHER_SANDSTORM
	jr .InvertZero

.Hail:
	ld a, [wWeather]
	cp WEATHER_HAIL
	jr .InvertZero

.Attract:
	farcall CheckOppositeGender
	jr c, .Redundant
	jr z, .Redundant
	ld a, [wPlayerSubStatus1]
	bit SUBSTATUS_IN_LOVE, a
	ret

.RainDance:
	ld a, [wWeather]
	cp WEATHER_RAIN
	jr .InvertZero

.SunnyDay:
	ld a, [wWeather]
	cp WEATHER_SUN
	jr .InvertZero

.DreamEater:
	ld a, [wBattleMonStatus]
	and SLP
	jr .InvertZero

.BatonPass:
	farcall CheckAnyOtherAliveMons
	jr z, .Redundant
	ld a, [wEnemySubStatus3]
	bit SUBSTATUS_CONFUSED, a
	jr nz, .Redundant
	ld a, [wEnemySubStatus4]
	bit SUBSTATUS_SUBSTITUTE, a
	jr nz, .NotRedundant
	ld hl, wEnemyAtkLevel
	ld c, $8
.stat_level_loop
	dec c
	jr z, .Redundant
	ld a, [hli]
	cp $9
	jr c, .stat_level_loop
	jr .NotRedundant
.InvertZero:
	jr z, .Redundant
.NotRedundant:
	xor a
	ret
	
.Heal:
.HealingLight:
.Roost:
	farcall AICheckEnemyMaxHP
	jr nc, .NotRedundant

.Teleport:
.Redundant:
	ld a, 1
	and a
	ret
