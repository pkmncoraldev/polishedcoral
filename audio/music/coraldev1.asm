Music_Coraldev1: ; efc01
	musicheader 3, 1, Music_Coraldev1_Ch1
	musicheader 1, 2, Music_Coraldev1_Ch2
	musicheader 1, 3, Music_Coraldev1_Ch3
; efc0d

Music_Coraldev1_Ch1: ; efc0d
	tempo 50
	volume $77
	dutycycle $1
	tone $0000
	vibrato $10, $15
	stereopanning $f0
	notetype $c, $b2
	intensity $87
	octave 3
	note F_, 3
	note __, 1
	note F_, 3
	note __, 1
	note F_, 3
	note __, 1
	note D#, 3
	note __, 1
	note __, 4
	note D#, 3
	note __, 1
	note __, 4
	note D_, 3
	note __, 1
	note __, 16
	octave 4
	note A#, 3
Music_Coraldev1_Ch1loop:
	note __, 5
	loopchannel 0, Music_Coraldev1_Ch1loop
	
; efcda

Music_Coraldev1_Ch2: ; efcda
	dutycycle $1
	vibrato $12, $36
	stereopanning $f
	notetype $c, $c2
	intensity $c5
	octave 4
	note D#, 3
	note __, 1
	note D_, 3
	note __, 1
	note C_, 3
	note __, 1
	octave 3
	note A#, 3
	note __, 1
	note __, 4
	note A_, 3
	note __, 1
	note __, 4
	note A#, 3
	note __, 1
	note __, 16
	octave 4
	note D_, 3
Music_Coraldev1_Ch2loop:
	note __, 5
	loopchannel 0, Music_Coraldev1_Ch2loop
	
; efd5f

Music_Coraldev1_Ch3: ; efd5f
	notetype $c, $14
	octave 2
	note F_, 3
	note __, 1
	note F_, 3
	note __, 1
	note F_, 3
	note __, 1
	octave 3
	note C_, 3
	note __, 1
	note __, 4
	note C_, 3
	note __, 1
	note __, 4
	octave 2
	note A#, 3
	note __, 1
	note __, 16
	octave 1
	note A#, 3
Music_Coraldev1_Ch3loop:
	note __, 5
	loopchannel 0, Music_Coraldev1_Ch3loop