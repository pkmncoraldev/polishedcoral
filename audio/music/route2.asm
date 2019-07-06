Music_Route2: ; efc01
	musicheader 4, 1, Music_Route2_Ch1
	musicheader 1, 2, Music_Route2_Ch2
	musicheader 1, 3, Music_Route2_Ch3
	musicheader 1, 4, Music_Route2_Ch4
; efc0d

Music_Route2_Ch1: ; efc0d
	tempo 150
	volume $77
	dutycycle $3
	tone $0001
	vibrato $10, $15
	stereopanning $f0
	notetype $c, $b2
	intensity $87
	octave 2
	note G#, 2
	note __, 4
	note G#, 1
	note G#, 1
	note G#, 2
	note G#, 2
	note __, 4
	note G#, 2
	note __, 4
	note G#, 1
	note G#, 1
	note G#, 2
	note G#, 2
	intensity $a7
	note F_, 1
	note F#, 1
	note G#, 1
	octave 3
	note C_, 1
Music_Route2_branch_efc2e: ; efc2e
	note C#, 4
	octave 2
	note G#, 4
	octave 3
	note F_, 4
	note C#, 4
	octave 2
	note B_, 6
	octave 3
	note C#, 2
	note D#, 4
	octave 2
	note B_, 4
	octave 3
	note C#, 3
	octave 2
	note G#, 1
	note F_, 12
	octave 3
	note F#, 8
	note F#, 8
	
	note C#, 4
	octave 2
	note G#, 4
	octave 3
	note F_, 4
	note C#, 4
	octave 2
	note B_, 4
	octave 3
	note C#, 4
	note D#, 4
	note F#, 2
	note D#, 1
	note F#, 1
	note F_, 8
	note C#, 6
	note F_, 1
	note F#, 1
	note G#, 8
	note G#, 8
	
	note C#, 4
	octave 2
	note A#, 4
	octave 3
	note F#, 4
	note C#, 4
	note A#, 8
	note G#, 4
	note F#, 4
	note C#, 4
	octave 2
	note G#, 4
	octave 3
	note F_, 4
	note D#, 4
	note C#, 8
	octave 2
	note G#, 8
	
	octave 3
	note C_, 4
	octave 2
	note G#, 4
	octave 3
	note D#, 4
	note C_, 4
	note F_, 8
	note D#, 4
	note C_, 4
	note C#, 4
	octave 2
	note G#, 4
	octave 3
	note F_, 4
	note D#, 4
	note C#, 8
	octave 2
	note B_, 8
	
	octave 3
	note C#, 4
	octave 2
	note A#, 4
	octave 3
	note F#, 4
	note C#, 4
	note A#, 8
	note G#, 4
	note F#, 4
	note C#, 4
	octave 2
	note G#, 4
	octave 3
	note F_, 4
	note D#, 4
	note C#, 8
	octave 2
	note G#, 8
	
	octave 3
	note C_, 4
	octave 2
	note G#, 4
	octave 3
	note D#, 4
	note C_, 4
	intensity $97
	note G#, 8
	note F#, 4
	note F#, 4
	note F_, 16
	note __, 16
	intensity $87
	octave 2
	note G#, 2
	note __, 4
	note G#, 1
	note G#, 1
	note G#, 2
	note G#, 2
	note __, 4
	note G#, 2
	note __, 4
	note G#, 1
	note G#, 1
	note G#, 2
	note __, 2
	intensity $a7
	note F_, 1
	note F#, 1
	note G#, 1
	octave 3
	note C_, 1
	loopchannel 0, Music_Route2_branch_efc2e
; efcda

Music_Route2_Ch2: ; efcda
	dutycycle $3
	vibrato $12, $36
	stereopanning $f
	notetype $c, $c2
	intensity $87
	octave 3
	note F_, 2
	note __, 4
	note F_, 1
	note F_, 1
	note F_, 2
	note F_, 2
	note __, 4
	note F_, 2
	note __, 4
	note F_, 1
	note F_, 1
	note F_, 2
	note F_, 2
	octave 2
	intensity $c7
	note G#, 1
	note A#, 1
	octave 3
	note C_, 1
	note D#, 1
