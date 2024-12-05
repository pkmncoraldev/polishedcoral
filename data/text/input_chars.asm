; see engine/naming_screen.asm

NameInputLower:
	db "1 2 3 4 5 6 7 8 9"
	db "0 ♂ ♀ & ¥ + ¿ ¡ ″"
	db "é 'd 'l 'm 'r 's 't 'v ′"
	db "<SHARP> ( ) : ★ ♥ ♪ <PK> <MN>"
	db " ABC   DEL   END "

BoxNameInputLower:
	db "a b c d e f g h i"
	db "j k l m n o p q r"
	db "s t u v w x y z  "
	db "é 'd 'l 'm 'r 's 't 'v 0"
	db "1 2 3 4 5 6 7 8 9"
	db "UPPER  DEL   END "

NameInputUpper:
	db "A B C D E F G H I"
	db "J K L M N O P Q R"
	db "S T U V W X Y Z  "
	db "- ? ! / . , “ ” …"
	db "OTHER  DEL   END "

BoxNameInputUpper:
	db "A B C D E F G H I"
	db "J K L M N O P Q R"
	db "S T U V W X Y Z  "
	db "/ ( ) ¥ <PK> <MN> ★ ♥ ♪"
	db "? ! ♂ ♀ . , : & %"
	db "lower  DEL   END "

MailEntry_Uppercase:
	db "A B C D E F G H I J"
	db "K L M N O P Q R S T"
	db "U V W X Y Z ? ! … :"
	db "1 2 3 4 5 6 7 8 9 0"
	db "<PK> <MN> <PO> <KE> é ♂ ♀ ¥ × /"
	db "lower  DEL   END "

MailEntry_Lowercase:
	db "a b c d e f g h i j"
	db "k l m n o p q r s t"
	db "u v w x y z   - . ,"
	db "'d 'l 'm 'r 's 't 'v ( ) &"
	db "“ ” ' % ↑ ↓ № ★ ♥ ♪"
	db "UPPER  DEL   END "
