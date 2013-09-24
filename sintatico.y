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
%token IF IF2 THEN ELSE AND OR NOT DEFAULT
%token EQUALS SMALLER_THAN BIGGER_THAN COMPARATION SMALLER_EQUALS BIGGER_EQUALS
%token PRINT SCANF QUOTATION ARROW
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
   | Read END_LINE { }
   ;
Integer:
   INTEGER {printf("Inteiro\n");}
   ;
Float:
   FLOAT { printf("float\n");}
   ;

Boolean:
   AND | OR | NOT
   ;
Expression:
   Integer { $$=$1; }
   |Float { $$=$1; }
   | Expression POWER Expression { $$=pow($1,$3); }
   | LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=$2; }
   | LEFT_COLCHETES Expression RIGHT_COLCHETES { $$=$2; }
   | LEFT_KEYS Expression RIGHT_KEYS { $$=$2; }
   | Expression PLUS Expression { $$ = $1 + $3; printf("%f\n",$$);}
   | Expression MINUS Expression { $$=$1-$3; }
   | Expression TIMES Expression { $$=$1*$3; }
   | Expression DIVIDE Expression { $$=$1/$3; }
   | MINUS Expression %prec NEG { $$ = -$2; }
   ;

If:
   IF LEFT_PARENTHESIS Comparacao RIGHT_PARENTHESIS  { }
   | IF2 Comparacao { printf("if");}
   ;

Comparacao:
   Comparacao Boolean Comparacao
   | Expression SMALLER_THAN Expression 
   | Expression BIGGER_THAN Expression 
   | Expression COMPARATION Expression 
   | Expression SMALLER_EQUALS Expression
   | Expression BIGGER_EQUALS Expression
   ;
Write:
   PRINT LEFT_PARENTHESIS QUOTATION STRING QUOTATION RIGHT_PARENTHESIS { printf( "printf(\"%s\"); \n", &buffer); }
   ;
Read:
   STRING ARROW SCANF {printf("scanf(\"%%s\", &%s);", &buffer);}
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
