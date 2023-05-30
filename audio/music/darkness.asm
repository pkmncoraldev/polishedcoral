Music_Darkness:
	musicheader 4, 1, Music_Darkness_Ch1
	musicheader 1, 2, Music_Darkness_Ch2
	musicheader 1, 3, Music_Darkness_Ch3
	musicheader 1, 4, Music_Darkness_Ch4
; ea2ca

Music_Darkness_Ch1:
	tempo 105
	volume $77
	dutycycle $3
	tone $0001
	vibrato $11, $15
	stereopanning $f0
	notetype $c, $77
	note __, 2
Music_Darkness_Ch1_loop1:
	stereopanning $f0
	notetype $c, $77
	callchannel Music_Darkness_Ch2_1
	loopchannel 3, Music_Darkness_Ch1_loop1
	callchannel Music_Darkness_Ch1_1
	callchannel Music_Darkness_Ch1_2
	callchannel Music_Darkness_Ch1_2
	note __, 4
	callchannel Music_Darkness_Ch1_3
	callchannel Music_Darkness_Ch1_2
	callchannel Music_Darkness_Ch1_2
	note __, 4
	callchannel Music_Darkness_Ch1_3
Music_Darkness_Ch1_loop2:
	note __, 16
	note __, 14
	loopchannel 4, Music_Darkness_Ch1_loop2
	note __, 16
	callchannel Music_Darkness_Ch1_4
	notetype $c, $67
	note F#, 3
	note __, 1
	note A#, 3
	note __, 1
	callchannel Music_Darkness_Ch1_4
	note __, 2
	loopchannel 4, Music_Darkness_Ch1_loop1
	
Music_Darkness_Ch1_4:
	stereopanning $ff
	notetype $c, $c7
	octave 4
	note D#, 1
	note __, 1
	note C#, 1
	note __, 1
	octave 3
	note A#, 3
	note __, 1
	note B_, 3
	note __, 1
	note G#, 3
	note __, 1
	note A#, 3
	note __, 1
	note F#, 3
	note __, 1
	notetype $c, $67
	note A#, 3
	note __, 1
	note F#, 3
	note __, 1
	notetype $c, $c7
	octave 4
	note D#, 1
	note __, 1
	note C#, 1
	note __, 1
	octave 3
	note A#, 3
	note __, 1
	note B_, 3
	note __, 1
	octave 4
	note D#, 3
	note __, 1
	note F#, 3
	note __, 1
	note A#, 3
	note __, 1
	notetype $c, $67
	note F#, 3
	note __, 1
	note A#, 3
	note __, 1
	notetype $c, $c7
	octave 4
	note D#, 1
	note __, 1
	note C#, 1
	note __, 1
	octave 3
	note A#, 3
	note __, 1
	note B_, 3
	note __, 1
	note G#, 3
	note __, 1
	note A#, 3
	note __, 1
	note F#, 3
	note __, 1
	notetype $c, $a7
	note A#, 3
	note __, 1
	note F#, 3
	note __, 1
	notetype $c, $67
	note A#, 3
	note __, 1
	note F#, 3
	note __, 1
	octave 4
	notetype $c, $c7
	note F#, 3
	note __, 1
	note A#, 3
	note __, 1
	notetype $c, $a7
	note F#, 3
	note __, 1
	note A#, 3
	note __, 1
	endchannel	
	
Music_Darkness_Ch1_1:
	stereopanning $f0
	notetype $c, $77
	octave 3
	note A#, 1
	note __, 1
	note G#, 1
	note __, 1
	note A#, 3
	note __, 1
	note D#, 3
	note __, 1
	note A#, 1
	note __, 1
	note G#, 1
	note __, 1
	note A#, 3
	note __, 1
	note D#, 3
	note __, 9
Music_Darkness_Ch1_3:
	notetype $c, $77
	octave 3
	note A#, 1
	note __, 1
	note G#, 1
	note __, 1
	note A#, 3
	note __, 1
	note D#, 3
	note __, 1
	note A#, 1
	note __, 1
	note G#, 1
	note __, 1
	note A#, 3
	note __, 1
	octave 4
	note C#, 3
	note __, 1
	octave 3
	note A#, 3
	note __, 1
	note G#, 2
	endchannel
	
Music_Darkness_Ch1_2:
	stereopanning $f0
	notetype $6, $77
	octave 5
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note C#, 1
	note __, 1
	note C#, 1
	note __, 1
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note C#, 1
	note __, 1
	note C#, 1
	note __, 1
	endchannel

Music_Darkness_Ch2:
Music_Darkness_Ch2_loop1:
	dutycycle $1
	vibrato $12, $36
	stereopanning $0f
	notetype $c, $c7
	callchannel Music_Darkness_Ch2_1
	loopchannel 6, Music_Darkness_Ch2_loop1

Music_Darkness_Ch2_loop2:
	callchannel Music_Darkness_Ch2_4
	callchannel Music_Darkness_Ch2_2
	loopchannel 4, Music_Darkness_Ch2_loop2
	
