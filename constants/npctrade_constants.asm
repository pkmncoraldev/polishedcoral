; see data/events/npc_trades.asm:NPCTrades
	const_def
	const TRADE_WITH_JAKE_FOR_HERACROSS  ; 0
	const TRADE_WITH_PAUL_FOR_PONYTA	 ; 1
	const TRADE_WITH_ALICE_FOR_GLIGAR 	 ; 2
	const TRADE_WITH_EMY_FOR_SCRAGGY     ; 3
	const TRADE_WITH_TABBY_FOR_HOUNDOUR  ; 4
	const TRADE_WITH_CARRIE_FOR_MARACTUS ; 5
	const TRADE_WITH_MARTY_FOR_MIENFOO   ; 6
	const TRADE_WITH_BEV_FOR_VOLTORB     ; 7

; Trade struct
DEF TRADE_DIALOG      EQU 0
DEF TRADE_GIVEMON     EQU 1
DEF TRADE_GETMON      EQU 2
DEF TRADE_NICK        EQU 3
DEF TRADE_DVS         EQU 14
DEF TRADE_PERSONALITY EQU 17
DEF TRADE_BALL        EQU 19
DEF TRADE_ITEM        EQU 20
DEF TRADE_OT_ID       EQU 22
DEF TRADE_OT_NAME     EQU 23

; Trade dialogs
DEF TRADE_INTRO    EQU 0
DEF TRADE_CANCEL   EQU 1
DEF TRADE_WRONG    EQU 2
DEF TRADE_COMPLETE EQU 3
DEF TRADE_AFTER    EQU 4
