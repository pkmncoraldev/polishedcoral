_FruitBearingTreeText::
	text "It's a fruit-"
	line "bearing tree."
	done

_HeyItsFruitText::
	text "Hey! It's a"
	line "@"
	text_from_ram wStringBuffer3
	text "!"
	done

_ObtainedFruitText::
	text "Obtained the"
	line "@"
	text_from_ram wStringBuffer3
	text "!"
	done

_FruitPackIsFullText::
	text "But the BAG is"
	line "full…"
	done

_NoApricornBoxText::
	text "But there's nothing"
	line "to put it in…"
	done

_ApricornBoxIsFullText::
	text "But the APRICORN"
	line "BOX is full…"
	done

_PutAwayTheApricornText::
	text "<PLAYER> put the"
	line "@"
	text_from_ram wStringBuffer3
	text " in"
	cont "the APRICORN BOX."
	done

_NothingHereText::
	text "There's nothing"
	line "here…"
	done

_WantToUseMulchText::
	text "Want to use"
	line "MULCH?"
	done

_UsedMulchText::
	text "<PLAYER> used"
	line "MULCH!"

	para "The tree was"
	line "fertilized!"
	done

UnknownText_0x1bc06b::
	text "Which APRICORN"
	line "should I use?"
	done

UnknownText_0x1bc089::
	text "How many should I"
	line "make?"
	done

UnknownText_0x1bc0a2::
	text_from_ram wStringBuffer1
	text ""
	line "recovered @"
	deciram wCurHPAnimDeltaHP, 2, 3
	text "HP!"
	done

UnknownText_0x1bc0bb::
	text_from_ram wStringBuffer1
	text "'s"
	line "cured of poison."
	done

UnknownText_0x1bc0d2::
	text_from_ram wStringBuffer1
	text "'s"
	line "rid of paralysis."
	done

UnknownText_0x1bc0ea::
	text_from_ram wStringBuffer1
	text "'s"
	line "burn was healed."
	done

UnknownText_0x1bc101::
	text_from_ram wStringBuffer1
	text ""
	line "was defrosted."
	done

UnknownText_0x1bc115::
	text_from_ram wStringBuffer1
	text ""
	line "woke up."
	done

UnknownText_0x1bc123::
	text_from_ram wStringBuffer1
	text "'s"
	line "health returned."
	done

UnknownText_0x1bc13a::
	text_from_ram wStringBuffer1
	text ""
	line "is revitalized."
	done

UnknownText_0x1bc14f::
	text_from_ram wStringBuffer1
	text " grew to"
	line "level @"
	deciram wCurPartyLevel, 1, 3
	text "!@"
	sound_dex_fanfare_50_79
	text_waitbutton
	db "@@"

UnknownText_0x1bc16e::
	text_from_ram wStringBuffer1
	text " came"
	line "to its senses."
	done

UnknownText_0x1bc29c::
	text "Please set the"
	line "time."
	prompt

UnknownText_0x1bc2eb::
	text "What time is it?"
	done

UnknownText_0x1bc2fd::
	text "What?@@"

UnknownText_0x1bc305::
	text "?"
	done

UnknownText_0x1bc308::
	text "How many minutes?"
	done

UnknownText_0x1bc31b::
	text "Whoa!@@"

UnknownText_0x1bc323::
	text "?"
	done

UnknownText_0x1bc326::
	text "!"
	line "Got it!"
	done

UnknownText_0x1bc336::
	text "!"
	line "Yikes! I over-"
	cont "slept!"
	done

UnknownText_0x1bc34f::
	text "!"
	line "No wonder it's so"
	cont "dark!"
	done

UnknownText_0x1bc369::
	text "What day is it?"
	done

UnknownText_0x1bc37a::
	text ", is it?"
	done

UnknownText_0x1bc471::
	text "There's nothing to"
	line "choose."
	prompt

UnknownText_0x1bc48c::
	text "Which side do you"
	line "want to put it on?"
	done