Music_Route2_branch_efcf6: ; efcf6
	note F_, 6
	note F_, 1
	note F#, 1
	note G#, 4
	note F_, 4
	note D#, 6
	note F_, 2
	note F#, 4
	note F#, 2
	note D#, 1
	note F#, 1
	note F_, 3
	note C#, 1
	octave 2
	note G#, 12
	octave 3
	note B_, 8
	note A#, 8
	
	note F_, 6
	note F_, 1
	note F#, 1
	note G#, 4
	note F_, 4
	note D#, 4
	note F_, 4
	note F#, 4
	note A#, 2
	note F#, 1
	note A#, 1
	note G#, 14
	note G#, 1
	octave 4
	note C_, 1
	note C#, 8
	octave 3
	note B_, 8
	
	note F#, 6
	note C#, 1
	note F#, 1
	note A#, 6
	note F#, 1
	note A#, 1
	octave 4
	note C#, 8
	note C_, 4
	octave 3
	note A#, 4
	note F_, 6
	note C#, 1
	note F_, 1
	note G#, 6
	note F#, 2
	note F_, 16
	note D#, 6
	note C_, 1
	note D#, 1
	note F#, 6
	note D#, 1
	note F#, 1
	note G#, 8
	note F#, 4
	note D#, 4
	note F_, 6
	note C#, 1
	note F_, 1
	note G#, 6
	note F#, 2
	note F_, 16
	
	note F#, 6
	note C#, 1
	note F#, 1
	note A#, 6
	note F#, 1
	note A#, 1
	octave 4
	note C#, 8
	note C_, 4
	octave 3
	note A#, 4
	note F_, 6
	note C#, 1
	note F_, 1
	note G#, 6
	note F#, 2
	note F_, 16
	note D#, 6
	note C_, 1
	note D#, 1
	note F#, 6
	note D#, 1
	note F#, 1
	note F_, 8
	note D#, 4
	note C_, 4
	note C#, 16
	note __, 16
	
	intensity $87
	note F_, 2
	note __, 4
	note F_, 1
	note F_, 1
	note F_, 2
	note F_, 2
	note __, 4
	note F_, 2
	note __, 4
	note F_, 1
	note F_, 1
	note F_, 2
	note __, 2
	octave 2
	intensity $c7
	note G#, 1
	note A#, 1
	octave 3
	note C_, 1
	note D#, 1
	
	loopchannel 0, Music_Route2_branch_efcf6
; efd5f

Music_Route2_Ch3: ; efd5f
	notetype $c, $14
	octave 3
	note C#, 2
	note __, 4
	note C#, 1
	note C#, 1
	note C#, 2
	note C#, 2
	note __, 2
	octave 2
	note G#, 2
	octave 3
	note C#, 2
	note __, 4
	note C#, 1
	note C#, 1
	note C#, 2
	note C#, 2
	note __, 2
	octave 2
	note G#, 2
Music_Route2_branch_efd79: ; efd79
	octave 3
	note C#, 2
	note __, 4
	note C#, 1
	note C#, 1
	note C#, 2
	note C#, 2
	note __, 2
	octave 2
	note G#, 2
	note B_, 2
	note __, 4
	note B_, 1
	note B_, 1
	note B_, 2
	note B_, 2
	note __, 2
	note F#, 2
	octave 3
	note C#, 2
	note __, 4
	note C#, 1
	note C#, 1
	note C#, 2
	note C#, 2
	note __, 2
	octave 2
	note G#, 2
	note B_, 2
	note __, 4
	note B_, 1
	note B_, 1
	note B_, 2
	note B_, 2
	note __, 2
	octave 3
	note D#, 2
	note C#, 2
	note __, 4
	note C#, 1
	note C#, 1
	note C#, 2
	note C#, 2
	note __, 2
	octave 2
	note G#, 2
	note B_, 2
	note __, 4
	note B_, 1
	note B_, 1
	note B_, 2
	note B_, 2
	note __, 2
	note F#, 2
	octave 3
	note C#, 2
	note __, 4
	note C#, 1
	note C#, 1
	note C#, 2
	note C#, 2
	note __, 2
	octave 2
	note G#, 2
	octave 3
	note C#, 2
	note __, 4
	note C#, 1
	note C#, 1
	note C#, 2
	note C#, 2
	note __, 2
	octave 2
	note G#, 2
	
	note F#, 2
	note __, 4
	note F#, 1 
	note F#, 1
	note F#, 2
	note F#, 2
	note __, 2
	note C#, 2
	note F#, 2
	note __, 4
	note F#, 1 
	note F#, 1
	note F#, 2
	note F#, 2
	note __, 2
	note F#, 2
	octave 3
	note C#, 2
	note __, 4
	note C#, 1
	note C#, 1
	note C#, 2
	note C#, 2
	note __, 2
	octave 2
	note G#, 2
	octave 3
	note C#, 2
	note __, 4
	note C#, 1
	note C#, 1
	note C#, 2
	note C#, 2
	note __, 2
	note C#, 2
	octave 2
	note G#, 2
	note __, 4
	note G#, 1
	note G#, 1
	note G#, 2
	note G#, 2
	note __, 2
	note D#, 2
	note G#, 2
	note __, 4
	note G#, 1
	note G#, 1
	note G#, 2
	note G#, 2
	note __, 2
	note G#, 2
	octave 3
	note C#, 2
	note __, 4
	note C#, 1
	note C#, 1
	note C#, 2
	note C#, 2
	note __, 2
	octave 2
	note G#, 2
	octave 3
	note C#, 2
	note __, 4
	note C#, 1
	note C#, 1
	note C#, 2
	note C#, 2
	note __, 2
	note C#, 2

	octave 2
	note F#, 2
	note __, 4
	note F#, 1 
	note F#, 1
	note F#, 2
	note F#, 2
	note __, 2
	note C#, 2
	note F#, 2
	note __, 4
	note F#, 1 
	note F#, 1
	note F#, 2
	note F#, 2
	note __, 2
	note F#, 2
	octave 3
	note C#, 2
	note __, 4
	note C#, 1
	note C#, 1
	note C#, 2
	note C#, 2
	note __, 2
	octave 2
	note G#, 2
	octave 3
	note C#, 2
	note __, 4
	note C#, 1
	note C#, 1
	note C#, 2
	note C#, 2
	note __, 2
	note C#, 2
	octave 2
	note G#, 2
	note __, 4
	note G#, 1
	note G#, 1
	note G#, 2
	note G#, 2
	note __, 2
	note D#, 2
	note G#, 2
	note __, 4
	note G#, 1
	note G#, 1
	note G#, 2
	note G#, 2
	note __, 2
	note G#, 2
	octave 3
	note C#, 2
	note __, 4
	note C#, 1
	note C#, 1
	note C#, 2
	note C#, 2
	note __, 2
	octave 2
	note G#, 2
	octave 3
	note C#, 2
	note __, 4
	note C#, 1
	note C#, 1
	note C#, 2
	note C#, 2
	note __, 2
	octave 2
	note G#, 2
	octave 3
	note C#, 2
	note __, 4
	note C#, 1
	note C#, 1
	note C#, 2
	note C#, 2
	note __, 2
	octave 2
	note G#, 2
	
	octave 3
	note C#, 2
	note __, 4
	note C#, 1
	note C#, 1
	note C#, 2
	note __, 4
	note C#, 2

	

	
	
	loopchannel 0, Music_Route2_branch_efd79
