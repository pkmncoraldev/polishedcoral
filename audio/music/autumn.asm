Music_Autumn: ; f06e1
	musicheader 4, 1, Music_Autumn_Ch1
	musicheader 1, 2, Music_Autumn_Ch2
	musicheader 1, 3, Music_Autumn_Ch3
	musicheader 1, 4, Music_Autumn_Ch4


Music_Autumn_Ch1: ; f06ed
	tempo 325
	volume $77
	vibrato $6, $34
	tone $0002
	dutycycle $0
	notetype $6, $88
	note __, 16
	note __, 16
Music_Autumn_Ch1_loop:
	notetype $6, $88
	octave 3
	note __, 4
	note C_, 6
	octave 2
	note G#, 6
	octave 3
	note D#, 8
	note C_, 4
	note D#, 4
	note D#, 6
	note C#, 6
	note C#, 16
	intensity $85
	note C#, 4
	
	intensity $88
	note __, 4
	note C_, 6
	octave 2
	note G#, 6
	octave 3
	note D#, 8
	note D#, 4
	note G#, 4
	note F_, 4
	note __, 2
	note F_, 16
	intensity $85
	note F_, 2
	intensity $88
	note D#, 4
	note C#, 4
	
	note C_, 10
	octave 2
	note G#, 6
	octave 3
	note D#, 8
	note C_, 4
	note D#, 4
	note D#, 6
	intensity $88
	note C#, 16
	intensity $85
	note C#, 2
	intensity $88
	note D#, 4
	note C#, 4
	

	note C_, 10
	octave 2
	note G#, 6
	octave 3
	note D#, 8
	note D#, 4
	note G#, 4
	note F_, 4
	note __, 2
	note G#, 4
	note G#, 2
	octave 4
	note C_,2
	octave 3
	note A#, 2
	
	intensity $a7
	octave 2
	note G_, 1
	octave 3
	note G_, 1
	octave 2
	note A#, 1
	octave 3
	note A#, 1
	octave 3
	note D#, 1
	octave 4
	note D#, 1
	octave 3
	note G_, 1
	octave 4
	note G_, 1
	octave 3
	note A#, 1
	octave 4
	note A#, 1
	octave 3
	note G_, 1
	octave 4
	note G_, 1
	octave 3
	note D#, 1
	octave 4
	note D#, 1
	octave 2
	note A#, 1
	octave 3
	note A#, 1
	
	callchannel Music_Autumn_Ch1_Part_1
	octave 4
	note C_, 4
	note C#, 4
	note D#, 4
	note C_, 4
	octave 3
	note G#, 4
	note A#, 4
	octave 4
	note C_, 4
	octave 3
	note G#, 4
	
	note F_, 4
	octave 4
	note C#, 2
	note D#, 6
	note C#, 4
	octave 3
	note A#, 4
	note G_, 4
	note G#, 4
	note A#, 4
	octave 4
	note C_, 4
	note C#, 4
	note D#, 4
	note G#, 4
	note F_, 4
	note D#, 4
	note C#, 4
	note C_, 4
	
	callchannel Music_Autumn_Ch1_Part_1
	octave 4
	note C_, 8
	octave 3
	note A#, 8
	note G#, 8
	note G_, 8
	notetype $c, $88
	note F_, 8
	notetype $6, $88
	dutycycle $1
	note A#, 6
	note G_, 6
	note G_, 4
	notetype $c, $88
	note G#, 8
	notetype $c, $85
	note G#, 8
	loopchannel 0, Music_Autumn_Ch1_loop

Music_Autumn_Ch1_Part_1:
	dutycycle $1
	intensity $88
	octave 4
	note C#, 6
	note D#, 6
	note C#, 4
	octave 3
	note A#, 4
	note G_, 4
	note G#, 4
	note A#, 4
	endchannel