UnknownText_0x1bc4b2::
	text "Which side do you"
	line "want to put away?"
	done

UnknownText_0x1bc4d7::
	text "Put away the"
	line "@"
	text_from_ram wStringBuffer3
	text "."
	prompt

UnknownText_0x1bc4ec::
	text "There's nothing to"
	line "put away."
	prompt

UnknownText_0x1bc509::
	text "Set up the"
	line "@"
	text_from_ram wStringBuffer3
	text "."
	prompt

UnknownText_0x1bc51c::
	text "Put away the"
	line "@"
	text_from_ram wStringBuffer3
	text ""

	para "and set up the"
	line "@"
	text_from_ram wStringBuffer4
	text "."
	prompt

UnknownText_0x1bc546::
	text "That's already set"
	line "up."
	prompt

UnknownText_0x1bc55d::
	text "It's the Town Map."
	done

UnknownText_0x1bc570::
	text "It's a poster of a"
	line "cute Pikachu."
	done

UnknownText_0x1bc591::
	text "It's a poster of a"
	line "cute Clefairy."
	done

UnknownText_0x1bc5b3::
	text "It's a poster of a"
	line "cute Spearow."
	done

UnknownText_0x1bc5d7::
	text "It's an adorable"
	line "@"
	text_from_ram wStringBuffer3
	text "."
	done

DecoConsoleText::
	text "It's a shiny"
	line "@"
	text_from_ram wStringBuffer3
	text "."
	done

UnknownText_0x1bc5ef::
	text "A giant doll! It's"
	line "fluffy and cuddly."
	done

UnknownText_0x1bc615::
	text "Hi, <PLAYER>!"
	line "How are you?"
	prompt

UnknownText_0x1bc62a::
	text "I found a useful"
	line "item shopping, so"
	prompt

UnknownText_0x1bc64e::
	text "I bought it with"
	line "your money. Sorry!"
	prompt

UnknownText_0x1bc673::
	text "It's in your PC."
	line "You'll like it!"
	done

UnknownText_0x1bc693::
	text "While shopping"
	line "today, I saw this"
	cont "adorable doll, so"
	prompt

UnknownText_0x1bc6c7::
	text "It's in your room."
	line "You'll love it!"
	done

UnknownText_0x1bc6e9::
	text_from_ram wPlayerTrademonSpeciesName
	text " was"
	line "sent to @"
	text_from_ram wOTTrademonSenderName
	text "."
	done

UnknownText_0x1bc701::
	text ""
	done

UnknownText_0x1bc703::
	text_from_ram wOTTrademonSenderName
	text " bids"
	line "farewell to"
	done

UnknownText_0x1bc719::
	text_from_ram wOTTrademonSpeciesName
	text "."
	done

UnknownText_0x1bc71f::
	text "Take good care of"
	line "@"
	text_from_ram wOTTrademonSpeciesName
	text "."
	done

UnknownText_0x1bc739::
	text "For @"
	text_from_ram wPlayerTrademonSenderName
	text "'s"
	line "@"
	text_from_ram wPlayerTrademonSpeciesName
	text ","
	done

UnknownText_0x1bc74c::
	text_from_ram wOTTrademonSenderName
	text " sends"
	line "@"
	text_from_ram wOTTrademonSpeciesName
	text "."
	done

UnknownText_0x1bc75e::
	text_from_ram wOTTrademonSenderName
	text " will"
	line "trade @"
	text_from_ram wOTTrademonSpeciesName
	db "@@"

UnknownText_0x1bc774::
	text "for @"
	text_from_ram wPlayerTrademonSenderName
	text "'s"
	line "@"
	text_from_ram wPlayerTrademonSpeciesName
	text "."
	done

; Oak's Pokémon Talk

_OPT_IntroText1::
	text ""
	line "Mary: Prof.Oak's"
	done

_OPT_IntroText2::
	text ""
	line "#mon Talk!"
	done

