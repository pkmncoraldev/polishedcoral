Music_Snes_Smw: ; f0000
	musicheader 4, 1, Music_Snes_Smw_Ch1
	musicheader 1, 2, Music_Snes_Smw_Ch2
	musicheader 1, 3, Music_Snes_Smw_Ch3
	musicheader 1, 4, Music_Snes_Smw_Ch4
; f000c

Music_Snes_Smw_Ch1: ; f000c
	tempo 60
	volume $77
	vibrato $9, $27
	dutycycle $20
	notetype $c, $c7
	intensity $50
	
Music_Snes_Smw_Ch1loop:
	octave 3
	note __, 4
	note C#, 5
	note __, 1
	note C#, 5
	note __, 1
	note C#, 5
	note __, 1
	note C#, 10
	note __, 4
	note F_, 5
	note __, 1
	note F_, 5
	note __, 1
	note F_, 5
	note __, 1
	note F_, 10
	octave 2
	note __, 4
	note B_, 5
	note __, 1
	note B_, 5
	note __, 1
	note B_, 5
	note __, 1
	note B_, 10
	octave 3
	note __, 4
	note C_, 5
	note __, 1
	note C_, 5
	note __, 1
	octave 2
	note E_, 4
	note E_, 4
	note D#, 4
	note D_, 4
	
	octave 3
	note __, 4
	note C#, 5
	note __, 1
	note C#, 5
	note __, 1
	note C#, 5
	note __, 1
	note C#, 10
	note __, 4
	note F_, 5
	note __, 1
	note F_, 5
	note __, 1
	note F_, 5
	note __, 1
	note F_, 10
	note __, 4
	note F_, 5
	note __, 1
	note F_, 5
	note __, 1
	note F_, 5
	note __, 1
	note F_, 10
	
	note __, 4
	note E_, 2
	note C_, 4
	note C_, 2
	note C_, 2
	note D_, 2
	note E_, 4
	note D_, 4
	note E_, 4
	octave 2
	note E_, 4
	
	note __, 4
	note E_, 4
	note __, 4
	note E_, 4
	note __, 4
	note F_, 4
	note __, 4
	note F#, 4
	note __, 4
	note E_, 4
	note __, 4
	note E_, 4
	note __, 4
	note F_, 4
	note __, 4
	note F_, 4
	note __, 4
	note E_, 4
	note __, 4
	note E_, 4
	note __, 4
	note F_, 4
	note __, 4
	note F#, 4
	note __, 4
	note F_, 4
	note __, 4
	note G_, 4
	note __, 4
	note E_, 4
	note __, 4
	note E_, 4
	
	note __, 4
	note E_, 4
	note __, 4
	note E_, 4
	note __, 4
	note F_, 4
	note __, 4
	note F#, 4
	note __, 4
	note E_, 4
	note __, 4
	note E_, 4
	note __, 4
	note F_, 4
	note __, 4
	note F_, 4
	note __, 4
	note E_, 4
	note __, 4
	note E_, 4
	note __, 4
	note F_, 4
	note __, 4
	note F#, 4
	note __, 4
	note F_, 4
	note __, 4
	note G_, 4
	note __, 4
	note E_, 4
	note __, 4
	note E_, 4
	
	note __, 4
	note F_, 4
	note __, 4
	note F_, 4
	note __, 4
	note E_, 4
	note __, 4
	note E_, 4
	note __, 4
	note D#, 4
	note __, 4
	note D#, 4
	note __, 4
	note F_, 4
	note __, 4
	note F_, 4
	note __, 4
	note F_, 4
	note __, 4
	note F_, 4
	note __, 4
	note E_, 4
	note __, 4
	note E_, 4
	note __, 4
	note D#, 4
	note __, 4
	note D#, 4
	note __, 4
	note F_, 4
	note __, 4
	note F_, 4
	
	note __, 4
	note E_, 4
	note __, 4
	note E_, 4
	note __, 4
	note F_, 4
	note __, 4
	note F_, 4
	note __, 4
	note E_, 4
	note __, 4
	note E_, 4
	note __, 4
	note D#, 4
	note __, 4
	note D#, 4
	note F_, 12
	note F_, 12
	note __, 8
	
	note __, 3
	octave 4
	note C_, 2
	octave 3
	note E_, 4
	octave 4
	note C_, 2
	octave 3
	note E_, 4
	octave 4
	note C_, 2
	octave 3
	note E_, 4
	octave 4
	note C_, 6
	note __, 4
	loopchannel 0, Music_Snes_Smw_Ch1loop

