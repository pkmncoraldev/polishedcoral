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