_OPT_IntroText3::
	text ""
	line "With me, Mary!"
	done

_OPT_OakText1::
	text ""
	line "Oak: @"
	text_from_ram wMonOrItemNameBuffer
	db "@@"

_OPT_OakText2::
	text ""
	line "may be seen around"
	done

_OPT_OakText3::
	text ""
	line "@"
	text_from_ram wStringBuffer1
	text "."
	done

_OPT_MaryText1::
	text ""
	line "Mary: @"
	text_from_ram wStringBuffer1
	text "'s"
	done

OPT_SweetAdorably::
	text ""
	line "sweet and adorably"
	done

OPT_WigglySlickly::
	text ""
	line "wiggly and slickly"
	done

OPT_AptlyNamed::
	text ""
	line "aptly named and"
	done

OPT_UndeniablyKindOf::
	text ""
	line "undeniably kind of"
	done

OPT_Unbearably::
	text ""
	line "so, so unbearably"
	done

OPT_WowImpressively::
	text ""
	line "wow, impressively"
	done

OPT_AlmostPoisonously::
	text ""
	line "almost poisonously"
	done

OPT_Sensually::
	text ""
	line "ooh, so sensually"
	done

OPT_Mischievously::
	text ""
	line "so mischievously"
	done

OPT_Topically::
	text ""
	line "so very topically"
	done

OPT_Addictively::
	text ""
	line "sure addictively"
	done

OPT_LooksInWater::
	text ""
	line "looks in water is"
	done

OPT_EvolutionMustBe::
	text ""
	line "evolution must be"
	done

OPT_Provocatively::
	text ""
	line "provocatively"
	done

OPT_FlippedOut::
	text ""
	line "so flipped out and"
	done

OPT_HeartMeltingly::
	text ""
	line "heart-meltingly"
	done

OPT_Cute::
	text ""
	line "cute."
	done

OPT_Weird::
	text ""
	line "weird."
	done

OPT_Pleasant::
	text ""
	line "pleasant."
	done

OPT_BoldSortOf::
	text ""
	line "bold, sort of."
	done

OPT_Frightening::
	text ""
	line "frightening."
	done

OPT_SuaveDebonair::
	text ""
	line "suave & debonair!"
	done

OPT_Powerful::
	text ""
	line "powerful."
	done

OPT_Exciting::
	text ""
	line "exciting."
	done

OPT_Groovy::
	text ""
	line "groovy!"
	done

OPT_Inspiring::
	text ""
	line "inspiring."
	done

OPT_Friendly::
	text ""
	line "friendly."
	done

OPT_HotHotHot::
	text ""
	line "hot, hot, hot!"
	done

OPT_Stimulating::
	text ""
	line "stimulating."
	done

OPT_Guarded::
	text ""
	line "guarded."
	done

OPT_Lovely::
	text ""
	line "lovely."
	done

OPT_Speedy::
	text ""
	line "speedy."
	done

_OPT_PokemonChannelText::
	text "#mon"
	done

_PokedexShowText::
	text ""
	line "@"
	text_from_ram wStringBuffer1
	db "@@"

; Pokémon Music Channel / Pokémusic

_BenIntroText1::
	text ""
	line "Ben: #mon Music"
	done

_BenIntroText2::
	text ""
	line "Channel! ♪"
	done

_BenIntroText3::
	text ""
	line "It's me, DJ Ben! ♪"
	done

_FernIntroText1::
	text ""
	line "Fern: #music! ♪"
	done

_FernIntroText2::
	text ""
	line "With DJ Fern! ♪"
	done

_BenFernText1::
	text ""
	line "Today's @"
	current_day
	text ","
	done

_BenFernText2A::
	text ""
	line "so let's jam to"
	done

_BenFernText2B::
	text ""
	line "so chill out to"
	done

_BenFernText3A::
	text ""
	line "#mon March!"
	done

_BenFernText3B::
	text ""
	line "#mon Lullaby!"
	done

; Lucky Channel

