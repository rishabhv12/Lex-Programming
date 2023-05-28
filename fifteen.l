/* 15. Implementing a chatbot: A Lex program can be used to implement a simple chatbot */
/* by defining regular expressions for common user inputs and generating responses. */

%{
#include <stdio.h>
#include <string.h>
%}

%option noyywrap
/* Regular expressions */
%%
    hi|hello|hey printf("Bot: Hello!\n");
    how are you printf("Bot: I'm doing well, thanks for asking!\n");
    what is your name printf("Bot: My name is ChatBot.\n");
    what time is it printf("Bot: I'm sorry, I don't have access to that information.\n");
    bye|goodbye|exit printf("Bot: Goodbye!\n"); exit(0);
    . printf("Bot: I'm sorry, I don't understand.\n");
%%
int main()
{
    /* Initialize lexer */
    FILE *fp = fopen("pal.txt","r");
    yyin = fp;
    
    while (1) {
        printf("You: ");
        yylex();
    }
    fclose(fp);
    return 0;
}