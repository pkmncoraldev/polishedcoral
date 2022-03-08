Music_SnareLeaderBattle:
	musicheader 4, 1, Music_SnareLeaderBattle_Ch1
	musicheader 1, 2, Music_SnareLeaderBattle_Ch2
	musicheader 1, 3, Music_SnareLeaderBattle_Ch3
	musicheader 1, 4, Music_SnareLeaderBattle_Ch4

Music_SnareLeaderBattle_Ch1:
	tempo $60
	volume $77
	dutycycle $3
	tone $0002
	vibrato $10, $15
	notetype $c, $a6
	note __, 2
	octave 3
	note D#, 6
	note G_, 2
	octave 4
	note C_, 2
	note __, 2
	note C_, 8
	octave 3
	note G_, 4
	octave 4
	note C_, 4
	octave 3
	note G_, 4
	note B_, 8
	note G_, 8
	note B_, 4
	note G#, 4
	note F_, 4
	note D_, 4
Music_SnareLeaderBattle_Ch1_loop:
	callchannel Music_SnareLeaderBattle_Ch1_Part_1
	note C_, 6
	octave 2
	note G_, 6
	note B_, 2
	octave 3
	note D_, 2
	callchannel Music_SnareLeaderBattle_Ch1_Part_1
	note C_, 4
	note C_, 8
	octave 2
	note B_, 4
	
	note G#, 6
	octave 3
	note C_, 6
	note D#, 4
	note D#, 8
	note C_, 2
	octave 2
	note G_, 2
	note G_, 6
	note B_, 6
	note G_, 4
	octave 3
	note C_, 8
	octave 2
	note G_, 4
	
	note G#, 6
	octave 3
	note C_, 6
	note D#, 4
	note D#, 8
	note C_, 2
	octave 2
	note G_, 2
	octave 3
	note C_, 8
	note F_, 8
	note D#, 8
	note D_, 8
	
;Pattern 3
	intensity $66
	note __, 2
	note D#, 2
	note __, 2
	note D#, 2
	note __, 2
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note D#, 2
	
	note __, 2
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note D_, 2
	
	note __, 2
	note D#, 2
	note __, 2
	note D#, 2
	note __, 2
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note D#, 2
	note D_, 2
	note __, 6
	
	intensity $a6
	note F_, 8
	
	note G_, 3
	octave 4
	note C_, 1
	note D#, 1
	note __, 1
	note D#, 4
	note C_, 2
	note D#, 2
	note C_, 2
	note D_, 4
	octave 3
	note B_, 4
	note G_, 4
	note F_, 4
	note D#, 4
	note __, 4
	callchannel Music_SnareLeaderBattle_Ch1_Part_2
	
	dutycycle $3
	tone $0002
	notetype $c, $a6
	note G_, 3
	octave 4
	note C_, 1
	note D#, 1
	note __, 1
	note D#, 4
	note C_, 2
	note D#, 2
	note C_, 2
	note D_, 4
	octave 3
	note B_, 4
	note G#, 4
	note F_, 4
	note D#, 4
	note __, 4
	dutycycle $0
	tone $0000
	intensity $68
	note D#, 8
	note F_, 8
	note G#, 8
	dutycycle $3
	tone $0002
	notetype $c, $a6
	note G_, 3
	octave 4
	note C_, 1
	note D#, 1
	note __, 1
	note D#, 4
	note C_, 2
	note D#, 2
	note C_, 2
	note D_, 4
	octave 3
	note B_, 4
	octave 4
	note G_, 4
	note F_, 4
	note D#, 4
	note __, 4
	callchannel Music_SnareLeaderBattle_Ch1_Part_2

;Pattern 5
	dutycycle $3
	tone $0000
	intensity $a8
	octave 2
	note G_, 12
	octave 3
	note C_, 12
	note D#, 4
	note D_, 12
	octave 2
	note B_, 12
	note G_, 4
	note G#, 12
	octave 3
	note C_, 12
	note D#, 4
	note D_, 12
	octave 2
	note B_, 12
	note G_, 4
	octave 2
	note G_, 12
	octave 3
	note C_, 12
	note D#, 4
	note F_, 12
	octave 2
	note B_, 12
	octave 3
	note F_, 4
	note D#, 12
	note G#, 12
	octave 4
	note C_, 4
	octave 3
	note B_, 12
	note G_, 12
	note D_, 4
	
