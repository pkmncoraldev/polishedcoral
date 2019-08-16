Music_RivalBattle: ; f6096
	musicheader 3, 1, Music_RivalBattle_Ch1
	musicheader 1, 2, Music_RivalBattle_Ch2
	musicheader 1, 3, Music_RivalBattle_Ch3
; f609f

Music_RivalBattle_Ch1: ; f609f
	tempo 90
	volume $77
	dutycycle $F
	tone $0002
	vibrato $8, $15
	notetype $c, $b2
	
	intensity $b3
	octave 5
	note C_, 1
	octave 4
	note G_, 1
	octave 5
	note C_, 1
	note D#, 1
	note C_, 1
	octave 4
	note G_, 1
	octave 5
	note C_, 1
	note D#, 1
	note C_, 1
	octave 4
	note G_, 1
	octave 5
	note C_, 1
	note D#, 1
	note C_, 1
	octave 4
	note G_, 1
	octave 5
	note C_, 1
	note D#, 1
	note C_, 1
	octave 4
	note G_, 1
	octave 5
	note C_, 1
	note D#, 1
	note C_, 1
	octave 4
	note G_, 1
	octave 5
	note C_, 1
	note D#, 1
	dutycycle $3
	octave 3
	note F#, 4
	note A_, 4
	
	dutycycle $0
	note G_, 2
	note __, 4
	note G_, 2
	note __, 4
	note G_, 2
	note __, 4
	dutycycle $8
	note G_, 2
	note D#, 2
	note G_, 2
	note A#, 2
	note A_, 2
	note G_, 2
	note F_, 2
	dutycycle $0
	note G_, 2
	note __, 4
	note G_, 2
	note __, 4
	note G_, 2
	note __, 4
	dutycycle $8
	note G_, 2
	note D#, 2
	note G_, 2
	note A#, 4
	note F#, 4
	
	dutycycle $0
	note G_, 2
	note __, 4
	note G_, 2
	note __, 4
	note G_, 2
	note __, 4
	dutycycle $8
	note G_, 2
	note D#, 2
	note G_, 2
	note A#, 2
	note A_, 2
	note G_, 2
	note F_, 2
	dutycycle $0
	note G_, 2
	note __, 4
	note G_, 2
	note __, 4
	note G_, 2
	note __, 2
	
	dutycycle $8
	intensity $b5
	note G#, 8
	note A#, 8
	
	dutycycle $3
	octave 4
	note C_, 4
	octave 3
	note D#, 2
	note G_, 4
	note C_, 4
	note D#, 2
	note D_, 4
	note F_, 4
	note A#, 4
	note F_, 4
	note A_, 6
	note F_, 6
	note C_, 4
	note D#, 8
	note F_, 8
	note G_, 4
	note D#, 2
	note G_, 4
	note D#, 4
	note G_, 2
	note D_, 4
	note F_, 4
	note A#, 4
	note F_, 4
	note A_, 6
	note F_, 6
	note A_, 4
	note D#, 8
	note F_, 8
		
