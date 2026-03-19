Music_SpamBuilding:
	musicheader 3, 1, Music_SpamBuilding_Ch1
	musicheader 1, 2, Music_SpamBuilding_Ch2
	musicheader 1, 3, Music_SpamBuilding_Ch3

Music_SpamBuilding_Ch1:
	tempo 200
	volume $77
Music_SpamBuilding_Ch1loop:
	note __, 16
	loopchannel 0, Music_SpamBuilding_Ch1loop

Music_SpamBuilding_Ch2:
	dutycycle $0
	tone $0003
	vibrato $00, $00
	stereopanning $f0
	notetype $F, $48
	octave 1
Music_SpamBuilding_Ch2loop:
	note G#, 16
	loopchannel 0, Music_SpamBuilding_Ch2loop

Music_SpamBuilding_Ch3:
	stereopanning $ff
	dutycycle 5
	notetype $f, $32
	octave 3
Music_SpamBuilding_Ch3loop:
	note __, 16
	loopchannel 0, Music_SpamBuilding_Ch3loop