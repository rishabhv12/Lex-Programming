/* 10. Implementing a data validation tool: A Lex program can implement a data */
/* validation tool by defining regular expressions for valid input patterns. */

%{
#include <stdio.h>  
%}

%option noyywrap
%%
    /* Regular expressions for valid input patterns */
email [a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}
phone \d{3}-\d{3}-\d{4}
zip \d{5}(-\d{4})?
date \d{1,2}/\d{1,2}/\d{4}
time \d{1,2}:\d{2}(am|pm)
%%
int main(int argc, char** argv)
{
    /* Initialize lexer */
    FILE *fp = fopen("pal.txt","r");
    yyin = fp;

    /* Tokenize input */
    while (yylex() != 0);

    /* Clean up */
    fclose(yyin);
    return 0;
}