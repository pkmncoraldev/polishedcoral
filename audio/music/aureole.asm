Music_AureoleMoutain:
	musicheader 4, 1, Music_AureoleMoutain_Ch1
	musicheader 1, 2, Music_AureoleMoutain_Ch2
	musicheader 1, 3, Music_AureoleMoutain_Ch3
	musicheader 1, 4, Music_AureoleMoutain_Ch4


Music_AureoleMoutain_Ch1:
	tempo 275
	volume $77
	dutycycle $1
	tone $0002
	vibrato $12, $15
	notetype $c, $b5
	octave 3
	note __, 14
	note __, 14
Music_AureoleMoutain_Ch1_loop:
	note C#, 4
	callchannel Music_AureoleMoutain_Harm_1
	note A_, 4
	callchannel Music_AureoleMoutain_Harm_1
	intensity $b7
	note A_, 14
	note __, 14
	
	;chords 1
	octave 3
	dutycycle $0
	intensity $2e
	note C#, 8
	note D_, 6
	note C#, 8
	note D_, 8
	
	intensity $b5
	dutycycle $1
	octave 3
	note C#, 4
	callchannel Music_AureoleMoutain_Harm_1
	note A_, 4
	octave 3
	note F#, 2
	note C#, 2
	note B_, 4
	note G#, 2
	note A_, 3
	octave 2
	note C#, 1
	note F#, 2
	note C#, 2
	note B_, 4
	note G#, 4
	intensity $b7
	note A_, 14
	
	;chords 2
	note __, 14
	
	;dark cave reference
	dutycycle $0
	intensity $95
	octave 2
	note C#, 2
	note A_, 1
	note F#, 2
	note A_, 1
	note G#, 2
	note G_, 1
	note __, 1
	octave 1
	note B_, 2
	note B_, 1
	octave 2
	note D_, 1
	
	note C#, 2
	note A_, 1
	note F#, 2
	note A_, 1
	note F#, 2
	note G_, 1
	note __, 1
	octave 1
	note B_, 2
	octave 2
	note E_, 1
	note D_, 1
	note E_, 2
	
	;key change part
	dutycycle $1
	intensity $b5
	octave 3
	note B_, 4
	note D_, 2
	octave 2
	note B_, 2
	octave 3
	note E_, 4
	note E_, 2
	note D_, 4
	octave 2
	note B_, 4
	note A#, 4
	note A#, 2
	
	octave 3
	note B_, 4
	note D_, 2
	octave 2
	note B_, 2
	octave 3
	note E_, 3
	note E_, 3
	note E_, 3
	note D_, 5
	octave 2
	note A#, 6
	octave 3
	loopchannel 0, Music_AureoleMoutain_Ch1_loop
	
Music_AureoleMoutain_Harm_1:
	octave 3
	note F#, 2
	note C#, 2
	note B_, 4
	note G#, 2
	note A_, 3
	octave 2
	note C#, 1
	note F#, 2
	note C#, 2
	note B_, 4
	note G#, 2
	endchannel

Music_AureoleMoutain_Ch2:
	dutycycle $1
	tone $0002
	vibrato $12, $15
	notetype $c, $d5
	octave 3
	note __, 14
	note __, 14
Music_AureoleMoutain_Ch2_loop:
	callchannel Music_AureoleMoutain_Lead_1
	callchannel Music_AureoleMoutain_Lead_1
	intensity $d7
	note C#, 12
	
	octave 4
	dutycycle $0
	note C#, 1
	note F#, 1
	note C#, 14
	
	;chords 1
	octave 3
	dutycycle $0
	intensity $2e
	note A_, 8
	note B_, 6
	note A_, 8
	note B_, 8
	
	dutycycle $1
	intensity $d5
	octave 3
	callchannel Music_AureoleMoutain_Lead_1
	note F#, 3
	note G#, 1
	note A_, 2
	note F#, 2
	octave 4
	note D_, 6
	note C#, 3
	octave 2
	note G#, 1
	note A_, 2
	note F#, 2
	octave 3
	note D_, 8
	note C#, 14
	
	;chords 2
	octave 4
	dutycycle $0
	intensity $2e
	note F#, 8
	intensity $e6
	note F#, 6
	
	;dark cave reference
	octave 3
	dutycycle $0
	intensity $b5
	octave 2
	note F#, 2
	octave 3
	note C#, 1
	octave 2
	note A_, 2
	octave 3
	note C#, 1
	octave 2
	note B_, 2
	note A_, 1
	note __, 1
	note E_, 2
	note E_, 1
	note G_, 1
	note F#, 2
	octave 3
	note C#, 1
	octave 2
	note A_, 2
	octave 3
	note C#, 1
	octave 2
	note A_, 2
	note B_, 1
	note __, 1
	note E_, 2
	note G_, 1
	note F#, 1
	note G_, 2
	
	;key change part
	dutycycle $1
	intensity $d5
	octave 4
	note D_, 3
	note C#, 1
	octave 3
	note B_, 2
	note F#, 2
	note G_, 2
	note A_, 2
	note G_, 2
	note F#, 6
	note D_, 2
	note E_, 2
	note F#, 2
	note E_, 2
	
	octave 4
	note D_, 3
	note C#, 1
	octave 3
	note B_, 2
	note F#, 2
	note G_, 3
	note A_, 3
	note G_, 3
	note F#, 5
	note E_, 2
	note F#, 2
	note G_, 2
	
	loopchannel 0, Music_AureoleMoutain_Ch2_loop
	
