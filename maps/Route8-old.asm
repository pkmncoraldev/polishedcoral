const_value set 2

Route12_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0


Route12_MapEventHeader:: db 0, 0

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 6
	person_event SPRITE_YOUNGSTER, 4, 34, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route2SouthNPC1, -1
	person_event SPRITE_LASS, 24, 55, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route2SouthNPC2, -1
	person_event SPRITE_FISHER, 6, 43, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerRoute2South_1, -1
	person_event SPRITE_POKEFAN_M, 13, 40, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 3, TrainerRoute2South_2, -1
	person_event SPRITE_POKEFAN_F, 13, 55, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 3, TrainerRoute2South_3, -1
	person_event SPRITE_FISHER, 20, 62, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 3, TrainerRoute2South_4, -1

Route2SouthNPC1:
	jumptextfaceplayer Route2SouthNPC1Text
	
Route2SouthNPC2:
	jumptextfaceplayer Route2SouthNPC2Text
	
TrainerRoute2South_1:
	trainer EVENT_BEAT_ROUTE_2_SOUTH_TRAINER_1, FISHER, 9, TrainerRoute2South_1SeenText, TrainerRoute2South_1BeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext TrainerRoute2South_1NormalText
	waitbutton
	closetext
	end
	
TrainerRoute2South_2:
	trainer EVENT_BEAT_ROUTE_2_SOUTH_TRAINER_2, POKEFANM, 4, TrainerRoute2South_2SeenText, TrainerRoute2South_2BeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext TrainerRoute2South_2NormalText
	waitbutton
	closetext
	end
	
TrainerRoute2South_3:
	trainer EVENT_BEAT_ROUTE_2_SOUTH_TRAINER_3, POKEFANF, 3, TrainerRoute2South_3SeenText, TrainerRoute2South_3BeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext TrainerRoute2South_3NormalText
	waitbutton
	closetext
	end
	
TrainerRoute2South_4:
	trainer EVENT_BEAT_ROUTE_2_SOUTH_TRAINER_4, HIKER, 12, TrainerRoute2South_4SeenText, TrainerRoute2South_4BeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext TrainerRoute2South_4NormalText
	waitbutton
	closetext
	end
	
Route2SouthNPC1Text:
	text "TEXT 1"
	done
	
Route2SouthNPC2Text:
	text "TEXT 2"
	done
	
TrainerRoute2South_1SeenText:
	text "TEXT"
	done
	
TrainerRoute2South_1BeatenText:
	text "TEXT"
	done
	
TrainerRoute2South_1NormalText:
	text "TEXT"
	done
	
TrainerRoute2South_2SeenText:
	text "TEXT"
	done
	
TrainerRoute2South_2BeatenText:
	text "TEXT"
	done
	
TrainerRoute2South_2NormalText:
	text "TEXT"
	done
	
TrainerRoute2South_3SeenText:
	text "TEXT"
	done
	
TrainerRoute2South_3BeatenText:
	text "TEXT"
	done
	
TrainerRoute2South_3NormalText:
	text "TEXT"
	done
	
TrainerRoute2South_4SeenText:
	text "TEXT"
	done
	
TrainerRoute2South_4BeatenText:
	text "TEXT"
	done
	
TrainerRoute2South_4NormalText:
	text "TEXT"
	done