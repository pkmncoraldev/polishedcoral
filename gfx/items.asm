UpdateItemIconAndDescription::
	farcall UpdateItemDescription
	jp UpdateItemIcon

UpdateTMHMIconAndDescriptionAndOwnership::
	farcall UpdateTMHMDescriptionAndOwnership
	farcall LoadTMHMIconPalette
	jp SetPalettes
	
UpdateClothesIconAndDescriptionAndOwnership::
	farcall UpdateClothesDescriptionAndOwnership
	call LoadClothesIcons
	jp SetPalettes
	
UpdateDecoIconAndDescriptionAndOwnership::
	farcall UpdateDecoDescriptionAndOwnership
	call LoadClothesIcons
	jp SetPalettes

UpdateMonIconAndDescriptionAndOwnership::
	farcall UpdateMonDescription
	ret
	
UpdateItemIconAndDescriptionAndBagQuantity::
	farcall UpdateItemDescriptionAndBagQuantity
UpdateItemIcon::
	ret

LoadBuyMonIcon::
	ld a, [wMenuSelection]
	cp a, -1
	jr z, .clear
	ld de, PokeBallIcon
	lb bc, BANK(PokeBallIcon), 4
	ld a, 1
	ld [wCurSpecies], a
	ld a, [wPlaceBallsX]
	cp 0
	jr z, .first
	cp 1
	jr z, .second
	cp 2
	jr z, .third
	cp 3
	jr z, .forth
	jr .fifth
.first
	ld hl, VTiles0 tile $68
	jr .finish
.second
	ld hl, VTiles0 tile $6c
	jr .finish
.third
	ld hl, VTiles0 tile $70
	jr .finish
.forth
	ld hl, VTiles0 tile $74
.finish
	call Get2bpp
	farcall LoadItemIconPalette
	ld a, [wPlaceBallsX]
	inc a
	ld [wPlaceBallsX], a
	ret
.fifth
	ld hl, VTiles0 tile $78
	call Get2bpp
	farcall LoadItemIconPalette
	xor a
	ld [wPlaceBallsX], a
	ret
.clear
	ld de, NoItemIcon
	lb bc, BANK(NoItemIcon), 4
	ld hl, VTiles0 tile $78
	jp Get2bpp
	
LoadClothesIcons::
	ld hl, VTiles0 tile $68
	call LoadClothesIcon
	ld hl, VTiles0 tile $6c
	call LoadClothesIcon
	ld hl, VTiles0 tile $70
	call LoadClothesIcon
	ld hl, VTiles0 tile $74
	call LoadClothesIcon
	ld hl, VTiles0 tile $78
	jp LoadClothesIcon
	
LoadClothesIcon:
	ld de, ClothesIcon
	lb bc, BANK(ClothesIcon), 4
	jp Get2bpp


SECTION "Item Icons 1", ROMX

