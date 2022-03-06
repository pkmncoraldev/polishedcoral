Music_FlickerStation: ; f57e8
	musicheader 4, 1, Music_FlickerStation_Ch1
	musicheader 1, 2, Music_FlickerStation_Ch2
	musicheader 1, 3, Music_FlickerStation_Ch3
	musicheader 1, 4, Music_FlickerStation_Ch4
; f57f4

Music_FlickerStation_Ch1: ; f57f4
	tempo 220
	volume $77
	dutycycle $2
	stereopanning $f
	notetype $c, $c4
	intensity $94
	note __, 4
	callchannel Music_FlickerStation_Ch1_Part_1
	note __, 2
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
Music_FlickerStation_loop1:
	callchannel Music_FlickerStation_Ch1_Part_1
	note __, 2
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	callchannel Music_FlickerStation_Ch1_Part_1
	octave 2
	note __, 2
	note A#, 1
	note __, 3
	note A#, 1
	note __, 1
	callchannel Music_FlickerStation_Ch1_Part_1
	note __, 2
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	callchannel Music_FlickerStation_Ch1_Part_1
	octave 2
	note __, 2
	note A#, 1
	note __, 3
	note A#, 1
	note __, 1
	
	callchannel Music_FlickerStation_Ch1_Part_2
	octave 3
	note __, 2
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	callchannel Music_FlickerStation_Ch1_Part_2
	octave 3
	note __, 2
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	callchannel Music_FlickerStation_Ch1_Part_2
	octave 3
	note __, 2
	note D#, 1
	note __, 3
	note D#, 1
	note __, 1
	note __, 2
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note __, 2
	note E_, 1
	note __, 3
	note E_, 1
	note __, 1
	note __, 2
	note D#, 1
	note __, 3
	note D#, 1
	note __, 1
	note D#, 1
	note __, 7
	loopchannel 0, Music_FlickerStation_loop1
	
Music_FlickerStation_Ch1_Part_1:
	octave 3
	note __, 2
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	octave 2
	note __, 2
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 3
	note __, 2
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	endchannel
	
Music_FlickerStation_Ch1_Part_2:
	octave 3
	note __, 2
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note __, 2
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note __, 2
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	endchannel
	
Music_FlickerStation_Ch2: ; f591d
	vibrato $12, $23
	dutycycle $1
	stereopanning $f0
	notetype $c, $f4
	note __, 4
	note __, 16
	note __, 16
Music_FlickerStation_loop2:
	callchannel Music_FlickerStation_Ch2_Part_1
	note B_, 1
	note __, 1
	octave 4
	note D#, 1
	note __, 1
	octave 3
	note B_, 1
	note __, 1
	note G#, 1
	note __, 1
	octave 4
	note C#, 2
	note D#, 1
	octave 3
	note B_, 1
	note __, 1
	octave 4
	note G#, 1
	note __, 1
	intensity $e0
	note F#, 9
	note __, 8
	
	callchannel Music_FlickerStation_Ch2_Part_1
	note B_, 1
	note __, 1
	octave 4
	note D#, 1
	note __, 1
	octave 3
	note B_, 1
	note __, 1
	note G#, 1
	note __, 1
	octave 4
	note C#, 2
	note D#, 1
	octave 3
	note B_, 1
	note __, 2
	note G#, 1
	note __, 1
	octave 4
	note C#, 2
	note D#, 1
	octave 3
	note B_, 1
	note __, 1
	note G#, 1
	note __, 1
	intensity $e0
	note F#, 7
	
	notetype $c, $f4
	octave 4
	note F#, 1
	note G_, 1
	note G#, 3
	note E_, 3
	octave 3
	note B_, 2
	note A#, 2
	octave 4
	note G_, 1
	note G#, 3
	note A#, 2
	
	notetype $4, $f4
	note G#, 1
	note A#, 1
	note G#, 4

	notetype $c, $f4
	note F#, 2
	note F_, 2
	note G#, 1
	note F#, 5
	note __, 2
	note D#, 2
	note E_, 3
	note C#, 3
	octave 3
	note B_, 2
	note A#, 2
	octave 4
	note F#, 1
	note G#, 3
	note A#, 2
	note F#, 4
	note __, 1
	notetype $9, $f4
	note D#, 2
	note E_, 2
	notetype $c, $f4
	note F#, 4
	note A_, 4
	
	note G#, 3
	note E_, 3
	octave 3
	note B_, 2
	note A#, 2
	octave 4
	note G_, 1
	note G#, 3
	note A#, 2
	note B_, 3
	note F#, 3
	note D#, 2
	note G#, 2
	note A_, 2
	note G#, 2
	note D#, 2
	note E_, 3
	note G#, 3
	note C#, 2
	octave 3
	note A#, 2
	octave 4
	note G#, 2
	note F#, 2
	octave 3
	note A#, 2
	intensity $e0
	note B_, 8
	note __, 8
	loopchannel 0, Music_FlickerStation_loop2
	
