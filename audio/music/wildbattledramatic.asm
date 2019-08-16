Music_WildBattle: ; f5dc5
	musicheader 3, 1, Music_WildBattle_Ch1
	musicheader 1, 2, Music_WildBattle_Ch2
	musicheader 1, 3, Music_WildBattle_Ch3
; f5dce
Music_WildBattle_Ch1: ; f5ea2
	tempo 107
	volume $77
	dutycycle $3
	vibrato $8, $36
	tone $0001
	notetype $c, $c2

	octave 4
	note A_, 1
	note G#, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	octave 3
	note B_, 1
	note A#, 1
	note A_, 1
	note G#, 1
	note G_, 1
	note F#, 1
	octave 4
	note F_, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	octave 3
	note B_, 1
	note A#, 1
	note A_, 1
	note G#, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note C#, 1
	note F_, 6
	note F_, 6
	note F_, 4
	note A#, 2
	note F_, 2
	note A#, 2
	octave 4
	note D_, 2
	note C_, 2
	octave 3
	note G_, 2
	octave 4
	note C_, 2
	note E_, 2
	octave 3
	note F_, 6
	note F_, 6
	note F_, 4
	note D_, 2
	note F_, 2
	note A#, 2
	note F_, 2
	note G_, 2
	octave 4
	note C_, 2
	octave 3
	note A#, 2
	note G_, 2
	note F_, 6
	note F_, 6
	note F_, 4
	note A#, 1
	note F_, 1
	note A#, 1
	octave 4
	note D_, 1
	note F_, 1
	note D_, 1
	octave 3
	note A#, 1
	note F_, 1
	octave 4
	note C_, 1
	octave 3
	note G_, 1
	octave 4
	note C_, 1
	note E_, 1
	note G_, 1
	note E_, 1
	note C_, 1
	octave 3
	note G_, 1
	note F_, 6
	note F_, 6
	note F_, 4
	
	intensity $b8
	note __, 4
	octave 4
	note D_, 4
	
	intensity $6F
	note E_, 8
	

Music_WildBattle_loop1:
	intensity $b8
	octave 3
	note __, 2
	note F_, 2
	note G_, 2
	note A_, 2
	note __, 2
	note F_, 2
	note A_, 2
	note F_, 2
	note A_, 4
	note F_, 4
	note D_, 4
	note F_, 4
	
	intensity $c4
	note G_, 6
	note F_, 6
	note E_, 6
	
	intensity $b8
	note C_, 2
	note E_, 2
	note C_, 2
	note G_, 2
	note F_, 2
	note E_, 2
	note G_, 2
	note __, 2
	note F_, 2
	note G_, 2
	note A_, 2
	note __, 2
	note F_, 2
	note A_, 2
	note F_, 2
	note A_, 4
	note G_, 4
	note F_, 4
	note A_, 4
	
	intensity $c4
	note G_, 8
	note F_, 8
	note E_, 8
	note A_, 8
	
	intensity $b8
	note __, 2
	note F_, 2
	note A#, 2
	octave 4
	note D_, 2
	note __, 2
	octave 3
	note A#, 2
	octave 4
	note D_, 2
	octave 3
	note A#, 2
	octave 4
	note D_, 4
	note C_, 4
	octave 3
	note A#, 4
	note G_, 4
	
	intensity $c4
	note A_, 8
	note G_, 8
	note F_, 8
	note E_, 8
	
	intensity $b8
	note __, 2
	note D#, 2
	note G_, 2
	note A#, 2
	note __, 2
	note G_, 2
	note A#, 2
	note G_, 2
	note A#, 4
	note A_, 4
	note G_, 4
	note F_, 4
	
	intensity $c4
	note G_, 16
	note E_, 16
	
	
	intensity $b8
	octave 3
	note __, 2
	note F_, 2
	note G_, 2
	note A_, 2
	note __, 2
	note F_, 2
	note A_, 2
	note F_, 2
	note A_, 4
	note F_, 4
	note D_, 4
	note F_, 4
	
	intensity $c4
	note G_, 8
	note F_, 8
	note E_, 8
	
	intensity $b8
	note G_, 2
	note F_, 2
	note E_, 2
	note G_, 2
	note __, 2
	note F_, 2
	note G_, 2
	note A_, 2
	note __, 2
	note F_, 2
	note A_, 2
	note F_, 2
	note A_, 4
	note G_, 4
	note F_, 4
	note A_, 4
	
	intensity $c4
	note E_, 8
	note F_, 8
	note G_, 8
	note A_, 8
	
	intensity $b8
	note __, 2
	note F_, 2
	note A#, 2
	octave 4
	note D_, 2
	note __, 2
	octave 3
	note A#, 2
	octave 4
	note D_, 2
	octave 3
	note A#, 2
	octave 4
	note D_, 4
	note C_, 4
	octave 3
	note A#, 4
	note G_, 4
	
	intensity $c4
	note A_, 8
	note G_, 8
	note F_, 8
	note E_, 8
	
	note D#, 8
	note G_, 8
	note E_, 8
	note C_, 8
	note G_, 16
	note E_, 16
	
	intensity $c2
	note F_, 4
	note __, 2
	note F_, 4
	note __, 2
	note F_, 4
	note F_, 4
	note __, 12
	
