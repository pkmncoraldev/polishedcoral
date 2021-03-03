specialcall: MACRO
; condition, contact, script
	dw \1
	db \2
	dba \3
ENDM

SpecialPhoneCallList:
; entries correspond to SPECIALCALL_* constants
	specialcall SpecialCallOnlyWhenOutside, PHONE_SPRUCE,  SprucePhoneScript    ; SPECIALCALL_POKERUS
	specialcall SpecialCallOnlyWhenOutside, PHONE_SPRUCE,  SprucePhoneScript    ; SPECIALCALL_COMETOISLAND
	specialcall SpecialCallWhereverYouAre, PHONE_MOM,	   MomPhoneScript       ; SPECIALCALL_MOMCOMEGETTRAINERCARD