ItemIcons1:
NoItemIcon:						INCBIN "gfx/items/0.2bpp"
PokeBallIcon:     				INCBIN "gfx/items/pokeball_1.2bpp"
GreatBallIcon:    				INCBIN "gfx/items/pokeball_1.2bpp"
UltraBallIcon:    				INCBIN "gfx/items/pokeball_1.2bpp"
MasterBallIcon:   				INCBIN "gfx/items/pokeball_1.2bpp"
SafariBallIcon:   				INCBIN "gfx/items/pokeball_1.2bpp"
LevelBallIcon:    				INCBIN "gfx/items/pokeball_1.2bpp"
LureBallIcon:     				INCBIN "gfx/items/pokeball_1.2bpp"
MoonBallIcon:     				INCBIN "gfx/items/pokeball_1.2bpp"
FriendBallIcon:   				INCBIN "gfx/items/pokeball_1.2bpp"
FastBallIcon:     				INCBIN "gfx/items/pokeball_1.2bpp"
HeavyBallIcon:    				INCBIN "gfx/items/pokeball_1.2bpp"
LoveBallIcon:     				INCBIN "gfx/items/pokeball_1.2bpp"
ParkBallIcon:     				INCBIN "gfx/items/pokeball_1.2bpp"
RepeatBallIcon:   				INCBIN "gfx/items/pokeball_1.2bpp"
TimerBallIcon:    				INCBIN "gfx/items/pokeball_1.2bpp"
NestBallIcon:     				INCBIN "gfx/items/pokeball_1.2bpp"
NetBallIcon:      				INCBIN "gfx/items/pokeball_1.2bpp"
DiveBallIcon:     				INCBIN "gfx/items/pokeball_2.2bpp"
LuxuryBallIcon:   				INCBIN "gfx/items/pokeball_2.2bpp"
HealBallIcon:     				INCBIN "gfx/items/pokeball_3.2bpp"
QuickBallIcon:    				INCBIN "gfx/items/pokeball_2.2bpp"
DuskBallIcon:     				INCBIN "gfx/items/pokeball_2.2bpp"
PremierBallIcon:  				INCBIN "gfx/items/pokeball_3.2bpp"
CherishBallIcon:  				INCBIN "gfx/items/pokeball_3.2bpp"
PotionIcon:
SuperPotionIcon:
HyperPotionIcon:  				INCBIN "gfx/items/potion.2bpp"
MaxPotionIcon:
FullRestoreIcon:  				INCBIN "gfx/items/full_restore.2bpp"
AntidoteIcon:
BurnHealIcon:
ParlyzHealIcon:
AwakeningIcon:
IceHealIcon:      				INCBIN "gfx/items/antidote.2bpp"
FullHealIcon:     				INCBIN "gfx/items/full_heal.2bpp"
ReviveIcon:       				INCBIN "gfx/items/revive.2bpp"
StarPieceIcon:
CometShardIcon:
MaxReviveIcon:    				INCBIN "gfx/items/max_revive.2bpp"
EtherIcon:
MaxEtherIcon:
ElixirIcon:
MaxElixirIcon:    				INCBIN "gfx/items/ether.2bpp"
HPUpIcon:         				INCBIN "gfx/items/hp_up.2bpp"
ProteinIcon:
IronIcon:
CarbosIcon:
CalciumIcon:
ZincIcon:         				INCBIN "gfx/items/protein.2bpp"
RareCandyIcon:    				INCBIN "gfx/items/rare_candy.2bpp"
PPUpIcon:         				INCBIN "gfx/items/pp_up.2bpp"
PPMaxIcon:        				INCBIN "gfx/items/pp_max.2bpp"
FreshWaterIcon:   				INCBIN "gfx/items/fresh_water.2bpp"
SodaPopIcon:      				INCBIN "gfx/items/soda_pop.2bpp"
LemonadeIcon:     				INCBIN "gfx/items/lemonade.2bpp"
MoomooMilkIcon:   				INCBIN "gfx/items/moomoo_milk.2bpp"
RageCandyBarIcon: 				INCBIN "gfx/items/ragecandybar.2bpp"
MooMooBrewIcon:   				INCBIN "gfx/items/moomoo_brew.2bpp"
SoftSandIcon:
BrightPowderIcon:
MetalPowderIcon:
QuickPowderIcon:
StardustIcon:     				INCBIN "gfx/items/stardust.2bpp"
EnergyPowderIcon:
HealPowderIcon:
SilverPowderIcon: 				INCBIN "gfx/items/silver_powder.2bpp"
EnergyRootIcon:   				INCBIN "gfx/items/energy_root.2bpp"
RevivalHerbIcon:  				INCBIN "gfx/items/revival_herb.2bpp"
XAttackIcon:
XDefendIcon:
XSpeedIcon:
XSpclAtkIcon:
XSpclDefIcon:
XAccuracyIcon:
DireHitIcon:
GuardSpecIcon:    				INCBIN "gfx/items/x_item.2bpp"
RepelIcon:
SuperRepelIcon:
MaxRepelIcon:     				INCBIN "gfx/items/repel.2bpp"
EscapeRopeIcon:   				INCBIN "gfx/items/escape_rope.2bpp"			;done by sourapple
PokeDollIcon:     				INCBIN "gfx/items/poke_doll.2bpp"
AbilityCapIcon:   				INCBIN "gfx/items/ability_capsule.2bpp"
LeafStoneIcon:    				INCBIN "gfx/items/leaf_stone.2bpp"
FireStoneIcon:    				INCBIN "gfx/items/fire_stone.2bpp"
WaterStoneIcon:   				INCBIN "gfx/items/water_stone.2bpp"
ThunderStoneIcon: 				INCBIN "gfx/items/thunderstone.2bpp"
MoonStoneIcon:    				INCBIN "gfx/items/moon_stone.2bpp"
SunStoneIcon:     				INCBIN "gfx/items/sun_stone.2bpp"
DuskStoneIcon:    				INCBIN "gfx/items/dusk_stone.2bpp"
ShinyStoneIcon:   				INCBIN "gfx/items/shiny_stone.2bpp"
DawnStoneIcon:    				INCBIN "gfx/items/dawn_stone.2bpp"
EverstoneIcon:    				INCBIN "gfx/items/everstone.2bpp"
BicycleIcon:      				INCBIN "gfx/items/bicycle.2bpp"				;done by gmerc
OldRodIcon:
GoodRodIcon:
SuperRodIcon:					INCBIN "gfx/items/rods.2bpp"				;done by sourapple
CoinCupIcon:     				INCBIN "gfx/items/coin_cup.2bpp"
ItemfinderIcon:   				INCBIN "gfx/items/itemfinder.2bpp"			;done by nuuk
ExpShareIcon:     				INCBIN "gfx/items/exp_share.2bpp"
LibraryCardIcon:  				INCBIN "gfx/items/library_card.2bpp"
PokeFluteIcon:    				INCBIN "gfx/items/pokeflute.2bpp"
TheThingIcon: 	  				INCBIN "gfx/items/the_thing.2bpp"
TorchIcon:        				INCBIN "gfx/items/torch.2bpp"
OldKeyIcon:       				INCBIN "gfx/items/old_key.2bpp"
ClayPotIcon:  	  				INCBIN "gfx/items/clay_pot.2bpp"			;redone by nuuk
ServiceKeyIcon:
Room104KeyIcon:
BRoomKeyIcon:
YRoomKeyIcon:
RRoomKeyIcon:     				INCBIN "gfx/items/twinkle_key.2bpp"
AncientBallIcon:				INCBIN "gfx/items/ancient_ball.2bpp"
RivalPokedexIcon: 				INCBIN "gfx/items/pokedex.2bpp"
SkateboardIcon:   				INCBIN "gfx/items/skateboard.2bpp"
TrainTicketIcon:
TrainPassIcon:    				INCBIN "gfx/items/train_ticket.2bpp"
NettSpecsIcon:    				INCBIN "gfx/items/nett_specs.2bpp"
FlowerPetalIcon:  				INCBIN "gfx/items/flower_petal.2bpp"
SilverTeaIcon:
GoldTeaIcon:
SunshineTeaIcon:
BlossomTeaIcon:   				INCBIN "gfx/items/blossom_tea.2bpp"
SweetHoneyItemIcon:   			INCBIN "gfx/items/sweet_honey.2bpp"
PaintbrushIcon:   				INCBIN "gfx/items/paintbrush.2bpp"
CheriBerryIcon:   				INCBIN "gfx/items/cheri_berry.2bpp"			;done by sourapple
ChestoBerryIcon:  				INCBIN "gfx/items/chesto_berry.2bpp"		;done by sourapple
PechaBerryIcon:   				INCBIN "gfx/items/pecha_berry.2bpp"			;done by sourapple
RawstBerryIcon:   				INCBIN "gfx/items/rawst_berry.2bpp"			;done by sourapple
AspearBerryIcon:  				INCBIN "gfx/items/aspear_berry.2bpp"		;done by sourapple
LeppaBerryIcon:   				INCBIN "gfx/items/leppa_berry.2bpp"			;done by sourapple
OranBerryIcon:    				INCBIN "gfx/items/oran_berry.2bpp"			;done by sourapple
PersimBerryIcon:  				INCBIN "gfx/items/persim_berry.2bpp"		;done by sourapple
LumBerryIcon:     				INCBIN "gfx/items/lum_berry.2bpp"			;done by sourapple
SitrusBerryIcon:  				INCBIN "gfx/items/sitrus_berry.2bpp"		;done by sourapple
FigyBerryIcon:    				INCBIN "gfx/items/figy_berry.2bpp"			;done by sourapple
BerryJuiceIcon:					INCBIN "gfx/items/berry_juice.2bpp"
SilkScarfIcon:
ChoiceScarfIcon:  				INCBIN "gfx/items/choice_scarf.2bpp"
FocusSashIcon:
BlackBeltIcon:    				INCBIN "gfx/items/black_belt.2bpp"
SharpBeakIcon:    				INCBIN "gfx/items/sharp_beak.2bpp"
PoisonBarbIcon:   				INCBIN "gfx/items/poison_barb.2bpp"			;redone by sourapple
HardStoneIcon:    				INCBIN "gfx/items/hard_stone.2bpp"
SpellTagIcon:     				INCBIN "gfx/items/spell_tag.2bpp"
MetalCoatIcon:    				INCBIN "gfx/items/metal_coat.2bpp"
CharcoalIcon:     				INCBIN "gfx/items/charcoal.2bpp"
MysticWaterIcon:  				INCBIN "gfx/items/mystic_water.2bpp"
MiracleSeedIcon:  				INCBIN "gfx/items/miracle_seed.2bpp"
MagnetIcon:       				INCBIN "gfx/items/magnet.2bpp"				;done by danny
TwistedSpoonIcon: 				INCBIN "gfx/items/twistedspoon.2bpp"
NeverMeltIceIcon: 				INCBIN "gfx/items/nevermeltice.2bpp"
DragonFangIcon:   				INCBIN "gfx/items/fang.2bpp"
BlackGlassesIcon: 				INCBIN "gfx/items/nett_specs.2bpp"
PinkBowIcon:      				INCBIN "gfx/items/pink_bow.2bpp"
ScopeLensIcon:    				INCBIN "gfx/items/0.2bpp"
QuickClawIcon:    				INCBIN "gfx/items/fang.2bpp"
KingsRockIcon:    				INCBIN "gfx/items/kings_rock.2bpp"
FocusBandIcon:    				INCBIN "gfx/items/focus_band.2bpp"
LeftoversIcon:    				INCBIN "gfx/items/leftovers.2bpp"
LuckyEggIcon:     				INCBIN "gfx/items/lucky_egg.2bpp"
AmuletCoinIcon:					INCBIN "gfx/items/amulet_coin.2bpp"
CleanseTagIcon:   				INCBIN "gfx/items/cleanse_tag.2bpp"
SmokeBallIcon:    				INCBIN "gfx/items/smoke_ball.2bpp"
TapePlayerIcon:   				INCBIN "gfx/items/tape_player.2bpp"
LightBallIcon:    				INCBIN "gfx/items/light_ball.2bpp"
LinkCableIcon:    				INCBIN "gfx/items/link_cable.2bpp"
ThickClubIcon:     				
RareBoneIcon:					INCBIN "gfx/items/thick_club.2bpp"
LuckyPunchIcon:   				INCBIN "gfx/items/lucky_punch.2bpp"
PollenPouchIcon:  				INCBIN "gfx/items/pollen_pouch.2bpp"
DubiousDogIcon:   				INCBIN "gfx/items/dubious_dog.2bpp"			;done by nuuk
AssaultVestIcon:  				INCBIN "gfx/items/0.2bpp"
BigRootIcon:      				INCBIN "gfx/items/big_root.2bpp"
FiveStarHelmIcon:  				INCBIN "gfx/items/fivestarhelm.2bpp"
DestinyKnotIcon:  				INCBIN "gfx/items/destiny_knot.2bpp"
EvioliteIcon:     				INCBIN "gfx/items/eviolite.2bpp"
ExpertBeltIcon:   				INCBIN "gfx/items/expert_belt.2bpp"
GripClawIcon:     				INCBIN "gfx/items/razor_claw.2bpp"
LifeOrbIcon:      				INCBIN "gfx/items/life_orb.2bpp"
LightClayIcon:    				INCBIN "gfx/items/everstone.2bpp"
MetronomeIIcon:   				INCBIN "gfx/items/metronome.2bpp"
MuscleBandIcon:   				INCBIN "gfx/items/muscle_band.2bpp"
RockyHelmetIcon:  				INCBIN "gfx/items/0.2bpp"
SafeGogglesIcon:  				INCBIN "gfx/items/0.2bpp"
ShedShellIcon:    				INCBIN "gfx/items/0.2bpp"
ShellBellIcon:    				INCBIN "gfx/items/shell_bell.2bpp"
SootheBellIcon:   				INCBIN "gfx/items/soothe_bell.2bpp"
CoralShardIcon:   				INCBIN "gfx/items/coral_shard.2bpp"
WideLensIcon:     				INCBIN "gfx/items/0.2bpp"
WiseGlassesIcon:  				INCBIN "gfx/items/nett_specs.2bpp"
ZoomLensIcon:     				INCBIN "gfx/items/0.2bpp"
GoldLeafIcon:
SilverLeafIcon:
MentalHerbIcon:
PowerHerbIcon:
WhiteHerbIcon:    				INCBIN "gfx/items/white_herb.2bpp"
DampRockIcon:     				INCBIN "gfx/items/0.2bpp"
HeatRockIcon:     				INCBIN "gfx/items/0.2bpp"
SmoothRockIcon:   				INCBIN "gfx/items/0.2bpp"
IcyRockIcon:      				INCBIN "gfx/items/0.2bpp"
ChoiceBandIcon:   				INCBIN "gfx/items/choice_band.2bpp"
ChoiceSpecsIcon:  				INCBIN "gfx/items/nett_specs.2bpp"
FlameOrbIcon:     				INCBIN "gfx/items/flame_orb.2bpp"
ToxicOrbIcon:     				INCBIN "gfx/items/toxic_orb.2bpp"
BlackSludgeIcon:  				INCBIN "gfx/items/black_sludge.2bpp"
MachoBraceIcon:   				INCBIN "gfx/items/macho_brace.2bpp"
DragonScaleIcon:  				INCBIN "gfx/items/flower_petal.2bpp"
UpGradeIcon:
DubiousDiscIcon:  				INCBIN "gfx/items/up_grade.2bpp"
BigMalasadaIcon:				INCBIN "gfx/items/big_malasada.2bpp"
ElectirizerIcon:  				INCBIN "gfx/items/electirizer.2bpp"
MagmarizerIcon:   				INCBIN "gfx/items/magmarizer.2bpp"
RazorFangIcon:    				INCBIN "gfx/items/fang.2bpp"
RazorClawIcon:    				INCBIN "gfx/items/razor_claw.2bpp"
ChlorophialIcon:	  			INCBIN "gfx/items/chlorophial.2bpp"
NuggetIcon:       				INCBIN "gfx/items/nugget.2bpp"
BigNuggetIcon:    				INCBIN "gfx/items/big_nugget.2bpp"
BlackPearlIcon:
PearlIcon:        				INCBIN "gfx/items/pearl.2bpp"
BigPearlIcon:     				INCBIN "gfx/items/big_pearl.2bpp"
SlowpokeTailIcon: 				INCBIN "gfx/items/fang.2bpp"
BottleCapIcon:    				INCBIN "gfx/items/bottle_cap.2bpp"
CoverFossilIcon: 	  			INCBIN "gfx/items/cover_fossil.2bpp"
PlumeFossilIcon:   				INCBIN "gfx/items/plume_fossil.2bpp"
MiracleTonicIcon:  				INCBIN "gfx/items/miracle_tonic.2bpp"
RockCandyIcon:  				INCBIN "gfx/items/rock_candy.2bpp"

ClothesIcon:      				INCBIN "gfx/items/0.2bpp"
