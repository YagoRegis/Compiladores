%{

#include "global.h"
#include "sintatico.h"
#include <stdlib.h>

char buffer[500];
%}

white [ \t]+
digit [0-9]
integer {digit}+
real {integer}("."{integer})
string [a-zA-Z ][a-zA-Z{integer} ]*
variable {string}

%%
{integer} {
   yylval=atof(yytext);
   return (INTEGER);
   };
{real} {
   yylval=atof(yytext);
   return (FLOAT);
   };

"then" return (THEN);
"else" return (ELSE);
"if" return (IF);
"not" return (NOT);
"putStrLn" return (PRINT);
"getLine" return (SCANF);
"otherwise" return (DEFAULT);
"+" return (PLUS);
"-" return (MINUS);
"*" return (TIMES);
"/" return (DIVIDE);
"^" return (POWER);
"(" return (LEFT_PARENTHESIS);
")" return (RIGHT_PARENTHESIS);
"[" return (LEFT_COLCHETES);
"]" return (RIGHT_COLCHETES);
"{" return (LEFT_KEYS);
"}" return (RIGHT_KEYS);
"\n" return (END_LINE);
"|" return (IF);
"&&" return (AND);
"||" return (OR);
"=" return (EQUALS);
"==" return (COMPARATION);
"<" return (SMALLER_THAN);
"<=" return(SMALLER_EQUALS);
">" return (BIGGER_THAN);
">=" return (BIGGER_EQUALS);
"::" return (TYPING);
"\"" return (QUOTATION);
"," return (VIRGULA);

{string} {
   strcpy(buffer,yytext); 
   return (STRING);
   };


%%
yywrap(){
return 0;
}
