Music_Underwater: ; f06e1
	musicheader 4, 1, Music_Underwater_Ch1
	musicheader 1, 2, Music_Underwater_Ch2
	musicheader 1, 3, Music_Underwater_Ch3
	musicheader 1, 4, Music_Underwater_Ch4
; f06ed

Music_Underwater_Ch1: ; f06ed
	tempo 164
	volume $77
	vibrato $6, $34
	tone $0001
	dutycycle $1
	notetype $c, $b6
	octave 2
	note __, 12
	note __, 12
Music_Underwater_Ch1_loop:
	note B_, 8
	note G_, 4
	octave 3
	note D_, 4
	note E_, 4
	note D_, 8
	intensity $96
	note E_, 4
	note D_, 4
	dutycycle $0
	intensity $c6
	note C_, 10
	octave 2
	note B_, 2
	note G_, 10
	intensity $a6
	note B_, 2
	note G_, 10
	intensity $86
	note B_, 2
	note G_, 10
	intensity $66
	note B_, 2
	note G_, 12
	
	dutycycle $1
	intensity $b6
	note B_, 8
	note G_, 4
	octave 3
	note D_, 4
	note E_, 4
	note D_, 8
	intensity $96
	note E_, 4
	note D_, 4
	dutycycle $0
	intensity $c6
	note C_, 8
	note D_, 4
	note E_, 8
	intensity $a6
	note D_, 4
	note E_, 8
	intensity $86
	note D_, 4
	note D#, 8
	note D_, 4
	note D#, 8
	note D_, 4
	
	octave 2
	dutycycle $1
	note B_, 8
	note G_, 4
	octave 3
	note D_, 4
	note E_, 4
	note D_, 8
	intensity $96
	note E_, 4
	note D_, 4
	dutycycle $0
	intensity $c6
	note C_, 10
	octave 2
	note B_, 2
	octave 3
	note C_, 2
	octave 2
	note B_, 2
	note G_, 6
	intensity $a6
	note B_, 2
	octave 3
	note C_, 2
	octave 2
	note B_, 2
	note G_, 6
	intensity $86
	note B_, 2
	octave 3
	note C_, 2
	octave 2
	note B_, 2
	note G_, 6
	intensity $66
	note B_, 2
	note G_, 12
	
	dutycycle $1
	intensity $b6
	note B_, 8
	note G_, 4
	octave 3
	note D_, 4
	note E_, 4
	note D_, 8
	intensity $96
	note E_, 4
	note D_, 4
	dutycycle $0
	intensity $c6
	note C_, 8
	note D_, 4
	note E_, 8
	intensity $a6
	note D_, 4
	note E_, 8
	intensity $86
	note D_, 4
	note D#, 8
	note D_, 4
	note D#, 8
	note D_, 4
	
	dutycycle $1
	intensity $b6
	note C_, 8
	octave 2
	note A_, 4
	octave 3
	note F_, 8
	note C_, 4
	note D#, 8
	octave 2
	note A#, 4
	octave 3
	note D#, 8
	octave 2
	note A#, 4
	note B_, 16
	note __, 8
	octave 3
	note F_, 12
	note D#, 12
	note D#, 12
	note D_, 12
	octave 2
	note A#, 16
	note __, 8
	octave 3
	note F_, 16
	note __, 4
	note C_, 4
	octave 2
	loopchannel 0, Music_Underwater_Ch1_loop

Music_Underwater_Ch2: ; f074f
	dutycycle $0
	vibrato $8, $25
	notetype $c, $c6
	octave 3
	note __, 12
	note __, 12
Music_Underwater_Ch2_loop:
	callchannel Music_Underwater_Ch2_Part1
	callchannel Music_Underwater_Ch2_Part1
	dutycycle $1
	note F_, 4
	note A_, 4
	note B_, 4
	octave 4
	note C_, 4
	octave 3
	note A_, 4
	octave 4
	note F_, 4
	intensity $86
	note C_, 4
	octave 3
	note A_, 4
	octave 4
	note F_, 4
	octave 3
	intensity $c6
	note G_, 4
	note A#, 4
	octave 4
	note D#, 4
	note D_, 4
	octave 3
	intensity $a6
	note B_, 4
	octave 4
	note D#, 4
	note D_, 4
	octave 3
	intensity $86
	note B_, 4
	octave 4
	note D#, 4
	intensity $c6
	note D_, 4
	note D#, 4
	note D_, 4
	note C_, 4
	note D_, 4
	note C_, 4
	octave 3
	note A#, 4
	octave 4
	note C_, 4
	note D_, 4
	octave 3
	note A#, 4
	octave 4
	intensity $86
	note C_, 4
	note D_, 4
	octave 3
	intensity $c6
	note F#, 4
	octave 4
	intensity $86
	note C_, 4
	note D_, 4
	octave 3
	intensity $a6
	note F#, 4
	octave 4
	intensity $66
	note C_, 4
	note D_, 4
	octave 2
	intensity $a6
	dutycycle $0
	note F_, 1
	note A_, 1
	note F_, 1
	note A_, 1
	octave 3
	note C_, 1
	octave 2
	note A_, 1
	octave 3
	note C_, 1
	note F_, 1
	note C_, 1
	note F_, 1
	note A_, 1
	octave 4
	note C_, 1
	note F_, 1
	note C_, 1
	octave 3
	note A_, 1
	note F_, 1
	note A_, 1
	note F_, 1
	note C_, 1
	note F_, 1
	note C_, 1
	octave 2
	note A_, 1
	octave 3
	note C_, 1
	octave 2
	note A_, 1
	octave 3
	intensity $c6
	loopchannel 0, Music_Underwater_Ch2_loop

