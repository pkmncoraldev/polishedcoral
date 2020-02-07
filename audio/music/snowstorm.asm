Music_SunbeamIsland:
	musicheader 4, 1, Music_SunbeamIsland_Ch1
	musicheader 1, 2, Music_SunbeamIsland_Ch2
	musicheader 1, 3, Music_SunbeamIsland_Ch3
	musicheader 1, 4, Music_SunbeamIsland_Ch4
	
Music_SunbeamIsland_Ch1:
	tempo $AE
	volume $77
	stereopanning $77
	endchannel 0
	
Music_SunbeamIsland_Ch2:
	endchannel 0

	
Music_SunbeamIsland_Ch3:
	endchannel 0	
	
Music_SunbeamIsland_Ch4:
	notetype $C
	togglenoise 6
	note D#, 1
Music_SunbeamIsland_Ch4_loop:	
	note C_, 6
	note E_, 4
	note C#, 6
	loopchannel 0, Music_SunbeamIsland_Ch4_loop
	