Music_Autumn_Ch2: ; f074f
	vibrato $6, $34
	tone $0002
	dutycycle $1
	notetype $6, $7a
	intensity $7a
	note __, 16
	note __, 16
Music_Autumn_Ch2_loop:
	notetype $6, $7a
	vibrato $6, $34
	callchannel Music_Autumn_Ch2_Part_1
	intensity $7a
	octave 3
	note __, 4
	note G#, 6
	note D#, 6
	octave 4
	note C_, 8
	note C_, 4
	note D#, 4
	note D#, 2
	note C#, 2
	note __, 2
	note C#, 16
	intensity $a7
	note C#, 10
	
	callchannel Music_Autumn_Ch2_Part_1
	intensity $7a
	octave 3
	note __, 4
	note G#, 6
	note D#, 6
	octave 4
	note C_, 8
	note C_, 4
	note D#, 4
	note D#, 2
	note C#, 2
	note __, 2
	note C#, 4
	note C#, 2
	note F_, 2
	note G_, 12
	intensity $a7
	note G_, 4
	note __, 2
	
	callchannel Music_Autumn_Ch2_Part_2
	note G#, 4
	note A#, 4
	octave 5
	note C_, 4
	octave 4
	note G#, 4
	note F_, 12
	intensity $a7
	note F_, 4
	callchannel Music_Autumn_Ch2_Part_2
	note G#, 4
	note A#, 4
	octave 5
	note C_, 4
	note D#, 4
	note C_, 12
	intensity $a7
	note C_, 4
	callchannel Music_Autumn_Ch2_Part_2
	note D#, 8
	note D#, 8
	note C_, 8
	note C_, 8
	octave 3
	note A#, 8
	intensity $a7
	note A#, 8
	intensity $aa
	dutycycle $1
	octave 4
	note C#, 6
	octave 3
	note A#, 6
	octave 4
	note C#, 4
	notetype $c, $2a
	note C_, 8
	notetype $c, $a7
	note C_, 8
	loopchannel 0, Music_Autumn_Ch2_loop

Music_Autumn_Ch2_Part_1:
	dutycycle $1
	intensity $7a
	octave 3
	note __, 4
	note G#, 6
	note D#, 6
	octave 4
	note C_, 8
	octave 3
	note A#, 4
	note G#, 4
	note G_, 6
	note G#, 6
	note F_, 16
	intensity $a7
	note F_, 4
	endchannel
	
Music_Autumn_Ch2_Part_2:
	dutycycle $0
	vibrato $12, $15
	intensity $aa
	octave 4
	note G#, 8
	note __, 2
	note G#, 2
	note A#, 2
	note G#, 2
	note G_, 6
	note F_, 6
	note D#, 4
	endchannel

Music_Autumn_Ch3: ; f079f
	notetype $6, $24
	
	callchannel Music_Autumn_Ch3_Part_1
	callchannel Music_Autumn_Ch3_Part_1
	callchannel Music_Autumn_Ch3_Part_2
	callchannel Music_Autumn_Ch3_Part_1
	callchannel Music_Autumn_Ch3_Part_2
	callchannel Music_Autumn_Ch3_Part_1
	callchannel Music_Autumn_Ch3_Part_2
	callchannel Music_Autumn_Ch3_Part_1
	note C#, 2
	note G#, 2
	octave 4
	note C#, 2
	note F_, 4
	note C#, 2
	octave 3
	note G#, 2
	note C#, 2
	note D#, 2
	note G_, 2
	note A#, 2
	octave 4
	note D#, 2
	note G_, 2
	note D#, 2
	octave 3
	note A#, 2
	note G_, 2
	callchannel Music_Autumn_Ch3_Part_3
	callchannel Music_Autumn_Ch3_Part_4
	callchannel Music_Autumn_Ch3_Part_3
	callchannel Music_Autumn_Ch3_Part_4
	callchannel Music_Autumn_Ch3_Part_3
	octave 3
	note G#, 4
	octave 4
	note G#, 4
	octave 3
	note G_, 4
	octave 4
	note G_, 4
	octave 3
	note F_, 4
	octave 4
	note F_, 4
	octave 3
	note D#, 4
	octave 4
	note D#, 4
	octave 3
	notetype $c, $24
	note D_, 8
	notetype $6, $24
	note D#, 4
	note __, 4
	note __, 8
	loopchannel 0, Music_Autumn_Ch3
	
