ObscuraMuseumEmployeeRoom_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 4 ; warp events
	warp_def  5, 12, 3, OBSCURA_CITY
	warp_def  6, 12, 4, OBSCURA_CITY
	warp_def 12,  5, 3, OBSCURA_MUSEUM_1F
	warp_def 12,  6, 3, OBSCURA_MUSEUM_1F

	db 0 ; coord events

	db 14 ; bg events
	signpost  1,  2, SIGNPOST_UP, ObscuraMuseumBooks
	signpost  1,  3, SIGNPOST_UP, ObscuraMuseumBooks
	signpost  1,  4, SIGNPOST_UP, ObscuraMuseumBooks
	signpost  1,  5, SIGNPOST_UP, ObscuraMuseumBooks
	signpost  1, 10, SIGNPOST_UP, ObscuraMuseumBooks
	signpost  1, 11, SIGNPOST_UP, ObscuraMuseumBooks
	signpost  4,  3, SIGNPOST_UP, ObscuraMuseumComputer1
	signpost  4,  9, SIGNPOST_UP, ObscuraMuseumComputer2
	signpost  8,  3, SIGNPOST_UP, ObscuraMuseumComputer3
	signpost  8,  9, SIGNPOST_UP, ObscuraMuseumComputer4
	signpost  4,  2, SIGNPOST_UP, ObscuraMuseumComputer1
	signpost  4,  8, SIGNPOST_UP, ObscuraMuseumComputer2
	signpost  8,  2, SIGNPOST_UP, ObscuraMuseumComputer3
	signpost  8,  8, SIGNPOST_UP, ObscuraMuseumComputer4

	db 0 ; object events


ObscuraMuseumComputer1:
	end
	
ObscuraMuseumComputer2:
	end
	
ObscuraMuseumComputer3:
	end
	
ObscuraMuseumComputer4:
	end