Music_FlickerStation_Ch2_Part_1:
	intensity $f4
	octave 4
	note __, 2
	note D#, 1
	note __, 1
	octave 3
	note B_, 1
	note __, 1
	note G#, 1
	note __, 1
	octave 4
	note C#, 2
	note D#, 1
	octave 3
	note B_, 2
	note __, 1
	note G#, 1
	note __, 1
	octave 4
	note C#, 1
	note __, 1
	note D#, 1
	octave 3
	note __, 1
	note B_, 1
	note __, 1
	note G#, 1
	note __, 1
	note F#, 3
	note G#, 1
	note __, 2
	note A#, 1
	note __, 1
	endchannel
	
	
Music_FlickerStation_Ch3: ; f5a08
	stereopanning $ff
	vibrato $0, $0
	notetype $c, $14
	octave 2
	note __, 4
	callchannel Music_FlickerStation_Ch3_Part_1
Music_FlickerStation_loop3:
	callchannel Music_FlickerStation_Ch3_Part_1
	callchannel Music_FlickerStation_Ch3_Part_2
	notetype $c, $14
	octave 3
	note F#, 1
	note __, 1
	callchannel Music_FlickerStation_Ch3_Part_1
	callchannel Music_FlickerStation_Ch3_Part_2
	notetype $c, $14
	note F_, 1
	note __, 1
	callchannel Music_FlickerStation_Ch3_Part_3	
	note G#, 1
	note __, 1
	notetype $c, $14
	octave 3
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	notetype $c, $12
	octave 2
	note G#, 1
	note __, 1
	callchannel Music_FlickerStation_Ch3_Part_3
	note B_, 1
	note __, 1
	notetype $c, $14
	octave 3
	note B_, 1
	notetype $c, $12
	note C#, 1
	notetype $c, $14
	note B_, 1
	note __, 1
	notetype $c, $12
	note D#, 1
	note __, 1
	callchannel Music_FlickerStation_Ch3_Part_3
	notetype $c, $12
	octave 3
	note C_, 1
	note __, 1
	notetype $c, $14
	octave 4
	note C_, 1
	note __, 1
	notetype $c, $12
	octave 2
	note G#, 1
	note __, 1
	notetype $c, $14
	octave 4
	note C_, 1
	note __, 1
	notetype $c, $12
	octave 3
	note C#, 1
	note __, 1
	notetype $c, $14
	octave 4
	note C#, 1
	note __, 1
	note C#, 1
	note __, 1
	notetype $c, $12
	octave 2
	note G#, 1
	note __, 1
	note F#, 1
	note __, 1
	notetype $c, $14
	octave 4
	note C#, 1
	note __, 1
	notetype $c, $12
	octave 2
	note A#, 1
	note __, 1
	notetype $c, $14
	octave 4
	note C#, 1
	note __, 1
	notetype $c, $12
	octave 2
	note B_, 1
	note __, 1
	notetype $c, $14
	octave 3
	note B_, 1
	note __, 1
	notetype $c, $12
	octave 2
	note F#, 1
	note __, 1
	notetype $c, $14
	octave 3
	note B_, 1
	note __, 1
	notetype $c, $12
	octave 1
	note B_, 1
	note __, 7
	loopchannel 0, Music_FlickerStation_loop3

Music_FlickerStation_Ch3_Part_1:
	notetype $c, $12
	octave 2
	note B_, 1
	note __, 1
	notetype $c, $14
	octave 3
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	notetype $c, $12
	octave 2
	note B_, 1
	note __, 1
	note G#, 1
	note __, 1
	notetype $c, $14
	octave 3
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	notetype $c, $12
	octave 2
	note G#, 1
	note __, 1
	octave 3
	note C#, 1
	note __, 1
	notetype $c, $14
	octave 4
	note C#, 1
	note __, 1
	note C#, 1
	note __, 1
	notetype $c, $12
	octave 3
	note C#, 1
	note __, 1
	octave 2
	note F#, 1
	note __, 1
	notetype $c, $14
	octave 4
	note C#, 1
	notetype $c, $12
	octave 2
	note G#, 1
	notetype $c, $14
	octave 4
	note C#, 1
	note __, 1
	notetype $c, $12
	octave 2
	note A#, 1
	note __, 1
	endchannel
	
