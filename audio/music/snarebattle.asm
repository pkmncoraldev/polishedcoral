Music_SnareBattle: ; e9b6f
	musicheader 3, 1, Music_SnareBattle_Ch1
	musicheader 1, 2, Music_SnareBattle_Ch2
	musicheader 1, 3, Music_SnareBattle_Ch3
; e9b78

Music_SnareBattle_Ch1: ; e9b78
	tempo 100
	volume $77
	dutycycle $3
	tone $0002
	vibrato $10, $15
	notetype $c, $b2
	octave 3
	note __, 2
	note B_, 1
	note __, 1
	note __, 2
	note B_, 1
	note __, 1
	note __, 2
	note B_, 1
	note __, 1
	note __, 2
	note B_, 1
	note __, 1
	note __, 2
	note B_, 1
	note __, 1
	
	intensity $b6
	note A#, 2
	note B_, 2
	octave 4
	note C#, 2
	octave 3
	note B_, 1
	note __, 1
	note A#, 2
	note G_, 1
	note __, 1
	
	note G#, 2
	note __, 4
	note G#, 2
	note __, 2
	note D#, 2
	note B_, 2
	note G#, 2
	note __, 2
	note G#, 2
	note __, 4
	note G_, 4
	note A#, 4
	
	note G#, 2
	note __, 4
	note G#, 2
	note __, 2
	note D#, 2
	note B_, 2
	note G#, 2
	note __, 2
	note G#, 2
	note __, 4
	note E_, 4
	note G_, 4
	
	note G#, 2
	note __, 4
	note G#, 2
	note __, 2
	note D#, 2
	note B_, 2
	note G#, 2
	note __, 2
	note G#, 2
	note __, 4
	note A#, 8
	
	note A#, 2
	note __, 4
	note A#, 2
	note __, 4
	note A#, 2
	note __, 4
	note A#, 2
	note __, 4
	note A#, 4
	note G_, 4
	
	callchannel Music_SnareBattle_Harm1
	
	note D#, 6
	octave 2
	note B_, 4
	note B_, 2
	octave 3
	note G#, 2
	note D#, 2
	note A#, 4
	note G_, 4
	octave 4
	note D#, 4
	note C#, 4
	octave 3
	note B_, 2
	note __, 4
	note B_, 2
	note __, 4
	note B_, 2
	note __, 4
	note B_, 2
	note __, 4
	octave 4
	note D#, 8
	
	octave 3
	note D#, 6
	octave 2
	note B_, 4
	note B_, 2
	octave 3
	note D#, 2
	note G#, 2
	note A#, 4
	note G_, 4
	note E_, 4
	note C#, 4
	octave 2
	note B_, 2
	note __, 4
	note B_, 2
	note __, 4
	note B_, 2
	note __, 4
	note B_, 2
	note __, 4
	octave 3
	note G_, 2
	note G#, 2
	note A#, 2
	note G_, 2
Music_SnareBattle_loop1:
	note D#, 6
	octave 2
	note B_, 4
	note B_, 2
	octave 3
	note D#, 2
	note G#, 2
	octave 4
	note C#, 4
	octave 3
	note A#, 4
	note G_, 4
	note E_, 4
	note D#, 2
	note __, 4
	note D#, 2
	note __, 4
	note D#, 2
	note __, 4
	note D#, 2
	note __, 4
	note B_, 8

	octave 2
	note B_, 2
	octave 3
	note E_, 2
	note __, 2
	note G#, 6
	note E_, 4
	note D#, 4
	note G_, 4
	note A#, 4
	note G_, 4
	note G#, 8
	note E_, 8
	note D#, 8
	octave 2
	note B_, 8
	
	octave 3
	note D#, 2
	note G_, 2
	note __, 2
	note A#, 6
	note G_, 4
	octave 4
	note C#, 4
	octave 3
	note A#, 4
	note G_, 4
	note E_, 4
	note D#, 8
	note G_, 8
	note G#, 8
	note B_, 8
	octave 2
	note B_, 2
	octave 3
	note E_, 2
	note __, 2
	note G#, 6
	note E_, 4
	note D#, 4
	note G_, 4
	note A#, 4
	note G_, 4
	note G#, 8
	note A#, 8
	note B_, 8
	note G#, 8
	
	octave 2
	note B_, 2
	octave 3
	note E_, 2
	note __, 2
	note G#, 6
	note E_, 4
	note D#, 4
	note C#, 4
	octave 2
	note B_, 4
	note A#, 4
	note B_, 2
	note __, 4
	note B_, 2
	note __, 4
	note B_, 2
	note __, 2
	note B_, 2
	note __, 2
	note __, 12
	
	note B_, 16
	note A#, 16
	note B_, 16
	
	octave 3
	note __, 2
	note D#, 2
	note D_, 2
	note D#, 2
	note E_, 2
	note F_, 2
	note F#, 2
	note G_, 2
	note D#, 2
	note D#, 1
	note G#, 1
	note B_, 1
	note __, 1
	note B_, 4
	note G#, 2
	note B_, 2
	note G#, 2
	note A#, 4
	note G_, 4
	note E_, 4
	note C#, 4
	note D#, 2
	note __, 6
	note D#, 8
	note G_, 8
	note A#, 8
	
	callchannel Music_SnareBattle_Harm1
	
	loopchannel 0, Music_SnareBattle_loop1
