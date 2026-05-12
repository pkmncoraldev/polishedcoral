Music_RivalEncounter2:
	musicheader 3, 1, Music_RivalEncounter2_Ch1
	musicheader 1, 2, Music_RivalEncounter2_Ch2
	musicheader 1, 3, Music_RivalEncounter2_Ch3

Music_RivalEncounter2_Ch1:
	tempo 210
	volume $77
	tone $0001
	vibrato $12, $15
	stereopanning $0f
	notetype $c, $58
	note __, 2
Music_RivalEncounter2_Ch1_Loop:
	dutycycle $2
	octave 3
	note C#, 3
	octave 2
	note G#, 3
	octave 3
	note E_, 4
	note F#, 4
	note E_, 2
	note E_, 10
	note C#, 2
	octave 2
	note G#, 2
	note G#, 2

	dutycycle $0
	octave 2
	note G#, 8
	octave 3
	note C#, 8
	note C_, 8
	octave 2
	note G#, 8
	loopchannel 0, Music_RivalEncounter2_Ch1_Loop
	endchannel

Music_RivalEncounter2_Ch2:
	dutycycle $1
	vibrato $8, $36
	stereopanning $ff
	notetype $c, $77
	note __, 2
Music_RivalEncounter2_Ch2_Loop:
	octave 1
	note C#, 1
	note __, 1
	note C#, 1
	note __, 5
	note G#, 6
	octave 2
	note C_, 2
	note C#, 8
	octave 1
	note G#, 6
	note E_, 2
	note C#, 1
	note __, 1
	note C#, 1
	
	dutycycle $0
	notetype $c, $38
	octave 3
	note E_, 5
	note G#, 8
	note F#, 8
	note D#, 6
	dutycycle $1
	notetype $c, $77
	octave 1
	note E_, 2
	
	note C#, 1
	note __, 1
	note C#, 1
	note __, 5
	note G#, 6
	octave 2
	note C_, 2
	note C#, 8
	octave 1
	note G#, 6
	note E_, 2
	note C#, 1
	note __, 1
	note C#, 1
	
	dutycycle $2
	notetype $c, $48
	octave 3
	note E_, 1
	note G#, 1
	note __, 1
	note G#, 4
	note E_, 2
	note G#, 2
	note E_, 2
	note F#, 4
	note D#, 4
	note C_, 4
	note D#, 2
	dutycycle $1
	notetype $c, $77
	octave 1
	note E_, 2
;	endchannel
	loopchannel 0, Music_RivalEncounter2_Ch2_Loop
	endchannel

Music_RivalEncounter2_Ch3:
	stereopanning $f0
Music_RivalEncounter2_Ch3_Loop:
	notetype $c, $20
	octave 4
	note C#, 1
	note D#, 1
	note E_, 3
	note C#, 3
	note G#, 4
	note A_, 4
	note A_, 2
	note G#, 10
	note F#, 2
	note D#, 2
	note E_, 2
	notetype $c, $31
	octave 5
	note C#, 8
	note E_, 8
	note D#, 8
	note C_, 6
	loopchannel 0, Music_RivalEncounter2_Ch3_Loop
	endchannel
