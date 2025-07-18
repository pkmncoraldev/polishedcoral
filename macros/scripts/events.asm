	enum_start

	enum scall_command
macro scall
	db scall_command
	dw \1 ; pointer
	endm

	enum farscall_command
macro farscall
	db farscall_command
	dba \1
	endm

	enum ptcall_command
macro {ptcall}
	db ptcall_command
	dw \1 ; pointer
	endm

	enum jump_command
macro {jump}
	db jump_command
	dw \1 ; pointer
	endm

	enum farjump_command
macro {farjump}
	db farjump_command
	dba \1
	endm

	enum ptjump_command
macro {ptjump}
	db ptjump_command
	dw \1 ; pointer
	endm

	enum ifequal_command
macro ifequal
	db ifequal_command
	db \1 ; byte
	dw \2 ; pointer
	endm

	enum ifnotequal_command
macro ifnotequal
	db ifnotequal_command
	db \1 ; byte
	dw \2 ; pointer
	endm

	enum iffalse_command
macro iffalse
	db iffalse_command
	dw \1 ; pointer
	endm

	enum iftrue_command
macro iftrue
	db iftrue_command
	dw \1 ; pointer
	endm

	enum ifgreater_command
macro ifgreater
	db ifgreater_command
	db \1 ; byte
	dw \2 ; pointer
	endm

	enum ifless_command
macro ifless
	db ifless_command
	db \1 ; byte
	dw \2 ; pointer
	endm

	enum jumpstd_command
macro jumpstd
	db jumpstd_command
	db \1 ; predefined_script
	endm

	enum callstd_command
macro callstd
	db callstd_command
	db \1 ; predefined_script
	endm

	enum callasm_command
macro callasm
	db callasm_command
	dba \1
	endm

	enum special_command
macro special
	db special_command
	db (\1Special - SpecialsPointers) / 3
	endm

	enum ptcallasm_command
macro {ptcallasm}
	db ptcallasm_command
	dw \1 ; asm
	endm

	enum checkmapscene_command
macro checkmapscene
	db checkmapscene_command
	map_id \1 ; map
	endm

	enum setmapscene_command
macro setmapscene
	db setmapscene_command
	map_id \1 ; map
	db \2 ; trigger_id
	endm

	enum checkscene_command
macro checkscene
	db checkscene_command
	endm

	enum setscene_command
macro setscene
	db setscene_command
	db \1 ; trigger_id
	endm

	enum writebyte_command
macro {writebyte}
	db writebyte_command
	db \1 ; value
	endm

	enum addvar_command
macro {addvar}
	db addvar_command
	db \1 ; value
	endm

	enum random_command
macro random
	db random_command
	db \1 ; input
	endm

	enum copybytetovar_command
macro {copybytetovar}
	db copybytetovar_command
	dw \1 ; address
	endm

	enum copyvartobyte_command
macro {copyvartobyte}
	db copyvartobyte_command
	dw \1 ; address
	endm

	enum loadvar_command
macro loadvar
	db loadvar_command
	dw \1 ; address
	db \2 ; value
	endm

	enum checkcode_command
macro {checkcode}
	db checkcode_command
	db \1 ; variable_id
	endm

	enum writevarcode_command
macro {writevarcode}
	db writevarcode_command
	db \1 ; variable_id
	endm

	enum writecode_command
macro writecode
	db writecode_command
	db \1 ; variable_id
	db \2 ; value
	endm

	enum giveitem_command
macro giveitem
	db giveitem_command
	db \1 ; item
if _NARG == 2
	db \2 ; quantity
else
	db 1
endc
	endm

	enum takeitem_command
macro takeitem
	db takeitem_command
	db \1 ; item
if _NARG == 2
	db \2 ; quantity
else
	db 1
endc
	endm

	enum checkitem_command
macro checkitem
	db checkitem_command
	db \1 ; item
	endm

	enum givemoney_command
macro givemoney
	db givemoney_command
	db \1 ; account
	dt \2 ; money
	endm

	enum takemoney_command
macro takemoney
	db takemoney_command
	db \1 ; account
	dt \2 ; money
	endm

	enum checkmoney_command
macro checkmoney
	db checkmoney_command
	db \1 ; account
	dt \2 ; money
	endm

	enum givecoins_command
