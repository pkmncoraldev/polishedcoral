Music_PokemaniacEncounter:
	musicheader 4, 1, Music_PokemaniacEncounter_Ch1
	musicheader 1, 2, Music_PokemaniacEncounter_Ch2
	musicheader 1, 3, Music_PokemaniacEncounter_Ch3
	musicheader 1, 4, Music_PokemaniacEncounter_Ch4

Music_PokemaniacEncounter_Ch1:
	tempo $78
	volume $77
	stereopanning $77
	notetype $C, $00
	note __, 12
Music_PokemaniacEncounter_Ch1_loop:
	note __, 4
	intensity $85
	octave 3
	note D#, 1
	note __, 3
	note C_, 1
	note __, 7
	note D#, 1
	note __, 3
	octave 2
	note B_, 1
	note __, 7
	note A_, 1
	note __, 3
	note G_, 1
	note __, 7
	note G#, 1
	note __, 3
	note F#, 1
	note __, 7
	note G_, 1
	note __, 3
	note F_, 1
	note __, 7
	note F#, 1
	note __, 3
	note E_, 1
	note __, 7
	octave 3
	note F_, 1
	note __, 3
	note D#, 1
	note __, 7
	note D#, 1
	note __, 3
	octave 2
	note B_, 1
	note __, 3
	loopchannel 0, Music_PokemaniacEncounter_Ch1_loop

Music_PokemaniacEncounter_Ch2:
	notetype $C, $00
	note __, 8
	intensity $85
	octave 2
	note E_, 1
	note __, 3
Music_PokemaniacEncounter_Ch2_loop:
	octave 1
	note A_, 1
	note __, 3
	octave 3
	note E_, 1
	note __, 3
	note E_, 1
	note __, 3
	octave 1
	note E_, 1
	note __, 3
	octave 3
	note E_, 1
	note __, 3
	note E_, 1
	note __, 3
	octave 1
	note C#, 1
	note __, 3
	octave 2
	note A#, 1
	note __, 3
	note A#, 1
	note __, 3
	octave 1
	note D_, 1
	note __, 3
	octave 2
	note A_, 1
	note __, 3
	note A_, 1
	note __, 3
	octave 1
	note B_, 1
	note __, 3
	octave 2
	note G#, 1
	note __, 3
	note G#, 1
	note __, 3
	note C_, 1
	note __, 3
	note G_, 1
	note __, 3
	note G_, 1
	note __, 3
	octave 1
	note B_, 1
	note __, 3
	octave 3
	note F#, 1
	note __, 3
	note F#, 1
	note __, 3
	octave 2
	note E_, 1
	note __, 3
	octave 3
	note E_, 1
	note __, 3
	note E_, 1
	note __, 3
	loopchannel 0, Music_PokemaniacEncounter_Ch2_loop

Music_PokemaniacEncounter_Ch3:
	dutycycle 1
	vibrato $00, $23
	octave 5
	notetype $C, $11
	note E_, 1
	note F_, 1
	note E_, 6
	note F_, 1
	note F#, 1
	note G_, 1
	note G#, 1
Music_PokemaniacEncounter_Ch3_loop:
	note A_, 4
	note C_, 4
	note A_, 4
	note G#, 6
	octave 4
	note B_, 2
	octave 5
	note G#, 4
	note G_, 4
	octave 4
	note A#, 4
	octave 5
	note G_, 4
	note F#, 6
	octave 4
	note A_, 2
	octave 5
	note F#, 4
	note F_, 4
	octave 4
	note G#, 4
	octave 5
	note F_, 4
	note E_, 6
	octave 4
	note G_, 2
	octave 5
	note E_, 4
	note D#, 4
	octave 4
	note B_, 2
	note __, 2
	octave 5
	note D#, 2
	note __, 2
	note E_, 1
	note F_, 1
	note E_, 6
	note F_, 1
	note F#, 1
	note G_, 1
	note G#, 1
	loopchannel 0, Music_PokemaniacEncounter_Ch3_loop

Music_PokemaniacEncounter_Ch4:
	togglenoise 3
	notetype $C
	note __, 12
Music_PokemaniacEncounter_Ch4_loop:
	note A#, 1
	note __, 3
	note E_, 1
	note __, 1
	note G_, 1
	note __, 1
	note E_, 1
	note __, 3
	loopchannel 0, Music_PokemaniacEncounter_Ch4_loop

