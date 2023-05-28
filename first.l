/* 1. Program to count the number of vowels in a given input */


%{
#include <stdio.h>
int vowel_count = 0;
%}

%%
[AEIOUaeiou]    { vowel_count++; }
.              ; /* ignore all other characters */

%%
int main() {
    FILE *fp = fopen("demo.txt","r");
    yyin = fp;
    yylex();
    fclose(fp);
    printf("Number of vowels: %d\n", vowel_count);
    return 0;
}
