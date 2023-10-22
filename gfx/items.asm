UpdateItemIconAndDescription::
	farcall UpdateItemDescription
	jr UpdateItemIcon

UpdateTMHMIconAndDescriptionAndOwnership::
	farcall UpdateTMHMDescriptionAndOwnership
	ld a, [wMenuSelection]
	cp -1
	jr z, .cancel
	call LoadTMHMIcon
	jr .ok
.cancel
	call ClearTMHMIcon
.ok
	farcall LoadTMHMIconPalette
	jp SetPalettes
	
UpdateClothesIconAndDescriptionAndOwnership::
	farcall UpdateClothesDescriptionAndOwnership
	ld a, [wMenuSelection]
	cp -1
	jr z, .cancel
	call LoadClothesIcon
	jr .ok
.cancel
	call ClearTMHMIcon
.ok
	farcall LoadClothesIconPalette
	jp SetPalettes

UpdateMonIconAndDescriptionAndOwnership::
	farcall UpdateMonDescription
	ld a, [wMenuSelection]
	cp -1
	jr z, .cancel
	call LoadBuyMonIcon
	jr .ok
.cancel
	call ClearTMHMIcon
.ok
	ld a, 1
	ld [wCurSpecies], a
	farcall LoadItemIconPalette
	jp SetPalettes
	
UpdateItemIconAndDescriptionAndBagQuantity::
	farcall UpdateItemDescriptionAndBagQuantity
UpdateItemIcon::
	ret
	ld hl, ItemIconPointers
	ld a, [wCurSpecies]
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, VTiles2 tile $1e
	call GetItemIconBank
	call DecompressRequest2bpp
	farcall LoadItemIconPalette
	jp SetPalettes

GetItemIconBank:
	lb bc, BANK(ItemIcons1), 9
	ld a, [wCurSpecies]
	cp SCOPE_LENS ; first icon in ItemIcons2
	ret c
	cp METAL_POWDER ; after Scope Lens, but in ItemIcons1
	ret z
	cp QUICK_POWDER ; after Scope Lens, but in ItemIcons1
	ret z
	cp STARDUST ; after Scope Lens, but in ItemIcons1
	ret z
	cp CHOICE_SCARF ; after Scope Lens, but in ItemIcons1
	ret z
	cp ITEM_FROM_MEM
	ret z
	lb bc, BANK(ItemIcons2), 9
	ret

LoadBuyMonIcon::
	ld hl, PokeBallIcon
	ld de, VTiles2 tile $1e
	lb bc, BANK(PokeBallIcon), 9
	jp DecompressRequest2bpp
	
LoadTMHMIcon::
	ld hl, TMHMIcon
	ld de, VTiles2 tile $1e
	lb bc, BANK(TMHMIcon), 9
	jp DecompressRequest2bpp
	
LoadClothesIcon::
	ld hl, ClothesIcon
	ld de, VTiles2 tile $1e
	lb bc, BANK(ClothesIcon), 9
	jp DecompressRequest2bpp

ClearTMHMIcon::
	ld hl, NoItemIcon
	ld de, VTiles2 tile $1e
	lb bc, BANK(NoItemIcon), 9
	jp DecompressRequest2bpp


SECTION "Item Icons 1", ROMX

