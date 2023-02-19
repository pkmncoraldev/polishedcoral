; Audio interfaces.

MapSetup_Sound_Off:: ; 3b4e

	push hl
	push de
	push bc
	push af

	ld a, [hROMBank]
	push af
	ld a, BANK(_MapSetup_Sound_Off)
;	ld [hROMBank], a
;	ld [MBC3RomBank], a
	rst Bankswitch

	call _MapSetup_Sound_Off

	jr PopAFBankThenAFBCDEHL

UpdateSound:: ; 3b6a

	push hl
	push de
	push bc
	push af

	ld a, [hROMBank]
	push af
	ld a, BANK(_UpdateSound)
;	ld [hROMBank], a
;	ld [MBC3RomBank], a
	rst Bankswitch

	call _UpdateSound

	jr PopAFBankThenAFBCDEHL


_LoadMusicByte:: ; 3b86
; wCurMusicByte = [a:de]
;	ld [hROMBank], a
;	ld [MBC3RomBank], a
	rst Bankswitch

	ld a, [de]
	ld [wCurMusicByte], a
	ld a, BANK(LoadMusicByte)

;	ld [hROMBank], a
;	ld [MBC3RomBank], a
	rst Bankswitch
	ret
; 3b97


PlayMusicAfterDelay::
	push de
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	pop de
	ld a, e
	ld [wMapMusic], a
PlayMusic:: ; 3b97
; Play music de.
	eventflagcheck EVENT_YOU_CHEATED
	ret nz
	
	push hl
	push de
	push bc
	push af

	ld a, [hROMBank]
	push af
	ld a, BANK(_PlayMusic) ; and BANK(_MapSetup_Sound_Off)
;	ld [hROMBank], a
;	ld [MBC3RomBank], a
	rst Bankswitch

	ld a, e
	and a
	jr z, .nomusic

	call _PlayMusic
	jr .end

.nomusic
	call _MapSetup_Sound_Off

.end
PopAFBankThenAFBCDEHL:
	pop af
;	ld [hROMBank], a
;	ld [MBC3RomBank], a
	rst Bankswitch

_PopAFBCDEHL:
	pop af
	pop bc
	pop de
	pop hl
	ret
; 3bbc

WaitPlaySFX::
	call WaitSFX
	; fallthrough
PlaySFX:: ; 3c23
; Play sound effect de.
; Sound effects are ordered by priority (highest to lowest)

	push hl
	push de
	push bc
	push af

	; Is something already playing?
	call CheckSFX
	jr nc, .play

	; Does it have priority?
	ld a, [wCurSFX]
	cp e
	jr c, _PopAFBCDEHL

.play
	ld a, [hROMBank]
	push af
	ld a, BANK(_PlaySFX)
;	ld [hROMBank], a
;	ld [MBC3RomBank], a
	rst Bankswitch

	ld a, e
	ld [wCurSFX], a
	call _PlaySFX
	jr PopAFBankThenAFBCDEHL

PlayCryHeader:: ; 3be3
;	push hl
;	push de
;	push bc
;	push af
; Play cry header at hl.

	; Cry headers are stuck in one bank.
	anonbankpush CryHeaders

.Function:

;	ld [hROMBank], a
;	ld [MBC3RomBank], a

;	ld hl, CryHeaders
;rept 6
;	add hl, de
;endr

;	ld e, [hl]
;	inc hl
;	ld d, [hl]
;	inc hl
	
	ld a, [hli]
	cp $ff
	jr z, .ded
	ld e, a
	ld d, 0

	ld a, [hli]
	ld [wCryPitch], a
	ld a, [hli]
	ld [wCryPitch + 1], a
	ld a, [hli]
	ld [wCryLength], a
	ld a, [hl]
	ld [wCryLength + 1], a

;	ld a, BANK(_PlayCryHeader)
;	ld [hROMBank], a
;	ld [MBC3RomBank], a

;	call _PlayCryHeader

;	pop af
;	ld [hROMBank], a
;	ld [MBC3RomBank], a
	farjp _PlayCryHeader