;	volume $60
	intensity $74
	octave 4
	note __, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note __, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note __, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note __, 2
	note D_, 2
	note A_, 2
	note D_, 2
	
;	volume $77
	intensity $88
	note E_, 8
	note C_, 8
	note G_, 8
	note E_, 8
	
;	volume $60
	intensity $74
	note __, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note __, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note __, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note __, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note __, 2
	note E_, 2
	note __, 2
	note E_, 2
	note __, 2
	note E_, 2
	note __, 2
	note E_, 2
	note E_, 2
	note __, 2
	note __, 12
	
;	volume $77
	intensity $b7
	note D_, 6
	
	intensity $c4
	octave 3
	note A#, 12
	
	intensity $b7
	note A#, 2
	octave 4
	note D_, 2
	octave 3
	note A#, 2
	octave 4
	note F_, 2
	note E_, 2
	note D_, 2
	note F_, 2
	
	intensity $c4
	note F_, 12
	note __, 4
	
	intensity $b7
	note C_, 8
	octave 3
	note A_, 8
	
	intensity $c4
	note A#, 8
	note __, 4
	
	intensity $b7
	note A_, 4
	note G_, 6
	note E_, 2
	note G_, 2
	note F_, 2
	note E_, 2
	note G_, 2
	
	intensity $c6
	note F#, 16
	note __, 16

	loopchannel 0, Music_WildBattle_loop1
; f5f91


Music_WildBattle_Ch2: ; f5dce
	dutycycle $3
	tone $0002
	vibrato $12, $15
	notetype $c, $b2

	octave 4
	note D_, 1
	octave 3
	note A_, 1
	octave 4
	note D_, 1
	octave 5
	note D_, 1
	octave 4
	note D_, 1
	octave 3
	note A_, 1
	octave 4
	note D_, 1
	octave 5
	note D_, 1
	octave 4
	note D_, 1
	octave 3
	note A_, 1
	octave 4
	note D_, 1
	octave 5
	note D_, 1	
	octave 4
	note D_, 1
	octave 3
	note A_, 1
	octave 4
	note D_, 1
	octave 5
	note D_, 1	
	octave 4
	note C_, 1
	octave 3
	note G_, 1
	octave 4
	note C_, 1
	octave 5
	note C_, 1	
	octave 4
	note C_, 1
	octave 3
	note G_, 1
	octave 4
	note C_, 1
	octave 5
	note C_, 1	
	octave 4
	note C#, 1
	octave 3
	note A_, 1
	octave 4
	note C#, 1
	octave 5
	note C#, 1	
	octave 4
	note C#, 1
	octave 3
	note A_, 1
	octave 4
	note C#, 1
	octave 5
	note C#, 1

	intensity $c2
	octave 4
	note D_, 6
	note D_, 6
	note D_, 4
	
	intensity $b7
	note F_, 4
	note E_, 4
	note D_, 4
	note C_, 4
	
	intensity $c2
	note D_, 6
	note D_, 6
	note D_, 4
	
	intensity $b7
	octave 3
	note A#, 8
	octave 4
	note C_, 8
	
	intensity $c2
	note D_, 6
	note D_, 6
	note D_, 4
	
	intensity $b7
	note F_, 4
	note E_, 4
	note D_, 4
	note C_, 4
	
	intensity $c2
	note D_, 6
	note D_, 6
	note D_, 4
	
	intensity $b8
	note __, 4
	note A#, 4
	
	intensity $6F
	octave 5
	note C_, 8
	
