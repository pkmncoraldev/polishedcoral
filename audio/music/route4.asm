Music_Route4: ; efc01
	musicheader 4, 1, Music_Route4_Ch1
	musicheader 1, 2, Music_Route4_Ch2
	musicheader 1, 3, Music_Route4_Ch3
	musicheader 1, 4, Music_Route4_Ch4
; efc0d

Music_Route4_Ch1: ; efc0d
	tempo 150
	volume $77
	dutycycle $0
	tone $0000
	vibrato $10, $15
	stereopanning $f0
	notetype $c, $b2
	intensity $87
	octave 3
	note __, 8
	note __, 8
	note __, 8
	note __, 8
	
	note D_, 4
	octave 2
	note B_, 2
	octave 3
	note D_, 2
	note G_, 4
	note D_, 4
	note F#, 6
	note E_, 2
	note D_, 4
	note C_, 4
	octave 2
	note __, 2
	note B_, 2
	octave 3
	note D_, 2
	note G_, 2
	note B_, 4
	note G_, 4
	octave 4
	note C_, 8
	octave 3
	note A_, 4
	note B_, 2
	note A_, 2
	
	note B_, 2
	note D_, 2
	octave 2
	note B_, 2
	octave 3
	note D_, 2
	note G_, 4
	note D_, 4
	note F#, 6
	note E_, 2
	note D_, 4
	note C_, 4
	octave 2
	note B_, 4
	octave 3
	note D_, 2
	note G_, 2
	note B_, 4
	note G_, 4
	note F#, 8
	note D_, 8
Music_Route4_branch_efc2e: ; efc2e
	note D_, 4
	octave 2
	note B_, 2
	octave 3
	note D_, 2
	note G_, 4
	note D_, 4
	note F#, 6
	note E_, 2
	note D_, 4
	note C_, 4
	octave 2
	note __, 2
	note B_, 2
	octave 3
	note D_, 2
	note G_, 2
	note B_, 4
	note G_, 4
	octave 4
	note C_, 8
	octave 3
	note A_, 4
	note B_, 2
	note A_, 2
	
	note B_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note A_, 4
	note G_, 4
	note F#, 6
	note E_, 2
	note D_, 4
	note F#, 4
	note G_, 16
	note __, 16
	
	note G_, 2
	note C_, 2
	note E_, 2
	note G_, 2
	octave 4
	note C_, 2
	octave 3
	note B_, 2
	note A_, 2
	note F#, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note A_, 2
	note G_, 4
	note D_, 4
	note F#, 2
	note D_, 2
	note F#, 2
	note E_, 2
	note D_, 2
	note A_, 2
	note G_, 2
	note F#, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note A_, 2
	note G_, 4
	note F#, 4
	
	note E_, 8
	note G_, 4
	note E_, 4
	note D_, 4
	note F#, 4
	note G_, 4
	note F#, 4
	note G_, 4
	note E_, 2
	note G_, 2
	octave 4
	note C_, 4
	octave 3
	note G_, 2
	octave 4
	note C_, 2
	octave 3
	note A_, 16
	note __, 16
	
	octave 2
	note B_, 6
	note G_, 1
	note B_, 1
	octave 3
	note G_, 6
	note G_, 2
	note F#, 8
	note D_, 6
	note D_, 1
	note C_, 1
	note D_, 6
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note B_, 4
	note G_, 4
	octave 4
	note C_, 8
	octave 3
	note A_, 4
	note B_, 2
	note A_, 2
	note B_, 8
	note A_, 4
	note G_, 4
	note A_, 8
	note D_, 6
	note G_, 1
	note F#, 1
	note G_, 6
	note D_, 1
	note G_, 1
	note B_, 4
	note G_, 4
	note F#, 8
	note D_, 8
	loopchannel 0, Music_Route4_branch_efc2e
; efcda

Music_Route4_Ch2: ; efcda
	dutycycle $3
	vibrato $12, $36
	stereopanning $f
	notetype $c, $c2
	intensity $c5
	octave 3
	note __, 8
	note __, 8
	note __, 8
	note __, 8
	
	note G_, 6
	note D_, 1
	note G_, 1
	octave 4
	note D_, 6
	octave 3
	note B_, 2
	octave 4
	note C_, 14
	octave 3
	note B_, 1
	note A_, 1
	note B_, 6
	note G_, 1
	note B_, 1
	octave 4
	note G_, 4
	note D_, 4
	note E_, 12
	note D_, 2
	note C_, 2
	
	note D_, 8
	note C_, 4
	octave 3
	note B_, 4
	octave 4
	note C_, 14
	octave 3
	note B_, 1
	note A_, 1
	note B_, 6
	note G_, 1
	note B_, 1
	octave 4
	note D_, 4
	octave 3
	note B_, 4
	note A_, 16
