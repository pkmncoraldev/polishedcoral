Music_AfterTheRivalFight: ; f5127
	musicheader 4, 1, Music_AfterTheRivalFight_Ch1
	musicheader 1, 2, Music_AfterTheRivalFight_Ch2
	musicheader 1, 3, Music_AfterTheRivalFight_Ch3
	musicheader 1, 4, Music_AfterTheRivalFight_Ch4

Music_AfterTheRivalFight_Ch1:
	tempo 112
	volume $77
	tone $0001
	vibrato $12, $15
	stereopanning $f
	notetype $c, $95
	note __, 2
	loopchannel 0, Music_LookRival_Ch1_Loop
	
Music_AfterTheRivalFight_Ch2:
	dutycycle $1
	vibrato $8, $36
	stereopanning $f0
	notetype $c, $b5
	octave 4
	note C#, 1
	note D#, 1
	loopchannel 0, Music_LookRival_Ch2_Loop
	
Music_AfterTheRivalFight_Ch3:
	notetype $c, $16
	note __, 2
	loopchannel 0, Music_LookRival_Ch3_Loop
	
Music_AfterTheRivalFight_Ch4:
	togglenoise $3
	notetype $c
	note __, 2
	loopchannel 0, Music_LookRival_Ch4_Loop