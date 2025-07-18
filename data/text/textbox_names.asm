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
	
TextBoxUnknown:			db "<UPDN>???@"
TextBoxMom:				db "<UPDN>MOM@"
TextBoxMina:			db "<UPDN>MINA@"
TextBoxFelicia:			db "<UPDN>FELICIA@"
TextBoxCaptain:			db "<UPDN>CAPTAIN@"
TextBoxRival:			db "<UPDN><RIVAL>@"
TextBoxPoppy:			db "<UPDN>POPPY@"
TextBoxWendy:			db "<UPDN>WENDY@"
TextBoxMaster:			db "<UPDN>MASTER@"
TextBoxStanley:			db "<UPDN>STANLEY@"
TextBoxRivalsMom:		db "<UPDN><RIVAL>'s MOM@"
TextBoxLedianRanger:	db "<UPDN>LEDIAN RANGER@"
TextBoxDisguiseMan:		db "<UPDN>M.O.D.@"
TextBoxGrunt:			db "<UPDN>GRUNT@"
TextBoxGruntA:			db "<UPDN>GRUNT A@"
TextBoxGruntB:			db "<UPDN>GRUNT B@"
TextBoxCage:			db "<UPDN>CAGE@"
TextBoxClerk:			db "<UPDN>CLERK@"
TextBoxPunk:			db "<UPDN>PUNK@"
TextBoxPunkBoss:		db "<UPDN>PUNK BOSS@"
TextBoxPunkA:			db "<UPDN>PUNK A@"
TextBoxPunkB:			db "<UPDN>PUNK B@"
TextBoxMallCop:			db "<UPDN>MALL COP@"
TextBoxPolly:			db "<UPDN>POLLY@"
TextBoxBrutus:			db "<UPDN>BRUTUS@"
TextBoxFrankie:			db "<UPDN>FRANKIE@"
TextBoxPA:				db "<UPDN>PA@"
TextBoxConductor:		db "<UPDN>CONDUCTOR@"
TextBoxReporter:		db "<UPDN>REPORTER@"
TextBoxNett:			db "<UPDN>NETT@"
TextBoxRocky:			db "<UPDN>ROCKY@"
TextBoxRockford:		db "<UPDN>ROCKFORD@"
TextBoxLocke:			db "<UPDN>LOCKE@"
TextBoxAbie:			db "<UPDN>DR. ABIE@"
TextBoxRose:			db "<UPDN>ROSE@"
TextBoxIris:			db "<UPDN>IRIS@"
TextBoxViolet:			db "<UPDN>VIOLET@"
TextBoxClover:			db "<UPDN>CLOVER@"
TextBoxLily:			db "<UPDN>LILY@"
TextBoxErika:			db "<UPDN>ERIKA@"
TextBoxLeilani:			db "<UPDN>LEILANI@"
TextBoxGirls:			db "<UPDN>GIRLS@"
TextBoxOtto:			db "<UPDN>OTTO@"
TextBoxDahlia:			db "@"
TextBoxPusher:			db "@"
TextBoxHill:			db "<UPDN>PROF. HILL@"
TextBoxCrowd:			db "<UPDN>CROWD@"
TextBoxSpruce:			db "<UPDN>PROF. SPRUCE@"
TextBoxLilac:			db "<UPDN>LILAC@"
TextBoxAster:			db "<UPDN>ASTER@"
TextBoxHazel:			db "<UPDN>HAZEL@"
TextBoxGirl:			db "<UPDN>GIRL@"
TextBoxLady:			db "<UPDN>LADY@"
TextBoxRodney:			db "<UPDN>RODNEY@"
TextBoxCharlie:			db "<UPDN>CHARLIE@"
TextBoxBoy:				db "<UPDN>BOY@"
TextBoxStrand:			db "<UPDN>CAP'N STRAND@"
TextBoxAbner:			db "<UPDN>ABNER@"
	
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
	cp 0
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
