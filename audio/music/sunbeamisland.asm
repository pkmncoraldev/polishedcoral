Music_SunbeamIsland: ; f5b03
	musicheader 4, 1, Music_SunbeamIsland_Ch1
	musicheader 1, 2, Music_SunbeamIsland_Ch2
	musicheader 1, 3, Music_SunbeamIsland_Ch3
	musicheader 1, 4, Music_SunbeamIsland_Ch4
; f5b0f

Music_SunbeamIsland_Ch1: ; f5b0f
	tempo 120
	volume $77
	dutycycle $1
	tone $0001
	vibrato $8, $15
	stereopanning $f0
	notetype $c, $67
	note __, 16
	note __, 16
Music_SunbeamIslandloop1: ; f5b26
	notetype $c, $67
	octave 3
	note F#, 6
	octave 4
	note D_, 6
	octave 3
	note A_, 4
	note D_, 16
	note F#, 6
	octave 4
	note D_, 6
	octave 3
	note A_, 4
	note C_, 16
	note G_, 6
	note B_, 6
	note G_, 4
	note A_, 6
	octave 4
	note C#, 6
	octave 3
	note A_, 4
	octave 4
	note D_, 6
	octave 3
	note A_, 6
	note F#, 4
	octave 4
	note C#, 8
	octave 3
	note A_, 8
	
	
	note F#, 6
	octave 4
	note D_, 6
	octave 3
	note A_, 4
	note D_, 16
	note F#, 6
	octave 4
	note D_, 6
	octave 3
	note A_, 4
	note C_, 16
	octave 2
	note B_, 6
	octave 3
	note B_, 6
	note G_, 4
	note A_, 6
	octave 4
	note C#, 6
	octave 3
	note A_, 4
	note F#, 16
	note __, 16
	
	note A_, 6
	note G_, 2
	note __, 8
	note __, 16
	note G_, 6
	note F#, 2
	note __, 8
	note __, 16
	note A_, 6
	note G_, 2
	note __, 8
	note __, 16
	note F#, 16
	note __, 16
	
	note A_, 6
	note G_, 2
	note __, 8
	note __, 16
	octave 4
	note C_, 16
	octave 3
	note B_, 16
	note B_, 6
	note G_, 2
	note __, 4
	
	intensity $47
	note B_, 4
	note A_, 4
	
	intensity $67
	octave 4
	note C#, 2
	note D_, 2
	notetype $8, $c7
	note E_, 4
	octave 3
	note A_, 4
	note G_, 4
	notetype $c, $c7
	note F#, 16
	note __, 16
	loopchannel 0, Music_SunbeamIslandloop1
; f5b74

Music_SunbeamIsland_Ch2: ; f5b74
	dutycycle $3
	vibrato $10, $36
	stereopanning $f
	notetype $c, $c6
	note __, 16
	note __, 16
Music_SunbeamIslandloop2: ; f5b87
	notetype $c, $c6
	octave 4
	note D_, 2
	note A_, 2
	note __, 2
	
	octave 3
	intensity $86
	note A_, 6
	note F#, 8
	
	octave 4
	intensity $c6
	note A_, 6
	note G_, 2
	note F#, 4
	note C_, 2
	note A_, 2
	note __, 2
	
	octave 3
	intensity $86
	note A_, 6
	note F#, 8
	
	octave 4
	intensity $c6
	note A_, 2
	note B_, 2
	note A_, 2
	note G_, 2
	note F#, 4
	note G_, 2
	note D_, 2
	note __, 2
	
	octave 3
	intensity $86
	note G_, 6
	
	octave 4
	intensity $c6
	note D_, 4
	note C#, 4
	note E_, 2
	note G_, 6
	note A_, 2
	note __, 2
	
	
	note F#, 12
	note G_, 2
	note F#, 2
	note E_, 16
	
	
	
	
	
	note D_, 2
	note A_, 2
	note __, 2
	
	octave 3
	intensity $86
	note A_, 6
	
	octave 5
	note D_, 2
	note C#, 2
	note C_, 4
	
	octave 4
	intensity $c6
	note A_, 6
	note G_, 2
	note F#, 4
	note C_, 2
	note A_, 2
	note __, 2
	
	octave 3
	intensity $86
	note A_, 6
	
	octave 4
	note G_, 2
	note A_, 2
	note B_, 4
	
	octave 4
	intensity $c6
	note A_, 2
	note B_, 2
	note A_, 2
	note G_, 2
	note F#, 4
	note G_, 2
	note D_, 2
	note __, 2
	
	octave 3
	intensity $86
	note G_, 6
	
	octave 4
	intensity $c6
	note D_, 4
	note C#, 2
	note E_, 2
	note __, 2
	note G_, 4
	note E_, 2
	note C#, 2
	note __, 2
	note D_, 16
	
	note __, 4
	note D_, 4
	note C#, 4
	note D_, 4
	
	note C#, 6
	octave 3
	note B_, 2
	note __, 8
	note __, 4
	octave 4
	note C#, 2
	note D_, 2
	note E_, 3
	note C#, 3
	octave 3
	note B_, 2
	note B_, 6
	note A_, 2
	note __, 8
	
	octave 4
	note __, 4
	note D_, 4
	note C#, 4
	note D_, 4
	
	note C#, 6
	octave 3
	note B_, 2
	note __, 8
	note __, 4
	octave 4
	note C#, 2
	note D_, 2
	note E_, 3
	note C#, 3
	octave 3
	note B_, 2
	note A_, 16
	octave 4
	
	note __, 4
	note D_, 4
	note C#, 4
	note D_, 4
	
	note C#, 6
	octave 3
	note B_, 2
	note __, 8
	note __, 4
	octave 4
	note C#, 4
	note D_, 4
	note E_, 4
	note F#, 8
	note E_, 8
	
	note D#, 4
	note F#, 4
	note G_, 4
	note F#, 4
	
	note E_, 6
	octave 3
	note B_, 2
	note __, 4
	
	octave 4
	intensity $86
	note D_, 4
	note C#, 4
	
	intensity $c6
	note E_, 2
	note F#, 2
	notetype $8, $c6
	note G_, 4
	note C#, 4
	note E_, 4
	notetype $c, $c7
	note D_, 16
	note __, 16
	loopchannel 0, Music_SunbeamIslandloop2