.ded
	ld e, 0
	call LoadDEDCryHeader
	jp PlayDEDCry

WaitSFX:: ; 3c55
; infinite loop until sfx is done playing

	push hl
	jr .handleLoop
.wait
	call DelayFrame
.handleLoop
	ld hl, wChannel5Flags
	bit 0, [hl]
	jr nz, .wait
	ld hl, wChannel6Flags
	bit 0, [hl]
	jr nz, .wait
	ld hl, wChannel7Flags
	bit 0, [hl]
	jr nz, .wait
	ld hl, wChannel8Flags
	bit 0, [hl]
	jr nz, .wait

	pop hl
	ret
; 3c74

IsSFXPlaying:: ; 3c74
; Return carry if no sound effect is playing.
; The inverse of CheckSFX.
	push hl

	ld hl, wChannel5Flags
	bit 0, [hl]
	jr nz, .playing
	ld hl, wChannel6Flags
	bit 0, [hl]
	jr nz, .playing
	ld hl, wChannel7Flags
	bit 0, [hl]
	jr nz, .playing
	ld hl, wChannel8Flags
	bit 0, [hl]
	jr nz, .playing

	pop hl
	scf
	ret

.playing
	pop hl
	and a
	ret
; 3c97

MaxVolume:: ; 3c97
	ld a, $77 ; max
	ld [wVolume], a
	ret
; 3c9d

LowVolume:: ; 3c9d
	ld a, $33 ; 40%
	ld [wVolume], a
	ret
; 3ca3

VolumeOff:: ; 3ca3
	xor a
	ld [wVolume], a
	ret
; 3ca8

FadeInMusic:: ; 3cae
	ld a, 4 | 1 << 7
	ld [wMusicFade], a
	ret
; 3cb4

SkipMusic::
; Skip a frames of music.
	ld [hBuffer], a
	ld a, [wMusicPlaying]
	push af
	xor a
	ld [wMusicPlaying], a
	ld a, [hBuffer]
.loop
	call UpdateSound
	dec a
	jr nz, .loop
	pop af
	ld [wMusicPlaying], a
	ret

FadeToMapMusic:: ; 3cbc
	eventflagcheck EVENT_YOU_CHEATED
	ret nz
	ld a, [wTileset]
	cp TILESET_PLAYER_ROOM
	ret z
	call GetCurrentLandmark
	cp GATE_LANDMARK
	ret z
	push hl
	push de
	push bc
	push af

	call GetMapMusic
	ld a, [wMapMusic]
	cp e
	jr z, PopAFBCDEHL

	ld a, 8
	ld [wMusicFade], a
	ld a, e
	ld [wMusicFadeIDLo], a
	ld a, d
	ld [wMusicFadeIDHi], a
	ld a, e
	ld [wMapMusic], a

	jr PopAFBCDEHL

;FadeToMapMusic2:: ; 3cbc
;	eventflagcheck EVENT_YOU_CHEATED
;	ret nz
;	push hl
;	push de
;	push bc
;	push af

;	call GetMapMusic
	
;	ld a, 8
;	ld [wMusicFade], a
;	ld a, e
;	ld [wMusicFadeIDLo], a
;	ld a, d
;	ld [wMusicFadeIDHi], a
;	ld a, e
;	ld [wMapMusic], a
;	jr PopAFBCDEHL

PlayMapMusic:: ; 3cdf
	eventflagcheck EVENT_YOU_CHEATED
	ret nz
	push hl
	push de
	push bc
	push af

	call GetMapMusic
	ld a, [wMapMusic]
	cp e
	call nz, PlayMusicAfterDelay

PopAFBCDEHL:
	jp _PopAFBCDEHL

EnterMapMusic:: ; 3d03
	eventflagcheck EVENT_YOU_CHEATED
	ret nz
	push hl
	push de
	push bc
	push af

	xor a
	ld [wDontPlayMapMusicOnReload], a
	call GetMapMusic
	call PlayMusicAfterDelay
	jr PopAFBCDEHL

