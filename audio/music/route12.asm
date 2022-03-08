Music_Route12:
	musicheader 4, 1, Music_Route12_Ch1
	musicheader 1, 2, Music_Route12_Ch2
	musicheader 1, 3, Music_Route12_Ch3
	musicheader 1, 4, Music_Route12_Ch4


Music_Route12_Ch1:
	tempo 150
	volume $77
	dutycycle $1
	tone $0001
	vibrato $10, $15
	stereopanning $0f
	notetype $c, $b2
	intensity $b7
	note __, 2
Music_Route12_Ch1_Repeat:
	callchannel Music_Route12_Ch1_Part_1
	octave 3
	note A#, 4
	note G_, 4
	note G#, 6
	note D#, 6
	note C_, 4
	callchannel Music_Route12_Ch1_Part_1
	note C#, 4
	note F_, 4
	note D#, 16
	
	loopchannel 2, Music_Route12_Ch1_Repeat
	
	dutycycle $2
	intensity $97
	note C#, 3
	octave 3
	note G#, 1
	note F_, 2
	note C#, 6
	note F_, 4
	note G#, 8
	note G#, 8
	note G#, 3
	note D#, 1
	note C_, 2
	octave 2
	note G#, 6
	octave 3
	note C_, 4
	note D#, 8
	note G#, 8
	
	note D#, 3
	octave 2
	note A#, 1
	note G_, 2
	note D#, 6
	note G_, 4
	note A#, 4
	octave 3
	note C#, 4
	note G_, 4
	note A#, 4
	note G#, 3
	note D#, 1
	note C_, 2
	octave 2
	note G#, 6
	octave 3
	note D#, 4
	note F#, 8
	note G#, 4
	octave 4
	note C_, 4
	
	note C#, 3
	octave 3
	note G#, 1
	note F_, 2
	note C#, 6
	note F_, 4
	note G#, 4
	note F_, 4
	octave 4
	note C#, 4
	octave 3
	note A#, 4
	octave 4
	note C_, 8
	octave 3
	note A#, 8
	note A_, 8
	note F_, 8
	
	note A#, 6
	octave 4
	note C_, 6
	note C#, 4
	note F_, 8
	note F_, 8
	note G_, 8
	note F_, 8
	note D#, 8
	
	dutycycle $1
	intensity $b7
	octave 3
	note D#, 8
	note E_, 8
	note G#, 8
	note F#, 8
	note A#, 8
	octave 4
	intensity $b8
	note C_, 15
	note __, 1
	
	intensity $b7
	note C_, 1
	note C_, 1
	note C_, 1
	note __, 3
	note C_, 1
	note C_, 1
	note C_, 1
	note __, 5
	loopchannel 0, Music_Route12_Ch1

Music_Route12_Ch1_Part_1:
	octave 2
	note __, 2
	note G#, 2
	octave 3
	note C_, 2
	octave 2
	note G#, 2
	octave 3
	note D#, 2
	note C_, 2
	note G#, 2
	note D#, 2
	octave 4
	note C_, 6
	octave 3
	note A#, 6
	note G#, 4
	octave 4
	note C#, 4
	note C_, 4
	endchannel

Music_Route12_Ch2:
	dutycycle $3
	vibrato $12, $36
;	stereopanning $f0
	notetype $c, $c2
	intensity $c5
Music_Route12_Ch2_Repeat:
	octave 3
	note G#, 1
	note A#, 1
	callchannel Music_Route12_Ch2_Part_1
	note D#, 4
	note C#, 4
	note C_, 16
	callchannel Music_Route12_Ch2_Part_1
	note F#, 4
	note A#, 4
	note G#, 14
	loopchannel 2, Music_Route12_Ch2_Repeat
	note G#, 1
	note G_, 1
	
	note F_, 6
	note C#, 6
	octave 3
	note G#, 4
	octave 4
	note C#, 8
	note F_, 4
	note C#, 4
	note D#, 6
	note C_, 6
	octave 3
	note G#, 4
	octave 4
	note C_, 14
	note C#, 1
	note C_, 1
	octave 3
	note A#, 6
	note G_, 6
	note A#, 4
	octave 4
	note C#, 8
	note F_, 8
	note D#, 6
	note C_, 6
	octave 3
	note G#, 4
	octave 4
	note C_, 14
	note G#, 1
	note G_, 1
	
	note F_, 6
	note C#, 6
	octave 3
	note G#, 4
	octave 4
	note C#, 8
	note F_, 8
	note G#, 6
	note D#, 6
	note C_, 4
	note D#, 6
	note C#, 6
	note C_, 4
	note C#, 6
	note D#, 6
	note F_, 4
	octave 5
	vibrato $10, $15
	intensity $c7
	note C_, 8
	note C#, 8
	octave 4
	note A#, 16
	
	octave 5
	note __, 8
	note C_, 8
	octave 4
	note G#, 16
	note G#, 16
	intensity $a8
	note G#, 15
	note __, 1
	
	intensity $c7
	note G#, 1
	note G#, 1
	note G#, 1
	note __, 3
	note G#, 1
	note G#, 1
	note G#, 1
	note __, 5
	loopchannel 0, Music_Route12_Ch2

