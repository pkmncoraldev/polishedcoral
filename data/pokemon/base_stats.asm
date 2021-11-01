ev_yield: MACRO
	db (\1 << 6) | (\2 << 4) | (\3 << 2) | \4
	db (\5 << 6) | (\6 << 4)
ENDM

tmhm: MACRO
tms1_24 = 0
tms25_48 = 0
tms49_72 = 0
tms73_96 = 0
tms97_112 = 0
rept _NARG
if def(\1_TMNUM)
	if \1_TMNUM < 25
tms1_24 = tms1_24 | (1 << ((\1_TMNUM) - 1))
	elif \1_TMNUM < 49
tms25_48 = tms25_48 | (1 << ((\1_TMNUM) - 1 - 24))
	elif \1_TMNUM < 73
tms49_72 = tms49_72 | (1 << ((\1_TMNUM) - 1 - 48))
	elif \1_TMNUM < 97
tms73_96 = tms73_96 | (1 << ((\1_TMNUM) - 1 - 72))
	elif \1_TMNUM < 113
tms97_112 = tms97_112 | (1 << ((\1_TMNUM) - 1 - 96))
	else
		fail "\1 overflows base data"
	endc
else
	fail "\1 is not a TM, HM, or move tutor move"
endc
	shift
endr

rept 3
	db tms1_24 & $ff
tms1_24 = tms1_24 >> 8
endr
rept 3
	db tms25_48 & $ff
tms25_48 = tms25_48 >> 8
endr
rept 3
	db tms49_72 & $ff
tms49_72 = tms49_72 >> 8
endr
rept 3
	db tms73_96 & $ff
tms73_96 = tms73_96 >> 8
endr
rept 2
	db tms97_112 & $ff
tms97_112 = tms97_112 >> 8
endr
ENDM

BaseData::

