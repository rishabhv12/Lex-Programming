/* 7. Implementing a data validation tool: A Lex program can be used to implement */
/* a data validation tool by defining regular expressions for valid input patterns. */

%{
#include <stdio.h>
#include <stdlib.h>
%}

%option noyywrap
/* Regular expressions */
digit [0-9]
letter [a-zA-Z]
id {letter}({letter}|{digit})*
date {digit}{4}-\d{2}-\d{2}
time \d{2}:\d{2}:\d{2}
%%

    /* Rules for valid input */
{date} { printf("Valid date: %s\n", yytext); }
{time} { printf("Valid time: %s\n", yytext); }
{id} { printf("Valid ID: %s\n", yytext); }
    /* Rules for invalid input */
. { printf("Invalid input: %s\n", yytext); }

%%
int main(int argc, char** argv)
{
    FILE *fp = fopen("demo.txt","r");
    yyin = fp;
    yylex();
    fclose(fp);
    /* Initialize lexer */
    
    /* Clean up */
    return 0;
}