Music_Bar: ; f06e1
	musicheader 4, 1, Music_Bar_Ch1
	musicheader 1, 2, Music_Bar_Ch2
	musicheader 1, 3, Music_Bar_Ch3
	musicheader 1, 4, Music_Bar_Ch4


Music_Bar_Ch1: ; f06ed
	tempo 240
	volume $77
	vibrato $6, $34
	tone $0002
	dutycycle $0
	notetype $6, $7a
	intensity $7a
	octave 3
	note __, 12
	note __, 12
	note __, 4
	note G#, 2
	note __, 6
	note G#, 2
	note __, 8
	note G#, 2
	note __, 12
	note __, 6
	tone $0003
	vibrato $8, $32
	note C_, 6
	note G#, 4
	note F#, 8
	note D#, 6
	note D_, 6
	note C#, 4
	note F_, 8
	intensity $c7
	note F_, 8
	note __, 4
	
	tone $0002
	vibrato $6, $34
	intensity $7a
	note __, 4
	note G#, 2
	note __, 6
	note G#, 2
	note __, 4
	note G#, 2
	note __, 2
	note G#, 2
	note __, 12
	
	tone $0003
	intensity $0a
	note G#, 1
	octave 4
	note C_, 1
	intensity $1a
	octave 3
	note G#, 1
	octave 4
	note C_, 1
	intensity $2a
	octave 3
	note G#, 1
	octave 4
	note C_, 1
	intensity $3a
	octave 3
	note G#, 1
	octave 4
	note C_, 1
	octave 3
	intensity $4a
	note G#, 1
	octave 4
	note C_, 1
	octave 3
	intensity $5a
	note G#, 1
	octave 4
	note C_, 1
	octave 3
	intensity $6a
	note G#, 1
	octave 4
	note C_, 1
	octave 3
	intensity $7a
	note G#, 1
	octave 4
	note C_, 1
	octave 3
	intensity $7a
	note G#, 1
	octave 4
	note C_, 1
	octave 3
	intensity $7a
	note G#, 1
	octave 4
	note C_, 1
	octave 3
	intensity $7a
	note G#, 1
	octave 4
	note C_, 1
	octave 3
	intensity $6a
	note G#, 1
	octave 4
	note C_, 1
	octave 3
	intensity $5a
	note G#, 1
	octave 4
	note C_, 1
	octave 3
	intensity $4a
	note G#, 1
	octave 4
	note C_, 1
	octave 3
	intensity $3a
	note G#, 1
	octave 4
	note C_, 1
	octave 3
	intensity $2a
	note G#, 1
	octave 4
	note C_, 1
	octave 3
	intensity $1a
	note G#, 1
	octave 4
	note C_, 1
	octave 3
	intensity $0a
	note G#, 1
	octave 4
	note C_, 1
	
	tone $0002
	notetype $c, $7a
	octave 3
	note G_, 12
	intensity $ba
	note G_, 6
	note G_, 3
	note A#, 3
	note G#, 12
	note G#, 12
	loopchannel 0, Music_Bar_Ch1


Music_Bar_Ch2: ; f074f
	dutycycle $3
	vibrato $8, $25
	notetype $6, $9a
	octave 4
	note __, 12
	note __, 12
	note __, 4
	note C_, 2
	note __, 6
	note C_, 2
	note __, 8
	note C_, 2
	note __, 12
	note __, 6
	octave 3
	note G#, 2
	note A#, 2
	note G#, 2
	octave 4
	note D#, 4
	note C_, 4
	octave 3
	note G#, 2
	note G_, 2
	note F#, 10
	note E_, 2
	note F_, 4
	note G#, 8
	intensity $c7
	note G#, 8
	note __, 4
	
	octave 4
	intensity $9a
	note __, 4
	note C#, 2
	note __, 6
	note C#, 2
	note __, 4
	note C#, 2
	note __, 2
	note C_, 2
	note __, 12
	
	intensity $0a
	note C_, 1
	note D#, 1
	intensity $1a
	note C_, 1
	note D#, 1
	intensity $2a
	note C_, 1
	note D#, 1
	intensity $3a
	note C_, 1
	note D#, 1
	intensity $4a
	note C_, 1
	note D#, 1
	intensity $5a
	note C_, 1
	note D#, 1
	intensity $6a
	note C_, 1
	note D#, 1
	intensity $7a
	note C_, 1
	note D#, 1
	intensity $7a
	note C_, 1
	note D#, 1
	intensity $7a
	note C_, 1
	note D#, 1
	intensity $7a
	note C_, 1
	note D#, 1
	intensity $6a
	note C_, 1
	note D#, 1
	intensity $5a
	note C_, 1
	note D#, 1
	intensity $4a
	note C_, 1
	note D#, 1
	intensity $3a
	note C_, 1
	note D#, 1
	intensity $2a
	note C_, 1
	note D#, 1
	intensity $1a
	note C_, 1
	note D#, 1
	intensity $0a
	note C_, 1
	note D#, 1
	
	notetype $c, $7a
	note D#, 12
	intensity $ba
	note D#, 6
	note D#, 3
	note D_, 3
	note C#, 12
	note C#, 12
	loopchannel 0, Music_Bar_Ch2