; f5bd8

Music_SunbeamIsland_Ch3: ; f5bd8
	notetype $c, $16
	octave 2
	note D_, 6
	note A_, 2
	note B_, 2
	note __, 2
	note A_, 2
	note __, 2
	note D_, 4
	note D_, 2
	note A_, 2
	note B_, 2
	note __, 2
	note A_, 2
	note __, 2
	
Music_SunbeamIslandloop3:
	note D_, 6
	note A_, 2
	note B_, 2
	note __, 2
	note A_, 2
	note __, 2
	note D_, 6
	note A_, 2
	note B_, 2
	note __, 2
	note A_, 2
	note __, 2
	note D_, 6
	note A_, 2
	note B_, 2
	note __, 2
	note A_, 2
	note __, 2
	note D_, 6
	note A_, 2
	note B_, 2
	note __, 2
	note A_, 2
	note __, 2
	
	octave 1
	note G_, 6
	octave 2
	note D_, 2
	note G_, 2
	note __, 2
	note D_, 2
	note __, 2
	octave 1
	note A_, 6
	octave 2
	note E_, 2
	note A_, 2
	note __, 2
	note E_, 2
	note __, 2
	note D_, 6
	note A_, 2
	note B_, 2
	note __, 2
	note A_, 2
	note __, 2
	octave 1
	note A_, 1
	note __, 3
	note A_, 12
	
	octave 2
	note D_, 6
	note A_, 2
	note B_, 2
	note __, 2
	note A_, 2
	note __, 2
	note D_, 6
	note A_, 2
	note B_, 2
	note __, 2
	note A_, 2
	note __, 2
	note D_, 6
	note A_, 2
	note B_, 2
	note __, 2
	note A_, 2
	note __, 2
	note D_, 6
	note A_, 2
	note B_, 2
	note __, 2
	note A_, 2
	note __, 2
	note G_, 6
	octave 3
	note D_, 2
	note E_, 2
	note __, 2
	note D_, 2
	note __, 2
	octave 2
	note A_, 6
	octave 3
	note E_, 2
	note G_, 2
	note __, 2
	note E_, 2
	note __, 2
	octave 2
	note D_, 6
	note A_, 2
	note B_, 2
	note __, 2
	note A_, 2
	note __, 2
	note D_, 2
	note __, 2
	note __, 12
	
	note E_, 6
	note B_, 2
	octave 3
	note E_, 2
	note __, 2
	octave 2
	note B_, 2
	note __, 2
	octave 1
	note A_, 6
	octave 2
	note E_, 2
	note A_, 2
	note __, 2
	note E_, 2
	octave 1
	note A_, 2
	octave 2
	note D_, 6
	note A_, 2
	octave 3
	note D_, 2
	note __, 2
	octave 2
	note A_, 2
	note __, 2
	note D_, 6
	note A_, 2
	octave 3
	note D_, 2
	note __, 2
	octave 2
	note A_, 2
	note D_, 2
	
	note E_, 6
	note B_, 2
	octave 3
	note E_, 2
	note __, 2
	octave 2
	note B_, 2
	note __, 2
	octave 1
	note A_, 6
	octave 2
	note E_, 2
	note A_, 2
	note __, 2
	note E_, 2
	octave 1
	note A_, 2
	octave 2
	note D_, 6
	note A_, 2
	octave 3
	note D_, 2
	note __, 2
	octave 2
	note A_, 2
	note __, 2
	note D_, 6
	note A_, 2
	octave 3
	note D_, 2
	note __, 2
	octave 2
	note A_, 2
	note __, 2
	
	note E_, 6
	note B_, 2
	octave 3
	note E_, 2
	note __, 2
	octave 2
	note B_, 2
	note __, 2
	octave 1
	note A_, 6
	octave 2
	note E_, 2
	note A_, 2
	note __, 2
	note E_, 2
	octave 1
	note A_, 2
	octave 2
	note F#, 8
	octave 3
	note C_, 8
	octave 2
	note B_, 8
	note D#, 8
	note E_, 6
	note B_, 2
	octave 3
	note E_, 2
	note __, 2
	octave 2
	note B_, 2
	note __, 2
	octave 1
	note A_, 2
	note __, 2
	note A_, 12
	
	octave 2
	note D_, 6
	note A_, 2
	note B_, 2
	note __, 2
	note A_, 2
	note __, 2
	note D_, 6
	note A_, 2
	note B_, 2
	note __, 2
	note A_, 2
	note __, 2
	loopchannel 0, Music_SunbeamIslandloop3
