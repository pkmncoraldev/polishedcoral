Music_LuminaTown:
	musicheader 4, 1, Music_LuminaTown_Ch1
	musicheader 1, 2, Music_LuminaTown_Ch2
	musicheader 1, 3, Music_LuminaTown_Ch3
	musicheader 1, 4, Music_LuminaTown_Ch4

Music_LuminaTown_Ch1:
	tempo 200
	volume $77
	stereopanning $ff
	dutycycle 1
	vibrato $03, $23
	notetype $c, $57
	octave 2
	note B_, 6
	note __, 2
	note B_, 2
	note __, 2
	note B_, 2
	note __, 2
	note B_, 6
	note __, 2
	note B_, 2
	note __, 2
	note B_, 2
	note __, 2
	callchannel Music_LuminaTown_Ch1_Part_1
	callchannel Music_LuminaTown_Ch1_Part_2
	transpose 0, 1
Music_LuminaTown_Ch1_loop:
	notetype $c, $57
	octave 2
	note B_, 6
	note __, 2
	note B_, 2
	note __, 2
	note B_, 2
	note __, 2
	note B_, 6
	note __, 2
	note B_, 2
	note __, 2
	note B_, 2
	note __, 2
	callchannel Music_LuminaTown_Ch1_Part_3
	callchannel Music_LuminaTown_Ch1_Part_2
	callchannel Music_LuminaTown_Ch1_Part_1
	callchannel Music_LuminaTown_Ch1_Part_2
	loopchannel 0, Music_LuminaTown_Ch1_loop

Music_LuminaTown_Ch1_Part_1:
	dutycycle 1
	vibrato $03, $23
	notetype $c, $77
	octave 2
	note B_, 2
	note G#, 1
	note A#, 1
	note B_, 2
	octave 3
	note C#, 2
	notetype $c, $68
	note D#, 4
	notetype $c, $77
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	notetype $c, $68
	note C#, 4
	octave 2
	note B_, 4
	note A#, 4
	note F#, 4
	notetype $c, $77
	note B_, 2
	note E_, 1
	note F#, 1
	note G#, 2
	note E_, 2
	octave 3
	note C#, 2
	octave 2
	note F#, 1
	note G#, 1
	note A#, 2
	note F#, 2
	notetype $c, $68
	note B_, 6
	note A#, 1
	note G#, 1
	note G_, 4
	note A#, 4
	
	notetype $c, $77
	note B_, 2
	note G#, 1
	note A#, 1
	note B_, 2
	octave 3
	note C#, 2
	notetype $c, $68
	note D#, 4
	note G#, 4
	note F#, 4
	notetype $c, $77
	note E_, 2
	note D#, 2
	notetype $c, $68
	note C#, 4
	notetype $c, $77
	note E_, 2
	note F#, 2
	notetype $c, $68
	note G#, 4
	notetype $c, $77
	note F#, 2
	note E_, 2
	notetype $c, $68
	note D#, 4
	note C#, 4
	notetype $c, $3f
	note C_, 4
	notetype $c, $88
	note C_, 8
	note __, 4
	endchannel
	
	
Music_LuminaTown_Ch1_Part_2:
	dutycycle 1
	octave 3
	notetype $c, $77
	note G#, 2
	note E_, 1
	note F#, 1
	note G#, 2
	note E_, 2
	notetype $c, $68
	note B_, 4
	note G#, 4
	note F#, 6
	note E_, 2
	note D#, 8
	notetype $c, $77
	note E_, 2
	note C#, 1
	note D#, 1
	note E_, 2
	note C#, 2
	notetype $c, $68
	note G#, 4
	note E_, 4
	note G_, 8
	note G_, 4
	note A#, 4
	notetype $c, $77
	note G#, 2
	note E_, 1
	note F#, 1
	note G#, 2
	note E_, 2
	notetype $c, $68
	note B_, 4
	note G#, 4
	note F#, 6
	note D#, 2
	note B_, 4
	note F#, 4
	note G_, 6
	note D#, 2
	note A#, 6
	note G_, 2
	octave 4
	note C#, 12
	note C#, 2
	octave 3
	note A#, 2
	note B_, 14
	notetype $c, $67
	note B_, 2
	notetype $c, $57
	octave 2
	note B_, 6
	note __, 2
	note B_, 2
	note __, 2
	note B_, 2
	note __, 2
	endchannel
	
