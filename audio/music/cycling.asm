Music_Cycling:
	channel_count 4
	channel 1, Music_Cycling_Ch1
	channel 2, Music_Cycling_Ch2
	channel 3, Music_Cycling_Ch3
	channel 4, Music_Cycling_Ch4

Music_Cycling_Ch1:
	tempo 116
	volume 7, 7
	stereo_panning FALSE, TRUE
	duty_cycle 0
	vibrato 18, 2, 6
	note_type 12, 12, 2
	octave 3
	note G#, 2
	note B_, 2
	octave 4
	note C#, 2
	octave 4
	sound_call .sub1
	sound_call .sub1
	note E_, 2
	note C#, 2
	octave 3
	note B_, 2
	octave 4
	note C#, 2
	octave 3
	note B_, 2
	note G_, 2
	note F#, 2
	note G_, 2
	note E_, 2
	rest 6
	octave 4
	note E_, 2
	rest 6
.mainloop:
	volume_envelope 10, 2
	stereo_panning TRUE, TRUE
	octave 2
	sound_call .sub2
	note D#, 2
	sound_call .sub3
	sound_call .sub2
	octave 1
	note B_, 2
	note A_, 2
	note F#, 2
	note G_, 2
	note G#, 2
	note A_, 2
	rest 2
	octave 2
	note F#, 2
	rest 2
	note E_, 2
	octave 1
	note B_, 2
	octave 2
	note D_, 2
	note D#, 2
	note E_, 2
	octave 1
	note B_, 2
	octave 2
	note G#, 2
	octave 1
	note B_, 2
	octave 2
	sound_call .sub2
	note D#, 2
	sound_call .sub3
	sound_call .sub2
	octave 1
	note B_, 2
	note A_, 2
	note A_, 2
	note A_, 2
	note A_, 2
	octave 2
	note C#, 2
	octave 1
	note A_, 2
	octave 2
	note F#, 2
	octave 1
	note A_, 2
	octave 2
	note E_, 2
	note E_, 2
	note E_, 2
	note E_, 2
	note B_, 2
	octave 1
	note B_, 2
	octave 2
	note E_, 2
	octave 1
	note B_, 2
	octave 2
	sound_call .sub4
	note E_, 2
	sound_call .sub4
	note A_, 2
	sound_call .sub5
	octave 3
	note D_, 2
	note C#, 2
	octave 2
	note B_, 2
	octave 3
	octave 2
	sound_call .sub5
	octave 3
	note E_, 2
	note C#, 2
	octave 2
	note B_, 2
	octave 1
	note B_, 2
	note B_, 2
	note B_, 2
	note B_, 2
	octave 2
	note B_, 2
	note B_, 2
	note A_, 2
	note B_, 2
	octave 1
	sound_call .sub4
	octave 2
	note A_, 2
	octave 1
	octave 2
	sound_call .sub5
	octave 3
	note D_, 2
	note C#, 2
	note D_, 2
	note E_, 2
	octave 2
	note E_, 2
	note E_, 2
	note B_, 2
	note E_, 2
	note E_, 2
	octave 3
	note D_, 2
	note E_, 2
	octave 2
	sound_call .sub4
	note E_, 2
	sound_call .sub4
	note A_, 2
	sound_call .sub5
	octave 3
	note D_, 2
	note C#, 2
	octave 2
	note B_, 2
	octave 3
	octave 2
	sound_call .sub5
	octave 3
	note E_, 2
	note C#, 2
	octave 2
	note B_, 2
	octave 1
	note B_, 2
	note B_, 2
	note B_, 2
	note B_, 2
	octave 2
	note B_, 2
	note B_, 2
	note A_, 2
	note B_, 2
	octave 1
	sound_call .sub4
	octave 2
	note A_, 2
	octave 1
	octave 2
	note E_, 2
	note E_, 2
	note E_, 2
	note E_, 2
	octave 3
	note E_, 2
	octave 2
	note E_, 2
	note B_, 2
	note E_, 2
	octave 3
	note E_, 2
	octave 2
	note E_, 2
	note E_, 2
	note B_, 2
	note E_, 2
	note E_, 2
	octave 3
	note E_, 2
	octave 2
	note F#, 2
	sound_loop 0, .mainloop
.sub1:
	octave 4
	note E_, 2
	note E_, 2
	note E_, 2
	note E_, 2
	note E_, 2
	note C#, 2
	octave 3
	note B_, 2
	octave 4
	note C#, 2
	sound_ret
