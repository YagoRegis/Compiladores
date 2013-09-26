%{
#include "global.h"
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

extern char buffer;

//extern FILE *stdin;
//stdin = fopen ("texto.txt", "r");

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
   | Atribuicao
   | If 
   | Write END_LINE { }
   | Read END_LINE { }
   | Comparacao
   ;
Integer:
   INTEGER
   ;
Float:
   FLOAT
   ;
Atribuicao:
   STRING EQUALS Expression { printf("%s = %f", &buffer, $3); }
   |STRING EQUALS STRING { printf("Atribuicao2"); }
   ;

Boolean:
   AND { printf(" && "); }
   | OR { printf(" || "); }
   | NOT { printf(" ! "); }
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
   IF LEFT_PARENTHESIS {printf ("if(");} Comparacao RIGHT_PARENTHESIS  { printf(")"); }
   | IF2 { printf("if(");} Comparacao { printf(")"); }
   ;

Comparacao:
   Comparacao Boolean Comparacao
   | Expression SMALLER_THAN Expression {printf ("%f < %f", $1, $3);}
   | Expression BIGGER_THAN Expression {printf ("%f > %f", $1, $3);}
   | Expression COMPARATION Expression {printf ("%f == %f", $1, $3);}
   | Expression SMALLER_EQUALS Expression {printf ("%f <= %f", $1, $3);}
   | Expression BIGGER_EQUALS Expression {printf ("%f >= %f", $1, $3);}
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
