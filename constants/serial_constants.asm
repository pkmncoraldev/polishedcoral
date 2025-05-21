DEF USING_EXTERNAL_CLOCK       EQU $01
DEF USING_INTERNAL_CLOCK       EQU $02
DEF CONNECTION_NOT_ESTABLISHED EQU $ff

DEF START_TRANSFER_EXTERNAL_CLOCK EQU $80
DEF START_TRANSFER_INTERNAL_CLOCK EQU $81

; signals the start of an array of bytes transferred over the link cable
DEF SERIAL_PREAMBLE_BYTE EQU $fd
; this byte is used when there is no data to send
DEF SERIAL_NO_DATA_BYTE EQU $fe
; signals the end of one part of a patch list (there are two parts)
; for player/enemy party data
DEF SERIAL_PATCH_LIST_PART_TERMINATOR EQU $ff

DEF const_value = 2
	const LINK_TRADECENTER
	const LINK_COLOSSEUM

DEF SERIAL_TRADECENTER EQU $70
DEF SERIAL_BATTLE      EQU $80
