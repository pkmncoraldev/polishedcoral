Sfx_Pokeflute2: ; f09f8
	musicheader 4, 7, Sfx_Pokeflute2_Ch7
	musicheader 1, 5, Sfx_Pokeflute2_Ch5
	musicheader 1, 6, Sfx_Pokeflute2_Ch6
	musicheader 1, 8, Sfx_Pokeflute2_Ch8

Sfx_Pokeflute2_Ch7: ; f1cda
	tempo 256
	volume $77
	togglesfx
	vibrato $10, $14
	notetype $c, $10
	octave 5
	note E_, 2
	note F_, 2
	note G_, 4
	note A_, 2
	note G_, 2
	octave 6
	note C_, 4
	note C_, 2
	note D_, 2
	note C_, 2
	octave 5
	note G_, 2
	note A_, 2
	note F_, 2
	note G_, 8
	note __, 2
	endchannel
	
	togglesfx
	
Sfx_Pokeflute2_Ch5:
	tempo 256
	volume $77
	togglesfx
	vibrato $10, $14
	notetype $c, $10
	note __, 12
	note __, 12
	note __, 12
	note __, 2
	endchannel
	
	togglesfx
	
Sfx_Pokeflute2_Ch6:
	tempo 256
	volume $77
	togglesfx
	vibrato $10, $14
	notetype $c, $10
	note __, 12
	note __, 12
	note __, 12
	note __, 2
	endchannel
	
	togglesfx
	
Sfx_Pokeflute2_Ch8:
	tempo 256
	volume $77
	togglesfx
	vibrato $10, $14
	notetype $c, $10
	note __, 12
	note __, 12
	note __, 12
	note __, 2
	endchannel