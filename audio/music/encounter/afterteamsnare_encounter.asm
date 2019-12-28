Music_AfterTeamSnareEncounter:
	musicheader 4, 1, Music_TeamSnareEncounter_Ch1_loop
	musicheader 1, 2, Music_TeamSnareEncounter_Ch2_loop
	musicheader 1, 3, Music_TeamSnareEncounter_Ch3_loop
	musicheader 1, 4, Music_AfterTeamSnareEncounter_Ch4_Initial

Music_AfterTeamSnareEncounter_Ch4_Initial:
	togglenoise 3
	notetype $C
	loopchannel 0, Music_TeamSnareEncounter_Ch4_loop