macro givecoins
	db givecoins_command
	dw \1 ; coins
	endm

	enum takecoins_command
macro takecoins
	db takecoins_command
	dw \1 ; coins
	endm

	enum checkcoins_command
macro checkcoins
	db checkcoins_command
	dw \1 ; coins
	endm

	enum addcellnum_command
macro addcellnum
	db addcellnum_command
	db \1 ; person
	endm

	enum delcellnum_command
macro delcellnum
	db delcellnum_command
	db \1 ; person
	endm

	enum checkcellnum_command
macro checkcellnum
	db checkcellnum_command
	db \1 ; person
	endm

	enum checktime_command
macro checktime
	db checktime_command
	db \1 ; time
	endm

	enum checkpoke_command
macro checkpoke
	db checkpoke_command
	db \1 ; pkmn
	endm

	enum givepoke_command
MACRO givepoke
	db givepoke_command
	db \1 ; pokemon
	if _NARG >= 3
	db \2 ; form
	db \3 ; level
	else
	db 0 ; no form
	db \2 ; level
	endc
	if _NARG >= 4
	db \4 ; item
	else
	db 0 ; no item
	endc
	if _NARG >= 5
	db \5 ; trainer
	if \5
	dw \6 ; trainer_name_pointer
	dw \7 ; pkmn_nickname
	endc
	else
	db 0 ; no trainer
	endc
	endm

	enum giveegg_command
macro giveegg
	db giveegg_command
	db \1 ; pkmn
	db \2 ; level
	endm

	enum givepokeitem_command
macro {givepokeitem}
	db givepokeitem_command
	dw \1 ; pointer
	endm

	enum checkpokeitem_command
macro {checkpokeitem}
	db checkpokeitem_command
	dw \1 ; pointer
	endm

	enum checkevent_command
macro checkevent
	db checkevent_command
	dw \1 ; event_flag
	endm

	enum clearevent_command
macro clearevent
	db clearevent_command
	dw \1 ; event_flag
	endm

	enum setevent_command
macro setevent
	db setevent_command
	dw \1 ; event_flag
	endm

	enum checkflag_command
macro checkflag
	db checkflag_command
	dw \1 ; engine_flag
	endm

	enum clearflag_command
macro clearflag
	db clearflag_command
	dw \1 ; engine_flag
	endm

	enum setflag_command
macro setflag
	db setflag_command
	dw \1 ; engine_flag
	endm

	enum wildon_command
macro wildon
	db wildon_command
	endm

	enum wildoff_command
macro wildoff
	db wildoff_command
	endm

	enum warpmod_command
macro warpmod
	db warpmod_command
	db \1 ; warp_id
	map_id \2 ; map
	endm

	enum blackoutmod_command
macro blackoutmod
	db blackoutmod_command
	map_id \1 ; map
	endm

	enum warp_command
macro warp
	db warp_command
	map_id \1 ; map
	db \2 ; x
	db \3 ; y
	endm

	enum readmoney_command
macro readmoney
	db readmoney_command
	db \1 ; account
	db \2 ; memory
	endm

	enum readcoins_command
macro {readcoins}
	db readcoins_command
	db \1 ; memory
	endm

	enum RAM2MEM_command
macro {RAM2MEM}
	db RAM2MEM_command
	db \1 ; memory
	endm

	enum pokenamemem_command
macro pokenamemem
	db pokenamemem_command
	db \1 ; pokemon
	db \2 ; memory
	endm

	enum itemtotext_command
macro itemtotext
	db itemtotext_command
	db \1 ; item
	db \2 ; memory
	endm

	enum mapnametotext_command
macro {mapnametotext}
	db mapnametotext_command
	db \1 ; memory
	endm

	enum trainertotext_command
macro trainertotext
	db trainertotext_command
	db \1 ; trainer_id
	db \2 ; trainer_group
	db \3 ; memory
	endm

	enum stringtotext_command
macro stringtotext
	db stringtotext_command
	dw \1 ; text_pointer
	db \2 ; memory
	endm

	enum itemnotify_command
macro itemnotify
	db itemnotify_command
	endm

	enum pocketisfull_command
macro pocketisfull
	db pocketisfull_command
	endm

	enum opentext_command