; e9d3e

Music_SnareBattle_Harm1:
	note D#, 6
	octave 2
	note B_, 4
	note B_, 2
	octave 3
	note D#, 2
	note G#, 2
	note A#, 4
	note G_, 4
	note E_, 4
	note C#, 4
	octave 2
	note B_, 2
	note __, 4
	note B_, 2
	note __, 4
	note B_, 2
	note __, 4
	note B_, 2
	note __, 4
	octave 3
	note E_, 8
	endchannel

Music_SnareBattle_Ch2: ; e9d3e
	dutycycle $3
	vibrato $8, $36
	tone $0001
	notetype $c, $c2
	octave 4
	note G#, 1
	note D#, 1
	note G#, 1
	octave 5
	note D#, 1
	octave 4
	note G#, 1
	note D#, 1
	note G#, 1
	octave 5
	note D#, 1
	octave 4
	note G#, 1
	note D#, 1
	note G#, 1
	octave 5
	note D#, 1
	octave 4
	note G#, 1
	note D#, 1
	note G#, 1
	octave 5
	note D#, 1
	
	intensity $c6
	octave 3
	note G_, 2
	note G#, 1
	note __, 1
	note G_, 2
	note G#, 2
	note A#, 2
	note G#, 1
	note __, 1
	note G_, 2
	note D#, 1
	note __, 1
	
	note B_, 2
	note __, 4
	note B_, 2
	note __, 2
	note G#, 2
	octave 4
	note D#, 2
	octave 3
	note B_, 2
	note __, 2
	note B_, 2
	note __, 4
	note A#, 4
	octave 4
	note C#, 4
	octave 3
	note B_, 2
	note __, 4
	note B_, 2
	note __, 2
	note G#, 2
	octave 4
	note D#, 2
	octave 3
	note B_, 2
	note __, 2
	note B_, 2
	note __, 4
	octave 4
	note D#, 2
	note C#, 2
	octave 3
	note B_, 2
	note A#, 2
	
	note B_, 2
	note __, 4
	note B_, 2
	note __, 4
	octave 4
	note D#, 2
	octave 3
	note B_, 2
	note __, 2
	note B_, 2
	note __, 4
	octave 4
	note C#, 4
	note E_, 4
	
	note D#, 2
	note __, 4
	note D#, 2
	note __, 4
	note D#, 2
	note __, 4
	note D#, 2
	note __, 4
	note D#, 2
	note C#, 2
	octave 3
	note B_, 2
	note A#, 2	
	
	callchannel Music_SnareBattle_Lead1
	
	note G#, 2
	note G#, 1
	note B_, 1
	octave 4
	note D#, 1
	note __, 1
	note D#, 4
	octave 3
	note B_, 2
	octave 4
	note D#, 2
	octave 3
	note B_, 2
	octave 4
	note C#, 4
	octave 3
	note A#, 4
	note G_, 4
	note A#, 4
	note G#, 2
	note __, 4
	note G#, 2
	note __, 4
	note G#, 2
	note __, 4
	note G#, 2
	note __, 4
	note B_, 2
	note A#, 2
	note G_, 2
	note A#, 2
	
	note G#, 2
	note G#, 1
	note B_, 1
	octave 4
	note D#, 1
	note __, 1
	note D#, 4
	octave 3
	note B_, 2
	octave 4
	note D#, 2
	octave 3
	note B_, 2
	octave 4
	note C#, 4
	octave 3
	note A#, 4
	note G_, 4
	note A#, 4
	note G#, 2
	note __, 4
	note G#, 2
	note __, 4
	note G#, 2
	note __, 4
	note G#, 2
	note __, 4
	octave 4
	note D#, 4
	note C#, 4
	
