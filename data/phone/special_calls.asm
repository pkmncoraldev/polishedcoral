specialcall: MACRO
; condition, contact, script
	dw \1
	db \2
	dba \3
ENDM

SpecialPhoneCallList:
; entries correspond to SPECIALCALL_* constants
	specialcall SpecialCallOnlyWhenOutside, PHONE_ELM,  SprucePhoneScript2    ; SPECIALCALL_POKERUS
	specialcall SpecialCallOnlyWhenOutside, PHONE_ELM,  SprucePhoneScript2    ; SPECIALCALL_ROBBED
	specialcall SpecialCallOnlyWhenOutside, PHONE_ELM,  SprucePhoneScript2    ; SPECIALCALL_ASSISTANT
	specialcall SpecialCallOnlyWhenOutside, PHONE_ELM,  SprucePhoneScript2    ; SPECIALCALL_WEIRDBROADCAST
	specialcall SpecialCallWhereverYouAre,  PHONE_ELM,  SprucePhoneScript2    ; SPECIALCALL_SSTICKET
	specialcall SpecialCallWhereverYouAre,  PHONE_OAK,  UnusedPhoneScript     ; SPECIALCALL_BIKESHOP
	specialcall SpecialCallOnlyWhenOutside, PHONE_ELM,  SprucePhoneScript2    ; SPECIALCALL_MASTERBALL
	specialcall SpecialCallOnlyWhenOutside, PHONE_BILL, BillPhoneScript2      ; SPECIALCALL_SECONDBADGE