Music_WildBattle_loop2:
	intensity $b7
	octave 4
	note D_, 6
	octave 3
	note A_, 4
	note A_, 2
	octave 4
	note D_, 2
	octave 3
	note A_, 2
	octave 4
	note F_, 4
	note E_, 4
	note D_, 4
	note F_, 4
	note E_, 12
	note C_, 12
	note __, 8
	note D_, 6
	octave 3
	note A_, 4
	note A_, 2
	octave 4
	note D_, 2
	octave 3
	note A_, 2
	octave 4
	note F_, 4
	note E_, 4
	note D_, 4
	note F_, 2
	note G_, 2
	
	intensity $c4
	note A_, 12
	note __, 12
	note __, 8
	
	intensity $b7
	note A#, 6
	
	intensity $c4
	note F_, 12
	
	intensity $b7
	note F_, 2
	note A#, 2
	note F_, 2
	octave 5
	note D_, 2
	note C_, 2
	octave 4
	note A#, 2
	octave 5
	note D_, 2
	
	intensity $c4
	note C_, 16
	octave 4
	note A_, 16
	
	intensity $b7
	note G_, 6
	
	intensity $c4
	note D#, 12
	
	intensity $b7
	note D#, 2
	note G_, 2
	note D#, 2
	note A#, 2
	note A_, 2
	note G_, 2
	note F_, 2
	
	intensity $c4
	note E_, 16
	note C_, 16
	
	intensity $b7
	octave 4
	note D_, 6
	octave 3
	note A_, 4
	note A_, 2
	octave 4
	note D_, 2
	octave 3
	note A_, 2
	octave 4
	note F_, 4
	note E_, 4
	note D_, 4
	note F_, 4
	
	intensity $c4
	note E_, 16
	note C_, 16
	
	intensity $b7
	note D_, 6
	octave 3
	note A_, 4
	note A_, 2
	octave 4
	note D_, 2
	octave 3
	note A_, 2
	octave 4
	note F_, 4
	note E_, 4
	note D_, 4
	note F_, 2
	note G_, 2
	
	intensity $c4
	note A_, 12
	note __, 12
	note __, 8
	
	intensity $b7
	note A#, 6
	
	intensity $c4
	note F_, 12
	
	intensity $b7
	note F_, 2
	note A#, 2
	note F_, 2
	octave 5
	note D_, 2
	note C_, 2
	octave 4
	note A#, 2
	octave 5
	note D_, 2
	
	intensity $c4
	note C_, 16
	
	intensity $b7
	octave 4
	note A_, 8
	note F_, 8
	
	intensity $c4
	note G_, 12
	
	intensity $b7
	note F_, 4
	note E_, 6
	note C_, 2
	note E_, 2
	note D_, 2
	note C_, 2
	note E_, 2
	
	intensity $c4
	note D_, 16
;	volume $60
	intensity $a4
	note D_, 16
;	volume $77
	
	intensity $c2
	note D_, 6
	note D_, 6
	note D_, 4
	note D_, 4
	note __, 12
	
