Music_DayBreakGrotto: ; f5dc5
	musicheader 3, 1, Music_DayBreakGrotto_Ch1
	musicheader 1, 2, Music_DayBreakGrotto_Ch2
	musicheader 1, 3, Music_DayBreakGrotto_Ch3
; f5dce
Music_DayBreakGrotto_Ch1: ; f5ea2
	tempo 200
	volume $77
	dutycycle $3
	vibrato $8, $36
	tone $0001
	notetype $c, $c2
	intensity $b5
	note __, 16
	note __, 8
Music_DayBreakGrotto_loop1:
	octave 3
	note D_, 4
	note E_, 4
	note F_, 4
	note D_, 4
	note G_, 6
	note F_, 6
	note D_, 4
	note E_, 8
	
	note __, 16
	note __, 8
	note D_, 4
	note E_, 4
	note F_, 4
	note D_, 4
	note G_, 6
	note F_, 6
	note D_, 4
	note G_, 10
	note F_, 14
	
	note __, 8
	note D_, 4
	note E_, 4
	note F_, 4
	note D_, 4
	note G_, 6
	note F_, 6
	note D_, 4
	note E_, 8
	
	note __, 16
	note __, 8
	note D_, 4
	note E_, 4
	note F_, 4
	note D_, 4
	note G_, 6
	note F_, 6
	note D_, 4
	note G_, 10
	note F_, 14
	
	note __, 8
	note F_, 16
	note G_, 16
	note F_, 16
	note __, 8
	
	note __, 8
	note F_, 16
	note G_, 16
	note E_, 6
	note F_, 16
	note __, 10
	
	loopchannel 0, Music_DayBreakGrotto_loop1
; f5f91


Music_DayBreakGrotto_Ch2: ; f5dce
	dutycycle $3
	tone $0002
	vibrato $12, $15
	notetype $c, $b2
	intensity $d5
	note __, 16
	note __, 8
Music_DayBreakGrotto_loop2:
	octave 3
	note F_, 4
	note G_, 4
	note A_, 4
	note F_, 4
	note A#, 6
	note A_, 6
	note F_, 4
	note G_, 8
	
	note __, 16
	note __, 8
	note F_, 4
	note G_, 4
	note A_, 4
	note F_, 4
	note A#, 6
	note A_, 6
	note F_, 4
	note A#, 10
	note A_, 14
	
	note __, 8
	note F_, 4
	note G_, 4
	note A_, 4
	note F_, 4
	note A#, 6
	note A_, 6
	note F_, 4
	note G_, 8
	
	note __, 16
	note __, 2
	note A_, 1
	note A#, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note E_, 1
	note F_, 4
	note G_, 4
	note A_, 4
	note F_, 4
	note A#, 6
	note A_, 6
	note F_, 4
	note A#, 10
	note A_, 14
	
	note __, 8
	note A#, 16
	octave 4
	note C_, 16
	octave 3
	note A_, 16
	note __, 8
	
	note __, 2
	note A_, 1
	note A#, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note E_, 1
	note A#, 16
	octave 4
	note C_, 16
	octave 3
	note G_, 6
	note A_, 16
	note __, 10
	loopchannel 0, Music_DayBreakGrotto_loop2
; f5ea2

Music_DayBreakGrotto_Ch3: ; f5f91
	notetype $c, $14

	octave 3
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1

Music_DayBreakGrotto_loop3:
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1

	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	
	note A#, 1
	note __, 1
	note F_, 1
	note __, 1
	note A#, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A#, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	
	octave 4
	note C_, 1
	note __, 1
	octave 3
	note G_, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	octave 3
	note E_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	octave 3
	note E_, 1
	note __, 1
	note G_, 1
	note __, 1
	
	note A_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note F_, 1
	note __, 1
	
	note A#, 1
	note __, 1
	note F_, 1
	note __, 1
	note A#, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A#, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	
	octave 4
	note C_, 1
	note __, 1
	octave 3
	note G_, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	octave 3
	note E_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	octave 3
	note E_, 1
	note __, 1
	note G_, 1
	note __, 1
	
	note A_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note F_, 1
	note __, 1

	loopchannel 0, Music_DayBreakGrotto_loop3

	
; f605c