macro opentext
	db opentext_command
if _NARG >= 1
	db \1 ; speaker
else
	db 0 ; no speaker
endc
if _NARG == 2
	db \2 ; species
else
	db 0 ; no species
endc
	endm

	enum refreshscreen_command
macro refreshscreen
	db refreshscreen_command
	endm

	enum closetext_command
macro closetext
	db closetext_command
	endm

	enum farwritetext_command
macro farwritetext
	db farwritetext_command
	dba \1
	endm

	enum writetext_command
macro writetext
	db writetext_command
	dw \1 ; text_pointer
	endm

	enum repeattext_command
macro repeattext
	db repeattext_command
	db \1 ; byte
	db \2 ; byte
	endm

	enum yesorno_command
macro yesorno
	db yesorno_command
	endm

	enum loadmenu_command
macro loadmenu
	db loadmenu_command
	dw \1 ; data
	endm

	enum closewindow_command
macro closewindow
	db closewindow_command
	endm

	enum jumptextfaceplayer_command
macro jumptextfaceplayer
	db jumptextfaceplayer_command
if _NARG == 1
	db 0
	db 0
	dw \1 ; text_pointer
else
	db \1 ; speaker
	if _NARG == 2
		db 0
		dw \2 ; text_pointer
	else
		db \2 ; species
		if _NARG == 3
			dw \3 ; text_pointer
		else
			db 0
		endc
	endc
endc
	endm

	enum farjumptext_command
macro farjumptext
	db farjumptext_command
	dba \1
	endm

	enum jumptext_command
macro jumptext
	db jumptext_command
	dw \1 ; text_pointer
	endm

	enum waitbutton_command
macro waitbutton
	db waitbutton_command
	endm

	enum buttonsound_command
macro buttonsound
	db buttonsound_command
	endm

	enum pokepic_command
macro pokepic
	db pokepic_command
	db \1 ; pokemon
if \1 == 0
	db -1 ; party mon
elif _NARG == 2
	db \2 ; form
else
	db 0
endc
	endm

	enum closepokepic_command
macro closepokepic
	db closepokepic_command
	endm

	enum _2dmenu_command
macro _2dmenu
	db _2dmenu_command
	endm

	enum verticalmenu_command
macro verticalmenu
	db verticalmenu_command
	endm

	enum randomwildmon_command
macro randomwildmon
	db randomwildmon_command
	endm

	enum loadmemtrainer_command
macro loadmemtrainer
	db loadmemtrainer_command
	endm

	enum loadwildmon_command
macro loadwildmon
	db loadwildmon_command
	db \1 ; pokemon
if _NARG == 3
	db \2 ; form
	db \3 ; level
else
	db 0  ; form
	db \2 ; level
endc
	endm

	enum loadtrainer_command
macro loadtrainer
	db loadtrainer_command
	db \1 ; trainer_group
	db \2 ; trainer_id
	endm

	enum startbattle_command
macro startbattle
	db startbattle_command
	endm

	enum reloadmapafterbattle_command
macro reloadmapafterbattle
	db reloadmapafterbattle_command
	endm

	enum catchtutorial_command
macro catchtutorial
	db catchtutorial_command
	db \1 ; byte
	endm

	enum trainertext_command
macro trainertext
	db trainertext_command
	db \1 ; which_text
	endm

	enum trainerflagaction_command
macro trainerflagaction
	db trainerflagaction_command
	db \1 ; action
	endm

	enum winlosstext_command
macro winlosstext
	db winlosstext_command
	dw \1 ; win_text_pointer
	dw \2 ; loss_text_pointer
	endm

	enum scripttalkafter_command
macro scripttalkafter
	db scripttalkafter_command
	endm

	enum end_if_just_battled_command
macro end_if_just_battled
	db end_if_just_battled_command
	endm

	enum check_just_battled_command
macro check_just_battled
	db check_just_battled_command
	endm

	enum setlasttalked_command
macro setlasttalked
	db setlasttalked_command
	db \1 ; person
	endm

	enum applymovement_command
macro applymovement
	db applymovement_command
	db \1 ; person
	dw \2 ; data
	endm

	enum applymovement2_command
