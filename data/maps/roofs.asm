MapGroupRoofs:
; entries correspond to map groups
; values are indexes for Roofs (see below)
	db -1 ; group 0
	db -1 ; group 1  (Dungeons)
	db  3 ; group 2  (Sunset)
	db  2 ; group 3  (Daybreak)
	db  2 ; group 4  (Glint)
	db  3 ; group 5  (Starglow)
	db  0 ; group 6  (Lake Onwa)
	db  0 ; group 7  (Sunbeam Island)
	db  2 ; group 8  (Eventide Forest)
	db  2 ; group 9  (Eventide Village)
	db  2 ; group 10 (Flicker Station)
	db -1 ; group 11 (Twinkle Town)
	db -1 ; group 12 (Train)
	db -1 ; group 13 (Luster City)
	db -1 ; group 14 (Nett Building)
	db -1 ; group 15 (Airport)
	db  3 ; group 16 (Shimmer City)
	db -1 ; group 17 (Brillo Town)
	db -1 ; group 18 (Desert Temple)
	db  0 ; group 19 (Radiant Township)
	db  4 ; group 20 (Highway)
	db -1 ; group 21 (Underwater)
	db  2 ; group 22 (Komore)
	db  0 ; group 23 (Bright)
	db  4 ; group 24 (Obscura)
	db  4 ; group 24 (Aureole)
	db -1 ; group last (Fake Route 1)

Roofs:
INCBIN "gfx/tilesets/roofs/0.2bpp"
INCBIN "gfx/tilesets/roofs/1.2bpp"
INCBIN "gfx/tilesets/roofs/2.2bpp"
INCBIN "gfx/tilesets/roofs/3.2bpp"
INCBIN "gfx/tilesets/roofs/4.2bpp"
