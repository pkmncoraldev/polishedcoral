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

	db 2 ; warp events
	warp_def  5, 12, 1, POKEMON_LEAGUE_INSIDE
	warp_def 10, 12, 1, POKEMON_LEAGUE_ARENA

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
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_MISC_PALM
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
	callasm PokemonLeagueArenaFindNextOppAsm
	if_equal 11, ArenaEntrySceneDisguise
	if_equal 15, ArenaEntrySceneMaster
	applymovement PLAYER, Movement_ArenaWalk1
	special Special_UpdatePalsInstant
	applymovement PLAYER, Movement_ArenaWalk1_2
	pause 25
	opentext TEXTBOX_PA
	writetext GenericTourneyIntroText
	buttonsound
	farwritetext StdBlankText
	pause 6
	callasm TourneyLoadOppIntroText
	waitbutton
	closetext
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
	callasm PokemonLeagueArenaFindNextOppAsm
	if_not_equal 13, ArenaEntryScenePart2
;ledian ranger
	pause 10
	spriteface PLAYER, DOWN
	pause 10
	loadvar wPlayerState, PLAYER_LEDIAN_RANGER2
	special MapCallbackSprites_LoadUsedSpritesGFX
	pause 6
	spriteface PLAYER, UP
	pause 12
	spriteface PLAYER, LEFT
	pause 20
	opentext TEXTBOX_LEDIAN_RANGER
	writetext PokemonLeagueArenaLedianRangerText
	waitbutton
	closetext
	spriteface PLAYER, DOWN
	pause 3
	loadvar wPlayerState, PLAYER_LEDIAN_RANGER
	special MapCallbackSprites_LoadUsedSpritesGFX
	pause 10
	spriteface PLAYER, LEFT
	
ArenaEntryScenePart2:
	pause 25
	appear 2
	
	applyonemovement PLAYER, remove_fixed_facing
	applyonemovement PLAYER, hide_person
	applyonemovement PLAYER, slow_step_left
	writecode VAR_MOVEMENT, PLAYER_NORMAL
	special MapCallbackSprites_LoadUsedSpritesGFX
	writebyte (1 << 7) | (PAL_OW_PINK << 4)
	special Special_SetPlayerPalette
.return
	callasm TourneyLoadTrainerData
	waitbutton
	closetext
	waitsfx	
	callasm PokemonLeagueArenaFindNextOppAsm
	if_not_equal 13, .skip_ledian
	pause 10
	spriteface 2, DOWN
	pause 10
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_LEDIAN_RANGER_MASK_POSE
	special MapCallbackSprites_LoadUsedSpritesGFX
	pause 6
	spriteface 2, UP
	pause 12
	spriteface 2, LEFT
	pause 20
	opentext TEXTBOX_LEDIAN_RANGER
	writetext PokemonLeagueArenaLedianRangerText
	waitbutton
	closetext
.skip_ledian
	applymovement PLAYER, Movement_ArenaWalk3
	pause 25
	opentext TEXTBOX_PA
	writetext ArenaText2
	waitbutton
	closetext
	waitsfx
	setevent EVENT_BIG_OW_MON_BATTLE
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	special Special_RestorePlayerPalette
	startbattle
	if_equal $1, .lose
	writebyte (1 << 7) | (PAL_OW_PINK << 4)
	special Special_SetPlayerPalette
	special FadeOutPalettes
	warp_stealth RIGHT, POKEMON_LEAGUE_ARENA, 12, 10
	clearevent EVENT_BIG_OW_MON_BATTLE
	dontrestartmapmusic
	reloadmapafterbattle
	opentext TEXTBOX_PA
	writetext TourneyRoundWinText1
	pause 40
	farwritetext StdBlankText
	pause 6
	writetext TourneyRoundWinText2
	waitbutton
	closetext
	callasm ArenaIncTrigger
	
	special FadeOutPalettes
	special Special_FadeOutMusic
	disappear 1
	disappear 2
	applyonemovement PLAYER, hide_person
	special Special_FadeOutMusic
	warpcheck
	refreshscreen
	callasm TourneyJumpToBracketAfterRound
	special Special_FadeOutMusic
	end
.lose
	clearevent EVENT_BIG_OW_MON_BATTLE
	dontrestartmapmusic
	reloadmapafterbattle
	end
	
TourneyJumpToBracketAfterRound:
	ld a, [wPokemonLeagueArenaTrigger]
	cp 2
	jr z, .round2
	cp 3
	jr z, .round3
	cp 4
	jr z, .round4
	farjp DrawTourneyBracketRound5
.round2
	farjp DrawTourneyBracketRound2
