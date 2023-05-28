/* 2. Program to count the number of words in a given input */

%{
int word_count = 0;
%}
%%
[a-zA-Z]+ { word_count++; }
. ; /* do nothing for other characters */
%%
int main() {
    FILE *fp = fopen("demo.txt","r");
    yyin = fp;
    yylex();
    fclose(fp);
    printf("Number of words: %d\n", word_count);
    return 0;
}