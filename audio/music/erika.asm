Music_Erika:
	musicheader 3, 1, Music_Erika_Ch1
	musicheader 1, 2, Music_Erika_Ch2
	musicheader 1, 3, Music_Erika_Ch3

Music_Erika_Ch1:
	tempo 224
	volume $77
	stereopanning $ff
Music_Erika_Ch1_loop:
	dutycycle 1
	vibrato $03, $23
	notetype $c, $97
	octave 3
	note D_, 6
	note F_, 6
	note D#, 4
	note D_, 6
	note F_, 2
	note D#, 8
	octave 2
	note A_, 6
	octave 3
	note C_, 6
	note D#, 4
	octave 2
	note A_, 6
	octave 3
	note D#, 2
	note D_, 4
	note F_, 2
	note D#, 2
	
	dutycycle 0
	notetype $c, $93
	note D_, 2
	note D#, 2
	note F_, 2
	note G_, 2
	note F_, 2
	note D#, 2
	note D_, 2
	note D#, 2
	note D_, 2
	note D#, 2
	note F_, 2
	note A#, 2
	note A_, 2
	note F_, 2
	note D#, 2
	note C_, 2
	
	dutycycle 1
	notetype $c, $97
	octave 2
	note A_, 2
	note A#, 2
	octave 3
	note C_, 2
	note D#, 2
	note C_, 2
	octave 2
	note A#, 2
	note A_, 2
	note A#, 2
	note A_, 6
	notetype $8, $87
	octave 3
	note F_, 1
	note A_, 1
	octave 4
	note C_, 1
	notetype $c, $97
	note D#, 8
	
	dutycycle 2
	notetype $c, $67
	callchannel Music_Erika_Ch1_part1
	callchannel Music_Erika_Ch1_part1
	callchannel Music_Erika_Ch1_part1
	callchannel Music_Erika_Ch1_part1
	callchannel Music_Erika_Ch1_part2
	callchannel Music_Erika_Ch1_part2
	note A_, 2
	note F_, 2
	octave 5
	note C_, 2
	octave 4
	note A_, 2
	callchannel Music_Erika_Ch1_part1
	callchannel Music_Erika_Ch1_part1
	callchannel Music_Erika_Ch1_part1
	callchannel Music_Erika_Ch1_part1
	callchannel Music_Erika_Ch1_part1
	callchannel Music_Erika_Ch1_part2
	callchannel Music_Erika_Ch1_part2
	callchannel Music_Erika_Ch1_part2
	octave 5
	note C_, 2
	octave 4
	note A#, 2
	note A_, 2
	note G_, 2
	note A_, 16
	loopchannel 0, Music_Erika_Ch1_loop
	
Music_Erika_Ch1_part1:
	note A#, 2
	note F_, 2
	octave 5
	note D_, 2
	octave 4
	note F_, 2
	endchannel
	
Music_Erika_Ch1_part2:
	note A_, 2
	note F_, 2
	octave 5
	note C_, 2
	octave 4
	note F_, 2
	endchannel

Music_Erika_Ch2:
	dutycycle 1
	stereopanning $ff
	notetype $C, $00
	intensity $96
	vibrato $00, $23