_LC_Text1::
	text ""
	line "Reed: Yeehaw! How"
	done

_LC_Text2::
	text ""
	line "y'all doin' now?"
	done

_LC_Text3::
	text ""
	line "Whether you're up"
	done

_LC_Text4::
	text ""
	line "or way down low,"
	done

_LC_Text5::
	text ""
	line "don't you miss the"
	done

_LC_Text6::
	text ""
	line "Lucky Number Show!"
	done

_LC_Text7::
	text ""
	line "This week's Lucky"
	done

_LC_Text8::
	text ""
	line "Number is @"
	interpret_data
	text_from_ram wStringBuffer1
	text "!"
	done

_LC_Text9::
	text ""
	line "I'll repeat that!"
	done

_LC_Text10::
	text ""
	line "Match it and go to"
	done

_LC_Text11::
	text ""
	line "the Radio Tower!"
	done

_LC_DragText1::
	text ""
	line "…Repeating myself"
	done

_LC_DragText2::
	text ""
	line "gets to be a drag…"
	done

; Places and People

_PnP_Text1::
	text ""
	line "Places and People!"
	done

_PnP_Text2::
	text ""
	line "Brought to you by"
	done

_PnP_Text3::
	text ""
	line "me, DJ Lily!"
	done

_PnP_Text4::
	text ""
	line "@"
	text_from_ram wStringBuffer2
	text " @"
	text_from_ram wStringBuffer1
	db "@@"

_PnP_cute::
	text ""
	line "is cute."
	done

_PnP_lazy::
	text ""
	line "is sort of lazy."
	done

_PnP_happy::
	text ""
	line "is always happy."
	done

_PnP_noisy::
	text ""
	line "is quite noisy."
	done

_PnP_precocious::
	text ""
	line "is precocious."
	done

_PnP_bold::
	text ""
	line "is somewhat bold."
	done

_PnP_picky::
	text ""
	line "is too picky!"
	done

_PnP_sortofok::
	text ""
	line "is sort of OK."
	done

_PnP_soso::
	text ""
	line "is just so-so."
	done

_PnP_great::
	text ""
	line "is actually great."
	done

_PnP_mytype::
	text ""
	line "is just my type."
	done

_PnP_cool::
	text ""
	line "is so cool, no?"
	done

_PnP_inspiring::
	text ""
	line "is inspiring!"
	done

_PnP_weird::
	text ""
	line "is kind of weird."
	done

_PnP_rightforme::
	text ""
	line "is right for me?"
	done

_PnP_odd::
	text ""
	line "is definitely odd!"
	done

_PnP_Text5::
	text ""
	line "@"
	text_from_ram wStringBuffer1
	db "@@"

_RocketRadioText1::
	text ""
	line "… …Ahem, we are"
	done

_RocketRadioText2::
	text ""
	line "Team Rocket!"
	done

_RocketRadioText3::
	text ""
	line "After three years"
	done

_RocketRadioText4::
	text ""
	line "of preparation, we"
	done

_RocketRadioText5::
	text ""
	line "have risen again"
	done

_RocketRadioText6::
	text ""
	line "from the ashes!"
	done

_RocketRadioText7::
	text ""
	line "Giovanni! @"
	interpret_data
	text "Can you"
	done

_RocketRadioText8::
	text ""
	line "hear?@"
	interpret_data
	text " We did it!"
	done

_RocketRadioText9::
	text ""
	line "@"
	interpret_data
	text "Where is our boss?"
	done

_RocketRadioText10::
	text ""
	line "@"
	interpret_data
	text "Is he listening?"
	done

_BuenaRadioText1::
	text ""
	line "Buena: Buena here!"
	done

_BuenaRadioText2::
	text ""
	line "Today's password!"
	done

_BuenaRadioText3::
	text ""
	line "Let me think… It's"
	done

_BuenaRadioText4::
	text ""
	line "@"
	text_from_ram wStringBuffer1
	text "!"
	done

