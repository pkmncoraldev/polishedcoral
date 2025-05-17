; Enumerate variables

MACRO enum_start
if _NARG >= 1
__enum__ = \1
else
__enum__ = 0
endc
if _NARG >= 2
__enumdir__ = \2
else
__enumdir__ = +1
endc
ENDM

MACRO enum
\1 = __enum__
__enum__ = __enum__ + __enumdir__
ENDM

MACRO enum_set
__enum__ = \1
ENDM


; Enumerate constants

MACRO const_def
if _NARG >= 1
const_value = \1
else
const_value = 0
endc
ENDM

MACRO const
\1 EQU const_value
const_value = const_value + 1
ENDM

MACRO shift_const
\1 EQU (1 << const_value)
const_value = const_value + 1
ENDM


; Enumerate strings

MACRO define
if !def(\1)
\1 equs \2
endc
ENDM