; f5c48

Music_SunbeamIsland_Ch4: ; f5c48
	togglenoise $3
	notetype $c
	note D_, 2
	note __, 4
	note D_, 2
	note D_, 2
	note __, 2
	note D#, 2
	note __, 2
	note D_, 2
	note __, 4
	note D_, 2
	note D_, 2
	note __, 2
	note D#, 2
	note D#, 2
Music_SunbeamIslandloop4: ; f5c4d
	note D_, 2
	note __, 4
	note D_, 2
	note D_, 2
	note __, 2
	note D#, 2
	note __, 2
	note D_, 2
	note __, 4
	note D_, 2
	note D_, 2
	note __, 2
	note D#, 2
	note D#, 2
	note D_, 2
	note __, 4
	note D_, 2
	note D_, 2
	note __, 2
	note D#, 2
	note __, 2
	note D_, 2
	note __, 4
	note D_, 2
	note D_, 2
	note __, 2
	note D#, 2
	note D#, 2
	note D_, 2
	note __, 4
	note D_, 2
	note D_, 2
	note __, 2
	note D#, 2
	note __, 2
	note D_, 2
	note __, 4
	note D_, 2
	note D_, 2
	note __, 2
	note D#, 2
	note D#, 2
	
	note D_, 2
	note __, 4
	note D_, 2
	note D_, 2
	note __, 2
	note D#, 2
	note __, 2
	note D_, 2
	note __, 2
	note D#, 1
	note __, 5
	note D#, 2
	note D#, 2
	note D#, 2
	
	note D_, 2
	note __, 4
	note D_, 2
	note D_, 2
	note __, 2
	note D#, 2
	note __, 2
	note D_, 2
	note __, 4
	note D_, 2
	note D_, 2
	note __, 2
	note D#, 2
	note D#, 2
	note D_, 2
	note __, 4
	note D_, 2
	note D_, 2
	note __, 2
	note D#, 2
	note __, 2
	note D_, 2
	note __, 4
	note D_, 2
	note D_, 2
	note __, 2
	note D#, 2
	note D#, 2
	note D_, 2
	note __, 4
	note D_, 2
	note D_, 2
	note __, 2
	note D#, 2
	note __, 2
	note D_, 2
	note __, 4
	note D_, 2
	note D_, 2
	note __, 2
	note D#, 2
	note D#, 2
	
	note D_, 2
	note __, 4
	note D_, 2
	note D_, 2
	note __, 2
	note D#, 2
	note __, 2
	note D_, 2
	note __, 14
	
	note D_, 2
	note __, 4
	note D_, 2
	note D_, 2
	note __, 2
	note D#, 2
	note __, 2
	note D_, 2
	note __, 4
	note D_, 2
	note D_, 2
	note __, 2
	note D#, 2
	note D#, 2
	note D_, 2
	note __, 4
	note D_, 2
	note D_, 2
	note __, 2
	note D#, 2
	note __, 2
	note D_, 2
	note __, 4
	note D_, 2
	note D_, 2
	note __, 2
	note D#, 2
	note D#, 2
	note D_, 2
	note __, 4
	note D_, 2
	note D_, 2
	note __, 2
	note D#, 2
	note __, 2
	note D_, 2
	note __, 4
	note D_, 2
	note D_, 2
	note __, 2
	note D#, 2
	note D#, 2
	note D_, 2
	note __, 4
	note D_, 2
	note D_, 2
	note __, 2
	note D#, 2
	note __, 2
	note D_, 2
	note __, 4
	note D_, 2
	note D_, 2
	note __, 2
	note D#, 2
	note D#, 2
	note D_, 2
	note __, 4
	note D_, 2
	note D_, 2
	note __, 2
	note D#, 2
	note __, 2
	note D_, 2
	note __, 4
	note D_, 2
	note D_, 2
	note __, 2
	note D#, 2
	note D#, 2
	
	note D_, 2
	note __, 6
	note D_, 2
	note __, 6
	note D_, 2
	note __, 6
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	note D_, 2
	note __, 4
	note D_, 2
	note D_, 2
	note __, 2
	note D#, 2
	note __, 2
	note D_, 2
	note __, 2
	note D_, 2
	note __, 10
	
	note D_, 2
	note __, 4
	note D_, 2
	note D_, 2
	note __, 2
	note D#, 2
	note __, 2
	note D_, 2
	note __, 4
	note D_, 2
	note D_, 2
	note __, 2
	note D#, 2
	note D#, 2
	loopchannel 0, Music_SunbeamIslandloop4
; f5c60