macro {applymovement2}
	db applymovement2_command
	dw \1 ; data
	endm

	enum faceplayer_command
macro faceplayer
	db faceplayer_command
	endm

	enum faceobject_command
macro faceobject
	db faceobject_command
	db \1 ; person1
	db \2 ; person2
	endm

	enum variablesprite_command
macro variablesprite
	db variablesprite_command
	db \1 - SPRITE_VARS ; byte
	db \2 ; sprite
	endm

	enum disappear_command
macro disappear
	db disappear_command
	db \1 ; person
	endm

	enum appear_command
macro appear
	db appear_command
	db \1 ; person
	endm

	enum follow_command
macro follow
	db follow_command
	db \1 ; person2
	db \2 ; person1
	endm

	enum stopfollow_command
macro stopfollow
	db stopfollow_command
	endm

	enum moveobject_command
macro moveobject
	db moveobject_command
	db \1 ; person
	db \2 ; x
	db \3 ; y
	endm

	enum writepersonxy_command
macro {writepersonxy}
	db writepersonxy_command
	db \1 ; person
	endm

	enum loademote_command
macro loademote
	db loademote_command
	db \1 ; bubble
	endm

	enum showemote_command
macro showemote
	db showemote_command
	db \1 ; bubble
	db \2 ; person
	db \3 ; time
	endm

	enum turnobject_command
macro turnobject
	db turnobject_command
	db \1 ; person
	db \2 ; facing
	endm

	enum follownotexact_command
macro follownotexact
	db follownotexact_command
	db \1 ; person2
	db \2 ; person1
	endm

	enum earthquake_command
macro earthquake
	db earthquake_command
	db \1 ; param
	endm

	enum changemap_command
macro changemap
	db changemap_command
	dba \1 ; map_data
	endm

	enum changeblock_command
macro changeblock
	db changeblock_command
	db \1 ; x
	db \2 ; y
	db \3 ; block
	endm

	enum reloadmap_command
macro reloadmap
	db reloadmap_command
	endm

	enum reloadmappart_command
macro reloadmappart
	db reloadmappart_command
	endm

	enum writecmdqueue_command
macro writecmdqueue
	db writecmdqueue_command
	dw \1 ; queue_pointer
	endm

	enum delcmdqueue_command
macro delcmdqueue
	db delcmdqueue_command
	db \1 ; byte
	endm

	enum playmusic_command
macro playmusic
	db playmusic_command
	db \1 ; music_id
	endm

	enum encountermusic_command
macro encountermusic
	db encountermusic_command
	endm

	enum musicfadeout_command
macro musicfadeout
	db musicfadeout_command
	db \1 ; music
	db \2 ; fadetime
	endm

	enum playmapmusic_command
macro playmapmusic
	db playmapmusic_command
	endm

	enum dontrestartmapmusic_command
macro dontrestartmapmusic
	db dontrestartmapmusic_command
	endm

	enum cry_command
macro cry
	db cry_command
	db \1 ; cry_id
	endm

	enum playsound_command
macro playsound
	db playsound_command
	db \1 ; sound_id
	endm

	enum waitsfx_command
macro waitsfx
	db waitsfx_command
	endm

	enum warpsound_command
macro warpsound
	db warpsound_command
	endm

	enum specialsound_command
macro specialsound
	db specialsound_command
	endm

	enum passtoengine_command
macro {passtoengine}
	db passtoengine_command
	db \1 ; data_pointer
	endm

	enum newloadmap_command
macro newloadmap
	db newloadmap_command
	db \1 ; which_method
	endm

	enum pause_command
macro pause
	db pause_command
	db \1 ; length
	endm

	enum deactivatefacing_command
macro deactivatefacing
	db deactivatefacing_command
	db \1 ; time
	endm

	enum priorityjump_command
macro {priorityjump}
	db priorityjump_command
	dw \1 ; pointer
	endm

	enum warpcheck_command
macro warpcheck
	db warpcheck_command
	endm

	enum ptpriorityjump_command
macro {ptpriorityjump}
	db ptpriorityjump_command
	dw \1 ; pointer
	endm

	enum return_command
macro return
	db return_command
	endm

	enum end_command
macro end
	db end_command
	endm

	enum reloadandreturn_command