Music_FlickerStation_Ch3_Part_2:
	notetype $c, $12
	note B_, 1
	note __, 1
	notetype $c, $14
	octave 3
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	notetype $c, $12
	octave 2
	note B_, 1
	note __, 1
	note G#, 1
	note __, 1
	notetype $c, $14
	octave 3
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	notetype $c, $12
	octave 2
	note G#, 1
	note __, 1
	octave 3
	note C#, 1
	note __, 1
	notetype $c, $14
	octave 4
	note C#, 1
	note __, 1
	note C#, 1
	note __, 1
	notetype $c, $12
	octave 3
	note C#, 1
	note __, 1
	octave 2
	note F#, 1
	note __, 1
	notetype $c, $14
	octave 3
	note F#, 1
	note __, 1
	notetype $c, $12
	octave 2
	note F#, 1
	note __, 1
	endchannel
	
Music_FlickerStation_Ch3_Part_3:
	notetype $c, $12
	note E_, 1
	note __, 1
	notetype $c, $14
	octave 3
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	notetype $c, $12
	octave 2
	note E_, 1
	note __, 1
	note F#, 1
	note __, 1
	notetype $c, $14
	octave 3
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	notetype $c, $12
	octave 2
	note F#, 1
	note __, 1
	note B_, 1
	note __, 1
	notetype $c, $14
	octave 3
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	notetype $c, $12
	octave 2
	note B_, 1
	note __, 1
	endchannel

Music_FlickerStation_Ch4: ; f5ae5
	togglenoise $3
	notetype $c
	note C_, 1
	note __, 1
	note C_, 1
	note C_, 1
	callchannel Music_FlickerStation_Ch4_Part_1
	note E_, 1
	note __, 1
	callchannel Music_FlickerStation_Ch4_Part_1
	note E_, 1
	note E_, 1
Music_FlickerStation_loop4:
	callchannel Music_FlickerStation_Ch4_Part_1
	note E_, 1
	note __, 1
	callchannel Music_FlickerStation_Ch4_Part_1
	note E_, 1
	note E_, 1
	callchannel Music_FlickerStation_Ch4_Part_1
	note E_, 1
	note __, 1
	callchannel Music_FlickerStation_Ch4_Part_1
	note E_, 1
	note E_, 1
	callchannel Music_FlickerStation_Ch4_Part_1
	note E_, 1
	note __, 1
	callchannel Music_FlickerStation_Ch4_Part_1
	note E_, 1
	note E_, 1
	callchannel Music_FlickerStation_Ch4_Part_1
	note E_, 1
	note __, 1
	callchannel Music_FlickerStation_Ch4_Part_1
	note D_, 1
	note D_, 1
	callchannel Music_FlickerStation_Ch4_Part_2
	callchannel Music_FlickerStation_Ch4_Part_3
	callchannel Music_FlickerStation_Ch4_Part_2
	callchannel Music_FlickerStation_Ch4_Part_3
	callchannel Music_FlickerStation_Ch4_Part_2
	callchannel Music_FlickerStation_Ch4_Part_3
	callchannel Music_FlickerStation_Ch4_Part_2
	note D#, 1
	note __, 1
	note D_, 1
	note __, 1
	note C_, 1
	note __, 1
	note D#, 1
	note __, 1
	note D#, 1
	note __, 3
	note C_, 1
	note __, 1
	note C_, 1
	note C_, 1
	loopchannel 0, Music_FlickerStation_loop4
	
Music_FlickerStation_Ch4_Part_1:
	note D#, 1
	note __, 1
	note D_, 1
	note __, 1
	note C_, 1
	note __, 1
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note D_, 1
	note __, 1
	note C_, 1
	note __, 1
	endchannel
	
Music_FlickerStation_Ch4_Part_2:
	note D#, 1
	note __, 1
	note D_, 1
	note __, 1
	note C_, 1
	note __, 1
	note D_, 1
	note __, 1
	note D#, 1
	note __, 1
	note D_, 1
	note __, 1
	note C_, 1
	note __, 1
	note E_, 1
	note __, 1
	endchannel
	
Music_FlickerStation_Ch4_Part_3:
	note D#, 1
	note __, 1
	note D_, 1
	note __, 1
	note C_, 1
	note __, 1
	note D_, 1
	note __, 1
	note D#, 1
	note __, 1
	note E_, 1
	note E_, 1
	note C_, 1
	note __, 1
	note E_, 1
	note __, 1
	endchannel
