DesertTemple2_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, DesertTemple2Callback

	db 2 ; warp events
	warp_event  4, 17, DESERT_TEMPLE_1, 11
	warp_event  5, 17, DESERT_TEMPLE_1, 12

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	person_event SPRITE_DISGUISEMAN,  2,  5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, DesertTemple2Pokeball, EVENT_DESERT_TEMPLE_2_POKE_BALL
	object_event -6, -6, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, VOLCARONA, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, DesertTemple2Pokeball, EVENT_ALWAYS_SET
	person_event SPRITE_GRIMER_A_OW, -6, -6, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, DesertTemple2Pokeball, EVENT_ALWAYS_SET
	person_event SPRITE_DISGUISEMAN,  2,  5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, DesertTemple2Pokeball, EVENT_ALWAYS_SET

	const_def 1 ; object constants
	const DESERT_TEMPLE_2_POKEBALL
	const DESERT_TEMPLE_2_VOLCARONA
	const DESERT_TEMPLE_2_VOLCARONA_2
	const DESERT_TEMPLE_2_POKEBALL_DUMMY

DesertTemple2Callback:
	checkevent EVENT_DESERT_TEMPLE_VOLCARONA_GONE
	iffalse .end
	changeblock $2, $2, $ca
	changeblock $6, $2, $cb
	changeblock $2, $c, $ca
	changeblock $6, $c, $cb
	changeblock $0, $4, $ca
	changeblock $8, $4, $cb
.end
	return

DesertTemple2Pokeball:
	checkevent EVENT_DESERT_TEMPLE_VOLCARONA_GONE
	iftrue .NormalBall
	moveperson DESERT_TEMPLE_2_VOLCARONA, 5, -1
	moveperson DESERT_TEMPLE_2_VOLCARONA_2, 5, 3
	checkcode VAR_FACING
	ifequal UP, .cont
	moveperson DESERT_TEMPLE_2_VOLCARONA, 4, -2
	moveperson DESERT_TEMPLE_2_VOLCARONA_2, 4, 2
.cont
	appear DESERT_TEMPLE_2_VOLCARONA
	appear DESERT_TEMPLE_2_POKEBALL_DUMMY
	opentext
	playsound SFX_ITEM_FAKE
	writetext DesertTemple2PokeballText1
	pause 13
	special SaveMusic
	playmusic MUSIC_NONE
	spriteface PLAYER, UP
	writetext DesertTemple2PokeballText2
	cry VOLCARONA
	waitsfx
	pause 5
	closetext
	pause 30
	
	playsound SFX_MORNING_SUN
	special FadeOutPalettes
	changeblock $2, $2, $ca
	changeblock $6, $2, $cb
	callasm GenericFinishBridge
	callasm LoadMapPals
	special FadeInPalettes
	waitsfx
	pause 25
	playsound SFX_MORNING_SUN
	special FadeOutPalettes
	changeblock $0, $4, $ca
	changeblock $8, $4, $cb
	callasm GenericFinishBridge
	callasm LoadMapPals
	special FadeInPalettes
	waitsfx
	
	pause 40
;	cry VOLCARONA
;	waitsfx
;	pause 30
	playsound SFX_WHIRLWIND
	pause 5
	disappear DESERT_TEMPLE_2_POKEBALL
	applymovement DESERT_TEMPLE_2_VOLCARONA, Movement_DesertTemple2Shadow
	appear DESERT_TEMPLE_2_POKEBALL
	callasm DesertTemple2FallOverAsm
	killsfx
	appear DESERT_TEMPLE_2_VOLCARONA_2
	clearevent EVENT_DESERT_TEMPLE_2_POKE_BALL
	playsound SFX_BEAT_UP
	applymovement PLAYER, Movement_DesertTemple2ShadowPlayerFall1
	playsound SFX_SUBMISSION
	applymovement PLAYER, Movement_DesertTemple2ShadowPlayerFall2
	disappear DESERT_TEMPLE_2_VOLCARONA
	disappear DESERT_TEMPLE_2_POKEBALL_DUMMY
	pause 20
	special Special_ForcePlayerStateNormal
	pause 30
	
	cry VOLCARONA
	waitsfx
	playsound SFX_METRONOME
	special FadeOutPalettes
	callasm DesertTemple2ForceDayPal
	callasm LoadMapPals
	special FadeInPalettes
	opentext
	writetext DesertTemple2BrilliantLightText
	waitbutton
	closetext
	
rept 2
	pause 30
	playsound SFX_BIND
	applymovement DESERT_TEMPLE_2_VOLCARONA_2, Movement_DesertTemple2ShadowPlayerFall2
endr
	pause 60
	opentext
	writetext DesertTemple2VolcaronaText
	cry VOLCARONA
	waitbutton
	closetext
	setevent EVENT_ALWAYS_SET
	waitsfx
	loadwildmon VOLCARONA, 45
	writecode VAR_BATTLETYPE, BATTLETYPE_LEGENDARY
	startbattle
	disappear DESERT_TEMPLE_2_VOLCARONA_2
	reloadmapafterbattle
	changeblock $2, $c, $ca
	changeblock $6, $c, $cb
	callasm GenericFinishBridge
	setevent EVENT_DESERT_TEMPLE_VOLCARONA_GONE
	checkcode VAR_MONJUSTCAUGHT
	if_equal VOLCARONA, .CaughtVolcarona
	opentext
	writetext DesertTemple2VolcaronaTextGone
	waitbutton
	closetext
.CaughtVolcarona
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	end
.NormalBall
	setevent EVENT_DESERT_TEMPLE_2_POKE_BALL
	callasm DesertTemple2SetItemAsm
	farjump FindItemInBallScript
	end
	
DesertTemple2ForceDayPal:
	ld a, 1
	ld [wTimeOfDayPal], a
	ret
	
DesertTemple2SetItemAsm:
	ld a, BLACK_PEARL
	ld [wCurItemBallContents], a
	ld a, 1
	ld [wCurItemBallQuantity], a
	ret
	
DesertTemple2FallOverAsm:
	ld a, PLAYER_FALLING
	ld [wPlayerState], a
	call ReplaceKrisSprite
	ret
	
DesertTemple2BrilliantLightText:
	text "The room flooded"
	line "with a brilliant"
	cont "light!"
	done
	
DesertTemple2PokeballText1:
	text "<PLAYER> found"
	done
	
DesertTemple2PokeballText2:
	text "Huh?"
	done
	
DesertTemple2VolcaronaText:
	text "GYAAAAOOOOOH"
	done
	
DesertTemple2VolcaronaTextGone:
	text "VOLCARONA flew"
	line "out of view!"
	done
	
Movement_DesertTemple2Shadow:
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	step_end
	
Movement_DesertTemple2ShadowPlayerFall1:
	fix_facing
	jump_step_down
	remove_fixed_facing
	step_end
	
Movement_DesertTemple2ShadowPlayerFall2:
	fix_facing
	slow_step_down
	remove_fixed_facing
	step_end