macro reloadandreturn
	db reloadandreturn_command
	db \1 ; which_method
	endm

	enum endall_command
macro endall
	db endall_command
	endm

	enum pokemart_command
macro pokemart
	db pokemart_command
	db \1 ; dialog_id
	db \2 ; mart_id
	endm

	enum elevator_command
macro elevator
	db elevator_command
	dw \1 ; floor_list_pointer
	endm

	enum trade_command
macro trade
	db trade_command
	db \1 ; trade_id
	endm

	enum askforphonenumber_command
macro askforphonenumber
	db askforphonenumber_command
	db \1 ; number
	endm

	enum phonecall_command
macro phonecall
	db phonecall_command
	dw \1 ; caller_name
	endm

	enum hangup_command
macro hangup
	db hangup_command
	endm

	enum describedecoration_command
macro describedecoration
	db describedecoration_command
	db \1 ; byte
	endm

	enum fruittree_command
macro fruittree
	db fruittree_command
	db \1 ; tree_id
	db \2 ; fruit_id
	endm

	enum specialphonecall_command
macro specialphonecall
	db specialphonecall_command
	db \1 ; call_id
	endm

	enum checkphonecall_command
macro checkphonecall
	db checkphonecall_command
	endm

	enum verbosegiveitem_command
macro verbosegiveitem
	db verbosegiveitem_command
	db \1 ; item
if _NARG == 2
	db \2 ; quantity
else
	db 1
endc
	endm

	enum verbosegiveitem2_command
macro {verbosegiveitem2}
	db verbosegiveitem2_command
	db \1 ; item
	db \2 ; var
	endm

	enum swarm_command
macro swarm
	db swarm_command
	db \1 ; flag
	map_id \2 ; map
	endm

	enum halloffame_command
macro halloffame
	db halloffame_command
	endm

	enum credits_command
macro credits
	db credits_command
	endm

	enum warpfacing_command
macro warpfacing
	db warpfacing_command
	db \1 ; facing
	map_id \2 ; map
	db \3 ; x
	db \4 ; y
	endm

	enum battletowertext_command
macro battletowertext
	db battletowertext_command
	db \1 ; memory
	endm

	enum landmarktotext_command
macro landmarktotext
	db landmarktotext_command
	db \1 ; id
	db \2 ; memory
	endm

	enum trainerclassname_command
macro trainerclassname
	db trainerclassname_command
	db \1 ; id
	db \2 ; memory
	endm

	enum name_command
macro name
	db name_command
	db \1 ; type
	db \2 ; id
	db \3 ; memory
	endm

	enum wait_command
macro wait
	db wait_command
	db \1 ; duration
	endm

	enum check_save_command
macro check_save
	db check_save_command
	endm

	enum count_seen_caught_command
macro count_seen_caught
	db count_seen_caught_command
	endm

	enum trainerpic_command
macro trainerpic
	db trainerpic_command
	db \1 ; trainer
	endm

	enum givetmhm_command
macro givetmhm
	db givetmhm_command
	db \1 ; tmhm
	endm

	enum checktmhm_command
macro checktmhm
	db checktmhm_command
	db \1 ; tmhm
	endm

	enum verbosegivetmhm_command
macro verbosegivetmhm
	db verbosegivetmhm_command
	db \1 ; tmhm
	endm

	enum tmhmnotify_command
macro tmhmnotify
	db tmhmnotify_command
	endm

	enum tmhmtotext_command
macro tmhmtotext
	db tmhmtotext_command
	db \1 ; tmhm
	db \2 ; memory
	endm

	enum checkdarkness_command
macro checkdarkness
	db checkdarkness_command
	endm

	enum checkunits_command
macro checkunits
	db checkunits_command
	endm

	enum unowntypeface_command
macro unowntypeface
	db unowntypeface_command
	endm

	enum restoretypeface_command
macro restoretypeface
	db restoretypeface_command
	endm

	enum jumpstashedtext_command
macro jumpstashedtext
	db jumpstashedtext_command
	endm

	enum jumpopenedtext_command
macro jumpopenedtext
	db jumpopenedtext_command
	dw \1 ; text_pointer
	endm

	enum iftrue_jumptext_command
macro iftrue_jumptext
	db iftrue_jumptext_command
	dw \1 ; text_pointer
	endm

	enum iffalse_jumptext_command
