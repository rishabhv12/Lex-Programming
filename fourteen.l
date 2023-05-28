/* 14. Implementing a regular expression engine: A Lex program can be used to implement */
/* a regular expression engine by defining regular expressions for pattern matching. */


%{
#include <stdio.h>
#include <string.h>
%}

%option noyywrap
/* Regular expressions */
%{
int in_brackets = 0;
%}
%%
[0-9]+ printf("Matched integer: %s\n", yytext);
[a-zA-Z]+ printf("Matched word: %s\n", yytext);
[^\s\[\]]+ printf("Matched string: %s\n", yytext);
. ;
%%
int main(int argc, char** argv)
{
/* Initialize lexer */
    FILE *fp = fopen("pal.txt","r");
    yyin = fp;
    yylex();
    fclose(fp);

return 0;
}