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
INCLUDE "audio/music/mom.asm"
INCLUDE "audio/music/wildpokemonvictory.asm" ; shares with successfulcapture.asm
INCLUDE "audio/music/successfulcapture.asm" ; shares with wildpokemonvictory.asm
INCLUDE "audio/music/pokemoncenter.asm"
INCLUDE "audio/music/healpokemon.asm"
INCLUDE "audio/music/lookyoungster.asm"
INCLUDE "audio/music/trainervictory.asm"
INCLUDE "audio/music/looksage.asm"
INCLUDE "audio/music/lookrival.asm" ; shares with aftertherivalfight.asm
INCLUDE "audio/music/rivalbattle.asm"
INCLUDE "audio/music/aftertherivalfight.asm" ; shares with lookrival.asm
INCLUDE "audio/music/evolution.asm"
INCLUDE "audio/music/gym.asm"
INCLUDE "audio/music/gymleadervictory.asm"
INCLUDE "audio/music/looklass.asm"
INCLUDE "audio/music/lookkimonogirl.asm"
INCLUDE "audio/music/lookmysticalman.asm"
INCLUDE "audio/music/lookpokemaniac.asm"
INCLUDE "audio/music/lookbeauty.asm"
INCLUDE "audio/music/halloffame.asm"
INCLUDE "audio/music/lookhiker.asm"
INCLUDE "audio/music/lookofficer.asm"
INCLUDE "audio/music/credits.asm"
INCLUDE "audio/music/postcredits.asm"
INCLUDE "audio/music/elmslab.asm"


SECTION "Music 2", ROMX
INCLUDE "audio/music/sunsetbay.asm"
INCLUDE "audio/music/route1.asm"
INCLUDE "audio/music/route2.asm"
INCLUDE "audio/music/daybreakvillage.asm"
INCLUDE "audio/music/snes_smw.asm"
INCLUDE "audio/music/snes_kirby.asm"
INCLUDE "audio/music/wildbattleshiny.asm"
INCLUDE "audio/music/wildbattleshinyintro.asm"
INCLUDE "audio/music/daybreakgrotto.asm"
INCLUDE "audio/music/gymbattle.asm"



SECTION "Music 3", ROMX
INCLUDE "audio/music/glintcity.asm"
INCLUDE "audio/music/route4.asm"
INCLUDE "audio/music/coraldev1.asm"
INCLUDE "audio/music/glintgrove.asm"
INCLUDE "audio/music/lava.asm"
INCLUDE "audio/music/route10.asm"
INCLUDE "audio/music/luster.asm"
INCLUDE "audio/music/lustersewer.asm"
INCLUDE "audio/music/snowtown.asm"
INCLUDE "audio/music/wildbattle.asm"
INCLUDE "audio/music/trainerbattle.asm"



SECTION "Music 4", ROMX




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



SECTION "Movie 2000 Music", ROMX



SECTION "Sound Effects", ROMX

INCLUDE "audio/sfx.asm"


SECTION "Crystal Sound Effects", ROMX

INCLUDE "audio/sfx_crystal.asm"


SECTION "Cries", ROMX

INCLUDE "data/pokemon/cries.asm"

INCLUDE "audio/cries.asm"
