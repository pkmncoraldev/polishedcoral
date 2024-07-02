Music_MinasTheme: ; f57e8
	musicheader 4, 1, Music_MinasTheme_Ch1
	musicheader 1, 2, Music_MinasTheme_Ch2
	musicheader 1, 3, Music_MinasTheme_Ch3
	musicheader 1, 4, Music_MinasTheme_Ch4
; f57f4

Music_MinasTheme_Ch1: ; f57f4
	tempo 350
	volume $77
	dutycycle 1
	stereopanning $f
	vibrato $12, $23
	notetype $6, $b4
Music_MinasTheme_loop1:
	dutycycle 1
	vibrato $12, $23
	intensity $b4
	octave 3
	note A#, 1
	note __, 1
	octave 4
	note C_, 1
	note D_, 3
	octave 3
	note F_, 1
	note __, 1
	note A_, 1
	note A#, 2
	note A_, 1
	note G_, 1
	note __, 2
	octave 4
	note F_, 1
	note __, 2
	note F_, 1
	note __, 2
	note F_, 1
	note __, 2
	note C_, 3
	octave 3
	note A_, 3
	note A#, 3
	note F_, 3
	note G_, 3
	note D#, 3
	note A_, 3
	note F_, 3
	
	octave 3
	note A#, 1
	note __, 1
	octave 4
	note C_, 1
	note D_, 3
	octave 3
	note F_, 1
	note __, 1
	note A_, 1
	note A#, 2
	note A_, 1
	note G_, 1
	note __, 2
	octave 4
	note F_, 1
	note __, 2
	note F_, 1
	note __, 2
	note F_, 1
	note __, 2
	octave 3
	note G_, 3
	note A_, 3
	note A#, 3
	octave 4
	note C_, 1
	note D_, 1
	note D#, 1
	note F_, 3
	note D#, 3
	note D_, 3
	note C_, 3
	octave 3
	note A#, 3
	note A_, 3
	note G_, 1
	note A_, 1
	note G_, 1
	note F_, 3
	
	dutycycle 0
	intensity $b6
	note D#, 5
	note D_, 1
	note C_, 3
	note D_, 2
	note D#, 1
	note F_, 5
	note D#, 1
	note D_, 3
	note F_, 2
	note G_, 1
	vibrato $10, $32
	intensity $7a
	note G#, 3
	octave 4
	note C_, 3
	octave 3
	note B_, 3
	note G_, 3
	octave 4
	note C_, 4
	octave 3
	note G_, 1
	octave 4
	note C_, 1
	octave 3
	note G_, 3
	octave 4
	note C_, 3
	
	vibrato $12, $23
	intensity $b6
	octave 3
	note F#, 5
	note F_, 1
	note D#, 3
	note F_, 2
	note F#, 1
	note F_, 5
	note D#, 1
	note D_, 3
	note F_, 3
	intensity $7a
	note G_, 6
	note E_, 6
	note F_, 6
	note F_,6
	note D#, 12
	intensity $79
	note F#, 6
	note __, 6
	loopchannel 0, Music_MinasTheme_loop1

Music_MinasTheme_Ch2: ; f591d
	vibrato $12, $23
	dutycycle 1
	stereopanning $f0
	notetype $6, $d4
Music_MinasTheme_loop2:
	vibrato $12, $23
	intensity $d4
	octave 4
	note D_, 1
	note __, 1
	note D#, 1
	note F_, 6
	note D_, 1
	note __, 2
	octave 3
	note A#, 1
	note __, 2
	octave 4
	note A#, 1
	note __, 2
	note A_, 1
	note __, 2
	note D_, 1
	note __, 2
	note G_, 2
	note F_, 2
	note D#, 2
	note D_, 2
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C_, 3
	octave 3
	note G_, 3
	octave 4
	note D_, 3
	note C_, 3
	
	note D_, 1
	note __, 1
	note D#, 1
	note F_, 6
	note D_, 1
	note __, 2
	octave 3
	note A#, 1
	note __, 2
	octave 4
	note A#, 1
	note __, 2
	note A_, 1
	note __, 2
	note D_, 1
	note __, 2
	note C_, 2
	note D_, 2
	note E_, 2
	note E_, 1
	note F_, 1
	note G_, 1
	note G_, 1
	note A_, 1
	note A#, 1
	note A#, 4
	note A_, 1
	note G_, 1
	note F_, 6
	note __, 12
	
	note __, 3
	note D_, 3
	note C_, 6
	note __, 3
	note G_, 3
	note F_, 4
	vibrato $10, $32	
	note D_, 1
	note D#, 1
	intensity $bd
	note F_, 3
	note G#, 3
	note G_, 3
	note D_, 3
	note F_, 4
	note D#, 1
	note F_, 1
	note D#, 6
	
	vibrato $12, $23
	intensity $d4
	note __, 3
	note F_, 3
	note D#, 6
	note __, 3
	note D#, 3
	note D_, 6
	intensity $bd
	note D_, 6
	note C_, 6
	octave 3
	note A#, 6
	note A_, 6
	vibrato $20, $32

	note A#, 12
	octave 4
	intensity $a9
	note C_, 6
	note __, 6
	loopchannel 0, Music_MinasTheme_loop2
	
	