ItemIcons1:
NoItemIcon:       INCBIN "gfx/items/potion.2bpp"
PokeBallIcon:     INCBIN "gfx/items/potion.2bpp"
GreatBallIcon:    INCBIN "gfx/items/potion.2bpp"
UltraBallIcon:    INCBIN "gfx/items/potion.2bpp"
MasterBallIcon:   INCBIN "gfx/items/potion.2bpp"
SafariBallIcon:   INCBIN "gfx/items/potion.2bpp"
LevelBallIcon:    INCBIN "gfx/items/potion.2bpp"
LureBallIcon:     INCBIN "gfx/items/potion.2bpp"
MoonBallIcon:     INCBIN "gfx/items/potion.2bpp"
FriendBallIcon:   INCBIN "gfx/items/potion.2bpp"
FastBallIcon:     INCBIN "gfx/items/potion.2bpp"
HeavyBallIcon:    INCBIN "gfx/items/potion.2bpp"
LoveBallIcon:     INCBIN "gfx/items/potion.2bpp"
ParkBallIcon:     INCBIN "gfx/items/potion.2bpp"
RepeatBallIcon:   INCBIN "gfx/items/potion.2bpp"
TimerBallIcon:    INCBIN "gfx/items/potion.2bpp"
NestBallIcon:     INCBIN "gfx/items/potion.2bpp"
NetBallIcon:      INCBIN "gfx/items/potion.2bpp"
DiveBallIcon:     INCBIN "gfx/items/potion.2bpp"
LuxuryBallIcon:   INCBIN "gfx/items/potion.2bpp"
HealBallIcon:     INCBIN "gfx/items/potion.2bpp"
QuickBallIcon:    INCBIN "gfx/items/potion.2bpp"
DuskBallIcon:     INCBIN "gfx/items/potion.2bpp"
PremierBallIcon:  INCBIN "gfx/items/potion.2bpp"
CherishBallIcon:  INCBIN "gfx/items/potion.2bpp"
PotionIcon:
SuperPotionIcon:
HyperPotionIcon:  INCBIN "gfx/items/potion.2bpp"
MaxPotionIcon:
FullRestoreIcon:  INCBIN "gfx/items/potion.2bpp"
AntidoteIcon:
BurnHealIcon:
ParlyzHealIcon:
AwakeningIcon:
IceHealIcon:      INCBIN "gfx/items/potion.2bpp"
FullHealIcon:     INCBIN "gfx/items/potion.2bpp"
ReviveIcon:       INCBIN "gfx/items/potion.2bpp"
MaxReviveIcon:    INCBIN "gfx/items/potion.2bpp"
EtherIcon:
MaxEtherIcon:
ElixirIcon:
MaxElixirIcon:    INCBIN "gfx/items/potion.2bpp"
HPUpIcon:         INCBIN "gfx/items/potion.2bpp"
ProteinIcon:
IronIcon:
CarbosIcon:
CalciumIcon:
ZincIcon:         INCBIN "gfx/items/potion.2bpp"
RareCandyIcon:    INCBIN "gfx/items/potion.2bpp"
PPUpIcon:         INCBIN "gfx/items/potion.2bpp"
PPMaxIcon:        INCBIN "gfx/items/potion.2bpp"
FreshWaterIcon:   INCBIN "gfx/items/potion.2bpp"
SodaPopIcon:      INCBIN "gfx/items/potion.2bpp"
LemonadeIcon:     INCBIN "gfx/items/potion.2bpp"
MoomooMilkIcon:   INCBIN "gfx/items/potion.2bpp"
RageCandyBarIcon: INCBIN "gfx/items/potion.2bpp"
SacredAshIcon:
SoftSandIcon:
BrightPowderIcon:
MetalPowderIcon:
QuickPowderIcon:
StardustIcon:     INCBIN "gfx/items/potion.2bpp"
EnergyPowderIcon:
HealPowderIcon:
SilverPowderIcon: INCBIN "gfx/items/potion.2bpp"
EnergyRootIcon:   INCBIN "gfx/items/potion.2bpp"
RevivalHerbIcon:  INCBIN "gfx/items/potion.2bpp"
XAttackIcon:
XDefendIcon:
XSpeedIcon:
XSpclAtkIcon:
XSpclDefIcon:
XAccuracyIcon:
DireHitIcon:
GuardSpecIcon:    INCBIN "gfx/items/potion.2bpp"
RepelIcon:
SuperRepelIcon:
MaxRepelIcon:     INCBIN "gfx/items/potion.2bpp"
EscapeRopeIcon:   INCBIN "gfx/items/potion.2bpp"
PokeDollIcon:     INCBIN "gfx/items/potion.2bpp"
AbilityCapIcon:   INCBIN "gfx/items/potion.2bpp"
LeafStoneIcon:    INCBIN "gfx/items/potion.2bpp"
FireStoneIcon:    INCBIN "gfx/items/potion.2bpp"
WaterStoneIcon:   INCBIN "gfx/items/potion.2bpp"
ThunderStoneIcon: INCBIN "gfx/items/potion.2bpp"
MoonStoneIcon:    INCBIN "gfx/items/potion.2bpp"
SunStoneIcon:     INCBIN "gfx/items/potion.2bpp"
DuskStoneIcon:    INCBIN "gfx/items/potion.2bpp"
ShinyStoneIcon:   INCBIN "gfx/items/potion.2bpp"
DawnStoneIcon:    INCBIN "gfx/items/potion.2bpp"
EverstoneIcon:    INCBIN "gfx/items/potion.2bpp"
BicycleIcon:      INCBIN "gfx/items/potion.2bpp"
OldRodIcon:       INCBIN "gfx/items/potion.2bpp"
GoodRodIcon:      INCBIN "gfx/items/potion.2bpp"
SuperRodIcon:     INCBIN "gfx/items/potion.2bpp"
CoinCaseIcon:     INCBIN "gfx/items/potion.2bpp"
ItemfinderIcon:   INCBIN "gfx/items/potion.2bpp"
ExpShareIcon:     INCBIN "gfx/items/potion.2bpp"
LibraryCardIcon:   INCBIN "gfx/items/potion.2bpp"
PokeFluteIcon:    INCBIN "gfx/items/potion.2bpp"
TheThingIcon: INCBIN "gfx/items/thething.2bpp"
TorchIcon:     INCBIN "gfx/items/torch.2bpp"
OldKeyIcon:      INCBIN "gfx/items/old_key.2bpp"
ClayPotIcon:  INCBIN "gfx/items/clay_pot.2bpp"
BRoomKeyIcon:
YRoomKeyIcon:
RRoomKeyIcon:  INCBIN "gfx/items/twinkle_room_key.2bpp"
AncientBallIcon:     INCBIN "gfx/items/ancient_ball.2bpp"
RivalPokedexIcon:  INCBIN "gfx/items/rival_pokedex.2bpp"
SkateboardIcon:   INCBIN "gfx/items/skateboard.2bpp"
TrainTicketIcon:    INCBIN "gfx/items/train_ticket.2bpp"
TrainPassIcon:       INCBIN "gfx/items/train_pass.2bpp"
BlueCardIcon:     INCBIN "gfx/items/potion.2bpp"
OrangeTicketIcon: INCBIN "gfx/items/potion.2bpp"
MysticTicketIcon: INCBIN "gfx/items/potion.2bpp"
OldSeaMapIcon:    INCBIN "gfx/items/potion.2bpp"
ShinyCharmIcon:   INCBIN "gfx/items/potion.2bpp"
OvalCharmIcon:    INCBIN "gfx/items/potion.2bpp"
FlowerPetalIcon:  INCBIN "gfx/items/flowerpetal.2bpp"
BlossomTeaIcon:   INCBIN "gfx/items/blossom_tea.2bpp"
PaintbrushIcon:   INCBIN "gfx/items/paintbrush.2bpp"
CheriBerryIcon:   INCBIN "gfx/items/potion.2bpp"
ChestoBerryIcon:  INCBIN "gfx/items/potion.2bpp"
PechaBerryIcon:   INCBIN "gfx/items/potion.2bpp"
RawstBerryIcon:   INCBIN "gfx/items/potion.2bpp"
AspearBerryIcon:  INCBIN "gfx/items/potion.2bpp"
LeppaBerryIcon:   INCBIN "gfx/items/potion.2bpp"
OranBerryIcon:    INCBIN "gfx/items/potion.2bpp"
PersimBerryIcon:  INCBIN "gfx/items/potion.2bpp"
LumBerryIcon:     INCBIN "gfx/items/potion.2bpp"
SitrusBerryIcon:  INCBIN "gfx/items/potion.2bpp"
FigyBerryIcon:    INCBIN "gfx/items/potion.2bpp"
LiechiBerryIcon:  INCBIN "gfx/items/potion.2bpp"
GanlonBerryIcon:  INCBIN "gfx/items/potion.2bpp"
SalacBerryIcon:   INCBIN "gfx/items/potion.2bpp"
PetayaBerryIcon:  INCBIN "gfx/items/potion.2bpp"
ApicotBerryIcon:  INCBIN "gfx/items/potion.2bpp"
JabocaBerryIcon:  INCBIN "gfx/items/potion.2bpp"
RowapBerryIcon:   INCBIN "gfx/items/potion.2bpp"
KeeBerryIcon:     INCBIN "gfx/items/potion.2bpp"
MarangaBerryIcon: INCBIN "gfx/items/potion.2bpp"
BerryJuiceIcon:	  INCBIN "gfx/items/berry_juice.2bpp"
SilkScarfIcon:
ChoiceScarfIcon:  INCBIN "gfx/items/potion.2bpp"
BlackBeltIcon:    INCBIN "gfx/items/potion.2bpp"
SharpBeakIcon:    INCBIN "gfx/items/potion.2bpp"

