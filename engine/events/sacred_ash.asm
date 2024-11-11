
_SacredAsh: ; 507e6
	xor a
	ld [wItemEffectSucceeded], a

	ld hl, SacredAshScript
	call QueueScript
	ld a, $1
	ld [wItemEffectSucceeded], a
	ret
; 507fb

CheckAnyFaintedMon: ; 507fb
	ld de, PARTYMON_STRUCT_LENGTH
	ld bc, wPartySpecies
	ld hl, wPartyMon1HP
	ld a, [wPartyCount]
	and a
	ret z

.loop
	push af
	push hl
	ld a, [bc]
	inc bc
	cp EGG
	jr z, .next

	ld a, [hli]
	or [hl]
	jr z, .done

.next
	pop hl
	add hl, de
	pop af
	dec a
	jr nz, .loop
	xor a
	ret

.done
	pop hl
	pop af
	scf
	ret
; 50821

SacredAshScript: ; 0x50821
	reloadmappart
	opentext
	writetext AskSacredAshText
	yesorno
	iftrue .yes
	writetext AskSacredAshText2
	waitbutton
	closetext
	giveitem MIRACLETONIC
	end
.yes
	writetext UnknownText_0x508452
	waitbutton
	closetext
	pause 5
	special FadeOutPalettes
	special HealParty
	special SaveMusic
	playmusic MUSIC_HEAL
	pause 60
	special RestoreMusic
	callasm LoadMapPals
	special FadeInPalettes
	pause 5
	opentext
	writetext UnknownText_0x50845
	waitendtext
; 0x50845

UnknownText_0x50845: ; 0x50845
	; 's #MON were all healed!
	text_jump UnknownText_0x1c0b65
	db "@"

UnknownText_0x508452: ; 0x50845
	; 's #MON were all healed!
	text_jump UnknownText_0x1c0b652
	db "@"

AskSacredAshText:
	text "Are you sure you"
	line "want to use the"
	cont "MIRACLETONIC?"
	done
	
AskSacredAshText2:
	text "Better save it"
	line "for later…"
	done
