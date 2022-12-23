INCLUDE "constants.asm"


SECTION "Audio", ROMX

INCLUDE "audio/engine.asm"

INCLUDE "data/trainers/encounter_music.asm"

INCLUDE "audio/music_pointers.asm"

INCLUDE "audio/music/nothing.asm"

INCLUDE "audio/cry_pointers.asm"

INCLUDE "audio/sfx_pointers.asm"


SECTION "Music 1", ROMX

INCLUDE "audio/music/titlescreen.asm"
INCLUDE "audio/music/titlescreen2.asm"
INCLUDE "audio/music/devmessage.asm"
INCLUDE "audio/music/devmessageend.asm"
INCLUDE "audio/music/mom.asm"
INCLUDE "audio/music/wildpokemonvictory.asm" ; shares with successfulcapture.asm
INCLUDE "audio/music/successfulcapture.asm" ; shares with wildpokemonvictory.asm
INCLUDE "audio/music/pokemoncenter.asm"
INCLUDE "audio/music/healpokemon.asm"
INCLUDE "audio/music/trainervictory.asm"
INCLUDE "audio/music/rivalbattle.asm"
INCLUDE "audio/music/evolution.asm"
INCLUDE "audio/music/gym.asm"
INCLUDE "audio/music/gymbattle.asm"
INCLUDE "audio/music/gymleadervictory.asm"
INCLUDE "audio/music/halloffame.asm"
INCLUDE "audio/music/credits.asm"
INCLUDE "audio/music/postcredits.asm"
INCLUDE "audio/music/sprucelab.asm"


SECTION "Music 2", ROMX
INCLUDE "audio/music/sunsetbay.asm"
INCLUDE "audio/music/route1.asm"
INCLUDE "audio/music/route2.asm"
INCLUDE "audio/music/daybreakvillage.asm"
INCLUDE "audio/music/snes_smw.asm"
INCLUDE "audio/music/snes_kirby.asm"
INCLUDE "audio/music/daybreakgrotto.asm"
INCLUDE "audio/music/snareinvasion.asm"
INCLUDE "audio/music/starglowvalley.asm"
INCLUDE "audio/music/eventide.asm"
INCLUDE "audio/music/clown.asm"
INCLUDE "audio/music/minibossbattle.asm"
INCLUDE "audio/music/shimmercity.asm"


SECTION "Music 3", ROMX
INCLUDE "audio/music/glintcity.asm"
INCLUDE "audio/music/route4.asm"
INCLUDE "audio/music/coraldev1.asm"
INCLUDE "audio/music/glintgrove.asm"
INCLUDE "audio/music/lava.asm"
INCLUDE "audio/music/sunbeamisland.asm"
INCLUDE "audio/music/route10.asm"
INCLUDE "audio/music/lustercity.asm"
INCLUDE "audio/music/lustersewer.asm"
INCLUDE "audio/music/wildbattle.asm"
INCLUDE "audio/music/trainerbattle.asm"
INCLUDE "audio/music/dodriorace.asm"
INCLUDE "audio/music/encountergymleader.asm"


SECTION "Music 4", ROMX
INCLUDE "audio/music/gscgamecorner.asm"
INCLUDE "audio/music/oasis.asm"
INCLUDE "audio/music/mountaintop.asm"
INCLUDE "audio/music/snarebattle.asm"
INCLUDE "audio/music/snareadminbattle.asm"
INCLUDE "audio/music/snareleaderbattle.asm"
INCLUDE "audio/music/train.asm"
INCLUDE "audio/music/trainstartup.asm"
INCLUDE "audio/music/snaretheme.asm"
INCLUDE "audio/music/twinkletown.asm"
INCLUDE "audio/music/waterroute.asm"
INCLUDE "audio/music/eventidevillage.asm"
INCLUDE "audio/music/snarevictory.asm"
INCLUDE "audio/music/tvstatic.asm"
INCLUDE "audio/music/wildboss.asm"
INCLUDE "audio/music/flickerstation.asm"
INCLUDE "audio/music/route12.asm"


SECTION "Music 5", ROMX




SECTION "Music 6", ROMX




SECTION "Music 7", ROMX




SECTION "Music 8", ROMX




SECTION "Music 9", ROMX




SECTION "Music 10", ROMX




SECTION "Music 11", ROMX




SECTION "Music 12", ROMX




SECTION "Music 13", ROMX



SECTION "Music 14", ROMX




SECTION "RBY Music 1", ROMX



SECTION "RBY Music 2", ROMX



SECTION "RSE Music 1", ROMX



SECTION "RSE Music 2", ROMX



SECTION "DPPt Music 1", ROMX



SECTION "DPPt Music 2", ROMX



SECTION "HGSS Music 1", ROMX



SECTION "HGSS Music 2", ROMX



SECTION "BW Music 1", ROMX



SECTION "BW Music 2", ROMX



SECTION "B2W2 Music 1", ROMX



SECTION "B2W2 Music 2", ROMX


SECTION "XY Music 1", ROMX



SECTION "XY Music 2", ROMX



SECTION "XY Music 3", ROMX



SECTION "ORAS Music 1", ROMX



SECTION "ORAS Music 2", ROMX



SECTION "SM Music 1", ROMX



SECTION "SM Music 2", ROMX



SECTION "Prism Music", ROMX



SECTION "Go Music", ROMX



SECTION "Stadium Music", ROMX



SECTION "Encounter Music", ROMX
INCLUDE "audio/music/encounter/aftertherivalfight.asm" ; shares with lookrival.asm
INCLUDE "audio/music/encounter/rival_encounter.asm" ; shares with aftertherivalfight.asm
INCLUDE "audio/music/encounter/youngster_encounter.asm"
INCLUDE "audio/music/encounter/lass_encounter.asm"
INCLUDE "audio/music/encounter/hiker_encounter.asm"
INCLUDE "audio/music/encounter/pokemaniac_encounter.asm"
INCLUDE "audio/music/encounter/gentleman_encounter.asm"
INCLUDE "audio/music/encounter/hardcore_encounter.asm"
INCLUDE "audio/music/encounter/teamsnare_encounter.asm"
INCLUDE "audio/music/encounter/afterteamsnare_encounter.asm"


SECTION "Sound Effects", ROMX

INCLUDE "audio/sfx.asm"


SECTION "Crystal Sound Effects", ROMX

INCLUDE "audio/sfx_crystal.asm"


SECTION "Coral Sound Effects", ROMX

INCLUDE "audio/sfx_coral.asm"


SECTION "Cries", ROMX

INCLUDE "data/pokemon/cries.asm"

INCLUDE "audio/cries.asm"


SECTION "DED", ROMX

INCLUDE "audio/ded.asm"

INCLUDE "audio/ded/files.asm"
