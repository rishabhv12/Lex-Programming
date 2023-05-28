%{
#include <stdio.h>
#include <stdlib.h>
%}

%%
[0-9]+      { printf("Number: %s\n", yytext); }
"+"         { printf("Operator: +\n"); }
"-"         { printf("Operator: -\n"); }
"*"         { printf("Operator: *\n"); }
"/"         { printf("Operator: /\n"); }
"("         { printf("Left Parenthesis\n"); }
")"         { printf("Right Parenthesis\n"); }
[ \t\n]     ;   // ignore whitespace and newline
.           { printf("Invalid character: %c\n", *yytext); }
%%

int main() {
    FILE *fp = fopen("pal.txt","r");
    yyin = fp;
    yylex();
    fclose(fp);
    return 0;
}
