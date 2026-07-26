INCLUDE "constants.asm"


SECTION "Music Player", ROMX

INCLUDE "data/music_player/song_info.asm"
INCLUDE "data/music_player/song_origins.asm"
INCLUDE "data/music_player/song_artists.asm"
INCLUDE "data/music_player/tape_names.asm"

RadioTitleTilemapRLE2:
INCBIN "gfx/pokegear/radio_title.tilemap.rle"
RadioComposerTilemapRLE2:
INCBIN "gfx/pokegear/radio_composer.tilemap.rle"
RadioArrangerTilemapRLE2:
INCBIN "gfx/pokegear/radio_arranger.tilemap.rle"

GetSongInfo:
;	ld a, [wSongSelection]
	ld b, a
	ld c, 0
	ld hl, SongInfo
.loop:
	ld a, [hl]
	cp -1
	jr z, .no_name
	inc c
	ld a, c
	cp b
	jr z, .found
.loop2:
	ld a, [hli]
	cp "@"
	jr z, .nextline
	jr .loop2
.found
	xor a
	ret
.nextline
	inc hl
	inc hl
	inc hl
	jr .loop

.no_name:
	scf
	ret

DrawSongInfo::
;	ld a, [wSongSelection]
	call GetSongInfo
	ret c ; no data

	ld a, [wSongInfoSwitch]
	and a
	jr z, .info
	hlcoord 0, 1
	jr DrawSongID

.info:

	call GetSongTitle
	hlcoord 1, 5
	call PlaceString
	inc de

;	push de
;	call GetSongOrigin
;	hlcoord 0, 1
;	push de
;	call DrawSongID
;	pop de
;	inc hl
;	call PlaceString
;	pop de
	inc de

	push de
	call GetSongArtist
	hlcoord 1, 9
	call PlaceString
	pop de
	inc de

	push de
	call GetSongArtist2
	hlcoord 1, 10
	call PlaceString
	pop de
	ret

DrawSongID:
	ld a, "<SHARP>"
	ld [hli], a
	ld a, [wSongSelection]
	cp 10
	jr c, .print_digit
	lb bc, 1, 2
	cp 100
	jr c, .print_id
	lb bc, 1, 3
.print_id
	ld de, wSongSelection
	jp PrintNum

.print_digit
	add "0"
	ld [hli], a
	ret

GetSongOrigin:
	ld a, [de]
	ld hl, SongOrigins
	call GetNthString
GetSongTitle:
	push hl
	pop de
	ret

GetSongArtist:
	ld a, [de]
	ld hl, SongArtists
	call GetNthString
	push hl
	ld de, RadioComposerTilemapRLE2
	hlcoord 1, 8
	call MusicPlayer_LoadTilemapRLE
	ld de, RadioTitleTilemapRLE2
	hlcoord 1, 4
	call MusicPlayer_LoadTilemapRLE
	pop de
	ret

GetSongArtist2:
	ld a, [de]
	ld hl, SongArtists
	call GetNthString
	push hl
	ld a, [hl]
	cp "@"
	jr z, .finish
	ld de, RadioArrangerTilemapRLE2
	hlcoord 1, 8
	call MusicPlayer_LoadTilemapRLE
.finish
	pop de
	ret
	
MusicPlayer_LoadTilemapRLE:
.loop
	ld a, [de]
	cp $ff
	ret z
	ld b, a
	inc de
	ld a, [de]
	ld c, a
	inc de
	ld a, b
.load
	ld [hli], a
	dec c
	jr nz, .load
	jr .loop