;	volume $60
	intensity $74
	octave 3
	note __, 2
	note A_, 2
	octave 4
	note F_, 2
	octave 3
	note A_, 2
	note __, 2
	note A_, 2
	octave 4
	note F_, 2
	octave 3
	note A_, 2
	note __, 2
	note A_, 2
	octave 4
	note F_, 2
	octave 3
	note A_, 2
	note __, 2
	note A_, 2
	octave 4
	note F_, 2
	octave 3
	note A_, 2
	
;	volume $77
	intensity $87
	octave 4
	note C_,1
	note C#,1
	note D_,1
	note D#,1
	note E_,1
	note F_,1
	note F#,1
	note G_,1
	note G#,1
	note A_,1
	note A#,1
	note B_,1
	octave 5
	note C_,1
	note C#,1
	note D_,1
	note D#,1
	note E_,1
	note D#,1
	note D_,1
	note C#,1
	note C_,1
	octave 4
	note B_,1
	note A#,1
	note A_,1
	note G#,1
	note G_,1
	note F#,1
	note F_,1
	note F#,1
	note G_,1
	note G#,1
	note A_,1
	
	intensity $74
;	volume $60
	octave 3
	note __, 2
	note A_, 2
	octave 4
	note F_, 2
	octave 3
	note A_, 2
	note __, 2
	note A_, 2
	octave 4
	note F_, 2
	octave 3
	note A_, 2
	note __, 2
	note A_, 2
	octave 4
	note F_, 2
	octave 3
	note A_, 2
	note __, 2
	note A_, 2
	octave 4
	note F_, 2
	octave 3
	note A_, 2
	note __, 2
	octave 4
	note A_, 2
	note __, 2
	note A_, 2
	note __, 2
	note A_, 2
	note __, 2
	note A_, 2
	note A_, 2
	note __, 2
	note __, 12
	
;	volume $77
	intensity $b7
	note A#, 6
	
	intensity $c4
	note F_, 12
	
	intensity $b7
	note F_, 2
	note A#, 2
	note F_, 2
	octave 5
	note D_, 2
	note C_, 2
	octave 4
	note A#, 2
	octave 5
	note D_, 2
	
	intensity $c4
	note C_, 12
	note __, 4
	
	intensity $b7
	octave 4
	note A_, 8
	note F_, 8
	
	intensity $c4
	note G_, 8
	note __, 4
	
	intensity $b7
	note F_, 4
	note E_, 6
	note C_, 2
	note E_, 2
	note D_, 2
	note C_, 2
	note E_, 2
	
	intensity $c6
	note D_, 16
	note __, 16

	loopchannel 0, Music_WildBattle_loop2
; f5ea2

Music_WildBattle_Ch3: ; f5f91
	notetype $c, $14

	octave 3
	note D_, 4
	note E_, 4
	note F_, 4
	note D_, 4
	note C_, 8
	note C#, 8
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	octave 2
	note A#, 4
	note F_, 4
	octave 3
	note C_, 4
	octave 2
	note G_, 4
	octave 3
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	octave 2
	note A#, 4
	note F_, 4
	octave 3
	note C_, 4
	note E_, 4
	