;Pattern 1
	dutycycle $3
	tone $0001
	intensity $a6
	callchannel Music_SnareLeaderBattle_Ch1_Part_3
	note D#, 4
	note G_, 2
	note D#, 4
	note G_, 2
	note D#, 2
	note D#, 2
	note F_, 8
	note G#, 4
	callchannel Music_SnareLeaderBattle_Ch1_Part_3
	note G_, 3
	octave 4
	note C_, 1
	note D#, 1
	note __, 1
	note D#, 4
	note C_, 2
	note D#, 2
	note C_, 2
	note D_, 4
	octave 3
	note B_, 4
	note G_, 4
	note B_, 4
	loopchannel 0, Music_SnareLeaderBattle_Ch1_loop

Music_SnareLeaderBattle_Ch1_Part_1:
	note C_, 6
	note D#, 6
	note D_, 6
	octave 2
	note B_, 6
	octave 3
	note D_, 2
	note F_, 2
	note D#, 6
	note C_, 6
	endchannel
	
Music_SnareLeaderBattle_Ch1_Part_2:
	octave 3
	dutycycle $0
	tone $0000
	intensity $68
	note G_, 8
	note F_, 8
	note D_, 8
	
	dutycycle $3
	tone $0002
	vibrato $10, $15
	notetype $c, $a6
	note D#, 6
	note C_, 6
	note G#, 4
	note G_, 8
	note D_, 8
	note D#, 6
	note C_, 6
	note G#, 4
	note G_, 8
	note B_, 8
	note G_, 4
	note __, 4
	
	dutycycle $0
	tone $0000
	intensity $68
	note D#, 8
	note G_, 8
	note D#, 8
	note __, 8
	note D#, 8
	note G_, 8
	note D#, 8
	endchannel
	
Music_SnareLeaderBattle_Ch1_Part_3:
	octave 3
	note D#, 4
	note G_, 2
	note D#, 4
	note G_, 2
	note D#, 2
	note D#, 2
	note G#, 4
	note F_, 4
	note D_, 4
	endchannel
	
Music_SnareLeaderBattle_Ch2:
	dutycycle $3
	vibrato $8, $36
	tone $0001
	notetype $c, $c6
	note __, 2
	octave 4
	note C_, 6
	note D#, 2
	note G_, 2
	note __, 2
	note G_, 8
	note D#, 4
	note G_, 4
	note D#, 4
	note F_, 8
	note D_, 8
	note F_, 4
	note D_, 4
	octave 3
	note B_, 4
	note G#, 4
Music_SnareLeaderBattle_Ch2_loop:
;Pattern 2
	callchannel Music_SnareLeaderBattle_Ch2_Part_1
	note F_, 4
	note D_, 4
	note F_, 2
	note G#, 2
	callchannel Music_SnareLeaderBattle_Ch2_Part_1
	note F_, 12
	
	callchannel Music_SnareLeaderBattle_Ch2_Part_2
	octave 2
	note B_, 3
	octave 3
	note D_, 3
	note F_, 3
	note D_, 3
	note F_, 2
	note D_, 2
	note D#, 8
	note C_, 4
	callchannel Music_SnareLeaderBattle_Ch2_Part_2
	note D#, 8
	note G#, 8
	note G_, 8
	note F_, 8
	
;Pattern 3
	intensity $88
	note __, 2
	note G_, 2
	note __, 2
	note G_, 2
	note __, 2
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 2
	note __, 2
	note F_, 2
	note __, 2
	note F_, 2
	note __, 2
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note F_, 2
	note __, 2
	note G_, 2
	note __, 2
	note G_, 2
	note __, 2
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 2
	note F_, 2
	note __, 6
	intensity $c6
	note B_, 8
	
	callchannel Music_SnareLeaderBattle_Ch2_Part_3
	note C_, 4
	note __, 4
	callchannel Music_SnareLeaderBattle_Ch2_Part_4
	
;Pattern 4
	callchannel Music_SnareLeaderBattle_Ch2_Part_3
	note C_, 4
	note __, 4
	octave 3
	dutycycle $0
	tone $0000
	intensity $98
	note G_, 8
	note B_, 8
	octave 4
	note D_, 8
	dutycycle $3
	tone $0001
	intensity $c6
	callchannel Music_SnareLeaderBattle_Ch2_Part_3
	note C_, 4
	note __, 4
	callchannel Music_SnareLeaderBattle_Ch2_Part_4

;Pattern 5
	callchannel Music_SnareLeaderBattle_Ch2_Part_5
	note B_, 2
	note G_, 2
	note G#, 6
	note D#, 6
	octave 4
	note C_, 6
	octave 3
	note G#, 6
	octave 4
	note C_, 2
	octave 3
	note G#, 2
	note B_, 6
	note G_, 6
	note F_, 6
	note D_, 6
	note G_, 2
	note F_, 2
	callchannel Music_SnareLeaderBattle_Ch2_Part_5
	note B_, 2
	octave 4
	note D_, 2
	note C_, 6
	octave 3
	note G#, 6
	octave 4
	note D#, 6
	note C_, 6
	note D_, 2
	note F_, 2
	note G_, 6
	note F_, 6
	note D_, 6
	octave 3
	note B_, 6
	note G_, 2
	note F_, 2
	