BaseData0::
INCLUDE "data/pokemon/base_stats/bulbasaur.asm"
BaseData1::
INCLUDE "data/pokemon/base_stats/ivysaur.asm"
INCLUDE "data/pokemon/base_stats/venusaur.asm"
INCLUDE "data/pokemon/base_stats/charmander.asm"
INCLUDE "data/pokemon/base_stats/charmeleon.asm"
INCLUDE "data/pokemon/base_stats/charizard.asm"
INCLUDE "data/pokemon/base_stats/squirtle.asm"
INCLUDE "data/pokemon/base_stats/wartortle.asm"
INCLUDE "data/pokemon/base_stats/blastoise.asm"
INCLUDE "data/pokemon/base_stats/pidgey.asm"
INCLUDE "data/pokemon/base_stats/pidgeotto.asm"
INCLUDE "data/pokemon/base_stats/pidgeot.asm"
INCLUDE "data/pokemon/base_stats/rattata.asm"
INCLUDE "data/pokemon/base_stats/raticate.asm"
INCLUDE "data/pokemon/base_stats/pikachu.asm"
INCLUDE "data/pokemon/base_stats/raichu.asm"
INCLUDE "data/pokemon/base_stats/sandshrew.asm"
INCLUDE "data/pokemon/base_stats/sandslash.asm"
INCLUDE "data/pokemon/base_stats/nidoran_f.asm"
INCLUDE "data/pokemon/base_stats/nidorina.asm"
INCLUDE "data/pokemon/base_stats/nidoqueen.asm"
INCLUDE "data/pokemon/base_stats/nidoran_m.asm"
INCLUDE "data/pokemon/base_stats/nidorino.asm"
INCLUDE "data/pokemon/base_stats/nidoking.asm"
INCLUDE "data/pokemon/base_stats/clefairy.asm"
INCLUDE "data/pokemon/base_stats/clefable.asm"
INCLUDE "data/pokemon/base_stats/jigglypuff.asm"
INCLUDE "data/pokemon/base_stats/wigglytuff.asm"
INCLUDE "data/pokemon/base_stats/zubat.asm"
INCLUDE "data/pokemon/base_stats/golbat.asm"
INCLUDE "data/pokemon/base_stats/oddish.asm"
INCLUDE "data/pokemon/base_stats/gloom.asm"
INCLUDE "data/pokemon/base_stats/vileplume.asm"
INCLUDE "data/pokemon/base_stats/meowth.asm"
INCLUDE "data/pokemon/base_stats/persian.asm"
INCLUDE "data/pokemon/base_stats/growlithe.asm"
INCLUDE "data/pokemon/base_stats/arcanine.asm"
INCLUDE "data/pokemon/base_stats/poliwag.asm"
INCLUDE "data/pokemon/base_stats/poliwhirl.asm"
INCLUDE "data/pokemon/base_stats/poliwrath.asm"
INCLUDE "data/pokemon/base_stats/abra.asm"
INCLUDE "data/pokemon/base_stats/kadabra.asm"
INCLUDE "data/pokemon/base_stats/alakazam.asm"
INCLUDE "data/pokemon/base_stats/machop.asm"
INCLUDE "data/pokemon/base_stats/machoke.asm"
INCLUDE "data/pokemon/base_stats/machamp.asm"
INCLUDE "data/pokemon/base_stats/geodude.asm"
INCLUDE "data/pokemon/base_stats/graveler.asm"
INCLUDE "data/pokemon/base_stats/golem.asm"
INCLUDE "data/pokemon/base_stats/ponyta.asm"
INCLUDE "data/pokemon/base_stats/rapidash.asm"
INCLUDE "data/pokemon/base_stats/slowpoke.asm"
INCLUDE "data/pokemon/base_stats/slowbro.asm"
INCLUDE "data/pokemon/base_stats/magnemite.asm"
INCLUDE "data/pokemon/base_stats/magneton.asm"
INCLUDE "data/pokemon/base_stats/doduo.asm"
INCLUDE "data/pokemon/base_stats/dodrio.asm"
INCLUDE "data/pokemon/base_stats/grimer.asm"
INCLUDE "data/pokemon/base_stats/muk.asm"
INCLUDE "data/pokemon/base_stats/gastly.asm"
INCLUDE "data/pokemon/base_stats/haunter.asm"
INCLUDE "data/pokemon/base_stats/gengar.asm"
INCLUDE "data/pokemon/base_stats/onix.asm"
INCLUDE "data/pokemon/base_stats/voltorb.asm"
INCLUDE "data/pokemon/base_stats/electrode.asm"
INCLUDE "data/pokemon/base_stats/exeggcute.asm"
INCLUDE "data/pokemon/base_stats/exeggutor.asm"
INCLUDE "data/pokemon/base_stats/cubone.asm"
INCLUDE "data/pokemon/base_stats/marowak.asm"
INCLUDE "data/pokemon/base_stats/koffing.asm"
INCLUDE "data/pokemon/base_stats/weezing.asm"
INCLUDE "data/pokemon/base_stats/chansey.asm"
INCLUDE "data/pokemon/base_stats/horsea.asm"
INCLUDE "data/pokemon/base_stats/seadra.asm"
INCLUDE "data/pokemon/base_stats/staryu.asm"
INCLUDE "data/pokemon/base_stats/starmie.asm"
INCLUDE "data/pokemon/base_stats/scyther.asm"
INCLUDE "data/pokemon/base_stats/electabuzz.asm"
INCLUDE "data/pokemon/base_stats/magmar.asm"
INCLUDE "data/pokemon/base_stats/tauros.asm"
INCLUDE "data/pokemon/base_stats/magikarp.asm"
INCLUDE "data/pokemon/base_stats/gyarados.asm"
INCLUDE "data/pokemon/base_stats/lapras.asm"
INCLUDE "data/pokemon/base_stats/ditto.asm"
INCLUDE "data/pokemon/base_stats/eevee.asm"
INCLUDE "data/pokemon/base_stats/vaporeon.asm"
INCLUDE "data/pokemon/base_stats/jolteon.asm"
INCLUDE "data/pokemon/base_stats/flareon.asm"
INCLUDE "data/pokemon/base_stats/porygon.asm"
INCLUDE "data/pokemon/base_stats/aerodactyl.asm"
INCLUDE "data/pokemon/base_stats/snorlax.asm"
INCLUDE "data/pokemon/base_stats/dratini.asm"
INCLUDE "data/pokemon/base_stats/dragonair.asm"
INCLUDE "data/pokemon/base_stats/dragonite.asm"

