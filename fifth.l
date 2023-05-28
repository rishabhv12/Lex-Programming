/* 5. Program to extract all email addresses from a given input */


%%
[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,} { printf("%s\n", yytext); }
. ; /* do nothing for other characters */
%%
int main() {
    FILE *fp = fopen("email.txt","r");
    yyin = fp;
    yylex();
    fclose(fp);
return 0;
}