RestartMapMusic:: ; 3d47
	eventflagcheck EVENT_YOU_CHEATED
	ret nz
	push hl
	push de
	push bc
	push af
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	ld a, [wMapMusic]
	ld e, a
	ld d, 0
	call PlayMusic
	jr PopAFBCDEHL

TryRestartMapMusic:: ; 3d2f
	eventflagcheck EVENT_YOU_CHEATED
	ret nz
	ld a, [wDontPlayMapMusicOnReload]
	and a
	jp z, RestoreMusic
	xor a
	ld [wMapMusic], a
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	xor a
	ld [wDontPlayMapMusicOnReload], a
	ret
; 3d47

GetMapMusic::
	eventflagcheck EVENT_YOU_CHEATED
	ret nz
	ld hl, SpecialMusicMaps
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
.loop:
	ld a, [hli]
	and a
	jp z, GetMapHeaderMusic
	cp b
	jr nz, .wrong_group
	ld a, [hli]
	cp c
	jr nz, .wrong_map
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.wrong_group:
	inc hl
.wrong_map:
	inc hl
	inc hl
	jr .loop

DoSurfMusic:
	ld a, [wPlayerState]
	cp PLAYER_SURF
	jr z, .surf
	jp GetMapHeaderMusic
	
.surf
	ld de, MUSIC_WATER_ROUTE
	ret
	
SpecialMusicMaps:
music_map: MACRO
	map_id \1
	dw \2
ENDM
	music_map SUNSET_BAY, DoSurfMusic
	music_map SUNSET_CAPE, DoSurfMusic
	music_map SHIMMER_CITY, DoSurfMusic
	music_map SHIMMER_HARBOR, DoSurfMusic
	music_map SHIMMER_UNDER_BOARDWALK, DoSurfMusic
;	music_map QUIET_CAVE_1F, GetMapHeaderMusic
;	music_map QUIET_CAVE_B1F, GetMapHeaderMusic
;	music_map QUIET_CAVE_B2F, GetMapHeaderMusic
;	music_map QUIET_CAVE_B3F, GetMapHeaderMusic
;	music_map SCARY_CAVE_SHIPWRECK, GetMapHeaderMusic
;	music_map WHIRL_ISLAND_LUGIA_CHAMBER, GetMapHeaderMusic
;	music_map TIN_TOWER_ROOF, GetMapHeaderMusic
;	music_map ROUTE_16_SOUTH, GetCyclingRoadMusic
;	music_map ROUTE_17, GetCyclingRoadMusic
;	music_map ROUTE_18_WEST, GetCyclingRoadMusic
;	music_map ROUTE_35_NATIONAL_PARK_GATE, GetBugCatchingContestMusic
;	music_map ROUTE_36_NATIONAL_PARK_GATE, GetBugCatchingContestMusic
	db 0 ; end

CheckSFX:: ; 3dde
; Return carry if any SFX channels are active.
	ld a, [wChannel5Flags]
	bit 0, a
	jr nz, .playing
	ld a, [wChannel6Flags]
	bit 0, a
	jr nz, .playing
	ld a, [wChannel7Flags]
	bit 0, a
	jr nz, .playing
	ld a, [wChannel8Flags]
	bit 0, a
	jr nz, .playing
	and a
	ret
.playing
	scf
	ret
; 3dfe

TerminateExpBarSound:: ; 3dfe
	xor a
	ld [wChannel5Flags], a
	ld [wSoundInput], a
	ld [rNR10], a
	ld [rNR11], a
	ld [rNR12], a
	ld [rNR13], a
	ld [rNR14], a
	ret
; 3e10


ChannelsOff:: ; 3e10
; Quickly turn off music channels
	xor a
	ld [wChannel1Flags], a
	ld [wChannel2Flags], a
	ld [wChannel3Flags], a
	ld [wChannel4Flags], a
	ld [wSoundInput], a
	ret
; 3e21

SFXChannelsOff:: ; 3e21
; Quickly turn off sound effect channels
	xor a
	ld [wSoundInput], a
	
KillSFX::
	xor a
	ld [wChannel5Flags], a
	ld [wChannel6Flags], a
	ld [wChannel7Flags], a
	ld [wChannel8Flags], a
	ret
; 3e32
