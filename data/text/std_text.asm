NurseMornText:
	text "Good morning!"
	line "Welcome to our"
	cont "#MON CENTER."
	done

NurseDayText:
	text "Hello!"
	line "Welcome to our"
	cont "#MON CENTER."
	done

NurseNiteText:
	text "Good evening!"
	line "You're out late."

	para "Welcome to our"
	line "#MON CENTER."
	done
	
NurseDuskText:
	text "Good evening!"
	line "Welcome to our"
	cont "#MON CENTER."
	done

PokeComNurseMornText:
	text "Good morning!"
	done

PokeComNurseDayText:
	text "Hello!"
	done

PokeComNurseNiteText:
	text "Good to see you"
	line "working so late."
	done

NurseAskHealText:
	text "We can heal your"
	line "#MON to perfect"
	cont "health."

	para "Shall we heal your"
	line "#MON?"
	done

NurseTakePokemonText:
	text "OK, may I see your"
	line "#MON?"
	done

NurseReturnPokemonText:
	text "Thank you for"
	line "waiting."

	para "Your #MON are"
	line "fully healed."
	done

NurseGoodbyeText:
	text "We hope to see you"
	line "again."
	done

NursePokerusText:
	text "Your #MON"
	line "appear to be"

	para "infected by tiny"
	line "life forms."

	para "Your #MON are"
	line "healthy and seem"
	cont "to be fine."

	para "But we can't tell"
	line "you anything more"

	para "at a #MON"
	line "CENTER."
	done

PokeComNursePokerusText:
	text "Your #MON are"
	line "healthy and seem"
	cont "to be fine."
	done
	
IceBlockText:
	text "A solid block of"
	line "ice."
	done
	
DeadLampText:
	text "It seems to be"
	line "dead."
	done

LitLampText:
	text "It's trying its"
	line "hardest to stay"
	cont "lit."
	done

DifficultBookshelfText:
	text "It's full of"
	line "difficult books."
	done

PictureBookshelfText:
	text "A whole collection"
	line "of #MON picture"
	cont "books!"
	done

MagazineBookshelfText:
	text "#MON magazines…"
	line "#MON PAL,"

	para "#MON HANDBOOK,"
	line "#MON GRAPH…"
	done

TeamRocketOathText:
	text "Team Rocket Oath"

	para "Steal #MON for"
	line "profit!"

	para "Exploit #MON"
	line "for profit!"

	para "All #MON exist"
	line "for the glory of"
	cont "Team Rocket!"
	done

IncenseBurnerText:
	text "It's an incense"
	line "burner!"
	done

MerchandiseShelfText::
	text "Lots of #MON"
	line "merchandise!"
	done

TownMapText:
	text "It's the TOWN MAP."
	done

WindowText:
	text "My reflection!"
	line "Lookin' good!"
	done

TVText:
	text "It's a TV."
	done

WrongSideText::
	text "Oops, wrong side."
	done

RadioText:
	text "It's a radio."
	done

RefrigeratorText:
	text "It's a fridge."
	done

SinkText:
	text "It's a sink."
	done

StoveText:
	text "It's a stove."
	done

TrashCanText:
	text "There's nothing in"
	line "here…"
	done

PokeCenterSignText:
	text "Heal Your #MON!"
	line "#MON Center"
	done

MartSignText:
	text "For All Your"
	line "#MON Needs"

	para "#MON MART"
	done

ContestResults_ReadyToJudgeText:
	text "We will now judge"
	line "the #MON you've"
	cont "caught."

	para "……"
	line "……"

	para "We have chosen the"
	line "winners!"

	para "Are you ready for"
	line "this?"
	done

ContestResults_PlayerWonAPrizeText:
	text "<PLAYER>, the No.@"
	text_from_ram wStringBuffer3
	text ""
	line "finisher, wins"
	cont "@"
	text_from_ram wStringBuffer4
	text "!"
	done

ReceivedItemText:
	text "<PLAYER> received"
	line "@"
	text_from_ram wStringBuffer4
	text "."
	done

ContestResults_JoinUsNextTimeText:
	text "Please join us for"
	line "the next Contest!"
	done

ContestResults_ConsolationPrizeText:
	text "Everyone else gets"
	line "a @"
	text_from_ram wStringBuffer4
	text " as a"
	cont "consolation prize!"
	done

