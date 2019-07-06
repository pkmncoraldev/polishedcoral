Music_Route1: ; f0386
	musicheader 4, 1, Music_Route1_Ch1
	musicheader 1, 2, Music_Route1_Ch2
	musicheader 1, 3, Music_Route1_Ch3
	musicheader 1, 4, Music_Route1_Ch4
; f0392

Music_Route1_Ch1: ; f0392
	tempo 160
	volume $77
	dutycycle $3
	tone $0000
	vibrato $10, $15
	stereopanning $f
	notetype $c, $b2
	intensity $c5
Music_Route1_branch_f03a5: ; f03a5
	octave 3
	note __, 4
	note C_, 2
	note E_, 2
	note C_, 2
	note A_, 4
	note G_, 2
	note F_, 2
	note D_, 4
	octave 2
	note B_, 2
	octave 3
	note F_, 2
	note E_, 4
	note __, 4
	note E_, 2
	note C_, 2
	note G_, 2
	note E_, 2
	note F_, 2
	note C_, 2
	note A_, 2
	note F_, 2
	note G_, 3
	note E_, 3
	note C_, 2
	note F_, 4
	note __, 6

	note C_, 2
	note E_, 2
	note C_, 2
	note A_, 4
	note G_, 2
	note F_, 2
	note D_, 3
	octave 2
	note G_, 2
	note B_, 1
	octave 3
	note F_, 2
	note E_, 4
	note __, 6
	note C_, 2
	note E_, 2
	note C_, 2
	note A_, 4
	note F_, 4
	note G_, 3
	note F_, 3
	note F_, 2
	note E_, 4
	note __, 4
	
	
	
	note F_, 4
	note C_, 2
	note F_, 2
	octave 4
	note C_, 2
	octave 3
	note B_, 2
	note A_, 2
	note F_, 2
	note G_, 4
	note E_, 2
	note F_, 2
	note G_, 4
	note E_, 4
	note D_, 4
	note B_, 2
	note D_, 2
	note B_, 2
	note A_, 2
	note G_, 2
	note F_, 2
	note E_, 2
	note D_, 2
	note E_, 2
	note F_, 2
	note G_, 4
	note C_, 4
	note F_, 4
	note C_, 2
	note F_, 2
	octave 4
	note C_, 2
	octave 3
	note B_, 2
	note A_, 2
	note F_, 2
	note G_, 4
	note E_, 2
	note F_, 2
	note G_, 4
	note E_, 2
	note G_, 2
	note A_, 2
	note G_, 2
	note F_, 2
	note A_, 2
	note G_, 2
	note F_, 2
	note D_, 2
	note F_, 2
	note E_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	loopchannel 0, Music_Route1_branch_f03a5
; f044d

Music_Route1_Ch2: ; f044d
	dutycycle $3
	vibrato $12, $36
	notetype $c, $c2
	intensity $c5
