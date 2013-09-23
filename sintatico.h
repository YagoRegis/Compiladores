/* A Bison parser, made by GNU Bison 2.5.  */

/* Bison interface for Yacc-like parsers in C
   
      Copyright (C) 1984, 1989-1990, 2000-2011 Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     INTEGER = 258,
     FLOAT = 259,
     STRING = 260,
     NEG = 261,
     PLUS = 262,
     MINUS = 263,
     TIMES = 264,
     DIVIDE = 265,
     POWER = 266,
     LEFT_PARENTHESIS = 267,
     RIGHT_PARENTHESIS = 268,
     LEFT_COLCHETES = 269,
     RIGHT_COLCHETES = 270,
     LEFT_KEYS = 271,
     RIGHT_KEYS = 272,
     IF = 273,
     THEN = 274,
     ELSE = 275,
     AND = 276,
     OR = 277,
     NOT = 278,
     DEFAULT = 279,
     EQUALS = 280,
     SMALLER_THAN = 281,
     BIGGER_THAN = 282,
     COMPARATION = 283,
     SMALLER_EQUALS = 284,
     BIGGER_EQUALS = 285,
     PRINT = 286,
     SCANF = 287,
     QUOTATION = 288,
     TYPING = 289,
     END_LINE = 290,
     VIRGULA = 291
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


