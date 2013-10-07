%{
#include "global.h"
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <string.h>

extern char buffer;
extern char buffer2;

/*typedef struct _table_variable{

  char[10] type;
  int value;
  float value;

} table_variable;
*/

//extern FILE *stdin;
//stdin = fopen ("texto.txt", "r");

%}


%token INTEGER FLOAT STRING VARIABLE
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
   | Write
   | Read 
   | Comparacao
   | Boolean
   ;
Integer:
   INTEGER
   ;
Float:
   FLOAT
   ;
Atribuicao:
   VARIABLE EQUALS { printf("%s = ", &buffer2);} Expression {printf (";");}
   |VARIABLE EQUALS STRING { int x; x = (int)strlen(&buffer)-2; printf("char %s[%d] = %s;",&buffer2, x, &buffer); }
   ;

Boolean:
   AND { printf(" && "); }
   | OR { printf(" || "); }
   | NOT { printf(" ! "); }
   ;
Expression:
   Integer { printf("%d", (int)$$); }
   |Float { printf("%f", $$); }
   | Expression POWER Expression { $$=pow($1,$3); }
   | LEFT_PARENTHESIS { printf("(");} Expression RIGHT_PARENTHESIS { printf(")");}
   | LEFT_COLCHETES { printf("[");} Expression RIGHT_COLCHETES { printf("]");}
   | LEFT_KEYS { printf("{");} Expression RIGHT_KEYS { printf("}");}
   | Expression PLUS { printf(" + ");} Expression 
   | Expression MINUS { printf(" - ");} Expression
   | Expression TIMES { printf(" * ");} Expression
   | Expression DIVIDE { printf(" / ");} Expression
   | MINUS Expression %prec NEG
   ;

If:
   IF LEFT_PARENTHESIS {printf ("if(");} Comparacao RIGHT_PARENTHESIS  { printf(")"); }
   | IF2 { printf("if(");} Comparacao { printf(")"); }
   ;

Comparacao:
   Comparacao Boolean Comparacao
   | Expression SMALLER_THAN {printf (" < ");} Expression 
   | Expression BIGGER_THAN {printf (" > ");} Expression 
   | Expression COMPARATION {printf (" == ");} Expression 
   | Expression SMALLER_EQUALS {printf (" <= ");} Expression 
   | Expression BIGGER_EQUALS {printf (" >= ");} Expression 
   ;

Write:
   PRINT LEFT_PARENTHESIS STRING RIGHT_PARENTHESIS { printf( "printf(%s); \n", &buffer); }
   ;
Read:
   VARIABLE ARROW SCANF {printf("scanf(\"%%s\", &%s);", &buffer2);}
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
