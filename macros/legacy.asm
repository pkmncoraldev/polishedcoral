; Legacy support for old pokecrystal.
; Allows porting scripts with as few edits as possible.
; Legacy support not in this file can be found by looking for the keyword: "LEGACY"

; macros/rst.asm
DEF callba EQUS "farcall"
DEF callab EQUS "callfar"

; macros/scripts/audio.asm
MACRO musicheader
	channel_count \1
	channel \2, \3
ENDM

MACRO sound
	note \1, \2
	db \3
	dw \4
ENDM

MACRO noise
	note \1, \2
	db \3
	db \4
ENDM

MACRO notetype
	if _NARG >= 2
		note_type \1, \2 >> 4, \2 & $0f
	else
		note_type \1
	endc
ENDM

MACRO pitchoffset
	transpose \1, \2 - 1
ENDM

DEF dutycycle EQUS "duty_cycle"

MACRO intensity
	volume_envelope \1 >> 4, \1 & $0f
ENDM

MACRO soundinput
	pitch_sweep \1 >> 4, \1 & $0f
ENDM

DEF unknownmusic0xde EQUS "sound_duty"
MACRO sound_duty
	db duty_cycle_pattern_cmd
	if _NARG == 4
		db \1 | (\2 << 2) | (\3 << 4) | (\4 << 6)
	else
		db \1
	endc
ENDM

DEF togglesfx EQUS "toggle_sfx"

MACRO slidepitchto
	pitch_slide \1, \2, \3
ENDM

DEF togglenoise EQUS "toggle_noise"

MACRO panning
	force_stereo_panning ((\1 >> 4) & 1), (\1 & 1)
ENDM

DEF tone           EQUS "pitch_offset"
DEF restartchannel EQUS "restart_channel"
DEF newsong        EQUS "new_song"
DEF sfxpriorityon  EQUS "sfx_priority_on"
DEF sfxpriorityoff EQUS "sfx_priority_off"

MACRO stereopanning
	stereo_panning ((\1 >> 4) & 1), (\1 & 1)
ENDM

DEF sfxtogglenoise EQUS "sfx_toggle_noise"
DEF setcondition   EQUS "set_condition"
DEF jumpif         EQUS "sound_jump_if"
DEF jumpchannel    EQUS "sound_jump"
DEF loopchannel    EQUS "sound_loop"
DEF callchannel    EQUS "sound_call"
DEF endchannel     EQUS "sound_ret"

; macros/scripts/events.asm

DEF checkmorn EQUS "checktime MORN"
DEF checkday  EQUS "checktime DAY"
DEF checknite EQUS "checktime NITE"

DEF jump           EQUS "sjump"
DEF farjump        EQUS "farsjump"
DEF priorityjump   EQUS "prioritysjump"
DEF ptcall         EQUS "memcall"
DEF ptjump         EQUS "memjump"
DEF ptpriorityjump EQUS "stopandsjump"
DEF ptcallasm      EQUS "memcallasm"

DEF if_equal        EQUS "ifequal"
DEF if_not_equal    EQUS "ifnotequal"
DEF if_greater_than EQUS "ifgreater"
DEF if_less_than    EQUS "ifless"
DEF end_all         EQUS "endall"

DEF checkmaptriggers EQUS "checkmapscene"
DEF domaptrigger     EQUS "setmapscene"
DEF checktriggers    EQUS "checkscene"
DEF dotrigger        EQUS "setscene"

DEF faceperson     EQUS "faceobject"
DEF moveperson     EQUS "moveobject"
DEF writepersonxy  EQUS "writeobjectxy"
DEF spriteface     EQUS "turnobject"
DEF objectface     EQUS "turnobject"
DEF applymovement2 EQUS "applymovementlasttalked"

DEF writebyte     EQUS "setval"
DEF addvar        EQUS "addval"
DEF copybytetovar EQUS "readmem"
DEF copyvartobyte EQUS "writemem"
DEF checkcode     EQUS "readvar"
DEF writevarcode  EQUS "writevar"

