%{
#include <stdio.h>
#include <stdlib.h>
%}

%token ID NUM IF LE GE EQ NE OR AND ELSE B WHILE DO FOR EIF
%right '='
%left AND OR
%left '<' '>' LE GE EQ NE
%left '+' '-'
%left '*' '/'
%left '!'
%%

S       : ST {printf("\nSyntax is Valid");exit(0);};

ST      : IF '(' COND B ST1 '}' IF2
        | IF '(' COND B ST1 '}'
        | FOR '(' E ';' COND ';' E B ST1 '}'
        | WHILE '(' COND B ST1 '}'
        | DO '{' ST1 '}' WHILE '(' COND B
        ;

IF2     : EIF '(' COND B ST1 '}' IF2 
        | ELSE '{' ST1 '}'   
        | EIF '(' COND B ST1 '}'
        ;

ST1     : E ';' ST1 | E ';'         

E       : ID '=' E
        | E '+' E
        | E '-' E
        | E '*' E
        | E '/'E 
        | E '<'E 
        | E '>'E 
        | E LE E
        | E GE E
        | E EQ E
        | E NE E
        | E OR E
        | E AND E
        | '(' E ')'
        | ID
        | NUM
        ; 

COND    : E '<' E
        | E '>' E
        | E LE E
        | E GE E
        | E EQ E
        | E NE E
        | E OR E
        | E AND E
        | ID
        | NUM
        ;
%%

void main()
{
printf("\nEnter loop or if else statement:\n");

yyparse();
}

void yyerror()
{
printf("\nSyntax is Invalid\n\n");
}