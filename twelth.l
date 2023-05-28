/* 12. Implementing a compiler: A Lex program can be used to implement a */
/* compiler by defining regular expressions for language constructs and generating output code. */

%{
#include <stdio.h>
%}
%option noyywrap

/* Tokens */
PLUS '+'
MINUS '-'
TIMES '*'
DIVIDE '/'
LPAREN '('
RPAREN ')'
NUMBER [0-9]+

%%
    /* Rules */
{PLUS} printf("ADD\n");
{MINUS} printf("SUB\n");
{TIMES} printf("MUL\n");
{DIVIDE} printf("DIV\n");
{LPAREN} printf("LPAREN\n");
{RPAREN} printf("RPAREN\n");
{NUMBER} printf("PUSH %s\n", yytext);
%%
int main(int argc, char** argv)
{
    FILE *fp = fopen("pal.txt","r");
    yyin = fp;
    
    
    /* Initialize lexer */
   
    while (yylex() != 0);
    
    /* Clean up */
    fclose(fp);
    return 0;
}