Music_RivalBattle_loop1: ; f6102
	note G_, 4
	note D#, 2
	note G_, 4
	note C_, 4
	note D#, 2
	note D_, 4
	note F_, 4
	note A#, 4
	note F_, 4
	note A_, 6
	note F_, 6
	note C_, 4
	note D#, 8
	note F_, 8
	note G_, 4
	note D#, 2
	note G_, 4
	note D#, 4
	note G_, 2
	note D_, 4
	note F_, 4
	note A#, 4
	note F_, 4
	note A_, 6
	note F_, 6
	note A_, 4
	note D#, 8
	note F_, 8
	
	intensity $b6
	note G_, 16
	note __, 16
	
	intensity $b5
	note G_, 16
	note A#, 6
	note G_, 10
	note G_, 16
	note F_, 8
	note D_, 8
	note D#, 16
	note D#, 6
	note G_, 10
	note F_, 6
	note D#, 6
	note C_, 4
	note D_, 8
	octave 2
	note B_, 8
	
	note G#, 6
	octave 3
	note C_, 6
	note D#, 4
	note D#, 6
	note G_, 10
	note B_, 6
	note G_, 6
	note B_, 4
	octave 4
	note C_, 8
	octave 3
	note G_, 8
	note C_, 6
	octave 2
	note G#, 6
	octave 3
	note C_, 4
	octave 2
	note B_, 6
	note G_, 6
	note B_, 2
	octave 3
	note D_, 2
	note F_, 8
	note D_, 8
	note G_, 8
	note F_, 8
	
	dutycycle $3
	note D#, 16
	note D#, 16
	dutycycle $0
	note D#, 2
	note __, 4
	note D#, 2
	note __, 4
	note D#, 2
	note __, 2
	note C_, 2
	note __, 4
	note C_, 2
	note __, 4
	note D#, 2
	note __, 2
	dutycycle $3
	note D#, 8
	note C_, 8
	note G#, 8
	note F_, 8
	dutycycle $0
	note D#, 2
	note __, 4
	note D#, 2
	note __, 4
	note D#, 2
	note __, 2
	note C_, 2
	note __, 4
	note C_, 2
	note __, 4
	note D#, 2
	note __, 2
	
	dutycycle $3
	note D#, 16
	note G#, 8
	octave 4
	note C_, 8
	dutycycle $0
	octave 3
	note D#, 2
	note __, 4
	note D#, 2
	note __, 4
	note D#, 2
	note F_, 2
	note G_, 2
	note __, 4
	note G_, 2
	note __, 4
	note G_, 2
	note __, 2
	dutycycle $3
	octave 4
	note C_, 16
	octave 3
	note G_, 8
	note F_, 8
	dutycycle $0
	note G_, 2
	note __, 4
	note G_, 2
	note __, 4
	note G_, 2
	note __, 2
	note G_, 2
	note __, 6
	note G_, 8
	
	dutycycle $3
	octave 4
	note C_, 12
	octave 3
	note G_, 2
	octave 4
	note C_, 2
	octave 3
	note D_, 4
	note F_, 4
	note A#, 4
	note F_, 4
	note A_, 6
	note F_, 6
	note C_, 4
	note D#, 8
	note F_, 8
	octave 4
	note C_, 12
	octave 3
	note G_, 2
	octave 4
	note C_, 2
	octave 3
	note D_, 4
	note F_, 4
	note A#, 4
	note F_, 4
	note A_, 6
	note F_, 6
	note A_, 4
	note D#, 8
	note F_, 4
	note __, 4
	loopchannel 0, Music_RivalBattle_loop1
	endchannel
; f62b3

Music_RivalBattle_Ch2: ; f62b3
	dutycycle $3
	vibrato $8, $36
	tone $0001
	notetype $c, $c2
	intensity $b3
	octave 4
	note C_, 6
	octave 3
	note G_, 6
	octave 4
	note D#, 6
	note C_, 6
	octave 3
	note B_, 4
	octave 4
	note D_, 4
	
	note C_, 2
	note __, 4
	note C_, 2
	note __, 4
	note C_, 2
	note __, 4
	note C_, 2
	octave 3
	note G_, 2
	octave 4
	note C_, 2
	note D#, 2
	note D_, 2
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	note __, 4
	note C_, 2
	note __, 4
	note C_, 2
	note __, 4
	note C_, 2
	octave 3
	note G_, 2
	octave 4
	note C_, 2
	note D#, 4
	octave 3
	note B_, 4
	
	octave 4
	note C_, 2
	note __, 4
	note C_, 2
	note __, 4
	note C_, 2
	note __, 4
	note C_, 2
	octave 3
	note G_, 2
	octave 4
	note C_, 2
	note D#, 2
	note D_, 2
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	note __, 4
	note C_, 2
	note __, 4
	note C_, 2
	note __, 2
	
	intensity $b5
	note C_, 8
	note D_, 8
	
	note D#, 12
	note C_, 2
	note D#, 2
	octave 3
	note A#, 4
	octave 4
	note D_, 4
	note F_, 4
	note D_, 4
	note D#, 6
	note C_, 6
	octave 3
	note A_, 4
	note G#, 2
	octave 4
	note C_, 2
	note D#, 2
	note G#, 2
	octave 3
	note A#, 2
	octave 4
	note D_, 2
	note F_, 2
	note A#, 2
	note D#, 12
	note C_, 2
	note D#, 2
	octave 3
	note A#, 4
	octave 4
	note D_, 4
	note F_, 4
	note D_, 4
	note D#, 6
	note C_, 6
	note D#, 4
	note G#, 2
	note D#, 2
	note C_, 2
	octave 3
	note G#, 2
	octave 4
	note A#, 2
	note F_, 2
	note D_, 2
	octave 3
	note A#, 2
		