Music_Darkness_Ch2_loop3:
	callchannel Music_Darkness_Ch2_3
	loopchannel 2, Music_Darkness_Ch2_loop3
	loopchannel 0, Music_Darkness_Ch2_loop1
	
Music_Darkness_Ch2_4:
	stereopanning $f0
	notetype $6, $a7
	octave 5
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note C#, 1
	note __, 1
	note C#, 1
	note __, 1
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note C#, 1
	note __, 1
	note C#, 1
	note __, 1
	endchannel
	
Music_Darkness_Ch2_3:
	stereopanning $ff
	notetype $c, $c7
	dutycycle $0
	octave 2
	note A#, 16
	note B_, 8
	octave 3
	note C#, 8
	octave 2
	note F#, 16
	note F_, 8
	note C#, 8
	note D#, 16
	note F_, 8
	note F#, 8
	note C#, 16
	note D#, 16
	endchannel
	
Music_Darkness_Ch2_2:
	stereopanning $0f
	notetype $c, $c7
	octave 4
	note G#, 1
	note __, 1
	note F#, 1
	note __, 1
	note F_, 1
	note __, 1
	note C#, 1
	note __, 1
	note A#, 1
	note __, 1
	note F#, 1
	note __, 1
	note D#, 1
	note __, 1
	note C#, 1
	note __, 1
	endchannel
	
Music_Darkness_Ch2_1:

	octave 3
	note A#, 1
	note __, 1
	note G#, 1
	note __, 1
	note A#, 3
	note __, 1
	note D#, 3
	note __, 1
	note A#, 1
	note __, 1
	note G#, 1
	note __, 1
	note A#, 3
	note __, 1
	note D#, 3
	note __, 9
	note A#, 1
	note __, 1
	note G#, 1
	note __, 1
	note A#, 3
	note __, 1
	note D#, 3
	note __, 1
	note A#, 1
	note __, 1
	note G#, 1
	note __, 1
	note A#, 3
	note __, 1
	octave 4
	note C#, 3
	note __, 1
	octave 3
	note A#, 3
	note __, 1
	note G#, 3
	note __, 1
	endchannel

Music_Darkness_Ch3: ; ea46e
	notetype $c, $27
Music_Darkness_Ch3_loop1:
	callchannel Music_Darkness_Ch3_1
	loopchannel 6, Music_Darkness_Ch3_loop1
Music_Darkness_Ch3_loop2:
	callchannel Music_Darkness_Ch3_2
	loopchannel 4, Music_Darkness_Ch3_loop2
Music_Darkness_Ch3_loop3:
	callchannel Music_Darkness_Ch3_1
	loopchannel 4, Music_Darkness_Ch3_loop3
	loopchannel 0, Music_Darkness_Ch3_loop1
	
Music_Darkness_Ch3_1:
	octave 1
	note G#, 4
	note G#, 4
	note __, 4
	octave 2
	note D#, 4
	octave 1
	note A#, 4
	note __, 4
	octave 2
	note C#, 4
	note __, 4
	octave 1
	note G#, 4
	note G#, 4
	note __, 4
	octave 2
	note C#, 4
	note D#, 4
	note C#, 4
	octave 1
	note A#, 4
	note F#, 4
	endchannel
	
Music_Darkness_Ch3_2:
	octave 1
	note G#, 4
	note G#, 4
	note __, 16
	note D#, 4
	note F#, 4
	endchannel
	

Music_Darkness_Ch4:
	togglenoise $3
	notetype $c
Music_Darkness_Ch4_loop1:
	note __, 16
	note __, 16
	loopchannel 4, Music_Darkness_Ch4_loop1
Music_Darkness_Ch4_loop2:
	callchannel Music_Darkness_Ch4_1
	loopchannel 8, Music_Darkness_Ch4_loop2
Music_Darkness_Ch4_loop3:
	callchannel Music_Darkness_Ch4_2
	loopchannel 4, Music_Darkness_Ch4_loop3
Music_Darkness_Ch4_loop4:
	callchannel Music_Darkness_Ch4_3
	loopchannel 8, Music_Darkness_Ch4_loop4
	loopchannel 0, Music_Darkness_Ch4_loop1
	

Music_Darkness_Ch4_1:
	note A#, 4
	note A#, 4
	note D_, 4
	note A#, 4
	note A#, 4
	note __, 4
	note D_, 4
	note __, 4
	endchannel
	
Music_Darkness_Ch4_2:
	note F#, 4
	note F#, 4
	note __, 16
	note F#, 8
	endchannel
	
Music_Darkness_Ch4_3:
	note A#, 4
	note E_, 2
	note A#, 2
	note D_, 2
	note E_, 2
	note A#, 4
	note E_, 2
	note __, 2
	note A#, 2
	note E_, 2
	note D_, 2
	note __, 2
	note E_, 2
	note __, 2
	endchannel
	