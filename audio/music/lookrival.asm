Music_LookRival: ; f4f79
	musicheader 4, 1, Music_LookRival_Ch1
	musicheader 1, 2, Music_LookRival_Ch2
	musicheader 1, 3, Music_LookRival_Ch3
	musicheader 1, 4, Music_LookRival_Ch4
; f4f85

Music_LookRival_Ch1: ; f4f85
	tempo 112
	volume $77
	dutycycle $1
	tone $0001
	vibrato $12, $15
	stereopanning $f
	notetype $c, $95
	octave 4
	note D#, 6
	note C#, 6
	octave 3
	note A#, 4
	octave 4
	note C_, 2
	note __, 2
	note __, 12
Music_LookRival_Ch1_Loop:
	dutycycle $0
	octave 3
	note A#, 2
	note __, 4
	note A#, 2
	note __, 8
	note A#, 2
	note __, 4
	octave 4
	note C#, 4
	note __, 2
	octave 3
	note G#, 3
	note __, 1
	note __, 2
	note A#, 2
	note __, 2
	note A#, 2
	note __, 8
	note A#, 2
	note __, 4
	octave 4
	note C#, 4
	note __, 2
	note D_, 4
	note __, 2
	note D#, 2
	note __, 2
	note D#, 2
	octave 3
	note A#, 4
	note __, 4
	octave 4
	note D#, 2
	note __, 4
	octave 3
	note A#, 4
	note __, 6
	octave 4
	note D#, 2
	note __, 4
	note D#, 2
	note __, 2
	note D#, 2
	note __, 4
	note D#, 2
	note __, 4
	octave 3
	note A#, 4
	note __, 6
	octave 4
	note F_, 16
	note G#, 12
	note __, 4
	note D#, 6
	note F_, 6
	note C#, 2
	note __, 2
	note C_, 4
	octave 3
	note A#, 1
	note F_, 1
	octave 4
	note C#, 4
	octave 3
	note A#, 2
	note A_, 2
	octave 4
	note C_, 2	
	loopchannel 0, Music_LookRival_Ch1_Loop
	endchannel
; f5010

Music_LookRival_Ch2: ; f5010
	dutycycle $1
	vibrato $8, $36
	stereopanning $f0
	notetype $c, $b5
	octave 5
	note C_, 3
	octave 4
	note B_, 3
	note A#, 2
	note G#, 3
	note F#, 3
	note E_, 2
	note F_, 2
	note __, 10
;	dutycycle $1
	note C#, 2
	note D#, 2
Music_LookRival_Ch2_Loop:
	note F_, 3
	note C#, 3
	note G#, 2
	note __, 2
	note A#, 4
	note A_, 2
	note G#, 8
	note __, 2
	note F#, 2
	note D#, 2
	note E_, 4
	note F_, 2
	note __, 2
	note C#, 2
	note G#, 3
	note A#, 3
	note A_, 2
	note G#, 8
	note __, 2
	octave 5
	note C#, 2
	octave 4
	note G#, 2
	note A_, 4
	note A#, 2
	note __, 2
	note F#, 2
	octave 5
	note C#, 3
	note D#, 3
	note D_, 2
	note C#, 8
	note __, 6
	octave 4
	note G#, 1
	note A_, 1
	note A#, 3
	note F#, 3
	octave 5
	note C#, 2
	note __, 2
	note D#, 4
	note D_, 2
	note C#, 8
	note __, 4
	note D#, 2
	note E_, 2
	
	note F_, 6
	dutycycle $0
	note C_, 6
	note D#, 12
	note __, 2
	dutycycle $1
	note C_, 2
	note F_, 2
	note E_, 2
	note D#, 6
	dutycycle $0
	octave 4
	note A#, 6
	octave 5
	note C#, 12
	note __, 4
	octave 4
	dutycycle $1
	note D#, 2
	note E_, 2
	loopchannel 0, Music_LookRival_Ch2_Loop
	endchannel
; f5086

Music_LookRival_Ch3: ; f5086
	notetype $c, $16
	octave 2
	note F_, 12
	octave 3
	note C_, 4
	note F_, 2
	note __, 2
	note F_, 2
	note __, 2
	note F_, 2
	note E_, 2
	note D#, 2
	note C#, 2
Music_LookRival_Ch3_Loop:
	octave 2
	note A#, 6
	note F_, 2
	note __, 8
	note A#, 6
	note F_, 2
	note __, 4
	octave 3
	note C#, 2
	note __, 2
	octave 2
	note __, 2
	note A#, 2
	note __, 2
	note F_, 2
	note __, 8
	note A#, 6
	note F_, 2
	note __, 4
	octave 3
	note F_, 2
	note __, 2
	
	note __, 2
	note D#, 2
	note __, 2
	octave 2
	note A#, 2
	note __, 8
	octave 3
	note D#, 6
	octave 2
	note A#, 2
	note __, 8
	octave 3
	note D#, 6
	octave 2
	note A#, 2
	note __, 8
	octave 3
	note D#, 6
	octave 2
	note A#, 2
	note __, 8
	octave 3
	note F_, 6
	note C_, 2
	note __, 4
	octave 2
	note F_, 4
	octave 3
	note F_, 4
	note E_, 4
	note D#, 8
	note D#, 6
	note G_, 2
	note A#, 2
	octave 4
	note C#, 2
	note __, 4
	octave 3
	note A_, 6
	octave 2
	note A_, 2
	octave 3
	note D#, 2
	note __, 2
	note F_, 2
	note __, 2
	loopchannel 0, Music_LookRival_Ch3_Loop
	endchannel
; f50ef

Music_LookRival_Ch4: ; f5106
	togglenoise $3
	notetype $c
	note __, 16
	note __, 2
	note D#, 2
	note D#, 2
	note __, 2
	note D_, 4
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1
Music_LookRival_Ch4_Loop: ; f5aea	
	
	callchannel Music_LookRival_Ch4_1
	callchannel Music_LookRival_Ch4_1
	callchannel Music_LookRival_Ch4_1
	callchannel Music_LookRival_Ch4_2
	callchannel Music_LookRival_Ch4_1
	callchannel Music_LookRival_Ch4_1
	callchannel Music_LookRival_Ch4_1
	callchannel Music_LookRival_Ch4_3
	callchannel Music_LookRival_Ch4_1
	callchannel Music_LookRival_Ch4_1
	callchannel Music_LookRival_Ch4_1
	callchannel Music_LookRival_Ch4_4
	loopchannel 0, Music_LookRival_Ch4_Loop
	
Music_LookRival_Ch4_1:
	note D#, 3
	note D#, 1
	note D_, 2
	note D#, 2
	note __, 2
	note D#, 2
	note D_, 4
	endchannel

Music_LookRival_Ch4_2:
	note D#, 3
	note D#, 1
	note D_, 2
	note D#, 2
	note __, 2
	note D#, 2
	note D_, 1
	note D_, 1
	note D_, 2
	endchannel
	
Music_LookRival_Ch4_3:
	note D#, 3
	note D#, 1
	note D_, 2
	note D#, 2
	note __, 2
	note D#, 2
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1
	endchannel
	
Music_LookRival_Ch4_4:
	note D#, 3
	note __, 3
	note D#, 2
	note __, 2
	note D#, 2
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1
	endchannel
; f5127