Music_MinasTheme_Ch3: ; f5a08
	stereopanning $ff
	vibrato $0, $0
	notetype $6, $10
Music_MinasTheme_loop3:
	octave 3
	note A#, 3
	octave 4
	note A#, 1
	note __, 1
	octave 3
	note A#, 1
	note A_, 5
	note A_, 1
	note G_, 3
	octave 4
	note G_, 1
	note __, 1
	octave 3
	note G_, 1
	note F_, 5
	note F_, 1
	note D#, 3
	octave 4
	note D#, 1
	note __, 1
	octave 3
	note D#, 1
	note D_, 3
	octave 2
	note A#, 3
	octave 3
	note C_, 3
	octave 4
	note C_, 3
	octave 3
	note F_, 3
	octave 2
	note F_, 3
	
	note A#, 3
	octave 3
	note A#, 1
	note __, 1
	octave 2
	note A#, 1
	note A_, 5
	note A_, 1
	note G_, 3
	octave 3
	note G_, 1
	note __, 1
	octave 2
	note G_, 1
	note F_, 3
	octave 3
	note D_, 3
	note C_, 3
	octave 2
	note G_, 3
	octave 3
	note E_, 3
	note C_, 3
	note F_, 5
	note F_, 1
	note F_, 5
	note F_, 1
	octave 2
	note F_, 12
	
	octave 3
	note C_, 2
	note C_, 1
	note __, 6
	note C_, 3
	note D_, 2
	note D_, 1
	note __, 6
	note D_, 3
	note G#, 2
	note G#, 1
	octave 2
	note G_, 3
	note B_, 3
	octave 3
	note D_, 3
	note C_, 3
	note D_, 3
	note D#, 3
	note G_, 3
	note F#, 2
	note F#, 1
	note __, 3
	octave 2
	note F#, 3
	octave 3
	note F#, 2
	note F#, 1
	note F_, 2
	note F_, 1
	note __, 3
	octave 2
	note F_, 3
	octave 3
	note F_, 2
	note F_, 1
	note E_, 6
	note C_, 6
	note F_, 6
	note F_, 6
	note F#, 12
	note G#, 6
	note __, 6
	loopchannel 0, Music_MinasTheme_loop3


Music_MinasTheme_Ch4: ; f5ae5
	togglenoise $3
	notetype $6
Music_MinasTheme_loop4:
	callchannel Music_MinasTheme_Ch4_1
	callchannel Music_MinasTheme_Ch4_1
	callchannel Music_MinasTheme_Ch4_2
	note __, 2
	callchannel Music_MinasTheme_Ch4_2
	note __, 1
	note G#, 1
	note F#, 6
	note __, 6
	
	callchannel Music_MinasTheme_Ch4_3
	callchannel Music_MinasTheme_Ch4_4
	callchannel Music_MinasTheme_Ch4_4
	callchannel Music_MinasTheme_Ch4_4
	callchannel Music_MinasTheme_Ch4_4
	
	callchannel Music_MinasTheme_Ch4_3
	callchannel Music_MinasTheme_Ch4_4
	callchannel Music_MinasTheme_Ch4_4
	callchannel Music_MinasTheme_Ch4_4
	callchannel Music_MinasTheme_Ch4_4
	callchannel Music_MinasTheme_Ch4_4
	callchannel Music_MinasTheme_Ch4_4
	callchannel Music_MinasTheme_Ch4_4
	note F#, 6
	loopchannel 0, Music_MinasTheme_loop4

Music_MinasTheme_Ch4_1:
	note __, 3
	note G#, 1
	note __, 5
	note G#, 1
	note __, 5
	note G#, 1
	note __, 1
	note G#, 1
	note __, 3
	note G#, 1
	note __, 2
	endchannel
	
Music_MinasTheme_Ch4_2:
	note D#, 1
	note __, 2
	note G#, 1
	note __, 2
	note D#, 1
	note __, 2
	note G#, 1
	note __, 2
	note D#, 1
	note __, 2
	note G#, 1
	note __, 1
	note G#, 1
	note D#, 1
	note __, 2
	note G#, 1
	endchannel
	
Music_MinasTheme_Ch4_3:
	note G#, 1
	note __, 1
	note G#, 1
	note __, 6
	note F#, 3
	note G#, 1
	note __, 1
	note G#, 1
	note __, 6
	note F#, 2
	note D#, 1
	endchannel
	
Music_MinasTheme_Ch4_4:
	note F#, 3
	note G#, 1
	note __, 1
	note G#, 1
	endchannel
