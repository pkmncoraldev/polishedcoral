Music_BrilloSong: ; f06e1
	musicheader 3, 1, Music_BrilloSong_Ch1
	musicheader 1, 2, Music_BrilloSong_Ch2
	musicheader 1, 3, Music_BrilloSong_Ch3


Music_BrilloSong_Ch1: ; f06ed
	tempo 150
	volume $77
	vibrato $6, $34
	tone $0002
	dutycycle $0
	notetype $c, $7a
	callchannel BrilloSongLeadMelody
	note C_, 12
	callchannel BrilloSongLeadMelody2
	callchannel BrilloSongLeadMelody
	note C_, 6
	octave 2
	note E_, 2
	note F_, 2
	note F#, 2
	note G_, 3
	note __, 1
	note G_, 4
	note F_, 2
	note G_, 2
	note A_, 2
	octave 3
	note C_, 12
	note C_, 2
	note F_, 2
	note E_, 3
	note __, 1
	note E_, 4
	note D_, 2
	octave 2
	note B_, 2
	octave 3
	note C_, 16
	endchannel
	
BrilloSongLeadMelody:
	octave 2
	note E_, 2
	note F_, 2
	note F#, 2
	note G_, 3
	note __, 1
	note G_, 4
	note F_, 2
	note E_, 2
	note F_, 6
	note D_, 2
	note D#, 2
	note E_, 2
	note F_, 3
	note __, 1
	note F_, 4
	note E_, 2
	note D_, 2
	note E_, 6
	note E_, 2
	note F_, 2
	note F#, 2
	note G_, 3
	note __, 1
	note G_, 4
	note F_, 2
	note G_, 2
	note A_, 4
	octave 3
	note C_, 4
	note C_, 2
	note F_, 2
	note E_, 3
	note __, 1
	note E_, 4
	note D_, 2
	note C_, 2
	note D_, 16
	note __, 2
	
	octave 2
	note E_, 2
	note F_, 2
	note F#, 2
	note G_, 3
	note __, 1
	note G_, 4
	note F_, 2
	note E_, 2
	note F_, 6
	note D_, 2
	note D#, 2
	note E_, 2
	note F_, 3
	note __, 1
	note F_, 4
	note E_, 2
	note D_, 2
	note E_, 6
	note E_, 2
	note F_, 2
	note F#, 2
	note G_, 3
	note __, 1
	note G_, 4
	note F_, 2
	note G_, 2
	note A_, 2
	octave 3
	note C_, 6
	note C_, 2
	note F_, 2
	note E_, 3
	note __, 1
	note E_, 4
	note D_, 2
	octave 2
	note B_, 2
	octave 3
	endchannel
	
	
BrilloSongLeadMelody2:
	octave 2
	note B_, 6
	note A_, 2
	note G_, 4
	octave 3
	note F_, 6
	note D_, 6
	note E_, 6
	note D_, 2
	note C_, 4
	octave 2
	note G_, 6
	octave 3
	note C_, 6
	octave 2
	note B_, 6
	note A_, 2
	note G_, 4
	octave 3
	note F_, 6
	note D_, 6
	note E_, 6
	note D_, 2
	note C_, 4
	note G_, 12
	
	octave 2
	note B_, 6
	note A_, 2
	note G_, 4
	octave 3
	note F_, 6
	note D_, 6
	note E_, 6
	note D_, 2
	note C_, 4
	octave 2
	note G_, 6
	octave 3
	note C_, 6
	octave 2
	note B_, 6
	note A_, 2
	note G_, 4
	octave 3
	note F_, 6
	note E_, 2
	note D_, 4
	note F_, 12
	notetype $c, $f8
	note F_, 12
	notetype $c, $7a
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 3
	note F_, 1
	note __, 3
	note F_, 1
	note __, 5
	endchannel


Music_BrilloSong_Ch2: ; f074f
	dutycycle $3
	vibrato $8, $25
	notetype $c, $78
	callchannel BrilloSongHarmony
	note E_, 12
	callchannel BrilloSongHarmony2
	callchannel BrilloSongHarmony
	note E_, 6
	note __, 6
	note C_, 4
	octave 4
	note C_, 4
	octave 3
	note A#, 4
	note F_, 14
	note G#, 4
	note G_, 6
	note F_, 6
	note E_, 16
	endchannel

BrilloSongHarmony:
	octave 3
	note __, 6
	note E_, 6
	note C_, 6
	octave 2
	note B_, 8
	note G_, 4
	note B_, 6
	octave 3
	note D_, 6
	note C_, 8
	note D_, 4
	note E_, 6
	note C_, 6
	note F_, 6
	note A_, 6
	octave 4
	note C_, 6
	octave 3
	note A_, 6
	note G_, 12
	note B_, 12
	
	note E_, 6
	note C_, 6
	octave 2
	note B_, 8
	note G_, 4
	note B_, 6
	octave 3
	note D_, 6
	note C_, 8
	note D_, 4
	note C_, 4
	octave 4
	note C_, 4
	octave 3
	note A#, 4
	note F_, 6
	note G#, 6
	note G_, 8
	note F_, 4
	endchannel
	
BrilloSongHarmony2:
	note D_, 12
	note A_, 6
	note F_, 6
	note G_, 12
	note E_, 6
	note G_, 6
	note D_, 12
	note A_, 6
	note F_, 6
	note G_, 12
	octave 4
	note C_, 12
	octave 3
	note D_, 12
	note A_, 6
	note F_, 6
	note G_, 12
	note E_, 6
	note G_, 6
	note D_, 12
	note A_, 12
	note G_, 12
	octave 4
	note C_, 12
	octave 3
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note B_, 1
	note __, 3
	note B_, 1
	note __, 3
	note B_, 1
	note __, 5
	endchannel


Music_BrilloSong_Ch3: ; f079f
	notetype $c, $12
	octave 3
	note __, 6
	callchannel BrilloSongBass	
	note C_, 12
	note G_, 12
	note G_, 12
	note C_, 12
	note C_, 12
	note F_, 12
	note C_, 12
	note G_, 12
	octave 2
	note G_, 12
	note C_, 12
	note G_, 12
	note G_, 12
	note C_, 12
	note C_, 12
	note F_, 12
	note G_, 12
	note C_, 12
	note C_, 12
	note F_, 16
	note __, 2
	note G_, 12
	note C_, 16
	endchannel
	
BrilloSongBass:
	note C_, 12
	note G_, 12
	note G_, 12
	note C_, 12
	note C_, 12
	note F_, 12
	note C_, 12
	note G_, 12
	octave 2
	note G_, 12
	note C_, 12
	note G_, 12
	note G_, 12
	note C_, 12
	note C_, 12
	note F_, 12
	note G_, 12
	note C_, 12
	octave 2
	note G_, 12
	note B_, 12
	octave 3
	note C_, 12
	note E_, 12
	octave 2
	note G_, 12
	note B_, 12
	octave 3
	note C_, 12
	note E_, 12
	octave 2
	note G_, 12
	note B_, 12
	octave 3
	note C_, 12
	note E_, 12
	octave 2
	note G_, 12
	note B_, 12
	note G_, 12
	octave 3
	note D_, 12
	octave 2
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 3
	octave 3
	note D_, 1
	note __, 3
	note G_, 1
	note __, 11
	endchannel