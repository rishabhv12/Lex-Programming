/* 4. Program to check if a given input is a palindrome */

%{
char str[100];
int len = 0, i;
%}
%%
[a-zA-Z] { str[len++] = yytext[0]; }
. ; /* do nothing for other characters */
%%
int main() {
    FILE *fp = fopen("pal.txt","r");
    yyin = fp;
    yylex();
    fclose(fp);
    for (i = 0; i < len/2; i++) {
    if (str[i] != str[len-i-1]) {
    printf("Not a palindrome\n");
    return 0;
}
}
    printf("Palindrome\n");
    return 0;
}