Music_LuminaTown_Ch1_Part_3:
	notetype $c, $68
	dutycycle 0
	octave 3
	note D#, 8
	note G#, 8
	note F#, 14
	note __, 2
	note E_, 8
	note C#, 8
	note D#, 14
	note __, 2
	note D#, 8
	note G#, 8
	note A#, 14
	note __, 2
	note G#, 8
	note F#, 8
	note G#, 14
	note __, 2
	endchannel

Music_LuminaTown_Ch2:
	dutycycle 1
	stereopanning $ff
	notetype $C, $a7
	vibrato 18, 3, 4
	octave 1
	note G#, 6
	note D#, 2
	note G#, 4
	note G#, 2
	note D#, 2
	note G#, 6
	note D#, 2
	note G#, 4
	note G#, 2
	note D#, 2
	callchannel Music_LuminaTown_Ch2_Part_1
	callchannel Music_LuminaTown_Ch2_Part_2
	transpose 0, 1
Music_LuminaTown_Ch2_loop:
	note G#, 6
	note D#, 2
	note G#, 4
	note G#, 2
	note D#, 2
	note G#, 6
	note D#, 2
	note G#, 4
	note G#, 2
	note D#, 2
	callchannel Music_LuminaTown_Ch2_Part_1
	callchannel Music_LuminaTown_Ch2_Part_2
	callchannel Music_LuminaTown_Ch2_Part_1
	callchannel Music_LuminaTown_Ch2_Part_2
	loopchannel 0, Music_LuminaTown_Ch2_loop
	
Music_LuminaTown_Ch2_Part_1:
	octave 1
	note G#, 6
	note D#, 2
	note G#, 4
	note G#, 2
	note D#, 2
	note F#, 6
	note C#, 2
	note F#, 4
	note F#, 2
	note C#, 2
	note E_, 6
	note B_, 2
	note F#, 4
	note F#, 2
	note C#, 2
	note G#, 4
	note D#, 4
	note A#, 4
	note D#, 2
	note G_, 2
	note G#, 6
	note D#, 2
	note G#, 4
	note G#, 2
	note D#, 2
	note F#, 6
	note C#, 2
	note F#, 4
	note F#, 2
	note C#, 2
	note E_, 4
	note G#, 4
	note F#, 4
	note A#, 4
	note G#, 6
	note D#, 2
	note G#, 4
	note G#, 2
	note D#, 2
	endchannel
	
Music_LuminaTown_Ch2_Part_2:
	note B_, 6
	note E_, 2
	note B_, 4
	note B_, 2
	note E_, 2
	note B_, 6
	note F#, 2
	note B_, 4
	note B_, 2
	note F#, 2
	note A#, 6
	note E_, 2
	note A#, 4
	note A#, 2
	note E_, 2
	note D#, 6
	note A#, 2
	note D#, 4
	note D#, 2
	note A#, 2
	note E_, 6
	note B_, 2
	note E_, 4
	note B_, 2
	note E_, 2
	note B_, 6
	note F#, 2
	note B_, 4
	note B_, 2
	note F#, 2
	note A#, 6
	note D#, 2
	octave 2
	note C#, 4
	note C#, 2
	octave 1
	note A#, 2
	octave 2
	note D#, 8
	octave 1
	note D#, 4
	note A#, 4
	note G#, 6
	note D#, 2
	note G#, 4
	note G#, 2
	note D#, 2
	note G#, 6
	note D#, 2
	note G#, 4
	note G#, 2
	note D#, 2
	endchannel