;Pattern 1
	dutycycle $3
	tone $0001
	intensity $c6
	callchannel Music_SnareLeaderBattle_Ch2_Part_6
	note G_, 4
	octave 4
	note C_, 2
	octave 3
	note G_, 4
	octave 4
	note C_, 2
	octave 3
	note G_, 2
	note G_, 2
	note B_, 8
	octave 4
	note D_, 4
	callchannel Music_SnareLeaderBattle_Ch2_Part_6
	callchannel Music_SnareLeaderBattle_Ch2_Part_3
	loopchannel 0, Music_SnareLeaderBattle_Ch2_loop
	
Music_SnareLeaderBattle_Ch2_Part_1:
	octave 3
	note D#, 3
	note G_, 1
	octave 4
	note C_, 1
	note __, 1
	note C_, 4
	octave 3
	note G_, 2
	octave 4
	note C_, 2
	octave 3
	note G_, 2
	note B_, 4
	note G#, 4
	note F_, 2
	note G#, 2
	note G_, 3
	note F_, 3
	note D#, 3
	note F_, 3
	note G_, 2
	note D#, 2
	endchannel
	
Music_SnareLeaderBattle_Ch2_Part_2:
	note D_, 3
	note F_, 1
	note G#, 1
	note __, 1
	note G#, 4
	note F_, 2
	note G#, 2
	note F_, 2
	note G_, 4
	note F_, 4
	note D#, 2
	note C_, 2
	endchannel
	
Music_SnareLeaderBattle_Ch2_Part_3:
	dutycycle $3
	tone $0001
	intensity $c6
	octave 4
	note C_, 3
	note D#, 1
	note G_, 1
	note __, 1
	note G_, 4
	note D#, 2
	note G_, 2
	note D#, 2
	note F_, 4
	note D_, 4
	octave 3
	note B_, 4
	octave 4
	note D_, 4
	endchannel
	
Music_SnareLeaderBattle_Ch2_Part_4:
	dutycycle $0
	tone $0000
	intensity $98
	note C_, 8
	octave 3
	note B_, 8
	note G_, 8
	
	
	dutycycle $3
	tone $0001
	intensity $c6
	note G#, 3
	octave 4
	note C_, 1
	note D#, 1
	note __, 1
	note D#, 4
	note C_, 2
	note D#, 2
	note C_, 2
	note D_, 4
	octave 3
	note B_, 4
	note G_, 4
	note B_, 4
	note G#, 3
	octave 4
	note C_, 1
	note D#, 1
	note __, 1
	note D#, 4
	note C_, 2
	note D#, 2
	note C_, 2
	note D_, 4
	octave 3
	note B_, 4
	octave 4
	note G_, 4
	note F_, 4
	note D#, 4
	note __, 4
	
	octave 3
	dutycycle $0
	tone $0000
	intensity $98
	note G_, 8
	octave 4
	note C_, 8
	octave 3
	note G_, 8
	note __, 8
	note G_, 8
	octave 4
	note C_, 8
	octave 3
	note G_, 8
	endchannel
	
Music_SnareLeaderBattle_Ch2_Part_5:
	dutycycle $3
	tone $0000
	intensity $c8
	note C_, 6
	note D#, 6
	note G_, 6
	note D#, 6
	octave 4
	note C_, 2
	octave 3
	note G_, 2
	note B_, 6
	note G_, 6
	note F_, 6
	note D_, 6
	endchannel
	
Music_SnareLeaderBattle_Ch2_Part_6:
	octave 3
	note G_, 4
	octave 4
	note C_, 2
	octave 3
	note G_, 4
	octave 4
	note C_, 2
	octave 3
	note G_, 2
	note G_, 2
	octave 4
	note D_, 4
	octave 3
	note B_, 4
	note G#, 4
	endchannel

Music_SnareLeaderBattle_Ch3:
	dutycycle 4
	octave 2
	notetype $C, $14
	note G_, 1
	note G_, 1
	note G_, 16
	note G_, 16
	octave 3
	note G_, 2
	note __, 2
	note G_, 2
	note __, 10
	octave 4
	note G_, 4
	note F_, 4
	note D_, 4
	octave 3
	note B_, 2
	octave 2
	note G_, 2