.round3
	farjp DrawTourneyBracketRound3
.round4
	farjp DrawTourneyBracketRound4
	
ArenaEntrySceneDisguise:
	moveperson 2, 13, 10
	appear 2
	applymovement PLAYER, Movement_ArenaWalk1
	special Special_UpdatePalsInstant
	applymovement PLAYER, Movement_ArenaWalk1_2
	pause 25
	special Special_UpdatePalsInstant
	appear 1
	opentext TEXTBOX_PA
	writetext GenericTourneyIntroText
	buttonsound
	farwritetext StdBlankText
	pause 6
	callasm TourneyLoadOppIntroText
	waitbutton
	closetext
	applyonemovement PLAYER, hide_person
	pause 30
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_DISGUISE_MASTER
	special MapCallbackSprites_LoadUsedSpritesGFX
	applymovement 2, Movement_PokemonLeagueArena_DisguiseMan
	opentext TEXTBOX_UNKNOWN
	writetext PokemonLeagueArenaDisguiseManText
	waitbutton
	closetext
	spriteface 2, LEFT
	pause 25
	jump ArenaEntryScenePart2.return
	
ArenaEntrySceneMaster:
	applymovement PLAYER, Movement_ArenaWalk1
	special Special_UpdatePalsInstant
	applymovement PLAYER, Movement_ArenaWalk1_2
	pause 25
	special Special_UpdatePalsInstant
	appear 1
	opentext TEXTBOX_PA
	writetext GenericTourneyIntroText
	buttonsound
	farwritetext StdBlankText
	pause 6
	callasm TourneyLoadOppIntroText
	waitbutton
	closetext
	applyonemovement PLAYER, hide_person
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_MASTER
	pause 20
	applyonemovement 1, turn_step_left
	spriteface 1, LEFT
	pause 10
	applyonemovement 1, turn_step_right
	spriteface 1, RIGHT
	pause 10
	applyonemovement 1, turn_step_left
	spriteface 1, LEFT
	moveperson 2, 13, 10
	pause 30
	playsound SFX_WATER_GUN
	appear 2
	spriteface 2, UP
	pause 2
	spriteface 2, LEFT
	pause 20
	spriteface 1, RIGHT
	pause 20
	jump ArenaEntryScenePart2.return
	
TourneyLoadOppIntroText:
	farcall TourneyFindNextOpp
	ld hl, TourneyOppIntroText
.loop3
	dec a
	cp 0
	inc hl
	inc hl
	jr nz, .loop3
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp BattleTextBox
	
TourneyOppIntroText:
	dw -1
	dw StanleyTourneyIntroText
	dw RodneyTourneyIntroText
	dw WendyTourneyIntroText
	dw CharlieTourneyIntroText
	dw PollyTourneyIntroText
	dw LeilaniTourneyIntroText
	dw RockyTourneyIntroText
	dw DarcyTourneyIntroText
	dw MinaTourneyIntroText
	dw ErikaTourneyIntroText
	dw DisguiseManTourneyIntroText
	dw FrankieTourneyIntroText
	dw LedianRangerTourneyIntroText
	dw ArmstrongTourneyIntroText
	dw MasterTourneyIntroText
	
GenericTourneyIntroText:
	text "And next up:"
	done
	
StanleyTourneyIntroText:
	text "The studious"
	line "valedictorian."
	
	para "It's<WAIT_M> STANLEY!"
	done
	
RodneyTourneyIntroText:
	text "The master"
	line "fisherman."
	
	para "It's<WAIT_M> RODNEY!"
	done
	
WendyTourneyIntroText:
	text "The high-flying"
	line "aviator."
	
	para "It's<WAIT_M> WENDY!"
	done
	
CharlieTourneyIntroText:
	text "The smokin' hot"
	line "stud."
	
	para "It's<WAIT_M> CHARLIE!"
	done
	
PollyTourneyIntroText:
	text "The toxic prodigy."
	
	para "It's<WAIT_M> POLLY!"
	done
	
LeilaniTourneyIntroText:
	text "The ferocious"
	line "flower."
	
	para "It's<WAIT_M> LEILANI!"
	done
	
RockyTourneyIntroText:
	text "The immovable and"
	line "unbreakable."
	
	para "It's<WAIT_M> ROCKY!<WAIT_L>"
	line "Er…<WAIT_M> ROCKFORD!"
	done
	
DarcyTourneyIntroText:
	text "The champion of"
	line "LUMINA TOWN."
	
	para "It's<WAIT_M> DARCY!"
	done
	
MinaTourneyIntroText:
	text "The wandering"
	line "artist."
	
	para "It's<WAIT_M> MINA!"
	done
	
