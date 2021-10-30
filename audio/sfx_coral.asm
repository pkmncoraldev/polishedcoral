Sfx_SnowstormIntro:
	musicheader 1, 8, Sfx_SnowstormIntro_Ch8

Sfx_SnowstormIntro_Ch8: ; f1317
	togglesfx
	notetype $C
	sfxtogglenoise 6
	note D#, 1
	note C_, 6
	callchannel Sfx_Snowstorm_Ch8_loop
	
Sfx_Snowstorm:
	musicheader 1, 8, Sfx_Snowstorm_Ch8
	
Sfx_Snowstorm_Ch8:
	togglesfx
	notetype $C
	sfxtogglenoise 6
Sfx_Snowstorm_Ch8_loop:
	note E_, 16
	note C#, 6
	note C_, 6
	loopchannel 0, Sfx_Snowstorm_Ch8_loop
	
Sfx_Bump_Snowstorm: ; f09aa
	musicheader 2, 5, Sfx_Bump_Snowstorm_Ch5
	musicheader 1, 8, Sfx_Bump_Snowstorm_Ch8
	
Sfx_Bump_Snowstorm_Ch5: ; f1d6f
	dutycycle $2
	soundinput $5a
	sound __, 16, $f1, $0300
	soundinput $8
	endchannel
	
Sfx_Bump_Snowstorm_Ch8:
	togglesfx
	notetype $C
	sfxtogglenoise 6
	note E_, 2
	endchannel
	
Sfx_Grind: ; f0ab5
	musicheader 2, 5, Sfx_Grind_Ch5
	musicheader 1, 8, Sfx_Grind_Ch8
	
Sfx_Grind_Ch5: ; f1fd9
	dutycycle $0
	sound __,  1, $d2, $0700
	sound __,  1, $d2, $0740
	sound __,  1, $d2, $0780
	sound __,  1, $d2, $07c0
	sound __,  11, $e1, $07e0
	sound __,  2, $0, 0
	endchannel

Sfx_Grind_Ch8: ; f225a
	noise __,  4, $0, 0
Sfx_Grind_branch_2: ; f225a
	noise __, 11, $f3, $35
;	noise __, 15, $f6, $45
	loopchannel 0, Sfx_Grind_branch_2
	
Sfx_Scream: ; f0aac
	musicheader 3, 5, Sfx_Scream_Ch5
	musicheader 1, 6, Sfx_Scream_Ch6
	musicheader 1, 8, Sfx_Scream_Ch8
	
Sfx_Scream_Ch5: ; f221a
Sfx_Scream_branch_f221a: ; f221a
	dutycycle $0
	sound __,  1, $f1, $07c0
	sound __,  1, $f1, $0700
	loopchannel 36, Sfx_Scream_branch_f221a
	endchannel
; f2229

Sfx_Scream_Ch6: ; f2229
Sfx_Scream_branch_f2229: ; f2229
	sound_duty 3, 0, 3, 2
	sound __,  1, $e1, $07c1
	sound __,  1, $e1, $0701
	loopchannel 36, Sfx_Scream_branch_f2229
	endchannel
; f2238

Sfx_Scream_Ch8: ; f2238
Sfx_Scream_branch_f2238: ; f2238
	noise __,  2, $d1, $49
	noise __,  2, $d1, $29
	loopchannel 18, Sfx_Scream_branch_f2238
	endchannel

Sfx_Newton: ; f275b
	musicheader 1, 5, Sfx_Newton_Ch5
; f275e

Sfx_Newton_Ch5: ; f275e
	dutycycle $0
	sound __,  1, $98, $07d0
	sound __,  2, $62, $07d7
	endchannel
	
Sfx_FossilMachine: ; f0b33
	musicheader 4, 5, Sfx_FossilMachine_Ch5
	musicheader 1, 6, Sfx_FossilMachine_Ch6
	musicheader 1, 7, Sfx_FossilMachine_Ch7
	musicheader 1, 8, Sfx_FossilMachine_Ch8
	
Sfx_FossilMachine_Ch5: ; f2722
	dutycycle $2
	soundinput $5a
Sfx_FossilMachine_branch_f2726: ; f2726
	sound __,  3, $f1, $0300
	loopchannel 40, Sfx_FossilMachine_branch_f2726
	endchannel
; f274b

Sfx_FossilMachine_Ch6: ; f274b
Sfx_FossilMachine_Ch7: ; f274b
	sound F_,  1, $0, 0
	sound E_,  4, $0, 0
	endchannel
	
Sfx_FossilMachine_Ch8: ; f2754
	noise F_,  1, $0, $0
	noise E_,  4, $0, $0
	endchannel
	
Sfx_TVStatic:
	musicheader 1, 8, Sfx_TVStatic_Ch8
	
Sfx_TVStatic_Ch8:
	togglesfx
	notetype $C
	sfxtogglenoise 6
Sfx_TVStatic_Ch8_loop:
	note E_, 16
	loopchannel 0, Sfx_TVStatic_Ch8_loop