Music_Autumn_Ch3_Part_1:
	octave 2
	note G#, 2
	octave 3
	note D#, 2
	note G#, 2
	octave 4
	note C_, 8
	octave 3
	note D#, 2
	octave 2
	note G#, 2
	octave 3
	note D#, 2
	note G#, 2
	octave 4
	note C_, 4
	octave 3
	note G#, 2
	note D#, 2
	note C_, 2
	endchannel
	
Music_Autumn_Ch3_Part_2:
	octave 3
	note C#, 2
	note G#, 2
	octave 4
	note C#, 2
	note F_, 8
	note C#, 2
	octave 3
	note C#, 2
	note G#, 2
	octave 4
	note C#, 2
	note F_, 4
	note C#, 2
	octave 3
	note G#, 2
	note F_, 2
	endchannel
	
Music_Autumn_Ch3_Part_3:
	octave 3
	note C#, 2
	note __, 1
	note C#, 1
	octave 4
	note C#, 2
	octave 3
	note C#, 2
	note __, 2
	note C#, 2
	octave 4
	note C#, 2
	octave 3
	note C#, 2
	note D#, 2
	note __, 1
	note D#, 1
	octave 4
	note D#, 2
	octave 3
	note D#, 2
	note __, 2
	note D#, 2
	note F_, 2
	note G_, 2
	endchannel
	
Music_Autumn_Ch3_Part_4:
	octave 3
	note G#, 2
	note __, 1
	note G#, 1
	octave 4
	note G#, 2
	octave 3
	note G#, 2
	note __, 2
	note G#, 2
	note G#, 2
	note G_, 2
	
	note F_, 2
	note __, 1
	note F_, 1
	octave 4
	note F_, 2
	octave 3
	note F_, 2
	note __, 2
	note F_, 2
	note F_, 2
	note D#, 2
	endchannel
	
Music_Autumn_Ch4:
	togglenoise $3
	notetype $6
Music_Autumn_Ch4_loop:
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	
	note D#, 4
	note D#, 4
	note D#, 4
	note D_, 1
	note D_, 1
	note __, 1
	note D_, 1
	callchannel Music_Autumn_Ch4_Part_1
	callchannel Music_Autumn_Ch4_Part_2
	callchannel Music_Autumn_Ch4_Part_1
	callchannel Music_Autumn_Ch4_Part_2
	callchannel Music_Autumn_Ch4_Part_1
	callchannel Music_Autumn_Ch4_Part_2
	callchannel Music_Autumn_Ch4_Part_1
	callchannel Music_Autumn_Ch4_Part_2
	callchannel Music_Autumn_Ch4_Part_1
	callchannel Music_Autumn_Ch4_Part_2
	note B_, 8
	note B_, 8
	note B_, 8
	note B_, 8
	note B_, 8
	note __, 8
	note B_, 16
	loopchannel 0, Music_Autumn_Ch4_loop
	
Music_Autumn_Ch4_Part_1:
	note D#, 1
	note __, 1
	note G#, 1
	note __, 1
	note D_, 1
	note __, 1
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note D_, 1
	note __, 1
	note D#, 1
	note D#, 1
	endchannel
	
Music_Autumn_Ch4_Part_2:
	note D#, 1
	note __, 1
	note G#, 1
	note __, 1
	note D_, 1
	note __, 1
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note D_, 1
	note __, 1
	note B_, 1
	note __, 1
	endchannel
	