Music_Route4_branch_efcf6: ; efcf6
	note G_, 6
	note D_, 1
	note G_, 1
	octave 4
	note D_, 6
	octave 3
	note B_, 2
	octave 4
	note C_, 14
	octave 3
	note B_, 1
	note A_, 1
	note B_, 6
	note G_, 1
	note B_, 1
	octave 4
	note G_, 4
	note D_, 4
	note E_, 12
	note D_, 2
	note C_, 2
	
	note D_, 8
	note C_, 4
	octave 3
	note B_, 4
	octave 4
	note C_, 14
	octave 3
	note B_, 1
	note A_, 1
	note B_, 16
	note __, 14
	note A_, 1
	note B_, 1
	
	octave 4
	note C_, 6
	note C_, 1
	note D_, 1
	note E_, 6
	note G_, 2
	note D_, 8
	octave 3
	note B_, 6
	octave 4
	note C_, 1
	octave 3
	note B_, 1
	note A_, 6
	note A_, 1
	note B_, 1
	octave 4
	note C_, 6
	note E_, 2
	note D_, 8
	octave 3
	note B_, 8
	
	note G_, 6
	note A_, 1
	note B_, 1
	octave 4
	note C_, 4
	octave 3
	note A_, 4
	note B_, 8
	octave 4
	note E_, 4
	note D_, 4
	note C_, 6
	note D_, 2
	note E_, 4
	note G_, 4
	note D_, 16
	note __, 16
	
	octave 3
	note G_, 6
	note D_, 1
	note G_, 1
	octave 4
	note D_, 6
	octave 3
	note B_, 2
	octave 4
	note C_, 14
	octave 3
	note B_, 1
	note A_, 1
	note B_, 6
	note G_, 1
	note B_, 1
	octave 4
	note G_, 4
	note D_, 4
	note E_, 12
	note D_, 2
	note C_, 2
	
	note D_, 8
	note C_, 4
	octave 3
	note B_, 4
	octave 4
	note C_, 14
	octave 3
	note B_, 1
	note A_, 1
	note B_, 6
	note G_, 1
	note B_, 1
	octave 4
	note D_, 4
	octave 3
	note B_, 4
	note A_, 16
	
	loopchannel 0, Music_Route4_branch_efcf6
; efd5f

Music_Route4_Ch3: ; efd5f
	notetype $c, $14
	octave 2
	note G_, 2
	note __,4
	note G_, 2
	note __, 2
	note G_, 2
	note __, 2
	note D_, 2
	note G_, 2
	note __, 4
	note G_, 2
	note __, 2
	note G_, 2
	note G_, 2
	note D_, 2
	
	note G_, 2
	note __,4
	note G_, 2
	note __, 2
	note G_, 2
	octave 3
	note D_, 2
	note __, 2
	octave 2
	note D_, 2
	note __, 4
	note D_, 2
	note __, 2
	note D_, 2
	note A_, 2
	note __, 2
	note G_, 2
	note __, 4
	note G_, 2
	note __, 2
	note G_, 2
	octave 3
	note G_, 2
	note __, 2
	note C_, 2
	note __, 4
	note C_, 2
	note __, 2
	note C_, 2
	note E_, 2
	note __, 2
	note D_, 2
	note __, 4
	note D_, 2
	note __, 2
	note D_, 2
	octave 2
	note G_, 2
	note __, 2
	octave 3
	note D_, 2
	note __, 4
	note D_, 2
	note __, 2
	note D_, 2
	octave 2
	note A_, 2
	note __, 2
	note G_, 2
	note __, 4
	note G_, 2
	note __, 2
	note G_, 2
	octave 3
	note E_, 2
	note __, 2
	note D_, 2
	note __, 4
	note D_, 2
	note __, 2
	note D_, 2
	octave 2
	note D_, 2
	note F#, 2