ErikaTourneyIntroText:
	text "The nature-loving"
	line "princess."
	
	para "It's<WAIT_M> ERIKA!"
	done
	
DisguiseManTourneyIntroText:
	text "Uhhh…"
	
	para "Wait."
	
	para "Where's the other"
	line "competitor?"
	done
	
FrankieTourneyIntroText:
	text "The big bad boss"
	line "of the BUNEARYS."
	
	para "It's<WAIT_M>"
	line "FRANKIE THE KID!"
	done
	
LedianRangerTourneyIntroText:
	text "The hero of"
	line "justice."
	
	para "It's<WAIT_M> the"
	line "LEDIAN RANGER!"
	done
	
ArmstrongTourneyIntroText:
	text "The kingpin of"
	line "the BRILLO POLICE."
	
	para "It's<WAIT_M>"
	line "CAPTAIN ARMSTRONG!"
	done
	
MasterTourneyIntroText:
	text "Master of body."
	line "Master of mind."
	
	para "It's<WAIT_M> THE MASTER!"
	done
	
TourneyLoadTrainerData:
	farcall TourneyFindNextOpp
	push af
	ld hl, TourneyOppWinLossText
.loop
	dec a
	cp 0
	inc hl
	inc hl
	jr nz, .loop
	ld d, h
	ld e, l
	ld hl, wWinTextPointer
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	xor a
	ld [hli], a
	ld [hl], a
	
	ld a, (1 << 7) | 1
	ld [wBattleScriptFlags], a
	pop af
	push af
	dec a
	add 100 ;number of trainer classes before the tourney classes
	ld [wOtherTrainerClass], a
	ld a, 1
	ld [wOtherTrainerID], a
	pop af
	push af
	ld hl, TourneyOppTextboxSpeakers
.loop2
	dec a
	cp 0
	inc hl
	jr nz, .loop2
	ld a, [hl]
	ld [wTextBoxSpeaker], a	
	
	pop af
	ld hl, TourneyOppPreBattleText
.loop3
	dec a
	cp 0
	inc hl
	inc hl
	jr nz, .loop3
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	call LoadStandardFont
	call OpenText
	pop hl
	jp BattleTextBox
	
TourneyOppPreBattleText:
	dw -1
	dw StanleyTourneyText
	dw RodneyTourneyText
	dw WendyTourneyText
	dw CharlieTourneyText
	dw PollyTourneyText
	dw LeilaniTourneyText
	dw RockyTourneyText
	dw DarcyTourneyText
	dw MinaTourneyText
	dw ErikaTourneyText
	dw DisguiseManTourneyText
	dw FrankieTourneyText
	dw LedianRangerTourneyText
	dw ArmstrongTourneyText
	dw MasterTourneyText
	
StanleyTourneyText:
	text "I told you we"
	line "would meet again."
	
	para "I've been studying"
	line "hard since our"
	cont "last battle!"
	
	para "I've sharpened my"
	line "strategy to a fine"
	cont "point!"
	
	para "Now let me put"
	line "all of my effort"
	cont "to the test."
	done
	
RodneyTourneyText:
	text "Hahaha!"
	
	para "So, you made it!"
	
	para "I had a good"
	line "feeling about you"
	cont "when we first met."
	
	para "The way you"
	line "handled those"
	cont "TEAM SNARE punks."
	
	para "I was sure I hadn't"
	line "seen the last"
	cont "of you."
	done
	
WendyTourneyText:
	text "So, we did end up"
	line "meeting in the"
	cont "bracket, huh?"
	
	para "I had a feeling"
	line "we would."
	
	para "Well, don't try"
	line "TOO hard, ok?"
	
	para "I'm still your"
	line "ride home!"
	done
	
CharlieTourneyText:
	text "Yo!"
	
	para "Long time no see!"
	
	para "I'm glad you kept"
	line "at it and made it"
	cont "all the way here!"
	
	para "I take it you've"
	line "gotten better"
	cont "since last time,"
	cont "huh?"
	
	para "Yeah well, me too!"
	
	para "No holding back!"
	done
	
PollyTourneyText:
	text "Hey! Hey!"
	
	para "I was hoping we'd"
	line "get paired up!"
	
	para "Ever since our"
	line "battle, I've like,"
	cont "totally been into"
	cont "battling!"
	
	para "I've done a"
	line "complete 360!"
	
	para "Anyway, I won't"
	line "lose, or whatever."
	
	para "Sooo, let's get"
	line "going already!"
	done
	