DEF MEM_BUFFER_0 EQUS "STRING_BUFFER_3"
DEF MEM_BUFFER_1 EQUS "STRING_BUFFER_4"
DEF MEM_BUFFER_2 EQUS "STRING_BUFFER_5"

DEF vartomem      EQUS "getnum"
DEF mapnametotext EQUS "getcurlandmarkname"
DEF readcoins     EQUS "getcoins"

DEF RAM2MEM           EQUS "getnum"
DEF loadfont          EQUS "opentext"
DEF loadmenudata      EQUS "loadmenu"
DEF loadmenuheader    EQUS "loadmenu"
DEF writebackup       EQUS "closewindow"
DEF interpretmenu     EQUS "_2dmenu"
DEF interpretmenu2    EQUS "verticalmenu"
DEF battlecheck       EQUS "randomwildmon"
DEF loadtrainerdata   EQUS "loadtemptrainer"
DEF loadpokedata      EQUS "loadwildmon"
DEF returnafterbattle EQUS "reloadmapafterbattle"
DEF trainerstatus     EQUS "trainerflagaction"
DEF talkaftercancel   EQUS "endifjustbattled"
DEF talkaftercheck    EQUS "checkjustbattled"
DEF playrammusic      EQUS "encountermusic"
DEF reloadmapmusic    EQUS "dontrestartmapmusic"
DEF resetfuncs        EQUS "endall"
DEF storetext         EQUS "battletowertext"
DEF displaylocation   EQUS "landmarktotext"
DEF givepokeitem      EQUS "givepokemail"
DEF checkpokeitem     EQUS "checkpokemail"
DEF passtoengine      EQUS "autoinput"
DEF verbosegiveitem2  EQUS "verbosegiveitemvar"
DEF loadbytec2cf      EQUS "writeunusedbytebuffer"

; macros/scripts/maps.asm

MACRO mapconst
	map_const \1, \3, \2
ENDM

DEF maptrigger EQUS "scene_script"

MACRO warp_def
	warp_event \2, \1, \4, \3
ENDM

MACRO xy_trigger
	coord_event \3, \2, \1, \5
ENDM

MACRO signpost
	bg_event \2, \1, \3, \4
ENDM

MACRO person_event
;	object_event \3, \2, \1, \4, \5, \6, \7, \8, \9, \10, \11, \12, \13
	db \1, \2 + 4, \3 + 4, \4
	dn \6, \5
	db \7, \8
	shift
	dn \8, \9
	shift
	db \9
	shift
	dw \9
	shift
	dw \9
ENDM

DEF PERSONTYPE_SCRIPT   EQUS "OBJECTTYPE_SCRIPT"
DEF PERSONTYPE_ITEMBALL EQUS "OBJECTTYPE_ITEMBALL"
DEF PERSONTYPE_TRAINER  EQUS "OBJECTTYPE_TRAINER"

; macros/scripts/movement.asm

DEF show_person   EQUS "show_object"
DEF hide_person   EQUS "hide_object"
DEF remove_person EQUS "remove_object"


; macros/scripts/text.asm
DEF text_from_ram          EQUS "text_ram"
DEF start_asm              EQUS "text_asm"
DEF deciram                EQUS "text_decimal"
DEF interpret_data         EQUS "text_pause"
DEF limited_interpret_data EQUS "text_dots"
DEF link_wait_button       EQUS "text_linkwaitbutton"
DEF current_day            EQUS "text_today"
DEF text_jump              EQUS "text_far"

; macros/scripts/battle_anims.asm
DEF anim_enemyfeetobj  EQUS "anim_battlergfx_2row"
DEF anim_playerheadobj EQUS "anim_battlergfx_1row"
DEF anim_clearsprites  EQUS "anim_keepsprites"