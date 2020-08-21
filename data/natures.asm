NatureNames:
	dw Hardy, Lonely, Brave, Adamant, Naughty
	dw Bold, Docile, Relaxed, Impish, Lax
	dw Timid, Hasty, Serious, Jolly, Naive
	dw Modest, Mild, Quiet, Bashful, Rash
	dw Calm, Gentle, Sassy, Careful, Quirky
	dw NoNature

Hardy:    db "HARDY@"
Lonely:   db "LONELY@"
Brave:    db "BRAVE@"
Adamant:  db "ADAMANT@"
Naughty:  db "NAUGHTY@"
Bold:     db "BOLD@"
Docile:   db "DOCILE@"
Relaxed:  db "RELAXED@"
Impish:   db "IMPISH@"
Lax:      db "LAX@"
Timid:    db "TIMID@"
Hasty:    db "HASTY@"
Serious:  db "SERIOUS@"
Jolly:    db "JOLLY@"
Naive:    db "NAIVE@"
Modest:   db "MODEST@"
Mild:     db "MILD@"
Quiet:    db "QUIET@"
Bashful:  db "BASHFUL@"
Rash:     db "RASH@"
Calm:     db "CALM@"
Gentle:   db "GENTLE@"
Sassy:    db "SASSY@"
Careful:  db "CAREFUL@"
Quirky:   db "QUIRKY@"
NoNature: db "---@"


NatureIndicators:
	dw HardyInd, LonelyInd, BraveInd, AdamantInd, NaughtyInd
	dw BoldInd, DocileInd, RelaxedInd, ImpishInd, LaxInd
	dw TimidInd, HastyInd, SeriousInd, JollyInd, NaiveInd
	dw ModestInd, MildInd, QuietInd, BashfulInd, RashInd
	dw CalmInd, GentleInd, SassyInd, CarefulInd, QuirkyInd
	dw NoNatureInd

SassyInd:   db "<NL>" ; fallthrough
RashInd:    db "<NL>" ; fallthrough
ImpishInd:  db "<NL>" ; fallthrough
LonelyInd:  db "↑<NL>↓@"
NaiveInd:   db "<NL>" ; fallthrough
CarefulInd: db "<NL>" ; fallthrough
MildInd:    db "<NL>" ; fallthrough
BoldInd:    db "↓<NL>↑@"
QuietInd:   db "<NL>" ; fallthrough
LaxInd:     db "<NL>" ; fallthrough
AdamantInd: db "↑<NL><NL>↓@"
JollyInd:   db "<NL>" ; fallthrough
GentleInd:  db "<NL>" ; fallthrough
ModestInd:  db "↓<NL><NL>↑@"
RelaxedInd: db "<NL>" ; fallthrough
NaughtyInd: db "↑<NL><NL><NL>↓@"
HastyInd:   db "<NL>" ; fallthrough
CalmInd:    db "↓<NL><NL><NL>↑@"
BraveInd:   db "↑<NL><NL><NL><NL>↓@"
TimidInd:   db "↓<NL><NL><NL><NL>↑" ; fallthrough
HardyInd:
DocileInd:
SeriousInd:
BashfulInd:
QuirkyInd:
NoNatureInd: db "@"