Music_Route12_Ch2_Part_1:
	octave 4
	note C_, 6
	note C#, 6
	note D#, 12
	note __, 6
	note D#, 1
	octave 4
	note F_, 1
	note F#, 4
	note F_, 4
	endchannel
	
Music_Route12_Ch3:
	notetype $c, $14
	note __, 2
	callchannel Music_Route12_Ch3_Part_1
	note F#, 2
	note __, 4
	note A#, 2
	note __, 2
	note A#, 2
	note G_, 2
	note __, 2
	note G#, 2
	note __, 4
	octave 3
	note C_, 2
	note __, 2
	note __, 2
	octave 2
	note D#, 2
	note G_, 2
	callchannel Music_Route12_Ch3_Part_1
	note F#, 2
	note __, 4
	note A#, 2
	note __, 2
	note A#, 2
	note D#, 2
	note __, 2
	note G#, 2
	note __, 8
	note D#, 2
	note F_, 2
	note G_, 2
	
	callchannel Music_Route12_Ch3_Part_2
	note D#, 2
	note F_, 2
	note G_, 2
	callchannel Music_Route12_Ch3_Part_2
	octave 3
	note C_, 1
	note __, 1
	octave 2
	note D#, 2
	note D_, 2
	
	note C#, 6
	note F_, 6
	note G#, 4
	octave 3
	note C#, 6
	octave 2
	note G#, 6
	note F_, 4
	octave 1
	note G#, 6
	octave 2
	note C_, 6
	note D#, 4
	note G#, 6
	note D#, 6
	note C_, 4
	note D#, 6
	note G_, 6
	note A#, 4
	octave 3
	note D#, 6
	octave 2
	note A#, 6
	note G_, 4
	octave 1
	note G#, 6
	octave 2
	note C_, 6
	note D#, 4
	note G#, 8
	octave 3
	note C_, 8
	
	note C#, 1
	note __, 1
	note C#, 1
	note __, 3
	notetype $6, $14
	octave 2
	note G#, 1
	note __, 1
	notetype $c, $14
	note G#, 1
	octave 3
	note C#, 1
	note __, 1
	note C#, 1
	note __, 1
	octave 2
	note G#, 2
	octave 3
	note C_, 2
	note C#, 1
	note __, 1
	note C#, 1
	note __, 3
	notetype $6, $14
	octave 2
	note G#, 1
	note __, 1
	notetype $c, $14
	note G#, 1
	octave 3
	note C#, 1
	note __, 1
	note C#, 1
	note __, 1
	octave 2
	note G_, 4
	note G#, 8
	note F#, 8
	note F_, 6
	octave 3
	note C_, 2
	note F_, 4
	note C_, 4
	
	octave 2
	note A#, 2
	note __, 4
	note A#, 2
	note __, 2
	note A#, 2
	note __, 2
	note F_, 2
	note A#, 2
	note __, 4
	note A#, 2
	note __, 2
	note A#, 2
	note F_, 4
	
	octave 3
	note D#, 2
	note __, 4
	note D#, 2
	note __, 2
	note D#, 2
	note __, 2
	octave 2
	note A#, 2
	octave 3
	note D#, 2
	note __, 4
	note D#, 2
	note __, 2
	note D#, 2
	octave 2
	note A#, 2
	note G_, 2
	
	note E_, 2
	note __, 4
	note E_, 2
	note __, 2
	note E_, 2
	octave 3
	note E_, 2
	note __, 2
	octave 2
	note F#, 2
	note __, 4
	note F#, 2
	note __, 2
	note F#, 2
	octave 3
	note F#, 2
	note __, 2
	octave 2
	note G#, 2
	note __, 4
	note G#, 2
	note __, 2
	note G#, 2
	note D#, 2
	note G_, 2
	
	note G#, 1
	note G#, 1
	note G#, 1
	note __, 3
	note G#, 1
	note G#, 1
	note G#, 1
	note __, 5
	loopchannel 0, Music_Route12_Ch3