SECTION "Item Icons 2", ROMX

ItemIcons2:
PoisonBarbIcon:   INCBIN "gfx/items/potion.2bpp"
HardStoneIcon:    INCBIN "gfx/items/potion.2bpp"
SpellTagIcon:     INCBIN "gfx/items/potion.2bpp"
MetalCoatIcon:    INCBIN "gfx/items/potion.2bpp"
CharcoalIcon:     INCBIN "gfx/items/potion.2bpp"
MysticWaterIcon:  INCBIN "gfx/items/potion.2bpp"
MiracleSeedIcon:  INCBIN "gfx/items/potion.2bpp"
MagnetIcon:       INCBIN "gfx/items/potion.2bpp"
TwistedSpoonIcon: INCBIN "gfx/items/potion.2bpp"
NeverMeltIceIcon: INCBIN "gfx/items/potion.2bpp"
DragonFangIcon:   INCBIN "gfx/items/potion.2bpp"
BlackGlassesIcon: INCBIN "gfx/items/potion.2bpp"
PinkBowIcon:      INCBIN "gfx/items/potion.2bpp"
ScopeLensIcon:    INCBIN "gfx/items/potion.2bpp"
QuickClawIcon:    INCBIN "gfx/items/potion.2bpp"
KingsRockIcon:    INCBIN "gfx/items/potion.2bpp"
FocusBandIcon:    INCBIN "gfx/items/potion.2bpp"
LeftoversIcon:    INCBIN "gfx/items/potion.2bpp"
LuckyEggIcon:     INCBIN "gfx/items/potion.2bpp"
AmuletCoinIcon:   INCBIN "gfx/items/potion.2bpp"
CleanseTagIcon:   INCBIN "gfx/items/potion.2bpp"
SmokeBallIcon:    INCBIN "gfx/items/potion.2bpp"
TapePlayerIcon:  INCBIN "gfx/items/tape_player.2bpp"
LightBallIcon:    INCBIN "gfx/items/potion.2bpp"
LinkCableIcon:        INCBIN "gfx/items/link_cable.2bpp"
ThickClubIcon:
RareBoneIcon:     INCBIN "gfx/items/potion.2bpp"
LuckyPunchIcon:   INCBIN "gfx/items/potion.2bpp"
PollenPouchIcon:    INCBIN "gfx/items/pollen_pouch.2bpp"
AirBalloonIcon:   INCBIN "gfx/items/potion.2bpp"
AssaultVestIcon:  INCBIN "gfx/items/potion.2bpp"
BigRootIcon:      INCBIN "gfx/items/potion.2bpp"
BindingBandIcon:  INCBIN "gfx/items/potion.2bpp"
DestinyKnotIcon:  INCBIN "gfx/items/potion.2bpp"
EvioliteIcon:     INCBIN "gfx/items/potion.2bpp"
ExpertBeltIcon:   INCBIN "gfx/items/potion.2bpp"
FocusSashIcon:    INCBIN "gfx/items/potion.2bpp"
GripClawIcon:     INCBIN "gfx/items/potion.2bpp"
LifeOrbIcon:      INCBIN "gfx/items/potion.2bpp"
LightClayIcon:    INCBIN "gfx/items/potion.2bpp"
MetronomeIIcon:   INCBIN "gfx/items/potion.2bpp"
MuscleBandIcon:   INCBIN "gfx/items/potion.2bpp"
ProtectPadsIcon:  INCBIN "gfx/items/potion.2bpp"
RockyHelmetIcon:  INCBIN "gfx/items/potion.2bpp"
SafeGogglesIcon:  INCBIN "gfx/items/potion.2bpp"
ShedShellIcon:    INCBIN "gfx/items/potion.2bpp"
ShellBellIcon:    INCBIN "gfx/items/potion.2bpp"
SootheBellIcon:   INCBIN "gfx/items/potion.2bpp"
WeakPolicyIcon:   INCBIN "gfx/items/potion.2bpp"
WideLensIcon:     INCBIN "gfx/items/potion.2bpp"
WiseGlassesIcon:  INCBIN "gfx/items/potion.2bpp"
ZoomLensIcon:     INCBIN "gfx/items/potion.2bpp"
MentalHerbIcon:
PowerHerbIcon:
WhiteHerbIcon:    INCBIN "gfx/items/potion.2bpp"
DampRockIcon:     INCBIN "gfx/items/potion.2bpp"
HeatRockIcon:     INCBIN "gfx/items/potion.2bpp"
SmoothRockIcon:   INCBIN "gfx/items/potion.2bpp"
IcyRockIcon:      INCBIN "gfx/items/potion.2bpp"
ChoiceBandIcon:   INCBIN "gfx/items/potion.2bpp"
ChoiceSpecsIcon:  INCBIN "gfx/items/potion.2bpp"
FlameOrbIcon:     INCBIN "gfx/items/potion.2bpp"
ToxicOrbIcon:     INCBIN "gfx/items/potion.2bpp"
BlackSludgeIcon:  INCBIN "gfx/items/potion.2bpp"
MachoBraceIcon:   INCBIN "gfx/items/potion.2bpp"
PowerWeightIcon:  INCBIN "gfx/items/potion.2bpp"
PowerBracerIcon:  INCBIN "gfx/items/potion.2bpp"
PowerBeltIcon:    INCBIN "gfx/items/potion.2bpp"
PowerLensIcon:    INCBIN "gfx/items/potion.2bpp"
PowerBandIcon:    INCBIN "gfx/items/potion.2bpp"
PowerAnkletIcon:  INCBIN "gfx/items/potion.2bpp"
DragonScaleIcon:  INCBIN "gfx/items/potion.2bpp"
UpGradeIcon:      INCBIN "gfx/items/potion.2bpp"
DubiousDiscIcon:  INCBIN "gfx/items/potion.2bpp"
BigMalasadaIcon:  INCBIN "gfx/items/big_malasada.2bpp"
ElectirizerIcon:  INCBIN "gfx/items/potion.2bpp"
MagmarizerIcon:   INCBIN "gfx/items/potion.2bpp"
RazorFangIcon:    INCBIN "gfx/items/potion.2bpp"
RazorClawIcon:    INCBIN "gfx/items/potion.2bpp"
LiquidSunIcon:  INCBIN "gfx/items/liquid_sun.2bpp"
NuggetIcon:       INCBIN "gfx/items/potion.2bpp"
BigNuggetIcon:    INCBIN "gfx/items/potion.2bpp"
TinyMushroomIcon: INCBIN "gfx/items/potion.2bpp"
BigMushroomIcon:  INCBIN "gfx/items/potion.2bpp"
BalmMushroomIcon: INCBIN "gfx/items/potion.2bpp"
PearlIcon:        INCBIN "gfx/items/potion.2bpp"
BigPearlIcon:     INCBIN "gfx/items/potion.2bpp"
PearlStringIcon:  INCBIN "gfx/items/potion.2bpp"
StarPieceIcon:    INCBIN "gfx/items/potion.2bpp"
BrickPieceIcon:   INCBIN "gfx/items/potion.2bpp"
SilverLeafIcon:
GoldLeafIcon:     INCBIN "gfx/items/potion.2bpp"
SlowpokeTailIcon: INCBIN "gfx/items/potion.2bpp"
BottleCapIcon:    INCBIN "gfx/items/potion.2bpp"
JawFossilIcon: 	  INCBIN "gfx/items/potion.2bpp"
SailFossilIcon:   INCBIN "gfx/items/potion.2bpp"
OldAmberIcon:     INCBIN "gfx/items/potion.2bpp"
SunshineTeaIcon:        INCBIN "gfx/items/blossom_tea.2bpp"
SweetHoneyIcon:   INCBIN "gfx/items/potion.2bpp"
FlowerMailIcon:   INCBIN "gfx/items/potion.2bpp"
SurfMailIcon:
LiteBlueMailIcon: INCBIN "gfx/items/potion.2bpp"
PortraitMailIcon: INCBIN "gfx/items/potion.2bpp"
LovelyMailIcon:   INCBIN "gfx/items/potion.2bpp"
EonMailIcon:      INCBIN "gfx/items/potion.2bpp"
MorphMailIcon:    INCBIN "gfx/items/potion.2bpp"
BlueSkyMailIcon:  INCBIN "gfx/items/potion.2bpp"
MusicMailIcon:    INCBIN "gfx/items/potion.2bpp"
MirageMailIcon:   INCBIN "gfx/items/potion.2bpp"

TMHMIcon:         INCBIN "gfx/items/potion.2bpp"
ClothesIcon:      INCBIN "gfx/items/potion.2bpp"
