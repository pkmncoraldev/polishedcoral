Route10East_MapScriptHeader:
	db 2 ; scene scripts
	scene_script Route10EastTrigger0
	scene_script Route10EastTrigger1

	db 0 ; callbacks

	db 1 ; warp events
	warp_event 11, 21, ROUTE_10_TENT, 1

	db 20 ; coord events
	xy_trigger 0, 23, 10, 0, Route10EastLight, 0, 0
	xy_trigger 0, 23, 11, 0, Route10EastLight, 0, 0
	xy_trigger 0, 23, 12, 0, Route10EastLight, 0, 0
	xy_trigger 0, 25, 12, 0, Route10EastLight, 0, 0
	xy_trigger 0, 24, 12, 0, Route10EastLight, 0, 0
	xy_trigger 0, 25, 11, 0, Route10EastLight, 0, 0
	xy_trigger 0, 25, 10, 0, Route10EastLight, 0, 0
	xy_trigger 0, 24, 10, 0, Route10EastLight, 0, 0
	xy_trigger 1, 22, 10, 0, Route10EastDark, 0, 0
	xy_trigger 1, 22, 11, 0, Route10EastDark, 0, 0
	xy_trigger 1, 22, 12, 0, Route10EastDark, 0, 0
	xy_trigger 1, 23, 13, 0, Route10EastDark, 0, 0
	xy_trigger 1, 24, 13, 0, Route10EastDark, 0, 0
	xy_trigger 1, 25, 13, 0, Route10EastDark, 0, 0
	xy_trigger 1, 26, 12, 0, Route10EastDark, 0, 0
	xy_trigger 1, 26, 11, 0, Route10EastDark, 0, 0
	xy_trigger 1, 26, 10, 0, Route10EastDark, 0, 0
	xy_trigger 1, 25,  9, 0, Route10EastDark, 0, 0
	xy_trigger 1, 24,  9, 0, Route10EastDark, 0, 0
	xy_trigger 1, 23,  9, 0, Route10EastDark, 0, 0

	db 0 ; bg events

	db 1 ; object events
	object_event 11, 24, SPRITE_CAMPFIRE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Route10EastCampfire, -1

	
Route10EastTrigger0:
	checkevent EVENT_SNOWSTORM_HAPPENING
	iffalse .end
	callasm Route10SfxAsm
.end
	end
	
Route10EastTrigger1:
	checkevent EVENT_SNOWSTORM_HAPPENING
	iffalse .end
	callasm Route10SfxAsm
.end
	end
	
Route10EastCampfire:
	jumptext Route10EastCampfireText
	
Route10EastCampfireText:
	text "OH SHIT A FIRE!"
	done

Route10EastLight:
	callasm Route10EastLightasm
	dotrigger $1
	end
	
Route10EastDark:
	callasm Route10EastDarkasm
	dotrigger $0
	end
	
Route10EastLightasm:
	ld a, [wTimeOfDayPalFlags]
	and $3F
	cp 1
	jr z, .snowstorm
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 8 palettes
	ld hl, MapObjectPalsRoute10Light
	call AddNTimes
	ld de, wOBPals
	ld bc, 8 palettes
	ld a, $5 ; BANK(UnknOBPals)
	call FarCopyWRAM
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
.snowstorm
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 8 palettes
	ld hl, MapObjectPalsRoute10SnowstormLight
	call AddNTimes
	ld de, wOBPals
	ld bc, 8 palettes
	ld a, $5 ; BANK(UnknOBPals)
	call FarCopyWRAM
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
	
Route10EastDarkasm:
	ld a, [wTimeOfDayPalFlags]
	and $3F
	cp 1
	jr z, .snowstorm
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 8 palettes
	ld hl, MapObjectPalsRoute10Dark
	call AddNTimes
	ld de, wOBPals
	ld bc, 8 palettes
	ld a, $5 ; BANK(UnknOBPals)
	call FarCopyWRAM
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
.snowstorm
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 8 palettes
	ld hl, MapObjectPalsRoute10SnowstormDark
	call AddNTimes
	ld de, wOBPals
	ld bc, 8 palettes
	ld a, $5 ; BANK(UnknOBPals)
	call FarCopyWRAM
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
	
MapObjectPalsRoute10Light:
INCLUDE "maps/palettes/obpals/obsnowfirelight.pal"

MapObjectPalsRoute10SnowstormLight:
INCLUDE "maps/palettes/obpals/obsnowfiresnowstormlight.pal"

MapObjectPalsRoute10Dark::
INCLUDE "maps/palettes/obpals/obsnowfire.pal"

MapObjectPalsRoute10SnowstormDark::
INCLUDE "maps/palettes/obpals/obsnowstormfire.pal"