Music_Route4_branch_efd79: ; efd79
	octave 2	
	note G_, 2
	note __,4
	note G_, 2
	note __, 2
	note G_, 2
	octave 3
	note D_, 2
	note __, 2
	octave 2
	note D_, 2
	note __, 4
	note D_, 2
	note __, 2
	note D_, 2
	note A_, 2
	note __, 2
	note G_, 2
	note __, 4
	note G_, 2
	note __, 2
	note G_, 2
	note G_, 2
	note B_, 2
	octave 3
	note C_, 2
	note __, 4
	note C_, 2
	note __, 2
	note C_, 2
	octave 2
	note G_, 2
	note __, 2
	octave 3
	note D_, 2
	note __, 4
	note D_, 2
	note __, 2
	note D_, 2
	octave 2
	note G_, 2
	note __, 2
	note D_, 2
	note __, 4
	note D_, 2
	note __, 2
	note D_, 2
	note A_, 2
	note __, 2
	note G_, 2
	note __, 4
	note G_, 2
	note __, 2
	note G_, 2
	note __, 2
	note D_, 2
	note G_, 2
	note __, 4
	note G_, 2
	note __, 2
	note G_, 2
	note G_, 2
	note B_, 2
	
	octave 3
	note C_, 8
	octave 2
	note E_, 4
	note F#,4
	note G_, 8
	note B_, 8
	octave 3
	note D_, 8
	octave 2
	note F#, 4
	note A_, 4
	note G_, 8
	note F#, 8
	note E_, 8
	note D#, 8
	note D_, 8
	octave 3
	note E_, 4
	note D_, 4
	octave 2
	note A_, 8
	note C_, 8
	octave 3
	note D_, 16
	octave 2
	note D_, 1
	note D_, 1
	note D_, 1
	note __, 3
	note D_, 1
	note D_, 1
	note D_, 1
	note __, 7
	
	note G_, 16
	octave 3
	note D_, 8
	octave 2
	note D_, 8
	note G_, 12
	note G_, 2
	note B_, 2
	octave 3
	note C_, 8
	octave 2
	note C_, 8
	note D_, 16
	octave 3
	note D_, 8
	octave 2
	note D_, 4
	note F#, 4
	note G_, 14
	note G_, 2
	note D_, 1
	note D_, 1
	note D_, 1
	note __, 3
	note D_, 1
	note D_, 1
	note D_, 1
	note __, 1
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1
	
	loopchannel 0, Music_Route4_branch_efd79
; efe7a

Music_Route4_Ch4: ; efe7a
	togglenoise $3
	notetype $c
	callchannel Music_Route4_Ch4Drum1
	callchannel Music_Route4_Ch4Drum1
	callchannel Music_Route4_Ch4Drum1
	callchannel Music_Route4_Ch4Drum1
	callchannel Music_Route4_Ch4Drum1
Music_Route4_branch_efe84: ; efe84
	callchannel Music_Route4_Ch4Drum1
	callchannel Music_Route4_Ch4Drum1
	callchannel Music_Route4_Ch4Drum1
	callchannel Music_Route4_Ch4Drum1
	callchannel Music_Route4_Ch4Drum2
	callchannel Music_Route4_Ch4Drum2
	callchannel Music_Route4_Ch4Drum2
	callchannel Music_Route4_Ch4Drum2
	
	note D_, 1
	note D_, 1
	note D_, 1
	note __, 3
	note D_, 1
	note D_, 1
	note D_, 1
	note __, 7
	
	callchannel Music_Route4_Ch4Drum3
	callchannel Music_Route4_Ch4Drum3
	
	note F#, 2
	note __, 4
	note F#, 4
	note __, 2
	note D_, 1
	note __, 3
	
	note D_, 1
	note D_, 1
	note D_, 1
	note __, 3
	note D_, 1
	note D_, 1
	note D_, 1
	note __, 1
	
	note D_, 1
	note D_, 1
	
	notetype $6
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1
	notetype $c
	
	note D_, 1
	note D_, 1
	loopchannel 0, Music_Route4_branch_efe84
	endchannel
; efef5

Music_Route4_Ch4Drum1:
	note D_, 2
	note __, 1
	note D_, 1
	note D_, 1
	note __, 1
	note F#, 2
	note __, 1
	note D_, 1
	note D_, 1
	note __, 1
	notetype $6
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1
	notetype $c
	note D_, 1
	note D_, 1
	
	note D_, 2
	note __, 1
	note D_, 1
	note D_, 1
	note __, 1
	note F#, 2
	note __, 1
	note D_, 1
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note D_, 1
	note D_, 1
	endchannel
	
Music_Route4_Ch4Drum2:
	note F#, 4
	note D_, 1
	note __, 1
	note D_, 1
	note __, 3
	note D_, 1
	note D_, 1
	note D_, 2
	note D_, 1
	note __, 1
	
	note F#, 4
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note D_, 1
	note __, 3
	note F#, 4	
	endchannel
	
Music_Route4_Ch4Drum3:
	note F#, 2
	note __, 4
	note F#, 4
	note __, 2
	note D_, 1
	note __, 3
	note F#, 2
	note __, 4
	note F#, 4
	note __, 2
	note D_, 1
	note __, 3
	note F#, 2
	note __, 4
	note F#, 4
	note __, 2
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	endchannel
	