Music_SnareLeaderBattle_Ch3_loop:
; Pattern 2
	octave 3
	callchannel Music_SnareLeaderBattle_Ch3_Part_1
	note C_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note F_, 2
	callchannel Music_SnareLeaderBattle_Ch3_Part_1
	octave 2
	note G_, 2
	note G_, 2
	octave 3
	note D_, 2
	octave 2
	note G_, 2
	octave 3
	note D_, 2
	octave 2
	note G_, 2
	
	callchannel Music_SnareLeaderBattle_Ch3_Part_2
	note B_, 2
	note B_, 2
	octave 3
	note F_, 2
	octave 2
	note B_, 2
	note B_, 2
	octave 3
	note F_, 2
	octave 2
	note B_, 2
	octave 3
	note F_, 2
	note C_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note D#, 2
	note G_, 2
	callchannel Music_SnareLeaderBattle_Ch3_Part_2
	note G#, 2
	note G#, 2
	octave 3
	note D#, 2
	octave 2
	note G#, 2
	note G#, 2
	octave 3
	note D#, 2
	octave 2
	note G#, 2
	octave 3
	note D#, 2
	octave 2
	note G_, 2
	note G_, 2
	octave 3
	note D_, 2
	octave 2
	note G_, 2
	octave 3
	note D_, 2
	octave 2
	note G_, 2
	note G_, 2
	note B_, 2
	
;Pattern 3
	notetype $C, $16
	octave 3
	note C_, 3
	note D#, 1
	note G_, 1
	note __, 1
	note G_, 4
	note D#, 2
	note G_, 2
	note D#, 2
	note F_, 4
	note D_, 4
	octave 2
	note B_, 4
	octave 3
	note D_, 4
	note C_, 4
	note __, 16
	octave 2
	note G_, 4
	octave 3
	note B_, 2
	octave 4
	note C_, 2
	note D_, 2
	octave 3
	note B_, 2
	notetype $C, $14
	callchannel Music_SnareLeaderBattle_Ch3_Part_3
	callchannel Music_SnareLeaderBattle_Ch3_Part_3
	callchannel Music_SnareLeaderBattle_Ch3_Part_4
	callchannel Music_SnareLeaderBattle_Ch3_Part_5
	octave 2
	note G_, 2
	note B_, 2
	callchannel Music_SnareLeaderBattle_Ch3_Part_5
	octave 2
	note G_, 2
	note B_, 2
	
;Pattern 4
	callchannel Music_SnareLeaderBattle_Ch3_Part_3
	callchannel Music_SnareLeaderBattle_Ch3_Part_3
	callchannel Music_SnareLeaderBattle_Ch3_Part_3
	callchannel Music_SnareLeaderBattle_Ch3_Part_3
	callchannel Music_SnareLeaderBattle_Ch3_Part_4
	callchannel Music_SnareLeaderBattle_Ch3_Part_5
	octave 2
	note G_, 2
	note B_, 2
	callchannel Music_SnareLeaderBattle_Ch3_Part_5
	octave 2
	note G_, 2
	note D#, 2
	
;Pattern 5
	callchannel Music_SnareLeaderBattle_Ch3_Part_6
	
	note G_, 2
	note G_, 2
	octave 3
	note D_, 2
	octave 2
	note G_, 2
	note G_, 2
	octave 3
	note D_, 2
	octave 2
	note G_, 2
	octave 3
	note D_, 2
	octave 2
	note G_, 2
	note G_, 2
	octave 3
	note D_, 2
	octave 2
	note G_, 2
	octave 3
	note D_, 2
	octave 2
	note G_, 2
	
	note G#, 2
	note G#, 2
	octave 3
	note D#, 2
	octave 2
	note G#, 2
	note G#, 2
	octave 3
	note D#, 2
	octave 2
	note G#, 2
	octave 3
	note D#, 2
	octave 2
	note G#, 2
	note G#, 2
	octave 3
	note D#, 2
	octave 2
	note G#, 2
	octave 3
	note D#, 2
	octave 2
	note G#, 2
	
	note G_, 2
	note G_, 2
	octave 3
	note D_, 2
	octave 2
	note G_, 2
	note G_, 2
	octave 3
	note D_, 2
	octave 2
	note G_, 2
	octave 3
	note D_, 2
	octave 2
	note G_, 2
	note G_, 2
	octave 3
	note D_, 2
	octave 2
	note G_, 2
	octave 3
	note D_, 2
	octave 2
	note G_, 2
	
	octave 3
	callchannel Music_SnareLeaderBattle_Ch3_Part_6
	note D_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	
	note D#, 2
	note D#, 2
	note G#, 2
	note D#, 2
	note D#, 2
	note G#, 2
	note D#, 2
	note G#, 2
	note D#, 2
	note D#, 2
	note G#, 2
	note D#, 2
	note G#, 2
	note D#, 2
	
	note G_, 2
	note G_, 2
	note B_, 2
	note G_, 2
	note G_, 2
	note B_, 2
	note G_, 2
	note B_, 2
	note G_, 2
	note G_, 2
	note B_, 2
	note G_, 2
	note B_, 2
	note G_, 2
	
