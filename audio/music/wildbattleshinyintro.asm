Music_WildBattle_Shiny_Intro: ; f5dc5
	musicheader 3, 1, Music_WildBattle_Shiny_Intro_Ch1
	musicheader 1, 2, Music_WildBattle_Shiny_Intro_Ch2
	musicheader 1, 3, Music_WildBattle_Shiny_Intro_Ch3
; f5dce
Music_WildBattle_Shiny_Intro_Ch1: ; f5ea2
	tempo 125
	volume $77
	dutycycle $3
	vibrato $8, $36
	tone $0001
	notetype $c, $c1
	octave 3
	note A_, 2
;	vibrato $12, $20
	notetype $c, $b8
	note G#, 14

Music_WildBattle_Shiny_Intro_loop1:
	note __, 1
	
	loopchannel 0, Music_WildBattle_Shiny_Intro_loop1

Music_WildBattle_Shiny_Intro_Ch2: ; f5dce
	dutycycle $3
	tone $0002
;	vibrato $12, $15
	notetype $c, $c1
	octave 3
	note D_, 2
;	vibrato $12, $20
	notetype $c, $b8
	note C#, 14

Music_WildBattle_Shiny_Intro_loop2:
	note __, 1
	
	loopchannel 0, Music_WildBattle_Shiny_Intro_loop2
	
Music_WildBattle_Shiny_Intro_Ch3: ; f5f91
	vibrato $12, $15
	notetype $c, $14
	octave 2
	note F_, 2
	note E_, 14
	
Music_WildBattle_Shiny_Intro_loop3:
	note __, 1
	
	loopchannel 0, Music_WildBattle_Shiny_Intro_loop3