; efe7a

Music_Route2_Ch4: ; efe7a
	togglenoise $3
	notetype $c
	callchannel Music_Route2_Ch4Drum1
	
Music_Route2_branch_efe84: ; efe84
	callchannel Music_Route2_Ch4Drum2
	callchannel Music_Route2_Ch4Drum3
	callchannel Music_Route2_Ch4Drum2
	callchannel Music_Route2_Ch4Drum3
	callchannel Music_Route2_Ch4Drum2
	callchannel Music_Route2_Ch4Drum3
	callchannel Music_Route2_Ch4Drum2
	callchannel Music_Route2_Ch4Drum3
	callchannel Music_Route2_Ch4Drum2
	callchannel Music_Route2_Ch4Drum3
	callchannel Music_Route2_Ch4Drum2
	callchannel Music_Route2_Ch4Drum1
	callchannel Music_Route2_Ch4Drum4
	loopchannel 0, Music_Route2_branch_efe84
	
Music_Route2_Ch4Drum1:
	note D_, 2
	note __, 4
	note D_, 1
	note D_, 1
	note D_, 2
	note D_, 2
	note __, 2
	note D_, 2
	note D_, 2
	note __, 4
	note D_, 1
	note D_, 1
	note D_, 2
	note D_, 2
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1
	endchannel
	
Music_Route2_Ch4Drum2:
	note D_, 2
	note F#, 2
	note F#, 2
	note D_, 1
	note D_, 1
	note D_, 2
	note D_, 2
	note __, 2
	note D_, 2
	
	note D_, 2
	note F#, 2
	note F#, 2
	note D_, 1
	note D_, 1
	note D_, 2
	note D_, 2
	note F#, 4
	endchannel
	
Music_Route2_Ch4Drum3:
	note D_, 2
	note F#, 2
	note F#, 2
	note D_, 1
	note D_, 1
	note D_, 2
	note D_, 2
	note __, 2
	note D_, 2
	
	note D_, 2
	note F#, 2
	note F#, 2
	note D_, 1
	note D_, 1
	note D_, 2
	note D_, 2
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1
	endchannel
	
Music_Route2_Ch4Drum4:
	note D_, 2
	note __, 4
	note D_, 1
	note D_, 1
	note D_, 2
	note D_, 2
	note __, 2
	note D_, 2
	note D_, 2
	note __, 4
	note D_, 1
	note D_, 1
	note D_, 2
	note __, 6
	endchannel
; efeb8
	endchannel
; efef5