;Pattern 1
	callchannel Music_SnareLeaderBattle_Ch3_Part_7
	callchannel Music_SnareLeaderBattle_Ch3_Part_7
	note G#, 2
	note G#, 2
	note D#, 2
	note G#, 2
	note G#, 2
	note D#, 2
	note G#, 2
	note D#, 2
	note G#, 2
	note G#, 2
	octave 3
	note G#, 2
	octave 2
	note G#, 2
	octave 3
	note G#, 2
	octave 2
	note G#, 2
	
	note G_, 2
	note __, 14
	octave 4
	note G_, 2
	note __, 2
	note F_, 2
	note __, 2
	note D_, 2
	note __, 2
	octave 3
	note B_, 2
	octave 2
	note G_, 2
	loopchannel 0, Music_SnareLeaderBattle_Ch3_loop
	
Music_SnareLeaderBattle_Ch3_Part_1:
	octave 3
	note C_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note C_, 2
	note G#, 2
	note C_, 2
	note G#, 2
	octave 2
	note G_, 2
	octave 3
	note C_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	endchannel
	
Music_SnareLeaderBattle_Ch3_Part_2:
	octave 2
	note G#, 2
	note G#, 2
	octave 3
	note D#, 2
	octave 2
	note G#, 2
	note G#, 2
	octave 3
	note D#, 2
	octave 2
	note G#, 2
	octave 3
	note D#, 2
	octave 2
	note G_, 2
	note G_, 2
	octave 3
	note D#, 2
	octave 2
	note G_, 2
	octave 3
	note D#, 2
	octave 2
	note G_, 2
	endchannel
	
Music_SnareLeaderBattle_Ch3_Part_3:
	octave 3
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2	
	octave 2
	note G_, 2
	octave 3
	note D_, 2
	octave 2
	note G_, 2
	octave 3
	note D_, 2
	octave 2
	note G_, 2
	octave 3
	note D_, 2
	octave 2
	note G_, 2
	octave 3
	note D_, 2
	endchannel
	
Music_SnareLeaderBattle_Ch3_Part_4:
	octave 2
	note G#, 2
	octave 3
	note D#, 2
	octave 2
	note G#, 2
	octave 3
	note D#, 2
	octave 2
	note G#, 2
	octave 3
	note D#, 2
	octave 2
	note G#, 2
	octave 3
	note D#, 2
	octave 2
	note G_, 2
	octave 3
	note D_, 2
	octave 2
	note G_, 2
	octave 3
	note D_, 2
	octave 2
	note G_, 2
	octave 3
	note D_, 2
	octave 2
	note G_, 2
	octave 3
	note D_, 2
	octave 2
	note G#, 2
	octave 3
	note D#, 2
	octave 2
	note G#, 2
	octave 3
	note D#, 2
	octave 2
	note G#, 2
	octave 3
	note D#, 2
	octave 2
	note G#, 2
	octave 3
	note D#, 2
	octave 2
	note G_, 2
	octave 3
	note D_, 2
	octave 2
	note G_, 2
	octave 3
	note D_, 2
	octave 2
	note G_, 2
	octave 3
	note D_, 2
	octave 2
	note G_, 2
	note B_, 2
	endchannel
	
Music_SnareLeaderBattle_Ch3_Part_5:
	octave 3
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
	note C_, 2
	note G_, 2
	endchannel
	
Music_SnareLeaderBattle_Ch3_Part_6:
	note C_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	endchannel
	
Music_SnareLeaderBattle_Ch3_Part_7:
	octave 3
	note C_, 2
	note C_, 2
	octave 2
	note G_, 2
	octave 3
	note C_, 2
	note C_, 2
	octave 2
	note G_, 2
	octave 3
	note C_, 2
	octave 2
	octave 2
	note G_, 2
	
	octave 3
	note C_, 2
	note C_, 2
	octave 4
	note C_, 2
	octave 3
	note C_, 2
	octave 4
	note C_, 2
	octave 2
	note G_, 2
	endchannel
	
Music_SnareLeaderBattle_Ch4:
	togglenoise $3
	notetype $c
	note D_, 1
	note D_, 1
	note B_, 16
	endchannel