INCLUDE "data/pokemon/base_stats/chikorita.asm"
INCLUDE "data/pokemon/base_stats/bayleef.asm"
INCLUDE "data/pokemon/base_stats/meganium.asm"
INCLUDE "data/pokemon/base_stats/cyndaquil.asm"
INCLUDE "data/pokemon/base_stats/quilava.asm"
INCLUDE "data/pokemon/base_stats/typhlosion.asm"
INCLUDE "data/pokemon/base_stats/totodile.asm"
INCLUDE "data/pokemon/base_stats/croconaw.asm"
INCLUDE "data/pokemon/base_stats/feraligatr.asm"
INCLUDE "data/pokemon/base_stats/ledyba.asm"
INCLUDE "data/pokemon/base_stats/ledian.asm"
INCLUDE "data/pokemon/base_stats/crobat.asm"
INCLUDE "data/pokemon/base_stats/chinchou.asm"
INCLUDE "data/pokemon/base_stats/lanturn.asm"
INCLUDE "data/pokemon/base_stats/togepi.asm"
INCLUDE "data/pokemon/base_stats/togetic.asm"
INCLUDE "data/pokemon/base_stats/natu.asm"
INCLUDE "data/pokemon/base_stats/xatu.asm"
INCLUDE "data/pokemon/base_stats/mareep.asm"
INCLUDE "data/pokemon/base_stats/flaaffy.asm"
INCLUDE "data/pokemon/base_stats/ampharos.asm"
INCLUDE "data/pokemon/base_stats/bellossom.asm"
INCLUDE "data/pokemon/base_stats/marill.asm"
INCLUDE "data/pokemon/base_stats/azumarill.asm"
INCLUDE "data/pokemon/base_stats/sudowoodo.asm"
INCLUDE "data/pokemon/base_stats/politoed.asm"
INCLUDE "data/pokemon/base_stats/wooper.asm"
INCLUDE "data/pokemon/base_stats/quagsire.asm"
INCLUDE "data/pokemon/base_stats/espeon.asm"
INCLUDE "data/pokemon/base_stats/umbreon.asm"
INCLUDE "data/pokemon/base_stats/murkrow.asm"
INCLUDE "data/pokemon/base_stats/slowking.asm"
INCLUDE "data/pokemon/base_stats/pineco.asm"
INCLUDE "data/pokemon/base_stats/forretress.asm"
INCLUDE "data/pokemon/base_stats/gligar.asm"
INCLUDE "data/pokemon/base_stats/steelix.asm"
INCLUDE "data/pokemon/base_stats/snubbull.asm"
INCLUDE "data/pokemon/base_stats/granbull.asm"
INCLUDE "data/pokemon/base_stats/scizor.asm"
INCLUDE "data/pokemon/base_stats/heracross.asm"
INCLUDE "data/pokemon/base_stats/sneasel.asm"
INCLUDE "data/pokemon/base_stats/teddiursa.asm"
INCLUDE "data/pokemon/base_stats/ursaring.asm"
INCLUDE "data/pokemon/base_stats/slugma.asm"
INCLUDE "data/pokemon/base_stats/magcargo.asm"
INCLUDE "data/pokemon/base_stats/swinub.asm"
INCLUDE "data/pokemon/base_stats/piloswine.asm"
INCLUDE "data/pokemon/base_stats/corsola.asm"
INCLUDE "data/pokemon/base_stats/skarmory.asm"
INCLUDE "data/pokemon/base_stats/houndour.asm"
INCLUDE "data/pokemon/base_stats/houndoom.asm"
INCLUDE "data/pokemon/base_stats/kingdra.asm"
INCLUDE "data/pokemon/base_stats/phanpy.asm"
INCLUDE "data/pokemon/base_stats/donphan.asm"
INCLUDE "data/pokemon/base_stats/porygon2.asm"
INCLUDE "data/pokemon/base_stats/stantler.asm"
INCLUDE "data/pokemon/base_stats/smeargle.asm"
INCLUDE "data/pokemon/base_stats/elekid.asm"
INCLUDE "data/pokemon/base_stats/magby.asm"
INCLUDE "data/pokemon/base_stats/miltank.asm"
INCLUDE "data/pokemon/base_stats/blissey.asm"
INCLUDE "data/pokemon/base_stats/larvitar.asm"
INCLUDE "data/pokemon/base_stats/pupitar.asm"
INCLUDE "data/pokemon/base_stats/tyranitar.asm"