_BuenaRadioText5::
	text ""
	line "Don't forget it!"
	done

_BuenaRadioText6::
	text ""
	line "I'm in Goldenrod's"
	done

_BuenaRadioText7::
	text ""
	line "Radio Tower!"
	done

_BuenaRadioMidnightText1::
	text ""
	line "Buena: Oh my…"
	done

_BuenaRadioMidnightText2::
	text ""
	line "It's midnight! I"
	done

_BuenaRadioMidnightText3::
	text ""
	line "have to shut down!"
	done

_BuenaRadioMidnightText4::
	text ""
	line "Thanks for tuning"
	done

_BuenaRadioMidnightText5::
	text ""
	line "in to the end! But"
	done

_BuenaRadioMidnightText6::
	text ""
	line "don't stay up too"
	done

_BuenaRadioMidnightText7::
	text ""
	line "late! Presented to"
	done

_BuenaRadioMidnightText8::
	text ""
	line "you by DJ Buena!"
	done

_BuenaRadioMidnightText9::
	text "I'm outta here!"
	done

_BuenaRadioMidnightText10::
	text "…"
	done

_BuenaOffTheAirText::
	text ""
	line ""
	done

Text_EnemyWithdrew::
	text "<ENEMY>"
	line "withdrew"
	cont "@"
	text_from_ram wEnemyMonNick
	text "!"
	prompt

Text_EnemyUsedOn::
	text "<ENEMY>"
	line "used @"
	text_from_ram wMonOrItemNameBuffer
	text ""
	cont "on @"
	text_from_ram wEnemyMonNick
	text "!"
	prompt

UnknownText_0x1bd2bc::
	text "Which floor?"
	done

UnknownText_0x1bd2ca::
	text "Announcer: BEEEP!"

	para "Time's up!"
	done

UnknownText_0x1bd2e7::
	text "Announcer: The"
	line "Contest is over!"
	done

UnknownText_0x1bd308::
	text "REPEL's effect"
	line "wore off."
	done

UseAnotherRepelText::
	text "REPEL's effect"
	line "wore off."

	para "Use another?"
	done

UnknownText_0x1bd34b::
	text "I just saw some"
	line "rare @"
	text_from_ram wStringBuffer1
	text " in"
	cont "@"
	text_from_ram wStringBuffer2
	text "."

	para "I'll call you if I"
	line "see another rare"
	cont "#mon, OK?"
	prompt

UnknownText_0x1bd39e::
	text "Saving record…"
	line "Don't turn off!"
	done

UnknownText_0x1bd3d7::
	text "You have no coins."
	prompt

UnknownText_0x1bd3eb::
	text "You don't have a"
	line "Coin Case."
	prompt

UnknownText_0x1bd407::
	text "OK, connect the"
	line "Game Link Cable."
	prompt

UnknownText_0x1bd429::
	text "<PLAYER> traded"
	line "@"
	text_from_ram wMonOrItemNameBuffer
	text " for"
	cont "@"
	text_from_ram wStringBuffer2
	text ".@@"

UnknownText_0x1bd445::
	sound_dex_fanfare_80_109
	interpret_data
	db "@@"

UnknownText_TradeIntroText1::
	text "My friend says he"
	line "found his SCYTHER"
	cont "on ROUTE 5,"
	
	para "but I just can't"
	line "find one…"
	
	para "Do you have a"
	line "@"
	text_from_ram wStringBuffer1
	text "?"

	para "Want to trade it"
	line "for my @"
	text_from_ram wStringBuffer2
	text "?"
	done

UnknownText_TradeCancelText1::
	text "Sigh…"
	
	line "Maybe someday…"
	done

UnknownText_TradeWrongText1::
	text "Huh? That's not"
	line "@"
	text_from_ram wStringBuffer1
	text "."
	cont "What a letdown…"
	done

UnknownText_TradeCompleteText1::
	text "Yes!"
	
	para "I finally have a"
	line "@"
	text_from_ram wStringBuffer1
	text "!"
	
	para "Thanks a lot!"
	done