Music_RivalBattle_loop2: ; f6102
	octave 4
	note D#, 12
	note C_, 2
	note D#, 2
	octave 3
	note A#, 4
	octave 4
	note D_, 4
	note F_, 4
	note D_, 4
	note D#, 6
	note C_, 6
	octave 3
	note A_, 4
	note G#, 2
	octave 4
	note C_, 2
	note D#, 2
	note G#, 2
	octave 3
	note A#, 2
	octave 4
	note D_, 2
	note F_, 2
	note A#, 2
	note D#, 12
	note C_, 2
	note D#, 2
	octave 3
	note A#, 4
	octave 4
	note D_, 4
	note F_, 4
	note D_, 4
	note D#, 6
	note C_, 6
	note D#, 4
	note G#, 2
	note D#, 2
	note C_, 2
	octave 3
	note G#, 2
	octave 4
	note A#, 2
	note F_, 2
	note D_, 2
	octave 3
	note A#, 2
	octave 5
	
	intensity $b6
	note C_, 16
	note __, 16
	
	intensity $b5
	octave 4
	note D#, 2
	note D_, 2
	note __, 2
	note C_, 6
	note D#, 4
	note D_, 6
	octave 3
	note A#, 10
	octave 4
	note C_, 2
	octave 3
	note A#, 2
	note __, 2
	note G_, 6
	octave 4
	note C_, 4
	octave 3
	note A#, 16
	note G#, 2
	note G_, 2
	note __, 2
	note F_, 6
	note G#, 4
	note G_, 6
	octave 4
	note C_, 10
	note C_, 2
	note D_, 2
	note __, 2
	note D#, 6
	note G_, 4
	note F_, 16
	
	note G#, 2
	note G_, 2
	note __, 2
	note F_, 6
	note G#, 4
	note G_, 6
	note C_, 10
	note F_, 2
	note D#, 2
	note __, 2
	note D_, 6
	note F_, 4
	note G_, 16
	note D#, 2
	note D_, 2
	note __, 2
	note C_, 6
	note D#, 4
	note D_, 6
	octave 3
	note B_, 6
	octave 4
	note D_, 2
	note F_, 2
	note G_, 14
	note F_, 2
	note G_, 16
	
	octave 3
	note G#, 16
	octave 4
	note C_, 16
	octave 3
	note G_, 2
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note G_, 2
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note G_, 2
	note C_, 1
	note __, 1
	note D#, 2
	octave 2
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 3
	note D#, 2
	octave 2
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 3
	note G_, 2
	note C_, 1
	note __, 1
	note G#, 16
	octave 4
	note C_, 16
	octave 3
	note G_, 2
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note G_, 2
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note G_, 2
	note C_, 1
	note __, 1
	note D#, 2
	octave 2
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 3
	note D#, 2
	octave 2
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 3
	note G_, 2
	note C_, 1
	note __, 1
	
	note G#, 16
	octave 4
	note C_, 8
	note D#, 8
	octave 3
	note G_, 2
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note G_, 2
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note G_, 2
	note C_, 1
	note __, 1
	
	octave 4
	note C_, 2
	octave 3
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	octave 4
	note C_, 2
	octave 3
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	octave 4
	note C_, 2
	octave 3
	note D#, 1
	note __, 1
	octave 4
	note D#, 16
	octave 3
	note B_, 16
	octave 4
	note C_, 2
	note __, 4
	note C_, 2
	note __, 4
	note C_, 2
	note __, 2
	note C_, 2
	note __, 6
	octave 3
	note B_, 8
	
	octave 4
	note D#, 12
	note C_, 2
	note D#, 2
	octave 3
	note A#, 4
	octave 4
	note D_, 4
	note F_, 4
	note D_, 4
	note D#, 6
	note C_, 6
	octave 3
	note A_, 4
	note G#, 2
	octave 4
	note C_, 2
	note D#, 2
	note G#, 2
	octave 3
	note A#, 2
	octave 4
	note D_, 2
	note F_, 2
	note A#, 2
	note D#, 12
	note C_, 2
	note D#, 2
	octave 3
	note A#, 4
	octave 4
	note D_, 4
	note F_, 4
	note D_, 4
	note D#, 6
	note C_, 6
	note D#, 4
	note G#, 2
	note D#, 2
	note C_, 2
	octave 3
	note G#, 2
	octave 4
	note A#, 2
	note F_, 2
	note D_, 2
	octave 3
	note A#, 2
	loopchannel 0, Music_RivalBattle_loop2
	endchannel