.sub2:
	octave 2
	note E_, 2
	note E_, 2
	note E_, 2
	note E_, 2
	note E_, 2
	note E_, 2
	note E_, 2
	note E_, 2
	note E_, 2
	note E_, 2
	note E_, 2
	note E_, 2
	octave 1
	note B_, 2
	note B_, 2
	octave 2
	note D_, 2
	sound_ret
.sub3:
	octave 1
	note A_, 2
	note A_, 2
	note A_, 2
	note A_, 2
	note A_, 2
	note A_, 2
	octave 2
	note D_, 2
	note D#, 2
	note E_, 2
	note E_, 2
	note C#, 2
	note C#, 2
	note D_, 2
	note D_, 2
	note D#, 2
	note D#, 2
	sound_ret
.sub4:
	octave 1
	note A_, 2
	note A_, 2
	note A_, 2
	note A_, 2
	octave 2
	note A_, 2
	note A_, 2
	note G_, 2
	sound_ret
.sub5:
	octave 2
	note E_, 2
	note E_, 2
	note E_, 2
	note E_, 2
	octave 3
	note D_, 2
	octave 2
	sound_ret


Music_Cycling_Ch2:
	stereo_panning TRUE, FALSE
	duty_cycle 0
	vibrato 18, 2, 6
	note_type 12, 11, 2
	octave 3
	note E_, 2
	note G#, 2
	note G#, 2
	octave 4
	sound_call .sub1
	sound_call .sub1
	note B_, 2
	note G#, 2
	note F#, 2
	note G#, 2
	note F#, 2
	note D_, 2
	note C#, 2
	note D_, 2
	octave 2
	note B_, 2
	rest 6
	octave 3
	note B_, 2
	rest 6
.mainloop:
	volume_envelope 11, 2
	octave 3
	sound_call .sub2
	note F#, 2
	note G#, 2
	note A_, 2
	note E_, 2
	note F#, 2
	note E_, 2
	note F#, 2
	note E_, 2
	note F#, 2
	note G#, 2
	note F#, 2
	sound_call .sub3
	sound_call .sub2
	note F#, 2
	note G#, 2
	note A_, 2
	octave 3
	sound_call .sub2
	note F#, 2
	note G#, 2
	note F#, 2
	note C#, 2
	note E_, 2
	note C#, 2
	note E_, 2
	note C#, 2
	note E_, 2
	note C#, 2
	note F#, 2
	note E_, 2
	note C#, 2
	note D_, 2
	note D#, 2
	note E_, 2
	note C#, 2
	note A_, 2
	note C#, 2
	note G#, 2
	note E_, 2
	note G#, 2
	note E_, 2
	note G#, 2
	note E_, 2
	note G#, 2
	note B_, 2
	stereo_panning FALSE, TRUE
	volume_envelope 12, 2
	duty_cycle 2
	octave 4
	sound_call .sub4
	note F#, 2
	note E_, 4
	octave 3
	note G#, 10
	octave 4
	sound_call .sub4
	octave 3
	note A_, 2
	octave 4
	note F#, 4
	note E_, 4
	octave 3
	note F#, 1
	note G#, 1
	note A_, 1
	note B_, 1
	octave 4
	note C#, 1
	note D#, 1
	sound_call .sub4
	octave 3
	note A_, 2
	note B_, 4
	note G#, 6
	octave 4
	note C#, 2
	note D#, 2
	note E_, 4
	note D#, 4
	note C#, 2
	note D#, 4
	note E_, 10
	volume_envelope 12, 5
	octave 3
	note B_, 4
	note A_, 4
	stereo_panning TRUE, FALSE
	volume_envelope 11, 2
	duty_cycle 0
	sound_call .sub5
	sound_call .sub5
	octave 2
	note B_, 2
	octave 3
	note E_, 2
	octave 2
	note B_, 2
	octave 3
	note E_, 2
	octave 2
	note B_, 2
	octave 3
	note E_, 2
	octave 2
	note B_, 2
	octave 3
	note E_, 2
	octave 2
	note G#, 2
	note B_, 2
	note G#, 2
	note B_, 2
	note G#, 2
	note B_, 2
	note G#, 2
	note F#, 2
	note B_, 2
	octave 3
	note D#, 2
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	note F#, 2
	note D#, 2
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	octave 2
	note A_, 2
	octave 3
	note C#, 2
	octave 2
	note A_, 2
	octave 3
	note C#, 2
	note E_, 2
	note C#, 2
	octave 2
	note A_, 2
	octave 3
	note C#, 2
	octave 2
	note B_, 2
	octave 3
	note E_, 2
	octave 2
	note B_, 2
	octave 3
	note E_, 2
	octave 2
	note B_, 2
	octave 3
	note E_, 2
	octave 2
	note B_, 2
	octave 3
	note E_, 2
	octave 2
	note B_, 2
	octave 3
	note G#, 2
	octave 2
	note B_, 2
	octave 3
	note G#, 2
	octave 2
	note B_, 2
	octave 3
	note G#, 2
	note F#, 2
	note G#, 2
	octave 2
	sound_call .sub5
	sound_call .sub5
	octave 2
	note B_, 2
	octave 3
	note E_, 2
	octave 2
	note B_, 2
	octave 3
	note E_, 2
	octave 2
	note B_, 2
	octave 3
	note E_, 2
	octave 2
	note B_, 2
	octave 3
	note E_, 2
	octave 2
	note G#, 2
	note B_, 2
	note G#, 2
	note B_, 2
	note G#, 2
	note B_, 2
	note G#, 2
	note F#, 2
	note B_, 2
	octave 3
	note D#, 2
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	note F#, 2
	note D#, 2
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	octave 2
	note A_, 2
	octave 3
	note C#, 2
	octave 2
	note A_, 2
	octave 3
	note C#, 2
	note E_, 2
	note C#, 2
	octave 2
	note A_, 2
	octave 3
	note C#, 2
	octave 2
	note B_, 2
	octave 3
	note E_, 2
	octave 2
	note B_, 2
	octave 3
	note E_, 2
	octave 2
	note B_, 2
	octave 3
	note E_, 2
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	octave 2
	note B_, 2
	octave 3
	note G#, 2
	octave 2
	note B_, 2
	octave 3
	note G#, 2
	octave 2
	note B_, 2
	octave 3
	note G#, 2
	octave 2
	note B_, 2
	octave 3
	note G#, 2
	octave 2
	sound_loop 0, .mainloop
