Music_Oasis:
	musicheader 3, 1, Music_Oasis_Ch1
	musicheader 1, 2, Music_Oasis_Ch2
	musicheader 1, 3, Music_Oasis_Ch3
;	musicheader 1, 4, Music_Mountaintop_Ch3
	
Music_Oasis_Ch1:
	tempo 150
	volume $77
	dutycycle $3
	vibrato $8, $25
	notetype $c, $78
Music_Oasis_Ch1_loop:
	callchannel BrilloSongHarmony
	note E_, 12
	callchannel BrilloSongHarmony2
	loopchannel 0, Music_Oasis_Ch1_loop
	
Music_Oasis_Ch2:
	vibrato $6, $34
	tone $0002
	dutycycle $0
	notetype $c, $7a
Music_Oasis_Ch2_loop:
	callchannel BrilloSongLeadMelody
	note C_, 12
	callchannel BrilloSongLeadMelody2
	loopchannel 0, Music_Oasis_Ch2_loop
	
Music_Oasis_Ch3:
	notetype $c, $12
	octave 3
	note __, 6
Music_Oasis_Ch3_loop:
	callchannel BrilloSongBass
	loopchannel 0, Music_Oasis_Ch3_loop
