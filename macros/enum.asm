; Enumerate variables

MACRO enum_start
if _NARG >= 1
DEF __enum__ = \1
else
DEF __enum__ = 0
endc
if _NARG >= 2
DEF __enumdir__ = \2
else
DEF __enumdir__ = +1
endc
ENDM

MACRO enum
DEF \1 = __enum__
DEF __enum__ = __enum__ + __enumdir__
ENDM

MACRO enum_set
DEF __enum__ = \1
ENDM


; Enumerate constants

MACRO const_def
if _NARG >= 1
DEF const_value = \1
else
DEF const_value = 0
endc
ENDM

MACRO const
DEF \1 EQU const_value
DEF const_value = const_value + 1
ENDM

MACRO shift_const
DEF \1 EQU (1 << const_value)
DEF const_value = const_value + 1
ENDM


; Enumerate strings

MACRO define
if !def(\1)
def \1 equs \2
endc
ENDM