Music_Bar_Ch3: ; f079f
	notetype $6, $14
	octave 1
	note G#, 4
	octave 2
	note G#, 2
	octave 2
	note C_, 4
	octave 3
	note C_, 2
	octave 2
	note C#, 4
	octave 3
	note C#, 2
	octave 2
	note D_, 4
	octave 3
	note D_, 2
	octave 2
	note D#, 4
	octave 3
	note D#, 2
	octave 2
	note C#, 4
	octave 3
	note C#, 2
	octave 2
	note C_, 4
	octave 3
	note C_, 2
	octave 1
	note A#, 4
	octave 2
	note A#, 2
	
	octave 1
	note G#, 4
	octave 2
	note G#, 2
	octave 2
	note C_, 4
	octave 3
	note C_, 2
	octave 2
	note C#, 4
	octave 3
	note C#, 2
	octave 2
	note D_, 4
	octave 3
	note D_, 2
	octave 2
	note G#, 4
	octave 3
	note G#, 2
	octave 1
	note G#, 4
	octave 2
	note G#, 2
	octave 1
	note A#, 4
	octave 2
	note A#, 2
	octave 2
	note C_, 4
	octave 3
	note C_, 2
	
	octave 2
	note C#, 4
	octave 3
	note C#, 2
	octave 2
	note F_, 4
	octave 3
	note C#, 2
	octave 2
	note F#, 4
	octave 3
	note F#, 2
	octave 2
	note F_, 4
	octave 3
	note F_, 2
	octave 2
	note C#, 4
	octave 3
	note C#, 2
	octave 1
	note F_, 4
	octave 2
	note F_, 2
	octave 1
	note F#, 4
	octave 2
	note F#, 2
	octave 1
	note G_, 4
	octave 2
	note G_, 2
	
	octave 1
	note G#, 4
	octave 2
	note G#, 2
	octave 2
	note C_, 4
	octave 3
	note C_, 2
	octave 2
	note C#, 4
	octave 3
	note C#, 2
	octave 2
	note D_, 4
	octave 3
	note D_, 2
	octave 2
	note D#, 4
	octave 3
	note D#, 2
	octave 2
	note G#, 4
	octave 3
	note G#, 2
	octave 2
	note F#, 4
	octave 3
	note F#, 2
	octave 2
	note D#, 4
	octave 3
	note D#, 2
	
	octave 2
	note D#, 4
	octave 3
	note D#, 2
	octave 1
	note D#, 4
	octave 2
	note D#, 2
	octave 1
	note G#, 4
	octave 2
	note G#, 2
	octave 1
	note A#, 4
	octave 2
	note A#, 2
	note D#, 4
	octave 3
	note D#, 2
	octave 1
	note D#, 4
	note A#, 2
	octave 2
	note D#, 4
	octave 3
	note D#, 2
	octave 2
	note D_, 4
	octave 3
	note D_, 2
	
	octave 2
	note C#, 4
	octave 3
	note C#, 2
	octave 1
	note C#, 4
	octave 2
	note C#, 2
	octave 1
	note F_, 4
	octave 2
	note F_, 2
	octave 1
	note G#, 4
	octave 2
	note G#, 2
	note C#, 4
	octave 3
	note C#, 2
	octave 1
	note B_, 4
	octave 2
	note B_, 2
	octave 1
	note G#, 4
	octave 2
	note G#, 2
	octave 1
	note F#, 4
	octave 2
	note F#, 2
	loopchannel 0, Music_Bar_Ch3
	
Music_Bar_Ch4:
	togglenoise $3
	notetype $6
Music_Bar_Ch4_loop:
	note F#, 6
	note D_, 2
	note __, 2
	note D_, 2
	loopchannel 0, Music_Bar_Ch4_loop