Music_Snes_Smw_Ch2: ; f0162
	vibrato $12, $25
	dutycycle $90
	notetype $c, $95
	intensity $70
	
Music_Snes_Smw_Ch2loop:
	octave 2	
	note __, 2
	note A_, 2
	octave 3
	note A_, 2
	note E_, 2
	note G_, 2
	note A_, 4
	octave 2
	note A_, 2
	octave 3
	note A_, 2
	note C#, 2
	note E_, 2
	note A_, 6
	octave 2
	note A_, 4
	
	note __, 2
	note A_, 2
	octave 3
	note A_, 2
	octave 2
	note A_, 2
	octave 3
	note D_, 2
	note A_, 4
	octave 2
	note A_, 2
	octave 3
	note A_, 2
	octave 2
	note A_, 2
	octave 3
	note D_, 2
	note A_, 6
	octave 2
	note A_, 4
	
	note __, 2
	note G_, 2
	octave 3
	note G_, 2
	note D_, 2
	note F_, 2
	note G_, 4
	octave 2
	note G_, 2
	octave 3
	note G_, 2
	octave 2
	note B_, 2
	octave 3
	note D_, 2
	note G_, 6
	octave 2
	note G_, 4
	
	note __, 2
	note G_, 2
	octave 3
	note G_, 2
	note C_, 2
	note E_, 2
	note G_, 4
	note C_, 2
	
	intensity $40
	note G_, 4
	note G_, 4
	
	intensity $55
	note F#, 4
	note F_, 4
	
	intensity $70
	octave 2	
	note __, 2
	note A_, 2
	octave 3
	note A_, 2
	note E_, 2
	note G_, 2
	note A_, 4
	octave 2
	note A_, 2
	octave 3
	note A_, 2
	note C#, 2
	note E_, 2
	note A_, 6
	octave 2
	note A_, 4
	
	note __, 2
	note A_, 2
	octave 3
	note A_, 2
	octave 2
	note A_, 2
	octave 3
	note D_, 2
	note A_, 4
	octave 2
	note A_, 2
	octave 3
	note A_, 2
	octave 2
	note A_, 2
	octave 3
	note D_, 2
	note A_, 6
	octave 2
	note A_, 4
	
	note __, 2
	note B_, 2
	octave 3
	note B_, 2
	octave 2
	note B_, 2
	octave 3
	note D_, 2
	note B_, 4
	octave 2
	note B_, 2
	octave 3
	note B_, 2
	octave 2
	note B_, 2
	octave 3
	note D_, 2
	note B_, 6
	octave 2
	note B_, 4
	
	octave 3
	note __, 2
	note C_, 2
	octave 4
	note C_, 2
	octave 2
	note G_, 4
	octave 3
	note G_, 2
	note A_, 2
	note B_, 2
	octave 4
	note C_, 4
	octave 3
	note B_, 4
	octave 4
	note C_, 4
	note __, 4
	
	note E_, 4
	note __, 4
	note C_, 4
	note __, 2
	octave 3
	note G_, 2
	note A_, 2
	octave 4
	note C_, 2
	note __, 2
	note C_, 4
	note __, 4
	octave 3
	note A_, 2
	note G_, 4
	octave 4
	note C_, 3
	note __, 1
	note C_, 4
	note G_, 4
	note E_, 4
	note __, 2
	note D_, 4
	note __, 4
	octave 3
	note G_, 2
	
	octave 4
	note E_, 4
	note __, 4
	note C_, 4
	note __, 2
	octave 3
	note G_, 2
	note A_, 2
	octave 4
	note C_, 2
	note __, 2
	note C_, 4
	note __, 4
	octave 3
	note A_, 2
	note G_, 4
	octave 4
	note C_, 4
	note F_, 2
	note E_, 2
	note D_, 2
	note C_, 4
	note __, 6
	note __, 8
	
	note E_, 4
	note __, 4
	note C_, 4
	note __, 2
	octave 3
	note G_, 2
	note A_, 2
	octave 4
	note C_, 2
	note __, 2
	note C_, 4
	note __, 4
	octave 3
	note A_, 2
	note G_, 4
	octave 4
	note C_, 3
	note __, 1
	note C_, 4
	note G_, 4
	note E_, 4
	note __, 2
	note D_, 4
	note __, 4
	octave 3
	note G_, 2
	
	octave 4
	note E_, 4
	note __, 4
	note C_, 4
	note __, 2
	octave 3
	note G_, 2
	note A_, 2
	octave 4
	note C_, 2
	note __, 2
	note C_, 4
	note __, 4
	octave 3
	note A_, 2
	note G_, 4
	octave 4
	note C_, 4
	note F_, 2
	note E_, 2
	note D_, 2
	note C_, 4
	note __, 6
	note __, 8
	
	note E_, 4
	note __, 2
	note C_, 4
	note __, 2
	octave 3
	note G_, 4
	octave 4
	note E_, 4
	note __, 2
	note C_, 4
	note __, 6
	note D#, 2
	note C_, 2
	octave 3
	note G_, 2
	note __, 2
	octave 4
	note D#, 4
	note __, 2
	note D_, 4
	note __, 6
	note __, 8
	
	note E_, 4
	note __, 2
	note C_, 4
	note __, 2
	octave 3
	note G_, 4
	octave 4
	note E_, 4
	note __, 2
	note C_, 4
	note __, 6
	note D#, 2
	note C_, 2
	octave 3
	note G_, 2
	note __, 2
	octave 4
	note G_, 4
	note __, 4
	note __, 16
	
	note E_, 4
	note __, 4
	note C_, 4
	note __, 2
	octave 3
	note G_, 2
	note A_, 2
	octave 4
	note C_, 2
	note __, 2
	note C_, 4
	note __, 4
	note D_, 2
	note E_, 2
	note C_, 2
	octave 3
	note G_, 2
	note __, 2
	note A_, 4
	note __, 2
	octave 4
	note C_, 4
	note __, 6
	note __, 6
	octave 3
	note G_, 2
	octave 4
	note G_, 2
	note __, 2
	note A_, 2
	note __, 2
	note G_, 2
	note __, 2
	note A_, 2
	note __, 2
	note G_, 2
	note __, 4
	octave 3
	note G_, 2
	octave 4
	note F_, 2
	note E_, 2
	note D_, 2
	note __, 2
	note C_, 4
	note __, 4
	note __, 8
	note __, 15
	loopchannel 0, Music_Snes_Smw_Ch2loop