Music_Underwater_Ch2_Part1:
	note D_, 4
	note G_, 4
	note A_, 4
	note B_, 4
	octave 4
	note C_, 4
	octave 3
	note B_, 8
	intensity $a6
	octave 4
	note C_, 4
	octave 3
	note B_, 8
	intensity $86
	octave 4
	note C_, 4
	octave 3
	note B_, 4
	intensity $c6
	note G_, 4
	octave 4
	intensity $66
	note C_, 4
	octave 3
	note B_, 4
	note G_, 4
	octave 4
	note C_, 4
	octave 3
	note B_, 4
	note G_, 4
	octave 4
	intensity $66
	note C_, 4
	octave 3
	note B_, 4
	note G_, 4
	octave 4
	intensity $36
	note C_, 4
	octave 3
	note B_, 4
	
	intensity $c6
	note D_, 6
	note G_, 2
	note A_, 4
	note B_, 4
	octave 4
	note C_, 4
	octave 3
	note B_, 4
	octave 4
	dutycycle $1
	note F_, 4
	dutycycle $0
	intensity $a6
	note C_, 4
	octave 3
	note B_, 4
	octave 4
	dutycycle $1
	note F_, 4
	dutycycle $0
	intensity $86
	note C_, 4
	octave 3
	note B_, 4
	octave 4
	intensity $a6
	dutycycle $1
	note E_, 4
	dutycycle $0
	intensity $86
	note C_, 4
	octave 3
	note B_, 4
	octave 4
	dutycycle $1
	note E_, 4
	dutycycle $0
	intensity $66
	note C_, 4
	octave 3
	note B_, 4
	octave 4
	intensity $a6
	dutycycle $1
	note D#, 4
	dutycycle $0
	intensity $66
	note C_, 4
	octave 3
	note B_, 4
	octave 4
	intensity $86
	dutycycle $1
	note D#, 4
	dutycycle $0
	intensity $66
	note C_, 4
	octave 3
	note B_, 4
	intensity $c6
	endchannel

Music_Underwater_Ch3: ; f079f
	notetype $c, $12
	octave 2
	note G_, 4
	note B_, 2
	octave 3
	note C_, 2
	note D_, 4
	octave 2
	note G_, 4
	note B_, 2
	octave 3
	note C_, 2
	note D_, 4
Music_Underwater_Ch3_loop:
	callchannel Music_Underwater_Ch3_Part1
	callchannel Music_Underwater_Ch3_Part1
	callchannel Music_Underwater_Ch3_Part1
	callchannel Music_Underwater_Ch3_Part1
	note F_, 4
	note A_, 2
	note B_, 2
	octave 3
	note C_, 4
	octave 2
	note F_, 4
	note A_, 2
	note B_, 2
	octave 3
	note C_, 4
	octave 2
	note D#, 4
	note G_, 2
	note A_, 2
	note A#, 4
	note D#, 4
	note G_, 2
	note A_, 2
	note A#, 4
	note G_, 4
	note B_, 2
	octave 3
	note C_, 2
	note D_, 4
	octave 2
	note G_, 4
	note B_, 2
	octave 3
	note C_, 2
	note D_, 4
	octave 2
	note A#, 4
	octave 3
	note D_, 2
	note D#, 2
	note F_, 4
	octave 2
	note A_, 4
	octave 3
	note D_, 2
	note D#, 2
	note F_, 4
	octave 2
	note G#, 4
	octave 3
	note D_, 2
	note D#, 2
	note F_, 4
	octave 2
	note G_, 4
	octave 3
	note D_, 2
	note D#, 2
	note F_, 4
	octave 2
	note F#, 12
	note F#, 12
	note A_, 12
	note A_, 12
	loopchannel 0, Music_Underwater_Ch3_loop
; f07bf

Music_Underwater_Ch3_Part1: ; f07bf
	octave 2
	note G_, 4
	note B_, 2
	octave 3
	note C_, 2
	note D_, 4
	octave 2
	note G_, 4
	note B_, 2
	octave 3
	note C_, 2
	note D_, 4
	octave 2
	note F_, 4
	note B_, 2
	octave 3
	note C_, 2
	note D_, 4
	octave 2
	note F_, 4
	note B_, 2
	octave 3
	note C_, 2
	note D_, 4
	octave 2
	note E_, 4
	note A_, 2
	note B_, 2
	octave 3
	note C_, 4
	octave 2
	note E_, 4
	note A_, 2
	note B_, 2
	octave 3
	note C_, 4
	octave 2
	note D#, 4
	note G_, 2
	note A_, 2
	note A#, 4
	note D#, 4
	note G_, 2
	note A_, 2
	note A#, 4
	endchannel

Music_Underwater_Ch4: ; f07eb
	togglenoise $5
	notetype $c
Music_Underwater_Ch4_loop:
	note __, 8
	loopchannel 0, Music_Underwater_Ch4_loop
; f07fd
