UpdateItemIconAndDescription::
	farcall UpdateItemDescription
	jp UpdateItemIcon

UpdateTMHMIconAndDescriptionAndOwnership::
	farcall UpdateTMHMDescriptionAndOwnership
	call LoadTMHMIcon
	farcall LoadTMHMIconPalette
	jp SetPalettes
	
UpdateClothesIconAndDescriptionAndOwnership::
	farcall UpdateClothesDescriptionAndOwnership
	call LoadClothesIcons
;	farcall LoadClothesIconPalette
	jp SetPalettes

UpdateMonIconAndDescriptionAndOwnership::
	farcall UpdateMonDescription
	ret
	
UpdateItemIconAndDescriptionAndBagQuantity::
	farcall UpdateItemDescriptionAndBagQuantity
UpdateItemIcon::
;	ld hl, ItemIconPointers
;	ld a, [wCurSpecies]
;	ld e, a
;	ld d, 0
;	add hl, de
;	add hl, de
;	ld a, [hli]
;	ld h, [hl]
;	ld l, a
;	ld de, VTiles2 tile $1e
;	call GetItemIconBank
;	call DecompressRequest2bpp
;	farcall LoadItemIconPalette
;	jp SetPalettes

;GetItemIconBank:
;	lb bc, BANK(ItemIcons1), 9
;	ld a, [wCurSpecies]
;	cp SCOPE_LENS ; first icon in ItemIcons2
;	ret c
;	cp METAL_POWDER ; after Scope Lens, but in ItemIcons1
;	ret z
;	cp QUICK_POWDER ; after Scope Lens, but in ItemIcons1
;	ret z
;	cp STARDUST ; after Scope Lens, but in ItemIcons1
;	ret z
;	cp CHOICE_SCARF ; after Scope Lens, but in ItemIcons1
;	ret z
;	cp ITEM_FROM_MEM
;	ret z
;	lb bc, BANK(ItemIcons2), 9
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
	ld a, [wPlaceBallsX]
	cp 0
	jr z, .first2
	cp 1
	jr z, .second2
	cp 2
	jr z, .third2
	cp 3
	jr z, .forth2
	jr .fifth2
.first2
	ld de, NoItemIcon
	lb bc, BANK(NoItemIcon), 4
	ld hl, VTiles0 tile $68
	call Get2bpp
.second2
	ld de, NoItemIcon
	lb bc, BANK(NoItemIcon), 4
	ld hl, VTiles0 tile $6c
	call Get2bpp
.third2
	ld de, NoItemIcon
	lb bc, BANK(NoItemIcon), 4
	ld hl, VTiles0 tile $70
	call Get2bpp
.forth2
	ld de, NoItemIcon
	lb bc, BANK(NoItemIcon), 4
	ld hl, VTiles0 tile $74
	call Get2bpp
.fifth2
	ld de, NoItemIcon
	lb bc, BANK(NoItemIcon), 4
	ld hl, VTiles0 tile $78
	jp Get2bpp
	
