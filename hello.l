%{
#include <stdio.h>
%}

%%
HelloWorld    printf("Hello, world!\n");
%%

int main() {
    yylex();
    return 0;
}



/* flex hello.l 
gcc lex.yy.c -ll
./hello */