Music_SnareBattle_loop2:
	octave 3
	note G#, 2
	note G#, 1
	note B_, 1
	octave 4
	note D#, 1
	note __, 1
	note D#, 4
	octave 3
	note B_, 2
	octave 4
	note D#, 2
	octave 3
	note B_, 2
	octave 4
	note G_, 4
	note D#, 4
	note C#, 4
	octave 3
	note A#, 4
	note B_, 2
	note __, 4
	note B_, 2
	note __, 4
	note B_, 2
	note __, 4
	note B_, 2
	note __, 4
	octave 4
	note D#, 8
	
	octave 3
	note E_, 2
	note G#, 2
	note __, 2
	note B_, 6
	note G#, 4
	note A#, 4
	octave 4
	note C#, 4
	note D#, 4
	note C#, 4
	octave 3
	note B_, 16
	note G#, 16
	
	note G_, 2
	note A#, 2
	note __, 2
	octave 4
	note C#, 6
	note D#, 4
	note G_, 4
	note D#, 4
	note C#, 4
	octave 3
	note A#, 4
	note B_, 16
	octave 4
	note D#, 16

	octave 3
	note E_, 2
	note G#, 2
	note __, 2
	note B_, 6
	note G#, 4
	note A#, 4
	octave 4
	note C#, 4
	note D#, 4
	note C#, 4
	octave 3
	note B_, 8
	octave 4
	note C#, 8
	note D#, 8
	octave 3
	note B_, 8
	
	note E_, 2
	note G#, 2
	note __, 2
	note B_, 6
	note G#, 4
	note G_, 4
	note E_, 4
	note D#, 4
	note G_, 4
	note G#, 2
	note __, 4
	note G#, 2
	note __, 4
	note G_, 2
	note __, 2
	note G#, 2
	note __, 2
	note __, 12
	
	note G#, 2
	note G#, 1
	note B_, 1
	octave 4
	note D#, 1
	note __, 1
	note D#, 4
	octave 3
	note B_, 2
	octave 4
	note D#, 2
	octave 3
	note B_, 2
	octave 4
	note C#, 4
	octave 3
	note A#, 4
	note G_, 4
	note A#, 4
	note G#, 2
	note __, 2
	note __, 12
	note __, 2
	note G#, 2
	note G_, 2
	note G#, 2
	note A#, 2
	note B_, 2
	octave 4
	note C_, 2
	note C#, 2
	note D#, 16
	note C#, 8
	octave 3
	note A#, 8
	note B_, 2
	note __, 6
	note G_, 8
	note A#, 8
	octave 4
	note C#, 8
	
	callchannel Music_SnareBattle_Lead1
	
	loopchannel 0, Music_SnareBattle_loop2
; e9ea0

Music_SnareBattle_Lead1:
	octave 3
	note G#, 2
	note G#, 1
	note B_, 1
	octave 4
	note D#, 1
	note __, 1
	note D#, 4
	octave 3
	note B_, 2
	octave 4
	note D#, 2
	octave 3
	note B_, 2
	octave 4
	note C#, 4
	octave 3
	note A#, 4
	note G_, 4
	note A#, 4
	note G#, 2
	note __, 4
	note G#, 2
	note __, 4
	note G#, 2
	note __, 4
	note G#, 2
	note __, 4
	note B_, 2
	note A#, 2
	note G_, 2
	note A#, 2
	endchannel