Music_Route12_Ch3_Part_1:
	octave 2
	note G#, 2
	note __, 4
	octave 3
	note C_, 2
	note __, 2
	note C_, 2
	octave 2
	note D#, 2
	note __, 2
	note G#, 2
	note __, 4
	octave 3
	note C_, 2
	note __, 2
	note C_, 2
	octave 2
	note D#, 4
	endchannel
	
Music_Route12_Ch3_Part_2:
	note G#, 2
	octave 3
	note C_, 1
	note __, 1
	octave 2
	note D#, 2
	octave 3
	note C_, 1
	note __, 1
	octave 2
	note G#, 2
	octave 3
	note C_, 1
	note __, 1
	octave 2
	note D#, 2
	octave 3
	note C_, 1
	note __, 1
	octave 2
	note G#, 2
	octave 3
	note C_, 1
	note __, 1
	octave 2
	note D#, 2
	octave 3
	note C_, 1
	note __, 1
	octave 2
	note G#, 2
	octave 3
	note C_, 1
	note __, 1
	octave 2
	note D#, 2
	octave 3
	note C_, 1
	note __, 1
	octave 2
	note F#, 2
	note A#, 1
	note __, 1
	note C#, 2
	note A#, 1
	note __, 1
	note F#, 2
	note A#, 1
	note __, 1
	note C#, 2
	note A#, 1
	note __, 1
	note G#, 2
	octave 3
	note C_, 1
	note __, 1
	octave 2
	note D#, 2
	octave 3
	note C_, 1
	note __, 1
	octave 2
	note G#, 2
	endchannel

Music_Route12_Ch4:
	togglenoise $3
	notetype $6
Music_Route12_Ch4_loop:
	note __, 4
	callchannel Music_Route12_Ch4_Part_1
	callchannel Music_Route12_Ch4_Part_1
	callchannel Music_Route12_Ch4_Part_1
	note D_, 6
	note D_, 2
	note D_, 4
	note F#, 6
	note D_, 2
	note D_, 4
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 2
	note D_, 2
	note D_, 8
	note D#, 8
	note D#, 8
	note D#, 8
	callchannel Music_Route12_Ch4_Part_2
	callchannel Music_Route12_Ch4_Part_2
	callchannel Music_Route12_Ch4_Part_2
	callchannel Music_Route12_Ch4_Part_2
	callchannel Music_Route12_Ch4_Part_3
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	callchannel Music_Route12_Ch4_Part_3
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 2
	note D_, 2
	callchannel Music_Route12_Ch4_Part_4
	callchannel Music_Route12_Ch4_Part_4
	note B_, 12
	note __, 4
	note B_, 12
	note __, 4
	note B_, 12
	note __, 4
	note B_, 12
	note __, 4
	callchannel Music_Route12_Ch4_Part_1
	callchannel Music_Route12_Ch4_Part_1
	
	callchannel Music_Route12_Ch4_Part_5
	
	note D_, 4
	note D_, 4
	note __, 4
	note D_, 1
	note __, 1
	note D_, 2
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	note D_, 2
	note __, 6
	
	callchannel Music_Route12_Ch4_Part_5
	
	note D_, 2
	note D_, 2
	note D_, 2
	note __, 6
	note D_, 2
	note D_, 2
	note D_, 2
	note __, 10
	loopchannel 0, Music_Route12_Ch4_loop
	
Music_Route12_Ch4_Part_1:
	note D_, 6
	note D_, 2
	note D_, 4
	note F#, 6
	note D_, 2
	note D_, 4
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 2
	note D_, 2
	
	note D_, 6
	note D_, 2
	note D_, 4
	note F#, 6
	note D_, 2
	note D_, 4
	note D_, 4
	note D_, 4
	endchannel
	
Music_Route12_Ch4_Part_2:
	note D_, 4
	note D_, 4
	note __, 4
	note D_, 1
	note __, 1
	note D_, 2
	note D_, 2
	note __, 2
	note D_, 2
	note __, 6
	note D_, 2
	note __, 2
	
Music_Route12_Ch4_Part_4:
	note D_, 4
	note D_, 4
	note __, 4
	note D_, 1
	note __, 1
	note D_, 2
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 2
	note D_, 2
	endchannel
	
Music_Route12_Ch4_Part_3:
	note B_, 6
	note __, 6
	note D_, 2
	note __, 10
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	note D_, 2
	note __, 10
	note D_, 2
	note __, 10
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 2
	note D_, 2
	
	note B_, 6
	note __, 6
	note D_, 2
	note __, 10
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	note D_, 2
	note __, 10
	note D_, 2
	note __, 10
	endchannel
	
Music_Route12_Ch4_Part_5:
	note D_, 4
	note D_, 4
	note __, 4
	note D_, 1
	note __, 1
	note D_, 2
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 2
	note D_, 2
	endchannel
	