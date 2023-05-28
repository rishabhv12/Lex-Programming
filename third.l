/* 3. Program to replace all occurrences of the word "hello" with "world" in a given input */

%%
hello { printf("world"); }
. { putchar(yytext[0]); } /* print all other characters */
%%
int main() {
    yylex();
    return 0;
}