macro iffalse_jumptext
	db iffalse_jumptext_command
	dw \1 ; text_pointer
	endm

	enum iftrue_jumptextfaceplayer_command
macro iftrue_jumptextfaceplayer
	db iftrue_jumptextfaceplayer_command
	dw \1 ; text_pointer
	endm

	enum iffalse_jumptextfaceplayer_command
macro iffalse_jumptextfaceplayer
	db iffalse_jumptextfaceplayer_command
	dw \1 ; text_pointer
	endm

	enum iftrue_jumpopenedtext_command
macro iftrue_jumpopenedtext
	db iftrue_jumpopenedtext_command
	dw \1 ; text_pointer
	endm

	enum iffalse_jumpopenedtext_command
macro iffalse_jumpopenedtext
	db iffalse_jumpopenedtext_command
	dw \1 ; text_pointer
	endm

	enum thistext_command
macro thistext
	db thistext_command
	endm

	enum thistextfaceplayer_command
macro thistextfaceplayer
	db thistextfaceplayer_command
	endm

	enum thisopenedtext_command
macro thisopenedtext
	db thisopenedtext_command
	endm

	enum showtext_command
macro showtext
	db showtext_command
	dw \1 ; text_pointer
	endm

	enum showtextfaceplayer_command
macro showtextfaceplayer
	db showtextfaceplayer_command
	dw \1 ; text_pointer
	endm

	enum applyonemovement_command
macro applyonemovement
	db applyonemovement_command
	db \1 ; person
	db movement_\2 ; movement data
	db movement_step_end
	endm

	enum showcrytext_command
macro showcrytext
	db showcrytext_command
	dw \1 ; text_pointer
	db \2 ; cry_id
	endm

	enum endtext_command
macro endtext
	db endtext_command
	endm

	enum waitendtext_command
macro waitendtext
	db waitendtext_command
	endm

	enum iftrue_endtext_command
macro iftrue_endtext
	db iftrue_endtext_command
	endm

	enum iffalse_endtext_command
macro iffalse_endtext
	db iffalse_endtext_command
	endm

	enum loadgrottomon_command
macro loadgrottomon
	db loadgrottomon_command
	endm

	enum giveapricorn_command
macro giveapricorn
	db giveapricorn_command
	db \1 ; apricorn
if _NARG == 2
	db \2 ; quantity
else
	db 1
endc
	endm

	enum paintingpic_command
macro paintingpic
	db paintingpic_command
	db \1 ; painting
	endm

	enum checkegg_command
macro checkegg
	db checkegg_command
	endm

	enum waitbuttonsilent_command
macro waitbuttonsilent
	db waitbuttonsilent_command
	endm
	
	enum killsfx_command
macro killsfx
	db killsfx_command
	endm
	
	enum waitbuttonseat_command
macro waitbuttonseat
	db waitbuttonseat_command
	endm
	
		enum warp2_command
macro warp2
	db warp2_command
	db \1 ; facing
	map_id \2 ; map
	db \3 ; x
	db \4 ; y
	endm
	
	enum giveitemnotification_command
macro giveitemnotification
	db giveitemnotification_command
	endm
	
	enum checkdebugmode_command
macro checkdebugmode
	db checkdebugmode_command
	endm
	
	enum movetoplayer_command
macro movetoplayer
	db movetoplayer_command
	db \1 ; person
	endm
	
	enum variablesprite2_command
macro variablesprite2
	db variablesprite2_command
	db \1 - SPRITE_VARS ; byte
	endm
	
	enum playnewmapmusic_command
macro playnewmapmusic
	db playnewmapmusic_command
	endm
	
	enum strengthtree_command
macro strengthtree
	db strengthtree_command
	endm
	
	enum opentext2_command
macro opentext2
	db opentext2_command
	endm
	
	enum changetextboxspeaker_command
macro changetextboxspeaker
	db changetextboxspeaker_command
if _NARG >= 1
	db \1 ; speaker
else
	db 0 ; no speaker
endc
if _NARG == 2
	db \2 ; species
else
	db 0 ; no species
endc
	endm
	
macro thisasm
	callasm .asm\@
	end
.asm\@
endm