INCLUDE "data/pokemon/base_stats/wingull.asm"
INCLUDE "data/pokemon/base_stats/pelipper.asm"
INCLUDE "data/pokemon/base_stats/ralts.asm"
INCLUDE "data/pokemon/base_stats/kirlia.asm"
INCLUDE "data/pokemon/base_stats/gardevoir.asm"
INCLUDE "data/pokemon/base_stats/shroomish.asm"
INCLUDE "data/pokemon/base_stats/breloom.asm"
INCLUDE "data/pokemon/base_stats/aron.asm"
INCLUDE "data/pokemon/base_stats/lairon.asm"
INCLUDE "data/pokemon/base_stats/aggron.asm"
INCLUDE "data/pokemon/base_stats/meditite.asm"
INCLUDE "data/pokemon/base_stats/medicham.asm"
INCLUDE "data/pokemon/base_stats/carvanha.asm"
INCLUDE "data/pokemon/base_stats/sharpedo.asm"
INCLUDE "data/pokemon/base_stats/numel.asm"
INCLUDE "data/pokemon/base_stats/camerupt.asm"
INCLUDE "data/pokemon/base_stats/cacnea.asm"
INCLUDE "data/pokemon/base_stats/cacturne.asm"
INCLUDE "data/pokemon/base_stats/swablu.asm"
INCLUDE "data/pokemon/base_stats/altaria.asm"
INCLUDE "data/pokemon/base_stats/snorunt.asm"
INCLUDE "data/pokemon/base_stats/glalie.asm"

INCLUDE "data/pokemon/base_stats/buizel.asm"
INCLUDE "data/pokemon/base_stats/floatzel.asm"
INCLUDE "data/pokemon/base_stats/drifloon.asm"
INCLUDE "data/pokemon/base_stats/drifblim.asm"
INCLUDE "data/pokemon/base_stats/buneary.asm"
INCLUDE "data/pokemon/base_stats/lopunny.asm"
INCLUDE "data/pokemon/base_stats/honchkrow.asm"
INCLUDE "data/pokemon/base_stats/spiritomb.asm"
INCLUDE "data/pokemon/base_stats/munchlax.asm"
INCLUDE "data/pokemon/base_stats/riolu.asm"
INCLUDE "data/pokemon/base_stats/lucario.asm"
INCLUDE "data/pokemon/base_stats/croagunk.asm"
INCLUDE "data/pokemon/base_stats/toxicroak.asm"
INCLUDE "data/pokemon/base_stats/snover.asm"
INCLUDE "data/pokemon/base_stats/abomasnow.asm"
INCLUDE "data/pokemon/base_stats/weavile.asm"
INCLUDE "data/pokemon/base_stats/magnezone.asm"
INCLUDE "data/pokemon/base_stats/electivire.asm"
INCLUDE "data/pokemon/base_stats/magmortar.asm"
INCLUDE "data/pokemon/base_stats/togekiss.asm"
INCLUDE "data/pokemon/base_stats/leafeon.asm"
INCLUDE "data/pokemon/base_stats/glaceon.asm"
INCLUDE "data/pokemon/base_stats/gliscor.asm"
INCLUDE "data/pokemon/base_stats/mamoswine.asm"
INCLUDE "data/pokemon/base_stats/porygon_z.asm"
INCLUDE "data/pokemon/base_stats/gallade.asm"
INCLUDE "data/pokemon/base_stats/froslass.asm"