UnknownText_TradeAfterText1::
	text "Yo!"
	
	para "How's HERC been?"
	
	para "I've been taking"
	line "real good care of"
	cont "@"
	text_from_ram wTradeScytherName
	text "!"
	done
	
UnknownText_TradeIntroText2::
	text "People say the"
	line "EXEGGCUTE around"
	cont "here are special."
	
	para "Would you like to"
	line "trade one for your"
	cont "GLOOM?"
	done
	
UnknownText_TradeCancelText2::
	text "Ah shoot!"
	done

UnknownText_TradeWrongText2::
	text "Huh? That's not"
	line "@"
	text_from_ram wStringBuffer1
	text "."
	done

UnknownText_TradeCompleteText2::
	text "I caught"
	line "SUNNY SIDE on a"
	cont "little island off"
	cont "the coast."

	para "EXEGGCUTE caught"
	line "around here are"
	cont "known to evolve"
	cont "into a taller form"
	cont "than usual."
	
	para "Some say it's their"
	line "natural form!"
	
	para "…"
	
	para "Thanks again!"

	para "I'll take great"
	line "care of @"
	text_from_ram wTradeGloomName
	text "!"
	done

UnknownText_TradeAfterText2::
	text "Hey!"
	
	para "@"
	text_from_ram wTradeGloomName
	text "'s"
	line "doing awesome!"
	
	para "How is SUNNY SIDE"
	line "doing?"
	done
	
	
UnknownText_TradeIntroText3::
	text "Hi!"
	
	para "Do you have"
	line "SNEASEL?"
	
	para "Wanna trade for my"
	line "GLIGAR?"
	
	para "She may help you"
	line "if you're gonna"
	cont "take on the gym."
	
	para "Whaduya say?"
	done
	
UnknownText_TradeCancelText3::
	text "Darn!"
	done

UnknownText_TradeWrongText3::
	text "What? That's not"
	line "@"
	text_from_ram wStringBuffer1
	text "!"
	done

UnknownText_TradeCompleteText3::
	text "ROBIN there may"
	line "not be too great"
	cont "in this climate,"

	para "but the GYM LEADER"
	line "doesn't use"
	cont "ICE-type #MON,"
	
	para "so she should be"
	line "a big help!"
	
	para "…"
	
	para "Thanks again!"

	para "I'll take great"
	line "care of @"
	text_from_ram wTradeSneaselName
	text "!"
	done

UnknownText_TradeAfterText3::
	text "Hey!"
	
	para "How has ROBIN been"
	line "treating ya?"
	
	para "@"
	text_from_ram wTradeSneaselName
	text "'s"
	line "been great!"
	
	para "Thanks again for"
	line "the trade!"
	done
	
UnknownText_TradeIntroText4::
	text "Are you a TRAINER?"
	
	para "Do you have a"
	line "CROAGUNK?"
	
	para "I love it!"
	
	para "Would you trade"
	line "for my SCRAGGY?"
	done
	
UnknownText_TradeCancelText4::
	text "Awww…"
	done

UnknownText_TradeWrongText4::
	text "What? That's not"
	line "@"
	text_from_ram wStringBuffer1
	text "!"
	done

UnknownText_TradeCompleteText4::
	text "Yay!"
	
	para "A CROAGUNK!"
	
	para "My favorite!"
	
	para "Where'd you find"
	line "it?"
	
	para "…"
	
	para "The sewer?"
	
	para "What were you"
	line "doing in the"
	cont "sewer?"
	
	para "Well, @"
	text_from_ram wTradeSneaselName
	line "won't be going"
	cont "down to the sewer"
	cont "again any time soon…"
	done

UnknownText_TradeAfterText4::
	text "How is SHAGGY"
	line "doing, sewer kid?"
	
	para "@"
	text_from_ram wTradeSneaselName
	text "'s"
	line "been great!"
	
	para "Thanks again for"
	line "the trade!"
	done

