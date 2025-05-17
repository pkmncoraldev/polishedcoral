text   EQUS "db \"<START>\"," ; Start writing text.
next   EQUS "db \"<NL>\","    ; Move a line down.
next1  EQUS "db \"<LNBRK>\"," ; Move a line down (without line spacing)
line   EQUS "db \"<LINE>\","  ; Start writing at the bottom line.
page   EQUS "db \"@\","       ; Start a new Pokedex page.
para   EQUS "db \"<PARA>\","  ; Start a new paragraph.
cont   EQUS "db \"<CONT>\","  ; Scroll to the next line.
done   EQUS "db \"<DONE>\""   ; End a text box.
prompt EQUS "db \"<PROMPT>\"" ; Prompt the player to end a text box (initiating some other event).

macro text_from_ram
	db "<RAM>"
	dw \1
endm

macro text_bcd
	db "<BCD>"
	dw \1
	db \2
endm

macro text_move
	db "<MOVE>"
	dw \1
endm

macro text_box
	db "<BOX>"
	dw \1
	db \2, \3
ENDM

macro text_low
	db "<LOW>"
endm

macro text_waitbutton
	db "<WAIT>"
endm

macro text_scroll
	db "<SCROLL>"
endm

macro start_asm
	db "<ASM>"
endm

macro deciram
	db "<NUM>"
	dw \1 ; address
	dn \2, \3 ; bytes, digits
endm

macro interpret_data
	db "<EXIT>"
endm

macro sound_dex_fanfare_50_79
	db "<DEX2>"
endm

macro limited_interpret_data
	db "<DOTS>"
	db \1
endm

macro link_wait_button
	db "<LINK>"
endm

macro sound_dex_fanfare_20_49
	db "<DEX1>"
endm

macro sound_item
	db "<ITEM>"
endm

macro sound_caught_mon
	db "<CAUGHT>"
endm

macro sound_dex_fanfare_80_109
	db "<DEX3>"
endm

macro sound_fanfare
	db "<BEEP>"
endm

macro sound_slot_machine_start
	db "<SLOTS>"
endm

macro sound_read
	db "<SOUND>"
endm

macro sound_knock
	db "<KNOCK>"
endm

macro text_buffer
	db "<BUFFER>"
	db \1
endm

macro current_day
	db "<DAY>"
endm

MACRO text_jump
	db "<FAR>"
	dw \1
	db BANK(\1)
ENDM