Music_Snes_Smw_Ch3: ; f0247
	stereopanning $ff
	vibrato $8, $23
	notetype $c, $25
	octave 2
	note A_, 4
	octave 3
	note A_, 4
	note E_, 4
	note A_, 4
	octave 2
	note A_, 4
	octave 3
	note A_, 4
	note E_, 4
	note A_, 4
	
	note D_, 4
	note A_, 4
	octave 2
	note A_, 4
	octave 3
	note A_, 4
	note D_, 4
	note A_, 4
	octave 2
	note A_, 4
	octave 3
	note A_, 4
	
	octave 2
	note G_, 4
	octave 3
	note G_, 4
	note D_, 4
	note G_, 4
	octave 2
	note G_, 4
	octave 3
	note G_, 4
	note D_, 4
	note G_, 4
	
	note C_, 4
	note G_, 4
	octave 2
	note G_, 4
	octave 3
	note G_, 4
	note C_, 4
	note C_, 4
	octave 2
	note B_, 4
	note A#, 4
	
	
	note A_, 4
	octave 3
	note A_, 4
	note E_, 4
	note A_, 4
	octave 2
	note A_, 4
	octave 3
	note A_, 4
	note E_, 4
	note A_, 4
	
	note D_, 4
	note A_, 4
	octave 2
	note A_, 4
	octave 3
	note A_, 4
	note D_, 4
	note A_, 4
	octave 2
	note A_, 4
	octave 3
	note A_, 4
	
	octave 2
	note G_, 4
	octave 3
	note G_, 4
	note D_, 4
	note G_, 4
	octave 2
	note G_, 4
	octave 3
	note G_, 4
	note D_, 4
	note G_, 4
	
	note C_, 4
	note G_, 4
	octave 2
	note G_, 4
	octave 3
	note G_, 4
	note C_, 4
	octave 2
	note G_, 4
	octave 3
	note C_, 4
	note C_, 4
	
	note C_, 4
	note G_, 4
	note E_, 4
	note G_, 4
	note F_, 4
	note A_, 4
	note F#, 4
	note A_, 4
	note E_, 4
	note G_, 4
	note D#, 4
	note G_, 4
	note D_, 4
	note A_, 4
	octave 2
	note G_, 4
	octave 3
	note G_, 4
	note C_, 4
	note G_, 4
	note E_, 4
	note G_, 4
	note F_, 4
	note A_, 4
	note F#, 4
	note A_, 4
	note D_, 4
	note A_, 4
	note G_, 4
	note B_, 4
	note C_, 4
	note G_, 4
	note C_, 4
	note G_, 4
	
	note C_, 4
	note G_, 4
	note E_, 4
	note G_, 4
	note F_, 4
	note A_, 4
	note F#, 4
	note A_, 4
	note E_, 4
	note G_, 4
	note D#, 4
	note G_, 4
	note D_, 4
	note A_, 4
	octave 2
	note G_, 4
	octave 3
	note G_, 4
	note C_, 4
	note G_, 4
	note E_, 4
	note G_, 4
	note F_, 4
	note A_, 4
	note F#, 4
	note A_, 4
	note D_, 4
	note A_, 4
	note G_, 4
	note B_, 4
	note C_, 4
	note G_, 4
	note C_, 4
	note G_, 4
	
	note F_, 4
	note A_, 4
	note F_, 4
	note A_, 4
	note E_, 4
	note G_, 4
	note E_, 4
	note G_, 4
	note D#, 4
	note G_, 4
	note D#, 4
	note G_, 4
	note D_, 4
	note A_, 4
	octave 2
	note G_, 4
	octave 3
	note G_, 4
	
	note F_, 4
	note A_, 4
	note F_, 4
	note A_, 4
	note E_, 4
	note G_, 4
	note E_, 4
	note G_, 4
	note D#, 4
	note G_, 4
	note D#, 4
	note G_, 4
	note D_, 4
	note A_, 4
	octave 2
	note G_, 4
	octave 3
	note G_, 4
	
	note C_, 4
	note G_, 4
	note C_, 4
	note G_, 4
	octave 2
	note A#, 4
	octave 3
	note G_, 4
	octave 2
	note A#, 4
	octave 3
	note G_, 4
	octave 2
	note A_, 4
	octave 3
	note G_, 4
	octave 2
	note A_, 4
	octave 3
	note G_, 4
	octave 2
	note G#, 4
	octave 3
	note F#, 4
	octave 2
	note G#, 4
	octave 3
	note F#, 4
	octave 2
	note G_, 11
	note G_, 11
	note __, 1
	note A_, 4
	note B_, 4
	octave 3
	note C_, 4
	note G_, 4
	note C_, 4
	note G_, 4
	note C_, 4
	note G_, 4
	note C_, 4
	note G_, 4
	loopchannel 0, Music_Snes_Smw_Ch3
	endchannel
; f031e

Music_Snes_Smw_Ch4: ; f031e
	togglenoise $3
	notetype $c
Music_Snes_Smw_Ch4loop:
	note __, 2
	loopchannel 0, Music_Snes_Smw_Ch4loop
	endchannel
; f0386