UnknownText_TradeIntroText5::
	text "My job keeps me so"
	line "busy that I can't"
	cont "always give my"
	cont "#MON the atten-"
	cont "tion she needs…"
	
	para "I think I need a"
	line "lower mantinence"
	cont "#MON!"
	
	para "Do you have a"
	line "MEOWTH?"
	
	para "Would you trade"
	line "for my HOUNDOUR?"
	done
	
UnknownText_TradeCancelText5::
	text "That's no good!"
	done
	
UnknownText_TradeWrongText5::
	text "I was hoping"
	line "for a #MON like"
	cont "MEOWTH…"
	done
	
UnknownText_TradeCompleteText5::
	text "Alright!"
	
	para "Please take good"
	line "care of MITTENS!"
	
	para "I'm really going to"
	line "miss her…"
	done
	
UnknownText_TradeAfterText5::
	text "Oh it's you!"
	
	para "How is MITTENS?"
	
	para "Are you giving her"
	line "lots of attention?"
	
	para "@"
	text_from_ram wTradeMeowthName
	text "'s been"
	line "a lot better for"
	cont "me with my busy"
	cont "schedule."
	done
	
UnknownText_TradeIntroText6::
	text "I love cactus"
	line "#MON, but my"
	cont "MARACTUS keeps me"
	cont "up all night with"
	cont "it's dancing!"
	
	para "I wish I had a"
	line "more quiet cactus"
	cont "#MON…"
	
	para "Do you have a"
	line "CACNEA?"
	
	para "Would you trade"
	line "for my MARACTUS?"
	done
	
UnknownText_TradeCancelText6::
	text "No sleep for me,"
	line "then!"
	done
	
UnknownText_TradeWrongText6::
	text "I really wanted"
	line "another cactus"
	cont "#MON…"
	done
	
UnknownText_TradeCompleteText6::
	text "Nice!"
	
	para "I hope SAMBA's"
	line "dancing will bring"
	cont "a smile to your"
	cont "face!"
	done
	
UnknownText_TradeAfterText6::
	text "Oh hi!"
	
	para "How is SAMBA?"
	
	para "Still dancing into"
	line "into the night?"
	
	para "@"
	text_from_ram wTradeCacneaName
	text "'s so"
	line "quiet!"
	
	para "I've been sleeping"
	line "like never before!"
	done
	
UnknownText_0x1bd88e::
	text "Transaction"
	line "cancelled!"
	done

UnknownText_0x1bd8da::
	text "<PLAYER> inserted"
	line "the ATM CARD."
	done

UnknownText_0x1bd942::
	text "Welcome!"
	
	para "What do you want"
	line "to do?"
	done

UnknownText_0x1bd95b::
	text "Deposit how"
	line "much?"
	done

UnknownText_0x1bd97a::
	text "Withdraw how"
	line "much?"
	done

UnknownText_0x1bd999::
	text "What do you want"
	line "to do?"
	done

UnknownText_0x1bd9ba::
	text "You haven't saved"
	line "that much."
	done

UnknownText_0x1bd9d7::
	text "You can't take"
	line "that much."
	done

UnknownText_0x1bd9f1::
	text "You don't have"
	line "that much."
	done

UnknownText_0x1bda0b::
	text "You can't save"
	line "that much."
	done

UnknownText_0x1bda25::
	text "OK, I'll save your"
	line "money. Trust me!"

	para "<PLAYER>, stick"
	line "with it!"
	done

UnknownText_0x1bda5b::
	text "Your money's safe"
	line "here! Get going!"
	done

UnknownText_0x1bda7e::
	text "Transaction"
	line "complete!"
	done

UnknownText_0x1bda90::
	text "Have a nice day!"
	done

UnknownText_0x1bdaa9::
	text "I'm the Day-Care"
	line "Man. Want me to"
	cont "raise a #mon?"
	done