; f64de

Music_RivalBattle_Ch3: ; f64de
	notetype $c, $19
	octave 3
	note C_, 2
	note D#, 2
	note G_, 2
	note C_, 2
	note D#, 2
	note G_, 2
	note C_, 2
	note D#, 2
	note G_, 2
	note C_, 2
	note D#, 2
	note G_, 2
	octave 2
	note G_, 4
	note B_, 4
	
	octave 3
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	octave 2
	note A#, 2
	note B_, 2
	
	octave 3
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	octave 2
	note A#, 4
	octave 3
	note C#, 4
	
	octave 3
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	octave 2
	note A#, 2
	note B_, 2
	
	octave 3
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	octave 2
	note G#, 2
	note D#, 2
	note G#, 2
	octave 3
	note C_, 2
	octave 2
	note A#, 2
	note F_, 2
	note A#, 2
	octave 3
	note D_, 2
	
	
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	octave 2
	note A_, 2
	octave 3
	note F_, 2
	octave 2
	note A_, 2
	octave 3
	note F_, 2
	octave 2
	note A_, 2
	octave 3
	note F_, 2
	octave 2
	note A_, 2
	octave 3
	note F_, 2
	octave 2
	note G#, 2
	octave 3
	note D#, 2
	octave 2
	note G#, 2
	octave 3
	note D#, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	octave 2
	note A_, 2
	octave 3
	note F_, 2
	octave 2
	note A_, 2
	octave 3
	note F_, 2
	octave 2
	note A_, 2
	octave 3
	note F_, 2
	octave 2
	note A_, 2
	octave 3
	note F_, 2
	octave 2
	note G#, 2
	octave 3
	note D#, 2
	octave 2
	note G#, 2
	octave 3
	note D#, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	
