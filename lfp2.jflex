%%

%class Lfp2
%unicode
%line
%column

//classe ter uma funcao main e ser usada como reconhecimento
%standalone

//gerar atributos para usar nas acoes
%{
int qtdId = 0;
%}


%eof{
System.out.println("Quantidade de Identificadores encontrados: "+qtdId);
%eof}

whitespace	= [ \n\t\r\f]
letter		= [A-Za-z]
digit		= [0-9]
comment		= "/*" [^*] ~"*/"
linecomment = "//" [^*] ~"\n"
underline	= [_]
alfanumerico = {letter}|{digit}|{underline}
identificadores = ({letter}|{underline})({alfanumerico})*
comentarios = {comment}|{linecomment}
inteiros = {digit}+

%%

"if"			{ System.out.println("Token IF"); }
"else"			{System.out.println("Token ELSE");}
"return"		{System.out.println("Token RETURN");}
"length"		{System.out.println("Token LENGTH");}
"true"			{System.out.println("Token TRUE");}
"false"			{System.out.println("Token FALSE");}
"this"			{System.out.println("Token THIS");}
"new"			{System.out.println("Token NEW");}
"System.out.println" {System.out.println("Token SYSTEM.OUT.PRINTLN");}
"boolean"		{System.out.println("Token BOOLEAN");}
"class"			{System.out.println("Token CLASS");}
"extends"		{System.out.println("Token EXTENDS");}
"static"		{System.out.println("Token STATIC");}
"void"			{System.out.println("Token VOID");}
"public"		{System.out.println("Token PUBLIC");}
"main"			{System.out.println("Token MAIN");}
"String"		{System.out.println("Token STRING");}
"int"			{System.out.println("Token INT");}
"*"             { System.out.println("Token *"); }
"+"             { System.out.println("Token +"); }
"-"             { System.out.println("Token -"); }
"<"             { System.out.println("Token <"); }
"&&"            { System.out.println("Token &&"); }
"=="            { System.out.println("Token =="); }
"!="            { System.out.println("Token !="); }
"!"             { System.out.println("Token !"); }
"("             { System.out.println("Token ("); }
")"             { System.out.println("Token )"); }
"{"             { System.out.println("Token {"); }
"}"             { System.out.println("Token }"); }
"["             { System.out.println("Token ["); }
"]"             { System.out.println("Token ]"); }
"."             { System.out.println("Token ."); }
";"             { System.out.println("Token ;"); }
","             { System.out.println("Token ,"); }
"="             { System.out.println("Token ="); }
{identificadores}    { qtdId++; System.out.println("Token ID ("+yytext()+")"); }
{inteiros}       { System.out.println("Token INT ("+yytext()+")"); }
{comentarios}    { }
{whitespace}    { }

. { throw new RuntimeException("Caractere ilegal! '" + yytext() + "' na linha: " + yyline + ", coluna: " + yycolumn); }
