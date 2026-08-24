BeaconAtoll_MapScriptHeader:
	db 1 ; scene scripts
	scene_script BeaconAtollTrigger0

	db 0 ; callbacks

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
	
	
BeaconAtollTrigger0:
	special Special_UpdatePalsInstant
	end