LeilaniTourneyText:
	text "Oh sweetie!"
	
	para "You've made it"
	line "so far!"
	
	para "GRAMMA is so proud"
	line "of you."
	
	para "Sorry, though,"
	line "honey."
	
	para "I promised the"
	line "girls I would win."
	
	para "So, this is as"
	line "far as you go…"
	done
	
RockyTourneyText:
	text "Well, if it isn't"
	line "the dragon's"
	cont "“chosen one”."
	
	para "Well, “chosen one”"
	line "or not, you're"
	cont "one impressive"
	cont "TRAINER for sure."
	
	para "You really came"
	line "through at both"
	cont "the museum and"
	cont "the shrine."
	
	para "I'm glad we get"
	line "a rematch!"
	done
	
DarcyTourneyText:
	text "I should have"
	line "known I'd have to"
	cont "go against you."
	
	para "This isn't going"
	line "to go well…"
	
	para "…"
	
	para "No!"
	
	para "You know what?"
	
	para "This is my second"
	line "chance to prove"
	cont "myself!"
	
	para "Here we go,"
	line "<PLAYER>!"
	
	para "I won't lose!"
	done
	
MinaTourneyText:
	text "Surprised to see"
	line "me, <PLAYER>?"
	
	para "I didn't come to"
	line "ONWA just to paint."
	
	para "I was invited to"
	line "compete in this"
	cont "tournament!"
	
	para "I used to be a"
	line "TRIAL CAPTAIN in"
	cont "ALOLA, you know."
	
	para "That's like a"
	line "GYM LEADER!"
	
	para "Anyway,<WAIT_M> let's go,"
	line "<PLAYER>!"
	done
	
ErikaTourneyText:
	text "Hello, <PLAYER>."
	
	para "GRAMMA told me you"
	line "would be competing"
	cont "in this tournament."
	
	para "When I heard that,"
	line "I just knew I had"
	cont "to accept the offer"
	cont "to compete myself."
	
	para "The girls are here"
	line "cheering for me,"
	cont "so I can't let"
	cont "them down."
	
	para "I shall not lose!"
	done
	
DisguiseManTourneyText:
	text "That's the last"
	line "time you'll hear"
	cont "my greeting,"
	
	para "for this will be"
	line "our final meeting."
	
	para "But do not cry,"
	line "and do not sob."
	
	para "It's been great"
	line "fun when we've"
	cont "hobnobbed."
	
	para "But all good"
	line "things must surely"
	cont "end."
	
	para "It's sad, but true,"
	line "my little friend."
	
	para "So, one more fight"
	line "before I dash."
	
	para "It's time now for"
	line "our final clash!"
	done
	
FrankieTourneyText:
	text "Well, well, well.<WAIT_M>"
	line "Look who it is."
	
	para "That NIDOKING"
	line "punk!"
	
	para "I told you this"
	line "wasn't over."
	
	para "You can't keep the"
	line "BUNEARY BOYS down!"
	
	para "We will have our"
	line "revenge!"
	
	para "NO IFS, NO BUTS,"
	line "NO COCONUTS!"
	done
	
LedianRangerTourneyText:
	text "KID LEDYBA!"
	
	para "It IS you!"
	
	para "Where have you"
	line "been?"
	
	para "Fighting for"
	line "justice in my"
	cont "name, no doubt."
	
	para "Though that's"
	line "surely the case,"
	
	para "I cannot allow"
	line "you to stand in"
	cont "my way here,"
	cont "KID LEDYBA."
	
	para "I mean, what kind"
	line "of hero would I"
	cont "be if I lost to"
	cont "my own sidekick?"
	done
	
ArmstrongTourneyText:
	text "You!!"
	
	para "You really did a"
	line "number on our"
	cont "police force!"
	
	para "Morale is at an"
	line "all time low."
	
	para "I'm gonna clobber"
	line "you for the boys"
	cont "watching back at"
	cont "the station."
	
	para "You'll learn some"
	line "respect!"
	done
	
MasterTourneyText:
	text "…"
	
	para "There is no need"
	line "for words."
	
	para "Our battle shall"
	line "speak for us…"
	done
	
TourneyOppWinLossText:
	dw -1
	dw StanleyTourneyWinText
	dw RodneyTourneyWinText
	dw WendyTourneyWinText
	dw CharlieTourneyWinText
	dw PollyTourneyWinText
	dw LeilaniTourneyWinText
	dw RockyTourneyWinText
	dw DarcyTourneyWinText
	dw MinaTourneyWinText
	dw ErikaTourneyWinText
	dw DisguiseManTourneyWinText
	dw FrankieTourneyWinText
	dw LedianRangerTourneyWinText
	dw ArmstrongTourneyWinText
	dw MasterTourneyWinText
	