Music_AureoleMoutain_Lead_1:
	note F#, 3
	note G#, 1
	note A_, 2
	note F#, 2
	octave 4
	note D_, 6
	note C#, 3
	octave 2
	note G#, 1
	note A_, 2
	note F#, 2
	octave 3
	note D_, 6
	endchannel

Music_AureoleMoutain_Ch3:
	notetype $c, $14
	octave 2
	callchannel Music_AureoleMoutain_Bass1
	callchannel Music_AureoleMoutain_Bass1
Music_AureoleMoutain_Ch3_loop:
	callchannel Music_AureoleMoutain_Bass1
	callchannel Music_AureoleMoutain_Bass1
	callchannel Music_AureoleMoutain_Bass1
	callchannel Music_AureoleMoutain_Bass1
	callchannel Music_AureoleMoutain_Bass1
	callchannel Music_AureoleMoutain_Bass1
	callchannel Music_AureoleMoutain_Bass1
	callchannel Music_AureoleMoutain_Bass1
	note G_, 2
	callchannel Music_AureoleMoutain_Bass1
	callchannel Music_AureoleMoutain_Bass1
	callchannel Music_AureoleMoutain_Bass1
	callchannel Music_AureoleMoutain_Bass1
	note G_, 2
	callchannel Music_AureoleMoutain_Bass1
	callchannel Music_AureoleMoutain_Bass1
	callchannel Music_AureoleMoutain_Bass1
	note F#, 2
	note __, 2
	note F#, 2
	note C#, 1
	note F#, 1
	note G_, 4
	note F#, 2
	note A#, 2
	callchannel Music_AureoleMoutain_Bass2
	callchannel Music_AureoleMoutain_Bass2
	callchannel Music_AureoleMoutain_Bass2
	callchannel Music_AureoleMoutain_Bass2
	loopchannel 0, Music_AureoleMoutain_Ch3_loop
	
Music_AureoleMoutain_Bass1:
	note F#, 2
	note __, 2
	note F#, 2
	note C#, 1
	note F#, 1
	note G_, 4
	note D_, 2
	endchannel
	
Music_AureoleMoutain_Bass2:
	note B_, 2
	note __, 2
	note B_, 2
	note F#, 1
	note B_, 1
	octave 3
	note C_, 4
	octave 2
	note G_, 2
	endchannel
	
Music_AureoleMoutain_Ch4:
	togglenoise $3
	notetype $c
	callchannel Music_AureoleMoutain_Drums1
	callchannel Music_AureoleMoutain_Drums1
	callchannel Music_AureoleMoutain_Drums1
	callchannel Music_AureoleMoutain_Drums1
	callchannel Music_AureoleMoutain_Drums1
	callchannel Music_AureoleMoutain_Drums1
	callchannel Music_AureoleMoutain_Drums2
	callchannel Music_AureoleMoutain_Drums2
	callchannel Music_AureoleMoutain_Drums2
	
	;drums kick in
	note A#, 1
	note __, 3
	note A#, 1
	note __, 3
	note A#, 1
	note __, 2
	notetype $6
	note A#, 1
	note A#, 1
	notetype $c
	note C_, 1
	note A#, 1
	note C_, 1
	note C_, 1
	