LoadTMHMIcon::
	ld hl, TMHMIcon
	ld de, VTiles2 tile $1e
	lb bc, BANK(TMHMIcon), 9
	jp DecompressRequest2bpp
	
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
EscapeRopeIcon:   				INCBIN "gfx/items/1.2bpp"
PokeDollIcon:     				INCBIN "gfx/items/poke_doll.2bpp"
AbilityCapIcon:   				INCBIN "gfx/items/1.2bpp"
LeafStoneIcon:    				INCBIN "gfx/items/leaf_stone.2bpp"
FireStoneIcon:    				INCBIN "gfx/items/fire_stone.2bpp"
WaterStoneIcon:   				INCBIN "gfx/items/water_stone.2bpp"
ThunderStoneIcon: 				INCBIN "gfx/items/thunderstone.2bpp"
MoonStoneIcon:    				INCBIN "gfx/items/moon_stone.2bpp"
SunStoneIcon:     				INCBIN "gfx/items/1.2bpp"
DuskStoneIcon:    				INCBIN "gfx/items/1.2bpp"
ShinyStoneIcon:   				INCBIN "gfx/items/1.2bpp"
DawnStoneIcon:    				INCBIN "gfx/items/1.2bpp"
EverstoneIcon:    				INCBIN "gfx/items/1.2bpp"
BicycleIcon:      				INCBIN "gfx/items/bicycle.2bpp"				;done by gmerc
OldRodIcon:       				INCBIN "gfx/items/1.2bpp"
GoodRodIcon:      				INCBIN "gfx/items/1.2bpp"
SuperRodIcon:     				INCBIN "gfx/items/1.2bpp"
CoinCupIcon:     				INCBIN "gfx/items/coin_cup.2bpp"
ItemfinderIcon:   				INCBIN "gfx/items/1.2bpp"
ExpShareIcon:     				INCBIN "gfx/items/1.2bpp"
LibraryCardIcon:  				INCBIN "gfx/items/library_card.2bpp"
PokeFluteIcon:    				INCBIN "gfx/items/1.2bpp"
TheThingIcon: 	  				INCBIN "gfx/items/1.2bpp"
TorchIcon:        				INCBIN "gfx/items/torch.2bpp"
OldKeyIcon:       				INCBIN "gfx/items/1.2bpp"
ClayPotIcon:  	  				INCBIN "gfx/items/1.2bpp"
BRoomKeyIcon:
YRoomKeyIcon:
RRoomKeyIcon:     				INCBIN "gfx/items/twinkle_key.2bpp"
AncientBallIcon:				INCBIN "gfx/items/ancient_ball.2bpp"
RivalPokedexIcon: 				INCBIN "gfx/items/pokedex.2bpp"
SkateboardIcon:   				INCBIN "gfx/items/skateboard.2bpp"
TrainTicketIcon:
TrainPassIcon:    				INCBIN "gfx/items/train_ticket.2bpp"
ShinyCharmIcon:   				INCBIN "gfx/items/1.2bpp"
FlowerPetalIcon:  				INCBIN "gfx/items/flower_petal.2bpp"
SunshineTeaIcon:
BlossomTeaIcon:   				INCBIN "gfx/items/blossom_tea.2bpp"
PaintbrushIcon:   				INCBIN "gfx/items/paintbrush.2bpp"
CheriBerryIcon:   				INCBIN "gfx/items/1.2bpp"
ChestoBerryIcon:  				INCBIN "gfx/items/1.2bpp"
PechaBerryIcon:   				INCBIN "gfx/items/1.2bpp"
RawstBerryIcon:   				INCBIN "gfx/items/1.2bpp"
AspearBerryIcon:  				INCBIN "gfx/items/1.2bpp"
LeppaBerryIcon:   				INCBIN "gfx/items/1.2bpp"
OranBerryIcon:    				INCBIN "gfx/items/1.2bpp"
PersimBerryIcon:  				INCBIN "gfx/items/1.2bpp"
LumBerryIcon:     				INCBIN "gfx/items/1.2bpp"
SitrusBerryIcon:  				INCBIN "gfx/items/1.2bpp"
FigyBerryIcon:    				INCBIN "gfx/items/1.2bpp"
BerryJuiceIcon:					INCBIN "gfx/items/berry_juice.2bpp"
SilkScarfIcon:
ChoiceScarfIcon:  				INCBIN "gfx/items/1.2bpp"
BlackBeltIcon:    				INCBIN "gfx/items/1.2bpp"
SharpBeakIcon:    				INCBIN "gfx/items/1.2bpp"
PoisonBarbIcon:   				INCBIN "gfx/items/1.2bpp"
HardStoneIcon:    				INCBIN "gfx/items/1.2bpp"
SpellTagIcon:     				INCBIN "gfx/items/1.2bpp"
MetalCoatIcon:    				INCBIN "gfx/items/1.2bpp"
CharcoalIcon:     				INCBIN "gfx/items/1.2bpp"
MysticWaterIcon:  				INCBIN "gfx/items/1.2bpp"
MiracleSeedIcon:  				INCBIN "gfx/items/1.2bpp"
MagnetIcon:       				INCBIN "gfx/items/1.2bpp"
TwistedSpoonIcon: 				INCBIN "gfx/items/1.2bpp"
NeverMeltIceIcon: 				INCBIN "gfx/items/1.2bpp"
DragonFangIcon:   				INCBIN "gfx/items/1.2bpp"
BlackGlassesIcon: 				INCBIN "gfx/items/1.2bpp"
PinkBowIcon:      				INCBIN "gfx/items/1.2bpp"
ScopeLensIcon:    				INCBIN "gfx/items/1.2bpp"
QuickClawIcon:    				INCBIN "gfx/items/1.2bpp"
KingsRockIcon:    				INCBIN "gfx/items/1.2bpp"
FocusBandIcon:    				INCBIN "gfx/items/1.2bpp"
LeftoversIcon:    				INCBIN "gfx/items/1.2bpp"
LuckyEggIcon:     				INCBIN "gfx/items/lucky_egg.2bpp"
AmuletCoinIcon:					INCBIN "gfx/items/amulet_coin.2bpp"
CleanseTagIcon:   				INCBIN "gfx/items/1.2bpp"
SmokeBallIcon:    				INCBIN "gfx/items/1.2bpp"
TapePlayerIcon:   				INCBIN "gfx/items/1.2bpp"
LightBallIcon:    				INCBIN "gfx/items/1.2bpp"
LinkCableIcon:    				INCBIN "gfx/items/1.2bpp"
ThickClubIcon:     				INCBIN "gfx/items/1.2bpp"
LuckyPunchIcon:   				INCBIN "gfx/items/1.2bpp"
PollenPouchIcon:  				INCBIN "gfx/items/1.2bpp"
AirBalloonIcon:   				INCBIN "gfx/items/1.2bpp"
AssaultVestIcon:  				INCBIN "gfx/items/1.2bpp"
BigRootIcon:      				INCBIN "gfx/items/1.2bpp"
BindingBandIcon:  				INCBIN "gfx/items/1.2bpp"
DestinyKnotIcon:  				INCBIN "gfx/items/1.2bpp"
EvioliteIcon:     				INCBIN "gfx/items/1.2bpp"
ExpertBeltIcon:   				INCBIN "gfx/items/1.2bpp"
FocusSashIcon:    				INCBIN "gfx/items/1.2bpp"
GripClawIcon:     				INCBIN "gfx/items/1.2bpp"
LifeOrbIcon:      				INCBIN "gfx/items/1.2bpp"
LightClayIcon:    				INCBIN "gfx/items/1.2bpp"
MetronomeIIcon:   				INCBIN "gfx/items/1.2bpp"
MuscleBandIcon:   				INCBIN "gfx/items/1.2bpp"
ProtectPadsIcon:  				INCBIN "gfx/items/1.2bpp"
RockyHelmetIcon:  				INCBIN "gfx/items/1.2bpp"
SafeGogglesIcon:  				INCBIN "gfx/items/1.2bpp"
ShedShellIcon:    				INCBIN "gfx/items/1.2bpp"
ShellBellIcon:    				INCBIN "gfx/items/1.2bpp"
SootheBellIcon:   				INCBIN "gfx/items/1.2bpp"
WeakPolicyIcon:   				INCBIN "gfx/items/1.2bpp"
WideLensIcon:     				INCBIN "gfx/items/1.2bpp"
WiseGlassesIcon:  				INCBIN "gfx/items/1.2bpp"
ZoomLensIcon:     				INCBIN "gfx/items/1.2bpp"
MentalHerbIcon:
PowerHerbIcon:
WhiteHerbIcon:    				INCBIN "gfx/items/white_herb.2bpp"
DampRockIcon:     				INCBIN "gfx/items/1.2bpp"
HeatRockIcon:     				INCBIN "gfx/items/1.2bpp"
SmoothRockIcon:   				INCBIN "gfx/items/1.2bpp"
IcyRockIcon:      				INCBIN "gfx/items/1.2bpp"
ChoiceBandIcon:   				INCBIN "gfx/items/1.2bpp"
ChoiceSpecsIcon:  				INCBIN "gfx/items/1.2bpp"
FlameOrbIcon:     				INCBIN "gfx/items/1.2bpp"
ToxicOrbIcon:     				INCBIN "gfx/items/1.2bpp"
BlackSludgeIcon:  				INCBIN "gfx/items/1.2bpp"
MachoBraceIcon:   				INCBIN "gfx/items/1.2bpp"
DragonScaleIcon:  				INCBIN "gfx/items/1.2bpp"
UpGradeIcon:      				INCBIN "gfx/items/1.2bpp"
DubiousDiscIcon:  				INCBIN "gfx/items/1.2bpp"
BigMalasadaIcon:				INCBIN "gfx/items/big_malasada.2bpp"
ElectirizerIcon:  				INCBIN "gfx/items/1.2bpp"
MagmarizerIcon:   				INCBIN "gfx/items/1.2bpp"
RazorFangIcon:    				INCBIN "gfx/items/1.2bpp"
RazorClawIcon:    				INCBIN "gfx/items/1.2bpp"
LiquidSunIcon:	  				INCBIN "gfx/items/1.2bpp"
NuggetIcon:       				INCBIN "gfx/items/1.2bpp"
BigNuggetIcon:    				INCBIN "gfx/items/1.2bpp"
PearlIcon:        				INCBIN "gfx/items/1.2bpp"
BigPearlIcon:     				INCBIN "gfx/items/1.2bpp"
StarPieceIcon:    				INCBIN "gfx/items/1.2bpp"
SlowpokeTailIcon: 				INCBIN "gfx/items/1.2bpp"
BottleCapIcon:    				INCBIN "gfx/items/bottle_cap.2bpp"
CoverFossilIcon: 	  			INCBIN "gfx/items/1.2bpp"
PlumeFossilIcon:   				INCBIN "gfx/items/1.2bpp"

UnusedItemIcon:
TMHMIcon:         				INCBIN "gfx/items/1.2bpp"
ClothesIcon:      				INCBIN "gfx/items/1.2bpp"
