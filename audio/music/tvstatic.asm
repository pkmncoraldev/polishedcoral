Music_TVStatic:
	musicheader 4, 1, Music_TVStatic_Ch1
	musicheader 1, 2, Music_TVStatic_Ch1
	musicheader 1, 3, Music_TVStatic_Ch1
	musicheader 1, 4, Music_TVStatic_Ch4

Music_TVStatic_Ch1:
	tempo $fe
	volume $77
	stereopanning $77
	endchannel
	
Music_TVStatic_Ch4:
	notetype $C
	togglenoise 6
Music_TVStatic_Ch4_loop:	
	note E_, 16
	loopchannel 0, Music_TVStatic_Ch4_loop
	