Music_WildBattle_loop3:
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note G_, 2
	note F_, 2
	note E_, 2
	note G_, 2
	
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	note C#, 2
	note D_, 2
	note E_, 2
	note D_, 2
	note C#, 2
	note E_, 2
	
	octave 2
	note A#, 6
	octave 3
	note D_, 10
	note F_, 4
	note E_, 4
	note D_, 4
	octave 2
	note A#, 4
	octave 3
	
	note C_, 2
	note F_, 2
	note C_, 2
	note F_, 2
	note C_, 2
	note F_, 2
	note C_, 2
	note F_, 2
	note C_, 2
	note F_, 2
	note C_, 2
	note F_, 2
	note C_, 2
	note F_, 2
	note C_, 2
	note F_, 2
	
	octave 2
	note A#, 2
	octave 3
	note D#, 2
	octave 2
	note A#, 2
	octave 3
	note D#, 2
	octave 2
	note A#, 2
	octave 3
	note D#, 2
	octave 2
	note A#, 2
	octave 3
	note D#, 2
	octave 2
	note A#, 2
	octave 3
	note D#, 2
	octave 2
	note A#, 2
	octave 3
	note D#, 2
	octave 2
	note A#, 2
	octave 3
	note D#, 2
	octave 2
	note A#, 2
	octave 3
	note D#, 2
	
	octave 2
	note G_, 2
	octave 3
	note C_, 2
	octave 2
	note G_, 2
	octave 3
	note C_, 2
	octave 2
	note G_, 2
	octave 3
	note C_, 2
	octave 2
	note G_, 2
	octave 3
	note C_, 2
	
	note C_, 2
	note G_, 2
	note E_, 2
	note F_, 2
	note G_, 2
	note F_, 2
	note E_, 2
	note G_, 2
	
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	
	note E_, 8
	note D_, 8
	note C_, 8
	
	note G_, 2
	note F_, 2
	note E_, 2
	note G_, 2
	
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	
	note C_, 8
	note D_, 8
	note E_, 8
	note C_, 8
	octave 2
	note A#, 6
	octave 3
	note D_, 6
	note F_, 4
	note A#, 4
	note A_, 4
	note G_, 4
	note E_, 4
	
	note C_, 2
	note F_, 2
	note C_, 2
	note F_, 2
	note C_, 2
	note F_, 2
	note C_, 2
	note F_, 2
	note C_, 2
	note F_, 2
	note C_, 2
	note F_, 2
	note C_, 2
	note F_, 2
	note C_, 2
	note F_, 2
	
	octave 2
	note A#, 2
	octave 3
	note D#, 2
	octave 2
	note A#, 2
	octave 3
	note D#, 2
	octave 2
	note A#, 2
	octave 3
	note D#, 2
	octave 2
	note A#, 2
	octave 3
	note D#, 2
	octave 2
	note G_, 2
	octave 3
	note C_, 2
	octave 2
	note G_, 2
	octave 3
	note C_, 2
	octave 2
	note G_, 2
	octave 3
	note C_, 2
	octave 2
	note G_, 2
	octave 3
	
	note C_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	
	note D_, 2
	octave 2
	note A_, 1
	note __, 1
	note A_, 2
	octave 3
	note D_, 2
	octave 2
	note A_, 1
	note __, 1
	note A_, 2
	octave 3
	note D_, 2
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note D_, 2
	note __, 6
	
	octave 2
	note A_, 8
	octave 3
	note D_, 6
	octave 2
	note A_, 6
	octave 3
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note F_, 4
	note E_, 4
	note D_, 4
	note F_, 4
	note E_, 16
	note C_, 16

	note D_, 6
	octave 2
	note A_, 6
	octave 3
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note F_, 4
	note E_, 4
	note D_, 4
	note F_, 2
	note G_, 2
	note A_, 16
	note __, 16
	
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	octave 2
	note F_,2
	octave 3
	note C_, 2
	octave 2
	note F_,2
	octave 3
	note C_, 2
	octave 2
	note F_,2
	octave 3
	note C_, 2
	octave 2
	note F_,2
	octave 3
	note C_, 2
	octave 2
	note F_,2
	octave 3
	note C_, 2
	octave 2
	note F_,2
	octave 3
	note C_, 2
	octave 2
	note F_,2
	octave 3
	note C_, 2
	octave 2
	note F_,2
	octave 3
	note C_, 2
	
	octave 2
	note A#, 8
	octave 3
	note D_, 8
	note C_, 8
	note E_, 8
	
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note A_, 2
	note G_, 2
	note F_, 2
	note A_, 2

	loopchannel 0, Music_WildBattle_loop3

	
; f605c
