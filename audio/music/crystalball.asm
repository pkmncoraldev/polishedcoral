Music_CrystalBall:
	musicheader 2, 1, Music_CrystalBall_Ch1
	musicheader 1, 2, Music_CrystalBall_Ch2

Music_CrystalBall_Ch1:
	tempo 200
	volume $77
	dutycycle $1
	tone $0000
	vibrato $12, $36
	stereopanning $f0
	notetype $c, $0e
	octave 3
	slidepitchto 1, 5, G#
	note C#, 16
	intensity $e8
Music_CrystalBall_Ch1loop:
	note G#, 16
	loopchannel 0, Music_CrystalBall_Ch1loop

Music_CrystalBall_Ch2:
	dutycycle $1
	vibrato $12, $36
	stereopanning $f
	notetype $c, $0e
	octave 2
	note A#, 16
	intensity $e8
Music_CrystalBall_Ch2loop:
	note A#, 16
	loopchannel 0, Music_CrystalBall_Ch2loop