StanleyTourneyWinText:
	text "My strategy!"
	
	para "It wasn't enough!"
	done
RodneyTourneyWinText:
	text "Hahaha!"
	
	para "Way to go,"
	line "kid!"
	done
	
WendyTourneyWinText:
	text "I never should"
	line "have flown you"
	cont "here."
	
	para "Hehehe!"
	line "Just kidding!"
	done
	
CharlieTourneyWinText:
	text "Your spirit still"
	line "burns white hot!"
	done
	
PollyTourneyWinText:
	text "No fair!"
	
	para "Whatever."
	line "I had fun!"
	done
	
LeilaniTourneyWinText:
	text "Hehehe."
	
	para "Too bad."
	done
	
RockyTourneyWinText:
	text "Impressive"
	line "as usual."
	done
	
DarcyTourneyWinText:
	text "Ohh!"
	
	para "One day I'll prove"
	line "myself against you"
	cont "for sure!"
	done
	
MinaTourneyWinText:
	text "I'm always shocked"
	line "by your strength,"
	cont "<PLAYER>!"
	done
	
ErikaTourneyWinText:
	text "Sorry, girls."
	line "I lost."
	
	para "I concede defeat."
	done
	
DisguiseManTourneyWinText:
	text "That battle truly"
	line "was sublime."
	
	para "Of course you won"
	line "one final time!"
	done
	
FrankieTourneyWinText:
	text "…"
	
	para "Grrrr…"
	done
	
LedianRangerTourneyWinText:
	text "Go! <WAIT_S>Go!<WAIT_S>"
	line "LEDIAN RANGER!"
	
	para "COMET PUNCH to…<WAIT_M>"
	line "…defeat?"
	done
	
ArmstrongTourneyWinText:
	text "GRAHH!!!"
	line "Not again!"
	done
	
MasterTourneyWinText:
	text "…"
	
	para "Very well…"
	done
	
TourneyOppTextboxSpeakers:
	db -1
	db TEXTBOX_STANLEY
	db TEXTBOX_RODNEY
	db TEXTBOX_WENDY
	db TEXTBOX_CHARLIE
	db TEXTBOX_POLLY
	db TEXTBOX_LEILANI
	db TEXTBOX_ROCKY
	db TEXTBOX_DARCY
	db TEXTBOX_MINA
	db TEXTBOX_ERIKA
	db TEXTBOX_DISGUISEMAN
	db TEXTBOX_FRANKIE
	db TEXTBOX_LEDIAN_RANGER
	db TEXTBOX_ARMSTRONG
	db TEXTBOX_MASTER

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
	text "First up for"
	line "this round:"
	
	para "The rising"
	line "superstar."
	
	para "It's <WAIT_M><PLAYER>!"
	done
	
ArenaText2:
	text "Let the battle"
	line "begin!"
	done
	
TourneyRoundWinText1:
	text "And the winner is…"
	done 
	
TourneyRoundWinText2:
	text "<PLAYER>!"
	done
	
PokemonLeagueArenaLedianRangerText:
	text "Go! <WAIT_S>Go!<WAIT_S>"
	line "LEDIAN RANGER!"
	
	para "COMET PUNCH to"
	line "victory!"
	done
	
PokemonLeagueArenaDisguiseManText:
	text "Ohohohoho!"
	
	para "Appearing right,"
	line "before your eyes!"
	
	para "'Tis I, the MASTER"
	line "OF DISGUISE!"
	done
	
PokemonLeagueArenaLedianRangerAnimation:
	pause 10
	spriteface PLAYER, DOWN
	pause 10
	loadvar wPlayerState, PLAYER_LEDIAN_RANGER2
	special MapCallbackSprites_LoadUsedSpritesGFX
	pause 6
	spriteface PLAYER, UP
	pause 12
	spriteface PLAYER, LEFT
	pause 20
	opentext TEXTBOX_LEDIAN_RANGER
	writetext PokemonLeagueArenaLedianRangerText
	waitbutton
	closetext
	end
	
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
;	slow_step_up
	slow_step_up
	slow_step_up
	step_end
	
Movement_PokemonLeagueArena_DisguiseMan:
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	step_sleep 1
	turn_head_down
	step_sleep 1
	turn_head_left
	step_sleep 1
	turn_head_up
	step_sleep 1
	turn_head_right
	step_sleep 2
	turn_head_down
	step_sleep 2
	turn_head_left
	step_sleep 2
	turn_head_up
	step_sleep 3
	turn_head_right
	step_sleep 6
	turn_head_down
	step_sleep 12
	step_end