Music_LuminaTown_Ch3:
	stereopanning $ff
	dutycycle 5
	vibrato 22, 2, 4
	notetype $c, $33
	octave 4
	note D#, 6
	note __, 2
	note D#, 2
	note __, 2
	note D#, 2
	note __, 2
	note D#, 6
	note __, 2
	note D#, 2
	note __, 2
	note D#, 2
	notetype $c, $11
	callchannel Music_LuminaTown_Ch3_Part_1
	callchannel Music_LuminaTown_Ch3_Part_2
	transpose 0, 1
Music_LuminaTown_Ch3_loop:
	notetype $c, $33
	octave 4
	note __, 2
	note D#, 6
	note __, 2
	note D#, 2
	note __, 2
	note D#, 2
	note __, 2
	note D#, 6
	note __, 2
	note D#, 2
	note __, 2
	notetype $c, $11
	callchannel Music_LuminaTown_Ch3_Part_3
	callchannel Music_LuminaTown_Ch3_Part_2
	callchannel Music_LuminaTown_Ch3_Part_1
	callchannel Music_LuminaTown_Ch3_Part_2
	loopchannel 0, Music_LuminaTown_Ch3_loop

Music_LuminaTown_Ch3_Part_1:
	notetype $c, $11
	octave 4
	note D#, 2
	note G#, 6
	note A#, 2
	notetype $8, $11
	note B_, 8
	octave 5
	
	note C#, 2
	octave 4
	note B_, 2
	notetype $C, $11
	note A#, 12
	note __, 2
	note A#, 2
	note G#, 6
	note B_, 2
	notetype $8, $11
	note A#, 8
	note F#, 2
	note E_, 2
	notetype $C, $11
	note D#, 12
	note __, 2
	
	note D#, 2
	note G#, 6
	note A#, 2
	notetype $8, $11
	note B_, 8
	octave 5
	
	note C#, 2
	octave 4
	note B_, 2
	note A#, 2
	note G#, 2
	note A#, 16
	note __, 1
	notetype $C, $11
	note B_, 1
	octave 5
	note C#, 1
	notetype $8, $11
	note D#, 8
	note C#, 2
	octave 4
	note B_, 2
	note A#, 8
	note G#, 2
	note G_, 2
	notetype $C, $11
	note G#, 12
	note __, 4
	endchannel
	
Music_LuminaTown_Ch3_Part_2:
	notetype $C, $11
	octave 5
	note E_, 8
	note G#, 4
	note E_, 4
	note D#, 1
	note C#, 1
	note D#, 12
	octave 4
	note B_, 2
	octave 5
	note C#, 8
	note E_, 4
	note C#, 4
	note D#, 16
	note E_, 6
	note E_, 1
	note F#, 1
	note G#, 4
	note E_, 4
	notetype $8, $11
	note D#, 2
	note C#, 2
	note D#, 16
	note __, 1
	notetype $C, $11
	octave 4
	note B_, 2
	octave 5
	note C#, 6
	note C#, 1
	note D#, 1
	note E_, 6
	note E_, 1
	note F#, 1
	note G_, 12
	note A#, 2
	note G_, 2
	note G#, 16
	notetype $c, $33
	octave 4
	note D#, 6
	note __, 2
	note D#, 2
	note __, 2
	note D#, 2
	endchannel
	
Music_LuminaTown_Ch3_Part_3:
	notetype $C, $22
	tone $0001
	octave 5
	note D#, 4
	note G#, 8
	note B_, 8
	note A#, 14
	note __, 2
	note G#, 8
	note F#, 8
	note G#, 14
	note __, 2
	note G#, 8
	note B_, 8
	octave 6
	note C#, 14
	note __, 2
	octave 5
	note B_, 8
	note A#, 8
	octave 6
	note C_, 14
	note __, 2
	tone $0000
	endchannel
	
Music_LuminaTown_Ch4:
	togglenoise 3
	notetype $C
Music_LuminaTown_Ch4_loop:
	note G_, 1
	note __, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note G_, 1
	note __, 1
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	loopchannel 0, Music_LuminaTown_Ch4_loop
