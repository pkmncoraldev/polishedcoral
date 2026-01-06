TextBoxSpeakers:
	dw -1
	dw TextBoxUnknown
	dw TextBoxMom
	dw TextBoxMina
	dw TextBoxFelicia
	dw TextBoxCaptain
	dw TextBoxRival
	dw TextBoxPoppy
	dw TextBoxWendy
	dw TextBoxMaster
	dw TextBoxStanley
	dw TextBoxRivalsMom
	dw TextBoxLedianRanger
	dw TextBoxDisguiseMan
	dw TextBoxGrunt
	dw TextBoxGruntA
	dw TextBoxGruntB
	dw TextBoxCage
	dw TextBoxClerk
	dw TextBoxPunk
	dw TextBoxPunkBoss
	dw TextBoxPunkA
	dw TextBoxPunkB
	dw TextBoxMallCop
	dw TextBoxPolly
	dw TextBoxBrutus
	dw TextBoxFrankie
	dw TextBoxPA
	dw TextBoxConductor
	dw TextBoxReporter
	dw TextBoxNett
	dw TextBoxRocky
	dw TextBoxRockford
	dw TextBoxLocke
	dw TextBoxAbie
	dw TextBoxRose
	dw TextBoxIris
	dw TextBoxViolet
	dw TextBoxClover
	dw TextBoxLily
	dw TextBoxErika
	dw TextBoxLeilani
	dw TextBoxGirls
	dw TextBoxOtto
	dw TextBoxDahlia
	dw TextBoxPusher
	dw TextBoxHill
	dw TextBoxCrowd
	dw TextBoxSpruce
	dw TextBoxLilac
	dw TextBoxAster
	dw TextBoxHazel
	dw TextBoxGirl
	dw TextBoxLady
	dw TextBoxRodney
	dw TextBoxCharlie
	dw TextBoxBoy
	dw TextBoxStrand
	dw TextBoxAbner
	dw TextBoxEggy
	dw TextBoxCrusher
	dw TextBoxButtercup
	dw TextBoxDarcy
	dw TextBoxLake
	dw TextBoxRaindrop
	dw TextBoxBliss
	dw TextBoxSpirit
	dw TextBoxJuniper
	dw TextBoxFlower
	dw TextBoxElder
	dw TextBoxGuy
	dw TextBoxBartender
	dw TextBoxRuss
	
TextBoxUnknown:			db "『???@"
TextBoxMom:				db "『MOM@"
TextBoxMina:			db "『MINA@"
TextBoxFelicia:			db "『FELICIA@"
TextBoxCaptain:			db "『CAPTAIN@"
TextBoxRival:			db "『<RIVAL>@"
TextBoxPoppy:			db "『POPPY@"
TextBoxWendy:			db "『WENDY@"
TextBoxMaster:			db "『MASTER@"
TextBoxStanley:			db "『STANLEY@"
TextBoxRivalsMom:		db "『<RIVAL>'s MOM@"
TextBoxLedianRanger:	db "『LEDIAN RANGER@"
TextBoxDisguiseMan:		db "『M.O.D.@"
TextBoxGrunt:			db "『GRUNT@"
TextBoxGruntA:			db "『GRUNT A@"
TextBoxGruntB:			db "『GRUNT B@"
TextBoxCage:			db "『CAGE@"
TextBoxClerk:			db "『CLERK@"
TextBoxPunk:			db "『PUNK@"
TextBoxPunkBoss:		db "『PUNK BOSS@"
TextBoxPunkA:			db "『PUNK A@"
TextBoxPunkB:			db "『PUNK B@"
TextBoxMallCop:			db "『MALL COP@"
TextBoxPolly:			db "『POLLY@"
TextBoxBrutus:			db "『BRUTUS@"
TextBoxFrankie:			db "『FRANKIE@"
TextBoxPA:				db "『PA@"
TextBoxConductor:		db "『CONDUCTOR@"
TextBoxReporter:		db "『REPORTER@"
TextBoxNett:			db "『NETT@"
TextBoxRocky:			db "『ROCKY@"
TextBoxRockford:		db "『ROCKFORD@"
TextBoxLocke:			db "『LOCKE@"
TextBoxAbie:			db "『DR. ABIE@"
TextBoxRose:			db "『ROSE@"
TextBoxIris:			db "『IRIS@"
TextBoxViolet:			db "『VIOLET@"
TextBoxClover:			db "『CLOVER@"
TextBoxLily:			db "『LILY@"
TextBoxErika:			db "『ERIKA@"
TextBoxLeilani:			db "『LEILANI@"
TextBoxGirls:			db "『GIRLS@"
TextBoxOtto:			db "『OTTO@"
TextBoxDahlia:			db "@"
TextBoxPusher:			db "@"
TextBoxHill:			db "『PROF. HILL@"
TextBoxCrowd:			db "『CROWD@"
TextBoxSpruce:			db "『PROF. SPRUCE@"
TextBoxLilac:			db "『LILAC@"
TextBoxAster:			db "『ASTER@"
TextBoxHazel:			db "『HAZEL@"
TextBoxGirl:			db "『GIRL@"
TextBoxLady:			db "『LADY@"
TextBoxRodney:			db "『RODNEY@"
TextBoxCharlie:			db "『CHARLIE@"
TextBoxBoy:				db "『BOY@"
TextBoxStrand:			db "『CAP'N STRAND@"
TextBoxAbner:			db "『ABNER@"
TextBoxEggy:			db "『EGGY@"
TextBoxCrusher:			db "『CRUSHER@"
TextBoxButtercup:		db "『BUTTERCUP@"
TextBoxDarcy:			db "『DARCY@"
TextBoxLake:			db "『LAKE@"
TextBoxRaindrop:		db "『RAINDROP@"
TextBoxBliss:			db "『BLISS@"
TextBoxSpirit:			db "『SPIRIT@"
TextBoxJuniper:			db "『JUNIPER@"
TextBoxFlower:			db "『FLOWER@"
TextBoxElder:			db "『ELDER@"
TextBoxGuy:				db "『GUY@"
TextBoxBartender:		db "『BARTENDER@"
TextBoxRuss:			db "『RUSS@"

	
ChangeTextboxName::
	call ClearTextboxName
	jp WriteTextboxName
	
ClearTextboxName::
	hlcoord TEXTBOX_X + 1, TEXTBOX_Y
	ld a, TEXTBOX_INNERW
	ld d, a
	ld a, "─"
.loop
	ld [hli], a
	dec d
	jr nz, .loop
	ret
	
WriteTextboxName::
	ld a, [wTextBoxSpeaker]
	cp TEXTBOX_POKEMON
	jr z, WriteTextboxPokemonName
	cp TEXTBOX_NONE
	ret z
	ld e, a
	ld d, 0
	ld hl, TextBoxSpeakers
	add hl, de
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	hlcoord 0, 12
	jp PlaceString
	
WriteTextboxPokemonName:
	ld de, .TopLeft
	hlcoord 0, 12
	call PlaceString
	ld a, [wd265]
	call GetPokemonName
	ld de, wStringBuffer1
	hlcoord 1, 12
	jp PlaceString

.TopLeft:
	db "『@"