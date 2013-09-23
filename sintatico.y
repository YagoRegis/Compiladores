%{
#include "global.h"
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

extern char buffer;
%}

%token INTEGER FLOAT STRING
%token NEG
%token PLUS MINUS TIMES DIVIDE POWER
%token LEFT_PARENTHESIS RIGHT_PARENTHESIS
%token LEFT_COLCHETES RIGHT_COLCHETES
%token LEFT_KEYS RIGHT_KEYS
%token IF THEN ELSE AND OR NOT DEFAULT
%token EQUALS SMALLER_THAN BIGGER_THAN COMPARATION SMALLER_EQUALS BIGGER_EQUALS
%token PRINT SCANF QUOTATION
%token TYPING
%token END_LINE VIRGULA

%%

Input:
   /* Empty */
   | Input Line
   ;
Line:
   END_LINE
   | Expression END_LINE { }
   | If
   | Write
   ;
Integer:
   INTEGER {printf("Inteiro\n");}
   ;
Float:
   FLOAT { printf("float\n");}
   ;
Expression:
   Integer { $$=$1; }
   |Float { $$=$1; }
   | Expression PLUS Expression { $$ = $1 + $3; printf("%f\n",$$);}
   | Expression MINUS Expression { $$=$1-$3; }
   | Expression TIMES Expression { $$=$1*$3; }
   | Expression DIVIDE Expression { $$=$1/$3; }
   | MINUS Expression %prec NEG { $$ = -$2; }
   | Expression POWER Expression { $$=pow($1,$3); }
   | LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=$2; }
   | LEFT_COLCHETES Expression RIGHT_COLCHETES { $$=$2; }
   | LEFT_KEYS Expression RIGHT_KEYS { $$=$2; }
   ;
If:
   IF LEFT_PARENTHESIS INTEGER Comparacao INTEGER RIGHT_PARENTHESIS { printf("comparacao\n"); }
   ;
Comparacao:
   SMALLER_THAN | BIGGER_THAN | COMPARATION | SMALLER_EQUALS | BIGGER_EQUALS
   ;
Write:
   PRINT LEFT_PARENTHESIS QUOTATION STRING QUOTATION RIGHT_PARENTHESIS { printf(" %s \n", &buffer); }
   ;
/*
List:
   EQUALS LEFT_COLCHETES INTEGER VIRGULA Term RIGHT_COLCHETES { }
   ;

Term:
   INTEGER 
   | VIRGULA Term { }
   ;
*/

%%

int yyerror(char *s) {
   printf("%s\n",s);
}

int main(void) {
   yyparse();
}