Music_RivalBattle_loop3: ; f6102
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	octave 2
	note A_, 2
	octave 3
	note F_, 2
	octave 2
	note A_, 2
	octave 3
	note F_, 2
	octave 2
	note A_, 2
	octave 3
	note F_, 2
	octave 2
	note A_, 2
	octave 3
	note F_, 2
	octave 2
	note G#, 8
	note A#, 8

	octave 3
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	octave 2
	note A_, 2
	octave 3
	note F_, 2
	octave 2
	note A_, 2
	octave 3
	note F_, 2
	octave 2
	note A_, 2
	octave 3
	note F_, 2
	octave 2
	note A_, 2
	octave 3
	note F_, 2
	octave 2
	note G#, 4
	note D#, 4
	note A#, 4
	note F_, 4
	
	octave 3
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	
	octave 2
	note G#, 2
	octave 3
	note D#, 2
	octave 2
	note G#, 2
	octave 3
	note D#, 2
	octave 2
	note G#, 2
	octave 3
	note D#, 2
	octave 2
	note G#, 2
	octave 3
	note D#, 2
	octave 2
	note G_, 2
	octave 3
	note D#, 2
	octave 2
	note G_, 2
	octave 3
	note D#, 2
	octave 2
	note G_, 2
	octave 3
	note D#, 2
	octave 2
	note G_, 2
	octave 3
	note D#, 2
	
	octave 2
	note F_, 2
	octave 3
	note C_, 2
	octave 2
	note F_, 2
	octave 3
	note C_, 2
	octave 2
	note F_, 2
	octave 3
	note C_, 2
	octave 2
	note F_, 2
	octave 3
	note C_, 2
	octave 2
	note G_, 2
	octave 3
	note D_, 2
	octave 2
	note G_, 2
	octave 3
	note D_, 2
	octave 2
	note G_, 2
	octave 3
	note D_, 2
	octave 2
	note G_, 2
	octave 3
	note D_, 2
	
	octave 2
	note G#, 2
	octave 3
	note D#, 2
	octave 2
	note G#, 2
	octave 3
	note D#, 2
	octave 2
	note G#, 2
	octave 3
	note D#, 2
	octave 2
	note G#, 2
	octave 3
	note D#, 2
	octave 2
	note G_, 2
	octave 3
	note C_, 2
	octave 2
	note G_, 2
	octave 3
	note C_, 2
	octave 2
	note G_, 2
	octave 3
	note C_, 2
	octave 2
	note G_, 2
	octave 3
	note C_, 2
	octave 2
	note G_, 2
	octave 3
	note D_, 2
	octave 2
	note G_, 2
	octave 3
	note D_, 2
	octave 2
	note G_, 2
	octave 3
	note D_, 2
	octave 2
	note G_, 2
	octave 3
	note D_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	octave 2
	note G#, 2
	octave 3
	note D#, 2
	octave 2
	note G#, 2
	octave 3
	note D#, 2
	octave 2
	note G#, 2
	octave 3
	note D#, 2
	octave 2
	note G#, 2
	octave 3
	note D#, 2
	octave 2
	note G_, 2
	octave 3
	note D_, 2
	octave 2
	note G_, 2
	octave 3
	note D_, 2
	octave 2
	note G_, 2
	octave 3
	note D_, 2
	octave 2
	note G_, 2
	octave 3
	note D_, 2
	octave 2
	note F_, 2
	octave 3
	note C_, 2
	octave 2
	note F_, 2
	octave 3
	note C_, 2
	octave 2
	note F_, 2
	octave 3
	note C_, 2
	octave 2
	note F_, 2
	octave 3
	note C_, 2
	octave 2
	note G_, 2
	octave 3
	note D_, 2
	octave 2
	note G_, 2
	octave 3
	note D_, 2
	octave 2
	note G_, 2
	octave 3
	note D_, 2
	octave 2
	note G_, 2
	octave 3
	note D_, 2
	
	octave 2
	note G#, 16
	note D#, 16
	note G_, 1
	note __, 1
	octave 3
	note C_, 1
	note __, 1
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note C_, 1
	note __, 1
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note C_, 1
	note __, 1
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note C_, 1
	note __, 1
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note C_, 1
	note __, 1
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note C_, 1
	note __, 1
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note C_, 1
	note __, 1
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note C_, 1
	note __, 1
	
	octave 2
	note G#, 16
	octave 3
	note C_, 8
	note D#, 8
	note C_, 1
	note __, 1
	note G_, 1
	note __, 1
	note C_, 1
	note __, 1
	note G_, 1
	note __, 1
	note C_, 1
	note __, 1
	note G_, 1
	note __, 1
	note C_, 1
	note __, 1
	note G_, 1
	note __, 1
	note C_, 1
	note __, 1
	note G_, 1
	note __, 1
	note C_, 1
	note __, 1
	note G_, 1
	note __, 1
	note C_, 1
	note __, 1
	note G_, 1
	note __, 1
	note C_, 1
	note __, 1
	note G_, 1
	note __, 1
	
	note G#, 8
	note D#, 8
	note C_, 8
	octave 2
	note G#, 8
	octave 3
	note C_, 1
	note __, 1
	note G_, 1
	note __, 1
	note C_, 1
	note __, 1
	note G_, 1
	note __, 1
	note C_, 1
	note __, 1
	note G_, 1
	note __, 1
	note C_, 1
	note __, 1
	note G_, 1
	note __, 1
	note C_, 1
	note __, 1
	note G_, 1
	note __, 1
	note C_, 1
	note __, 1
	note G_, 1
	note __, 1
	note C_, 1
	note __, 1
	note G_, 1
	note __, 1
	note C_, 1
	note __, 1
	note G_, 1
	note __, 1
	
	note A_, 8
	note F_, 8
	note G_, 8
	octave 2
	note G_, 8
	octave 3
	note C_, 2
	note __, 4
	note C_, 2
	note __, 4
	octave 2
	note G_, 2
	note __, 2
	octave 3
	note C_, 2
	note __, 6
	note D_, 8
	
	note C_, 16
	octave 2
	note A#, 16
	note A_, 16
	note G#, 8
	note A#, 8
	octave 3
	note C_, 16
	octave 2
	note A#, 16
	note A_, 16
	octave 3
	note G#, 8
	note A#, 4
	note __, 4
	
	loopchannel 0, Music_RivalBattle_loop3
	endchannel
; f66c3
