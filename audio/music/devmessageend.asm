Music_DevMessageEnd: ; f6bf2
	musicheader 3, 2, Music_DevMessageEnd_Ch1
	musicheader 1, 2, Music_DevMessageEnd_Ch2
	musicheader 1, 3, Music_DevMessageEnd_Ch3
; f6bfb

Music_DevMessageEnd_Ch1: ; f6bfb
	tempo 144
	volume $77
	dutycycle $2
	octave 3
	intensity $b1
	note E_, 12
Music_DevMessageEnd_Ch1_loop:
	note __, 16
	loopchannel 0, Music_DevMessageEnd_Ch1_loop
	
Music_DevMessageEnd_Ch2: ; f6bfb
	dutycycle $2
	octave 3
	intensity $a1
	note C#, 12
Music_DevMessageEnd_Ch2_loop:
	note __, 16
	loopchannel 0, Music_DevMessageEnd_Ch2_loop

Music_DevMessageEnd_Ch3: ; f6c20
	stereopanning $f0
	notetype $6, $25
	intensity $10
	octave 4
	note A_, 2
Music_DevMessageEnd_Ch3_loop:
	note __, 16
	loopchannel 0, Music_DevMessageEnd_Ch3_loop