ContestResults_DidNotWinText:
	text "We hope you do"
	line "better next time."
	done

ContestResults_ReturnPartyText:
	text "We'll return the"
	line "#MON we kept"

	para "for you."
	line "Here you go!"
	done

ContestResults_PartyFullText:
	text "Your party's full,"
	line "so the #MON was"

	para "sent to your BOX"
	line "in BILL's PC."
	done

GymStatue_CityGymText:
	text_from_ram wStringBuffer3
	text ""
	line "#MON GYM"

	para "Leader: @"
	text_from_ram wStringBuffer4
	text ""
	done

GymStatue_WinningTrainersText:
	text "Winning Trainers:"
	line "<RIVAL>"
	done

GymStatue_TwoWinningTrainersText:
	text "Winning Trainers:"
	line "<RIVAL>"
	cont "<PLAYER>"
	done

GymStatue_ThreeWinningTrainersText:
	text "Winning Trainers:"
	line "<RIVAL>"
	cont "<PLAYER>"
	cont "Lyra"
	done

CoinVendor_WelcomeText:
	text "A casino?"
	
	para "I don't have any"
	line "idea what you're"
	cont "talking about."
	
	para "The MARACTUS ROOM"
	line "isn't a casino."
	
	para "This is a"
	line "GAME CORNER."
	
	para "You don't bet real"
	line "money here."
	
	para "We use COINs!"
	
	para "Here."
	done

CoinVendor_WelcomeText2:
	text "I threw in"
	line "50 COINs on the"
	cont "house."
	
	para "Say the password"
	line "to the guy up"
	cont "front to exhange"
	cont "'em for prizes."
	
	para "Now, stop asking"
	line "questions."
	
	para "Come talk to me"
	line "if you wanna buy"
	cont "more COINs."
	done

CoinVendor_IntroText:
	text "Do you need some"
	line "COINs?"

	para "It costs ¥1000 for"
	line "50 COINs. Do you"
	cont "want some?"
	done

CoinVendor_Buy50CoinsText:
	text "Here."
	
	para "50 COINs."
	
	para "Say the password"
	line "to the guy up"
	cont "front to exhange"
	cont "'em for prizes."
	done

CoinVendor_Buy500CoinsText:
	text "Here."
	
	para "500 COINs."
	
	para "Say the password"
	line "to the guy up"
	cont "front to exhange"
	cont "'em for prizes."
	done

CoinVendor_NotEnoughMoneyText:
	text "You don't have"
	line "enough money."
	done

CoinVendor_CoinCaseFullText:
	text "You can't hold"
	line "anymore COINs."
	done

CoinVendor_CancelText:
	text "Quit wasting my"
	line "time!"
	done

BugContestPrizeNoRoomText:
	text "Oh? Your BAG is"
	line "full."

	para "We'll keep this"
	line "for you today, so"

	para "come back when you"
	line "make room for it."
	done

HappinessText3:
	text "Wow! You and your"
	line "#MON are really"
	cont "close!"
	done

HappinessText2:
	text "#MON get more"
	line "friendly if you"

	para "spend time with"
	line "them."
	done

HappinessText1:
	text "You haven't tamed"
	line "your #MON."

	para "If you aren't"
	line "nice, it'll pout."
	done

RegisteredNumber1Text:
	text "<PLAYER> registered"
	line "@"
	text_from_ram wStringBuffer3
	text "'s number."
	done

RegisteredNumber2Text:
	text "<PLAYER> registered"
	line "@"
	text_from_ram wStringBuffer3
	text "'s number."
	done

VendingMachineText:
	text "A VENDING MACHINE!"
	line "Here's the menu."
	done

VendingMachineClangText:
	text "Clang!"

	para "A @"
	text_from_ram wStringBuffer3
	text ""
	line "popped out."
	done

VendingMachineScoreText:
	text "Score! An extra"

	line "@"
	text_from_ram wStringBuffer3
	text ""
	cont "popped out."
	done

VendingMachineNoMoneyText:
	text "Oops, not enough"
	line "money…"
	done

VendingMachineNoSpaceText:
	text "There's no more"
	line "room for stuff…"
	done

HiddenGrottoText:
	text "Look! You've found"
	line "a narrow path!"

	para "Will you follow"
	line "it?"
	done
	
StdBlankText::
	text " "
	done