INCLUDE "data/pokemon/base_stats/drilbur.asm"
INCLUDE "data/pokemon/base_stats/excadrill.asm"
INCLUDE "data/pokemon/base_stats/venipede.asm"
INCLUDE "data/pokemon/base_stats/whirlipede.asm"
INCLUDE "data/pokemon/base_stats/scolipede.asm"
INCLUDE "data/pokemon/base_stats/cottonee.asm"
INCLUDE "data/pokemon/base_stats/whimsicott.asm"
INCLUDE "data/pokemon/base_stats/sandile.asm"
INCLUDE "data/pokemon/base_stats/krokorok.asm"
INCLUDE "data/pokemon/base_stats/krookodile.asm"
INCLUDE "data/pokemon/base_stats/maractus.asm"
INCLUDE "data/pokemon/base_stats/dwebble.asm"
INCLUDE "data/pokemon/base_stats/crustle.asm"
INCLUDE "data/pokemon/base_stats/scraggy.asm"
INCLUDE "data/pokemon/base_stats/scrafty.asm"
INCLUDE "data/pokemon/base_stats/tirtouga.asm"
INCLUDE "data/pokemon/base_stats/carracosta.asm"
INCLUDE "data/pokemon/base_stats/archen.asm"
INCLUDE "data/pokemon/base_stats/archeops.asm"
INCLUDE "data/pokemon/base_stats/minccino.asm"
INCLUDE "data/pokemon/base_stats/cinccino.asm"
INCLUDE "data/pokemon/base_stats/joltik.asm"
INCLUDE "data/pokemon/base_stats/galvantula.asm"
INCLUDE "data/pokemon/base_stats/litwick.asm"
INCLUDE "data/pokemon/base_stats/lampent.asm"
INCLUDE "data/pokemon/base_stats/chandelure.asm"
INCLUDE "data/pokemon/base_stats/larvesta.asm"
INCLUDE "data/pokemon/base_stats/volcarona.asm"

INCLUDE "data/pokemon/base_stats/sylveon.asm"
INCLUDE "data/pokemon/base_stats/phantump.asm"
INCLUDE "data/pokemon/base_stats/trevenant.asm"
INCLUDE "data/pokemon/base_stats/noibat.asm"
INCLUDE "data/pokemon/base_stats/noivern.asm"

INCLUDE "data/pokemon/base_stats/pikipek.asm"
INCLUDE "data/pokemon/base_stats/trumbeak.asm"
INCLUDE "data/pokemon/base_stats/toucannon.asm"
INCLUDE "data/pokemon/base_stats/mareanie.asm"
INCLUDE "data/pokemon/base_stats/toxapex.asm"

INCLUDE "data/pokemon/base_stats/wyrdeer.asm"

INCLUDE "data/pokemon/base_stats/raichu_a.asm"
INCLUDE "data/pokemon/base_stats/exeggcute.asm"
INCLUDE "data/pokemon/base_stats/exeggutor_a.asm"
INCLUDE "data/pokemon/base_stats/marowak_a.asm"
INCLUDE "data/pokemon/base_stats/grimer_a.asm"
INCLUDE "data/pokemon/base_stats/muk_a.asm"