Music_SnareBattle_Ch3: ; e9eaa
	notetype $c, $19
	octave 2
	note G#, 1
	note __, 1
	octave 3
	note G#, 1
	note __, 1
	octave 2
	note G#, 1
	note __, 1
	octave 3
	note G#, 1
	note __, 1
	octave 2
	note G#, 1
	note __, 1
	octave 3
	note G#, 1
	note __, 1
	octave 2
	note G#, 1
	note __, 1
	octave 3
	note G#, 1
	note __, 1
	octave 2
	note D#, 4
	note G_, 4
	note A#, 4
	note G_, 1
	note __, 1
	note G_, 2
	
	note G#, 1
	note __, 1
	note G#, 2
	note A#, 2
	note B_, 2
	note G#, 2
	note A#, 2
	note B_, 2
	note G#, 2
	note G#, 1
	note __, 1
	note G#, 2
	note A#, 2
	note B_, 2
	note G_, 2
	note A#, 2
	octave 3
	note C#, 2
	octave 2
	note G_, 2
	octave 3
	note D#, 1
	note __, 1
	octave 2
	note G#, 2
	note A#, 2
	note B_, 2
	note G#, 2
	note A#, 2
	note B_, 2
	note G#, 2
	note G#, 1
	note __, 1
	note G#, 2
	note A#, 2
	note B_, 2
	octave 3
	note D#, 2
	note C#, 2
	octave 2
	note B_, 2
	note A#, 2
	octave 3
	note D#, 1
	note __, 1
	octave 2
	note G#, 2
	note A#, 2
	note B_, 2
	note G#, 2
	note A#, 2
	note B_, 2
	note G#, 2
	note G#, 1
	note __, 1
	note G#, 2
	note A#, 2
	note B_, 2
	note G_, 2
	note A#, 2
	octave 3
	note C#, 2
	note E_, 2
	
	
	note D#, 2
	octave 2
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	octave 3
	note D#, 2
	octave 2
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	octave 3
	note D#, 2
	octave 2
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note D#, 2
	note G_, 2
	note A#, 2
	octave 3
	note D#, 2
	note C#, 2
	octave 2
	note B_, 2
	note A#, 2
	
	callchannel Music_SnareBattle_Bass1
	
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
	note D#, 2
	note A#, 2
	note D#, 2
	note A#, 2
	note D#, 2
	note A#, 2
	note D#, 2
	note A#, 2
	note G#, 2
	octave 3
	note D#, 1
	note __, 1
	note D#, 2
	octave 2
	note G#, 2
	octave 3
	note D#, 1
	note __, 1
	note D#, 2
	octave 2
	note G#, 2
	octave 3
	note D#, 1
	note __, 1
	note D#, 2
	octave 2
	note G#, 2
	octave 3
	note D#, 1
	note __, 1
	note D#, 2
	octave 2
	note G_, 2
	note G#, 2
	note A#, 2
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
	note D#, 2
	note A#, 2
	note D#, 2
	note A#, 2
	note D#, 2
	note A#, 2
	note D#, 2
	note A#, 2
	note G#, 2
	octave 3
	note D#, 1
	note __, 1
	note D#, 2
	octave 2
	note G#, 2
	octave 3
	note D#, 1
	note __, 1
	note D#, 2
	octave 2
	note G#, 2
	octave 3
	note D#, 1
	note __, 1
	note D#, 2
	octave 2
	note G#, 2
	octave 3
	note D#, 1
	note __, 1
	note D#, 2
	octave 2
	note D#, 4
	note G_, 4
	