.sub1:
	octave 3
	note B_, 2
	note B_, 2
	note B_, 2
	note B_, 2
	note B_, 2
	note G#, 2
	note F#, 2
	note G#, 2
	sound_ret
.sub2:
	octave 3
	note G#, 2
	note A_, 2
	note G#, 2
	note A_, 2
	note G#, 2
	sound_ret
.sub3:
	octave 3
	note C#, 2
	note E_, 2
	note C#, 2
	note E_, 2
	note C#, 2
	note E_, 2
	note C#, 2
	note F#, 2
	sound_ret
.sub4:
	octave 4
	note E_, 4
	note D#, 2
	note E_, 4
	note D#, 2
	note C#, 2
	octave 3
	note B_, 2
	octave 4
	sound_ret
.sub5:
	octave 3
	note C#, 2
	note E_, 2
	note C#, 2
	note E_, 2
	note C#, 2
	note E_, 2
	note C#, 2
	note E_, 2
	sound_ret


Music_Cycling_Ch3:
	stereo_panning TRUE, TRUE
	note_type 12, 1, 4
	vibrato 22, 2, 3
	octave 3
	rest 6
	note E_, 2
	rest 12
	octave 2
	note B_, 2
	octave 3
	note E_, 2
	rest 12
	octave 2
	note B_, 2
	octave 3
	note E_, 2
	rest 2
	note C#, 2
	rest 2
	octave 2
	note B_, 2
	rest 2
	note F#, 2
	rest 2
	note E_, 2
	rest 6
	octave 3
	note E_, 2
	rest 6
