Music_Mountaintop:
	musicheader 4, 1, Music_Mountaintop_Ch1
	musicheader 1, 2, Music_Mountaintop_Ch2
	musicheader 1, 3, Music_Mountaintop_Ch3
	musicheader 1, 4, Music_Mountaintop_Ch4
	
Music_Mountaintop_Ch1:
	tempo $AE
	volume $77
	stereopanning $77
Music_Mountaintop_Ch1_loop:	
	notetype $C, $00
	dutycycle 0
	note __, 16
	note __, 8
	note __, 16
	intensity $58
	octave 4
	note B_, 3
	intensity $53
	slidepitchto 2, 5, D_
	octave 5
	note D#, 3
	intensity $28
	octave 4
	note B_, 3
	intensity $23
	slidepitchto 2, 5, D_
	octave 5
	note D#, 4
	note __, 11
	note __, 13
	note __, 7
	loopchannel 0, Music_Mountaintop_Ch1_loop
	
Music_Mountaintop_Ch2:
	endchannel 0

	
Music_Mountaintop_Ch3:
	endchannel 0	
	
Music_Mountaintop_Ch4:
	notetype $C
	togglenoise 6
	note D#, 1
Music_Mountaintop_Ch4_loop:	
	note C_, 6
	note E_, 4
	note C#, 6
	note D_, 15
	loopchannel 0, Music_Mountaintop_Ch4_loop
	