Music_AureoleMoutain_Ch4_loop:
	;measure 12
	note B_, 2
	note D#, 2
	note C_, 2
	note D#, 1
	note A#, 1
	note D#, 2
	note B_, 2
	note D#, 2
	
	note A#, 2
	note D#, 2
	note C_, 2
	note D#, 1
	note A#, 1
	note D#, 2
	note B_, 1
	note D#, 1
	note C_, 2
	
	;measure 14
	note B_, 2
	note D#, 2
	note C_, 2
	note D#, 1
	note A#, 1
	note D#, 2
	note B_, 2
	note D#, 2
	
	note A#, 2
	note D#, 2
	note C_, 2
	note D#, 1
	note A#, 1
	note D#, 2
	note A#, 1
	note D#, 1
	note C_, 1
	note D#, 1
	note C_, 1
	note C_, 1
	
	;measure 17
	note B_, 2
	note D#, 2
	note C_, 2
	note D#, 1
	note A#, 1
	note D#, 2
	note B_, 2
	note D#, 2
	
	note A#, 2
	note D#, 2
	note C_, 2
	note D#, 1
	note A#, 1
	note D#, 2
	note B_, 1
	note D#, 1
	note C_, 2
	
	;measure 19
	note B_, 2
	note D#, 2
	note C_, 2
	note D#, 1
	note A#, 1
	note D#, 2
	note B_, 2
	note D#, 2
	
	note A#, 2
	note D#, 2
	note C_, 2
	note D#, 1
	note A#, 1
	note D#, 2
	note A#, 1
	note D#, 1
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 1
	
	;measure 22
	note B_, 2
	note D#, 2
	note C_, 2
	note D#, 1
	note A#, 1
	note D#, 2
	note B_, 2
	note D#, 2
	
	note A#, 2
	note D#, 2
	note C_, 2
	note D#, 1
	note A#, 1
	note D#, 2
	note B_, 1
	note D#, 1
	note C_, 2
	
	;measure 24
	note B_, 2
	note D#, 2
	note C_, 2
	note D#, 1
	note A#, 1
	note D#, 2
	note B_, 2
	note D#, 2
	
	note A#, 2
	note D#, 2
	note C_, 2
	note D#, 1
	note A#, 1
	note C_, 2
	note A#, 1
	note D#, 1
	note C_, 1
	note D#, 1
	
	;measure 26
	note B_, 2
	note D#, 2
	note C_, 2
	note D#, 1
	note A#, 1
	note D#, 2
	note B_, 2
	note D#, 2
	
	note A#, 2
	note D#, 2
	note C_, 2
	note D#, 1
	note A#, 1
	note D#, 2
	note B_, 1
	note D#, 1
	note C_, 2
	
	note B_, 2
	note D#, 2
	note C_, 2
	note D#, 1
	note A#, 1
	note D#, 2
	note B_, 2
	note D#, 2
	
	note A#, 2
	note D#, 2
	note C_, 2
	note D#, 1
	note A#, 1
	note D#, 2
	note B_, 1
	note D#, 1
	note C_, 2
	
	note B_, 2
	note D#, 2
	note C_, 2
	note D#, 1
	note A#, 1
	note D#, 2
	note B_, 2
	note D#, 2
	
	note A#, 2
	note D#, 2
	note C_, 2
	note D#, 1
	note A#, 1
	note D#, 2
	note B_, 1
	note D#, 1
	note C_, 2
	
	note B_, 2
	note D#, 2
	note C_, 2
	note D#, 1
	note A#, 1
	note D#, 2
	note B_, 2
	note D#, 2
	
	note A#, 2
	note D#, 2
	note C_, 2
	note D#, 1
	note A#, 1
	note C_, 2
	note A#, 1
	note D#, 1
	note C_, 1
	note D#, 1
	note C_, 1
	note C_, 1
	loopchannel 0, Music_AureoleMoutain_Ch4_loop
	
Music_AureoleMoutain_Drums1:
	note D_, 1
	note __, 5
	note D_, 1
	note D_, 1
	note D_, 1
	note __, 3
	note B_, 1
	note __, 1
	endchannel
	
Music_AureoleMoutain_Drums2:
	note D_, 1
	note __, 3
	note D_, 1
	note __, 1
	note D_, 1
	note D_, 1
	note D_, 1
	note __, 3
	note B_, 1
	note __, 1
	endchannel
	