UnknownText_0x1bdad8::
	text "I'm the Day-Care"
	line "Man. Do you know"
	cont "about Eggs?"

	para "I was raising"
	line "#mon with my"
	cont "wife, you see."

	para "We were shocked to"
	line "find an Egg!"

	para "How incredible is"
	line "that?"

	para "So, want me to"
	line "raise a #mon?"
	done

UnknownText_0x1bdb85::
	text "I'm the Day-Care"
	line "Lady."

	para "Should I raise a"
	line "#mon for you?"
	done

UnknownText_0x1bdbbb::
	text "I'm the Day-Care"
	line "Lady. Do you know"
	cont "about Eggs?"

	para "My husband and I"
	line "were raising some"
	cont "#mon, you see."

	para "We were shocked to"
	line "find an Egg!"

	para "How incredible"
	line "could that be?"

	para "Should I raise a"
	line "#mon for you?"
	done

UnknownText_0x1bdc79::
	text "What should I"
	line "raise for you?"
	prompt

UnknownText_0x1bdc97::
	text "Oh? But you have"
	line "just one #mon."
	prompt

UnknownText_0x1bdcb8::
	text "Sorry, but I can't"
	line "accept an Egg."
	prompt

UnknownText_0x1bdcda::
	text "Remove Mail before"
	line "you come see me."
	prompt

UnknownText_0x1bdcff::
	text "If you give me"
	line "that, what will"
	cont "you battle with?"
	prompt

UnknownText_0x1bdd30::
	text "OK. I'll raise"
	line "your @"
	text_from_ram wStringBuffer1
	text "."
	prompt

UnknownText_0x1bdd4b::
	text "Come back for it"
	line "later."
	done

UnknownText_0x1bdd64::
	text "Are we geniuses or"
	line "what? Want to see"
	cont "your @"
	text_from_ram wStringBuffer1
	text "?"
	done

UnknownText_0x1bdd96::
	text "Your @"
	text_from_ram wStringBuffer1
	text ""
	line "has grown a lot."

	para "Its level grew"
	line "by @"
	deciram wStringBuffer2 + 1, 1, 3
	text "."

	para "If you want your"
	line "#mon back, it"
	cont "will cost ¥@"
	deciram wStringBuffer2 + 2, 3, 4
	text "."
	done

UnknownText_0x1bde04::
	text "Perfect! Here's"
	line "your #mon."
	prompt

UnknownText_0x1bde1f::
	text "<PLAYER> got back"
	line "@"
	text_from_ram wStringBuffer1
	text "."
	prompt

UnknownText_0x1bde32::
	text "Huh? Back already?"
	line "Your @"
	text_from_ram wStringBuffer1
	text ""
	para "needs a little"
	line "more time with us."

	para "If you want your"
	line "#mon back, it"
	cont "will cost ¥100."
	done

UnknownText_0x1bdea2::
	text "You have no room"
	line "for it."
	prompt

UnknownText_0x1bdebc::
	text "You don't have"
	line "enough money."
	prompt

UnknownText_0x1bded9::
	text "Oh, fine then."
	prompt

UnknownText_0x1bdee9::
	text "Come again."
	done

UnknownText_0x1bdef6::
	text "Not yet…"
	done

UnknownText_0x1bdf00::
	text "Ah, it's you!"

	para "We were raising"
	line "your #mon, and"

	para "my goodness, were"
	line "we surprised!"

	para "Your #mon had"
	line "an Egg!"

	para "We don't know how"
	line "it got there, but"

	para "your #mon had"
	line "it. You want it?"
	done

UnknownText_0x1bdfa5::
	text "<PLAYER> received"
	line "the Egg!"
	done

UnknownText_0x1bdfba::
	text "Take good care of"
	line "it."
	done

UnknownText_0x1bdfd1::
	text "Well then, I'll"
	line "keep it. Thanks!"
	done

UnknownText_0x1bdff2::
	text "You have no room"
	line "in your party."
	cont "Come back later."
	done