Music_SnareBattle_loop3:	
	
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
	note D#, 2
	note A#, 2
	note D#, 2
	note A#, 2
	note D#, 2
	note A#, 2
	note D#, 2
	note A#, 2
	note G#, 2
	octave 3
	note D#, 1
	note __, 1
	note D#, 2
	octave 2
	note G#, 2
	octave 3
	note D#, 1
	note __, 1
	note D#, 2
	octave 2
	note G#, 2
	octave 3
	note D#, 1
	note __, 1
	note D#, 2
	octave 2
	note G#, 2
	octave 3
	note D#, 1
	note __, 1
	note D#, 2
	note D#, 2
	note C#, 2
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	
	
	octave 2
	note E_, 2
	note B_, 2
	note E_, 2
	note B_, 2
	note E_, 2
	note B_, 2
	note E_, 2
	note B_, 2
	note D#, 2
	note A#, 2
	note D#, 2
	note A#, 2
	note D#, 2
	note A#, 2
	note D#, 2
	note A#, 2
	note G#, 2
	note B_, 2
	octave 3
	note D#, 2
	octave 2
	note G#, 4
	note B_, 2
	octave 3
	note D#, 2
	octave 2
	note B_, 2
	note G#, 2
	note B_, 2
	octave 3
	note D#, 2
	octave 2
	note G#, 4
	note B_, 2
	octave 3
	note D#, 2
	octave 2
	note B_, 2
	
	
	octave 2
	note D#, 2
	note A#, 2
	note D#, 2
	note A#, 2
	note D#, 2
	note A#, 2
	note D#, 2
	note A#, 2
	note D#, 2
	note A#, 2
	note D#, 2
	note A#, 2
	note D#, 2
	note A#, 2
	note D#, 2
	note G_, 2
	note G#, 2
	note B_, 2
	octave 3
	note D#, 2
	octave 2
	note G#, 4
	note B_, 2
	octave 3
	note D#, 2
	octave 2
	note B_, 2
	note G#, 2
	note B_, 2
	octave 3
	note D#, 2
	octave 2
	note G#, 4
	note B_, 2
	octave 3
	note D#, 2
	octave 2
	note B_, 2
	
	
	octave 2
	note E_, 2
	note B_, 2
	note E_, 2
	note B_, 2
	note E_, 2
	note B_, 2
	note E_, 2
	note B_, 2
	note D#, 2
	note A#, 2
	note D#, 2
	note A#, 2
	note D#, 2
	note A#, 2
	note D#, 2
	note A#, 2
	note G#, 8
	note A#, 8
	note B_, 8
	octave 3
	note D#, 8
	
	
	octave 2
	note E_, 2
	note G#, 2
	note __, 2
	note B_, 6
	note G#, 4
	note G_, 4
	note E_, 4
	note D#, 4
	note G_, 4
	note G#, 2
	note __, 4
	note G#, 2
	note __, 4
	note G#, 2
	note __, 2
	note G#, 2
	note __, 6
	octave 5
	note G#, 2
	note __, 6
	
	
	octave 2
	note G#, 6
	octave 3
	note D#, 1
	note __, 1
	note G#, 4
	note D#, 4
	octave 2
	note D#, 6
	note A#, 1
	note __, 1
	octave 3
	note D#, 4
	octave 2
	note A#, 4
	note G#, 6
	octave 3
	note D#, 1
	note __, 1
	note G#, 4
	note D#, 4
	
	octave 2
	note __, 2
	note D#, 2
	note D_, 2
	note D#, 2
	note E_, 2
	note F_, 2
	note F#, 2
	note G_, 2
	
	note G#, 6
	octave 3
	note D#, 1
	note __, 1
	note G#, 4
	note D#, 4
	octave 2
	note D#, 6
	note A#, 1
	note __, 1
	octave 3
	note D#, 4
	octave 2
	note A#, 4
	
	note G#, 2
	note __, 6
	note D#, 8
	note A#, 8
	note G_, 8
	
	callchannel Music_SnareBattle_Bass1
	
	loopchannel 0, Music_SnareBattle_loop3
	endchannel
; ea033
Music_SnareBattle_Bass1:
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
	note D#, 2
	note A#, 2
	note D#, 2
	note A#, 2
	note D#, 2
	note A#, 2
	note D#, 2
	note A#, 2
	note G#, 2
	octave 3
	note D#, 1
	note __, 1
	note D#, 2
	octave 2
	note G#, 2
	octave 3
	note D#, 1
	note __, 1
	note D#, 2
	octave 2
	note G#, 2
	octave 3
	note D#, 1
	note __, 1
	note D#, 2
	octave 2
	note G#, 2
	octave 3
	note D#, 1
	note __, 1
	note D#, 2
	octave 2
	note G_, 2
	note E_, 2
	note D#, 2
	note G_, 2
	endchannel