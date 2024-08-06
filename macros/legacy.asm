; Legacy support for old pokecrystal.
; Allows porting scripts with as few edits as possible.
; Legacy support not in this file can be found by looking for the keyword: "LEGACY"

; macros/rst.asm
callba EQUS "farcall"
callab EQUS "callfar"

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

checkmorn EQUS "checktime MORN"
checkday  EQUS "checktime DAY"
checknite EQUS "checktime NITE"

jump           EQUS "sjump"
farjump        EQUS "farsjump"
priorityjump   EQUS "prioritysjump"
ptcall         EQUS "memcall"
ptjump         EQUS "memjump"
ptpriorityjump EQUS "stopandsjump"
ptcallasm      EQUS "memcallasm"

if_equal        EQUS "ifequal"
if_not_equal    EQUS "ifnotequal"
if_greater_than EQUS "ifgreater"
if_less_than    EQUS "ifless"
end_all         EQUS "endall"

checkmaptriggers EQUS "checkmapscene"
domaptrigger     EQUS "setmapscene"
checktriggers    EQUS "checkscene"
dotrigger        EQUS "setscene"

faceperson     EQUS "faceobject"
moveperson     EQUS "moveobject"
writepersonxy  EQUS "writeobjectxy"
spriteface     EQUS "turnobject"
objectface     EQUS "turnobject"
applymovement2 EQUS "applymovementlasttalked"

writebyte     EQUS "setval"
addvar        EQUS "addval"
copybytetovar EQUS "readmem"
copyvartobyte EQUS "writemem"
checkcode     EQUS "readvar"
writevarcode  EQUS "writevar"

MEM_BUFFER_0 EQUS "STRING_BUFFER_3"
MEM_BUFFER_1 EQUS "STRING_BUFFER_4"
MEM_BUFFER_2 EQUS "STRING_BUFFER_5"

vartomem      EQUS "getnum"
mapnametotext EQUS "getcurlandmarkname"
readcoins     EQUS "getcoins"

RAM2MEM           EQUS "getnum"
loadfont          EQUS "opentext"
loadmenudata      EQUS "loadmenu"
loadmenuheader    EQUS "loadmenu"
writebackup       EQUS "closewindow"
interpretmenu     EQUS "_2dmenu"
interpretmenu2    EQUS "verticalmenu"
battlecheck       EQUS "randomwildmon"
loadtrainerdata   EQUS "loadtemptrainer"
loadpokedata      EQUS "loadwildmon"
returnafterbattle EQUS "reloadmapafterbattle"
trainerstatus     EQUS "trainerflagaction"
talkaftercancel   EQUS "endifjustbattled"
talkaftercheck    EQUS "checkjustbattled"
playrammusic      EQUS "encountermusic"
reloadmapmusic    EQUS "dontrestartmapmusic"
resetfuncs        EQUS "endall"
storetext         EQUS "battletowertext"
displaylocation   EQUS "landmarktotext"
givepokeitem      EQUS "givepokemail"
checkpokeitem     EQUS "checkpokemail"
passtoengine      EQUS "autoinput"
verbosegiveitem2  EQUS "verbosegiveitemvar"
loadbytec2cf      EQUS "writeunusedbytebuffer"

; macros/scripts/maps.asm

mapconst: MACRO
	map_const \1, \3, \2
ENDM

maptrigger EQUS "scene_script"

warp_def: MACRO
	warp_event \2, \1, \4, \3
ENDM

xy_trigger: MACRO
	coord_event \3, \2, \1, \5
ENDM

signpost: MACRO
	bg_event \2, \1, \3, \4
ENDM

person_event: MACRO
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

PERSONTYPE_SCRIPT   EQUS "OBJECTTYPE_SCRIPT"
PERSONTYPE_ITEMBALL EQUS "OBJECTTYPE_ITEMBALL"
PERSONTYPE_TRAINER  EQUS "OBJECTTYPE_TRAINER"

; macros/scripts/movement.asm

show_person   EQUS "show_object"
hide_person   EQUS "hide_object"
remove_person EQUS "remove_object"


; macros/scripts/text.asm
text_from_ram          EQUS "text_ram"
start_asm              EQUS "text_asm"
deciram                EQUS "text_decimal"
interpret_data         EQUS "text_pause"
limited_interpret_data EQUS "text_dots"
link_wait_button       EQUS "text_linkwaitbutton"
current_day            EQUS "text_today"
text_jump              EQUS "text_far"

; macros/scripts/battle_anims.asm
anim_enemyfeetobj  EQUS "anim_battlergfx_2row"
anim_playerheadobj EQUS "anim_battlergfx_1row"
anim_clearsprites  EQUS "anim_keepsprites"