.mainloop:
	stereo_panning FALSE, TRUE
	octave 5
	sound_call .sub1
	octave 4
	note B_, 2
	rest 2
	note G#, 2
	rest 8
	sound_call .sub1
	octave 5
	note F#, 2
	rest 2
	note E_, 2
	rest 8
	sound_call .sub1
	octave 4
	note B_, 2
	rest 2
	note G#, 2
	rest 4
	note E_, 2
	note F#, 2
	note A_, 2
	rest 2
	note F#, 2
	rest 2
	note G#, 2
	rest 2
	octave 5
	note D#, 2
	rest 2
	note E_, 2
	rest 14
	stereo_panning TRUE, FALSE
	note_type 12, 2, 4
	octave 4
	note G#, 2
	note A_, 2
	rest 2
	note G#, 2
	rest 2
	note F#, 2
	note G#, 2
	note A_, 2
	note E_, 2
	note F#, 2
	rest 2
	note E_, 2
	rest 2
	note F#, 2
	note G#, 2
	note F#, 2
	note C#, 2
	note E_, 2
	rest 2
	note C#, 2
	rest 2
	note E_, 2
	note C#, 2
	note F#, 2
	note F#, 2
	note A_, 2
	rest 2
	note G#, 2
	rest 2
	note D#, 2
	note F#, 2
	note A_, 2
	note G#, 2
	note A_, 2
	rest 2
	note G#, 2
	rest 2
	note F#, 2
	note G#, 2
	note A_, 2
	note E_, 2
	note F#, 2
	rest 2
	note E_, 2
	rest 2
	note F#, 2
	note G#, 2
	note F#, 2
	note C#, 2
	note E_, 2
	note C#, 2
	note F#, 2
	note C#, 2
	note A_, 2
	rest 2
	note G#, 2
	rest 8
	note F#, 4
	note E_, 4
	stereo_panning FALSE, TRUE
	note_type 12, 1, 4
	octave 5
	sound_call .sub2
	note D#, 2
	note E_, 2
	rest 2
	note G_, 2
	rest 2
	note F#, 2
	rest 2
	note D#, 2
	note E_, 2
	octave 4
	note B_, 2
	octave 5
	sound_call .sub2
	note F#, 2
	note E_, 2
	rest 14
	octave 4
	note B_, 1
	octave 5
	note C#, 1
	sound_loop 0, .mainloop
.sub1:
	octave 5
	note E_, 2
	rest 2
	note D#, 2
	note E_, 2
	rest 2
	note D#, 2
	note C#, 2
	octave 4
	note B_, 2
	note A_, 2
	octave 5
	sound_ret
.sub2:
	octave 5
	note C#, 2
	rest 8
	octave 4
	note A_, 2
	octave 5
	note A_, 2
	note G_, 2
	rest 2
	note E_, 2
	rest 2
	note C#, 2
	rest 2
	note E_, 2
	note D_, 2
	note C#, 2
	octave 4
	note B_, 2
	rest 8
	note G#, 2
	octave 5
	note G#, 2
	note F#, 2
	rest 2
	note E_, 2
	rest 2
	octave 4
	note B_, 2
	octave 5
	rest 2
	note B_, 2
	note G#, 2
	note E_, 2
	note D#, 2
	rest 8
	octave 4
	note B_, 2
	octave 5
	note D#, 2
	note F#, 2
	note A_, 2
	rest 4
	note G#, 2
	rest 2
	note F#, 2
	note E_, 2
	note C#, 2
	note E_, 2
	rest 10
	sound_ret


Music_Cycling_Ch4:
	toggle_noise 3
	drum_speed 12
	rest 6
	drum_note 11, 2
	rest 12
	drum_note 8, 2
	drum_note 11, 2
	rest 12
	drum_note 8, 2
	drum_note 11, 2
	drum_note 8, 2
	drum_note 11, 2
	drum_note 8, 2
	drum_note 11, 2
	drum_note 8, 1
	drum_note 2, 1
	drum_note 8, 2
	drum_note 8, 2
	drum_note 11, 2
	rest 6
	drum_note 3, 2
	rest 6
.mainloop:
.loop0:
	sound_call .sub1
	sound_loop 7, .loop0
	sound_call .sub2
.loop1:
	sound_call .sub1
	sound_loop 4, .loop1
	sound_call .sub3
	sound_call .sub3
	sound_call .sub1
	sound_call .sub2
.loop2:
	sound_call .sub1
	sound_loop 7, .loop2
	sound_call .sub2
.loop3:
	sound_call .sub1
	sound_loop 7, .loop3
	sound_call .sub2
.loop4:
	sound_call .sub1
	sound_loop 7, .loop4
	sound_call .sub2
.loop5:
	sound_call .sub1
	sound_loop 7, .loop5
	sound_call .sub2
.loop6:
	sound_call .sub1
	sound_loop 7, .loop6
	sound_call .sub2
.loop7:
	sound_call .sub1
	sound_loop 7, .loop7
	sound_call .sub2
	sound_loop 0, .mainloop
.sub1:
	drum_note 11, 2
	drum_note 8, 2
	drum_note 3, 2
	drum_note 8, 2
	sound_ret
.sub2:
	drum_note 3, 2
	drum_note 8, 2
	drum_note 3, 2
	drum_note 3, 2
	sound_ret
.sub3:
	drum_note 8, 2
	drum_note 11, 2
	drum_note 3, 2
	drum_note 11, 2
	sound_ret

