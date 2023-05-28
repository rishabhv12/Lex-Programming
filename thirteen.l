/* 13. Implementing a text classification tool: A Lex program can be used to implement a text */
/* classification tool by defining regular expressions for different text categories and matching */
/* them against input text. */
%{
#include <stdio.h>
#include <string.h>
%}

%option noyywrap

/* Categories */
%{
    int category = 0;
%}
%%
"apple"     { category = 1; }
"banana"    { category = 2; }
"cherry"    { category = 3; }
"date"      { category = 4; }
"elderberry"{ category = 5; }

/* Default rule */
.           { category = 0; }

%%

int main(int argc, char** argv)
{
    /* Initialize lexer */
    FILE *fp = fopen("pal.txt","r");
    yyin = fp;
    
   

    /* Tokenize input */
    char line[256];
    while (fgets(line, sizeof(line), yyin)) {
        /* Strip newline character */
        line[strcspn(line, "\n")] = '\0';

        /* Match against categories */
        yylex();

        /* Print category */
        printf("%s: ", line);
        switch (category) {
            case 1: printf("fruit\n"); break;
            case 2: printf("fruit\n"); break;
            case 3: printf("fruit\n"); break;
            case 4: printf("fruit\n"); break;
            case 5: printf("fruit\n"); break;
            default: printf("unknown\n"); break;
        }
    }

    /* Clean up */
    fclose(fp);
    return 0;
}
