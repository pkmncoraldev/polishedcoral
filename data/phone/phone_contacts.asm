phone: MACRO
	db  \1, \2 ; trainer
	map_id \3 ; map
	db  \4
	dba \5 ; script 1
	db  \6
	dba \7 ; script 2
ENDM

PhoneContacts:
	phone TRAINER_NONE, PHONE_00,              N_A,                       0, UnusedPhoneScript,   0, UnusedPhoneScript
	phone TRAINER_NONE, PHONECONTACT_MOM,      PLAYER_HOUSE_1F,           7, MomPhoneScript,      0, UnusedPhoneScript
	phone TRAINER_NONE, PHONECONTACT_SPRUCE,   SUNSET_LIGHTHOUSE,         7, SprucePhoneScript1,  0, SprucePhoneScript2
;	phone SCHOOLBOY,    JACK1,                 NATIONAL_PARK,             7, JackPhoneScript1,    7, JackPhoneScript2