Music_Erika_Ch2_loop:
	octave 1
	note A#, 2
	octave 2
	note D_, 2
	note F_, 2
	note A#, 6
	note F_, 2
	note D_, 2
	octave 1
	note A#, 2
	octave 2
	note D_, 2
	note F_, 2
	note A#, 2
	note A_, 4
	note F_, 4
	
	octave 1
	note F_, 2
	note A_, 2
	octave 2
	note C_, 2
	note D#, 6
	note C_, 2
	octave 1
	note A_, 2
	note F_, 2
	note A_, 2
	octave 2
	note C_, 2
	note D#, 2
	note D_, 4
	octave 1
	note A#, 4
	
	note A#, 2
	octave 2
	note D_, 2
	note F_, 2
	note A#, 6
	note F_, 2
	note D_, 2
	octave 1
	note A#, 2
	octave 2
	note D_, 2
	note F_, 2
	note A#, 2
	note A_, 4
	note F_, 4
	
	octave 1
	note F_, 2
	note A_, 2
	octave 2
	note C_, 2
	note D#, 2
	note C_, 2
	note D#, 2
	note F_, 2
	note G_, 2
	note F_, 8
	note A_, 8
	
	callchannel Music_Erika_Ch2_part
	callchannel Music_Erika_Ch2_part
	octave 1
	note F_, 6
	octave 2
	note C_, 2
	note F_, 4
	note C_, 4
	octave 1
	note F_, 4
	octave 2
	note D#, 4
	note D_, 4
	octave 1
	note A#, 4
	callchannel Music_Erika_Ch2_part
	callchannel Music_Erika_Ch2_part
	octave 1
	note F_, 6
	octave 2
	note C_, 2
	note D#, 4
	note C_, 2
	note D#, 2
	note F_, 8
	note F_, 2
	note G_, 2
	note A_, 2
	note A#, 2
	octave 3
	note C_, 8
	octave 2
	note F_, 4
	octave 1
	note F_, 2
	note A_, 2
	loopchannel 0, Music_Erika_Ch2_loop

Music_Erika_Ch2_part:
	octave 1
	note A#, 6
	octave 2
	note F_, 2
	note A#, 4
	note F_, 4
	endchannel

Music_Erika_Ch3:
	stereopanning $ff
	dutycycle 5
	vibrato 22, 2, 4
Music_Erika_Ch3_loop:
	notetype $c, $25
	octave 5
	note D_, 4
	octave 4
	note A#, 4
	octave 5
	note D_, 2
	octave 4
	note A#, 6
	octave 5
	note D_, 2
	octave 4
	note A#, 2
	octave 5
	note D#, 2
	note D_, 2
	note C_, 8
	note C_, 4
	octave 4
	note A_, 4
	octave 5
	note C_, 2
	octave 4
	note A_, 6
	octave 5
	note C_, 2
	octave 4
	note A_, 2
	octave 5
	note D_, 2
	note C_, 2
	octave 4
	note A#, 8
	
	notetype $c, $11
	octave 5
	note D_, 2
	notetype $c, $21
	note D_, 2
	notetype $c, $11
	octave 4
	note A#, 2
	notetype $c, $21
	note A#, 2
	notetype $c, $11
	octave 5
	note D_, 2
	octave 4
	note A#, 4
	notetype $c, $21
	note A#, 2
	notetype $c, $11
	octave 5
	note D_, 2
	octave 4
	note A#, 2
	octave 5
	note D#, 2
	note D_, 2
	note C_, 4
	notetype $c, $21
	note C_, 4
	
	notetype $c, $25
	note C_, 2
	octave 4
	note A#, 2
	note A_, 2
	note A#, 2
	note A_, 2
	note G_, 2
	note F_, 2
	note E_, 2
	note F_, 8
	vibrato 22, 2, 4
	octave 5
	note F_, 8
	
	notetype $c, $11
	octave 5
	note F_, 8
	note D#, 2
	note D_, 2
	note C_, 2
	octave 4
	note A#, 2
	octave 5
	note G_, 8
	note F_, 8
	note D#, 8
	octave 4
	note A_, 2
	note A#, 2
	octave 5
	note C_, 2
	note D_, 2
	note D#, 4
	note F_, 4
	note D_, 8
	
	note F_, 8
	note D#, 2
	note D_, 2
	note C_, 2
	octave 4
	note A#, 2
	octave 5
	note G_, 4
	note A_, 2
	note G_, 2
	note F_, 8
	note D#, 8
	octave 6
	note C_, 2
	octave 5
	note A#, 2
	note A_, 2
	note G_, 2
	note A_, 14
	notetype $8, $11
	note F_, 1
	note A_, 1
	octave 6
	note C_, 1
	notetype $c, $11
	note F_, 14
	note __, 2
	loopchannel 0, Music_Erika_Ch3_loop
