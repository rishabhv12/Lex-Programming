/* 6. A program that converts all lowercase letters in a text file to uppercase */

%%
[a-z] { printf("%c", yytext[0] - 32); }
. { printf("%c", yytext[0]); }
%%

int main(int argc, char **argv) {
    FILE *fp = fopen("pal.txt","r");
    yyin = fp;
    yylex();
    fclose(fp);
    return 0;
}