Music_Route1_branch_f0458: ; f0458
	octave 4
	note C_, 1
	note D_, 1
	
	note E_, 3
	note E_, 2
	note C_, 1
	note G_, 2
	note F_, 4
	note E_, 2
	note D_, 2
	octave 3
	note B_, 3
	note B_, 2
	octave 4
	note C_, 1
	note D_, 2
	note C_, 4
	note __, 2
	
	note C_, 1
	note D_, 1
	note E_, 3
	note E_, 2
	note C_, 1
	note A_, 2
	note G_, 2
	note F_, 2
	note C_, 2
	note F_, 2
	note E_, 3
	note E_, 2
	note F_, 1
	note G_, 2
	note D_, 4
	octave 3
	note G_, 2
	
	octave 4
	note C_, 1
	note D_, 1
	
	note E_, 3
	note E_, 2
	note C_, 1
	note G_, 2
	note F_, 4
	note E_, 2
	note D_, 2
	octave 3
	note B_, 3
	note B_, 2
	octave 4
	note C_, 1
	note D_, 2
	note C_, 4
	note __, 2
	
	note C_, 1
	note D_, 1
	note E_, 3
	note E_, 2
	note C_, 1
	note A_, 2
	note G_, 2
	note F_, 2
	note C_, 2
	note F_, 2
	note E_, 3
	note D_, 2
	octave 3
	note B_, 1
	octave 4
	note D_, 2
	note C_, 4
	note __, 4
	
	
	note F_, 6
	note C_, 2
	note A_, 2
	note G_, 2
	note F_, 2
	note A_, 2
	note G_, 6
	note F_, 2
	note E_, 8
	
	note D_, 6
	octave 3
	note B_, 2
	octave 4
	note F_, 2
	note E_, 2
	note D_, 2
	note F_, 2
	note E_, 6
	note F_, 2
	note G_, 8
	
	note F_, 6
	note C_, 2
	note A_, 2
	note G_, 2
	note F_, 2
	note A_, 2
	note G_, 6
	note E_, 2
	note G_, 2
	note F_, 2
	note E_, 2
	note G_, 2
	note F_, 2
	note E_, 2
	note D_, 2
	note F_, 2
	note D_, 2
	note C_, 2
	octave 3
	note B_, 2
	octave 4
	note D_, 2
	note C_, 2
	octave 3
	note G_, 2
	octave 4
	note E_, 2
	octave 3
	note G_, 2
	octave 4
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	loopchannel 0, Music_Route1_branch_f0458
	endchannel
; f04fb

Music_Route1_Ch3: ; f04fb
	stereopanning $f0
	notetype $c, $25
	vibrato $9, $27
Music_Route1_branch_f0504: ; f0504
	octave 3
	note __, 2
	note C_, 6
	octave 2
	note G_, 2
	octave 3
	note F_, 4
	note E_, 4
	octave 2
	note G_, 6
	note B_, 2
	octave 3
	note C_, 4
	octave 2
	note G_, 4
	octave 3
	note C_, 6
	octave 2
	note G_, 2
	note F_, 4
	octave 3
	note C_, 4
	note C_, 3
	octave 2
	note A_, 3
	octave 3
	note C_, 2
	octave 2
	note B_, 4
	note G_, 4
	
	octave 3
	note C_, 6
	octave 2
	note G_, 2
	octave 3
	note F_, 4
	note E_, 4
	octave 2
	note G_, 6
	note B_, 2
	octave 3
	note C_, 4
	octave 2
	note G_, 4
	octave 3
	note C_, 6
	octave 2
	note G_, 2
	note F_, 4
	octave 3
	note C_, 4
	note C_, 3
	octave 2
	note B_, 3
	octave 3
	note D_, 2
	note C_, 4
	note __, 4
	
	
	octave 2
	note F_, 6
	octave 3
	note C_, 6
	note F_, 2
	note D_, 2
	octave 2
	note E_, 6
	octave 3
	note C_, 2
	note E_, 4
	note C_, 4
	octave 2
	note D_, 6
	note B_, 6
	octave 3
	note D_, 2
	octave 2
	note B_, 2
	octave 3
	note C_, 4
	note D_, 4
	note E_, 4
	note C_, 4
	
	octave 2
	note F_, 6
	octave 3
	note C_, 6
	note F_, 2
	note D_, 2
	note E_, 4
	note A#, 4
	note A_, 4
	note E_, 4
	note D_, 6
	octave 2
	note A_, 2
	note G_, 2
	note __, 2
	octave 3
	note D_, 4
	note C_, 6
	octave 2
	note G_, 2
	octave 3
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	loopchannel 0, Music_Route1_branch_f0504
; f05a9

Music_Route1_Ch4: ; f05a9
	togglenoise $3
	notetype $c
	note __, 2
Music_Route1_branch_f05b0: ; f05b0
	note __, 2
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note __, 4
	note F#, 4
	loopchannel 0, Music_Route1_branch_f05b0
; f05bf
