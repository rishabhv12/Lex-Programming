/* 11. Implementing a data encryption tool: A Lex program can be used to mplement a data */
/* encryption tool by defining regular expressions for input patterns and generating encrypted output. */

%{
    #include <stdio.h>
    #include <string.h>
    #include <ctype.h>
%}

%option noyywrap
/* Encryption key */
#define KEY 5
%%
    /* Regular expressions */
    letter [a-zA-Z]
    digit [0-9]
    input .+
%%
void encrypt(char* str)
{
    int i;
    for (i = 0; str[i] != '\0'; i++) {
        if (isalpha(str[i])) {
            /* Encrypt letters */
            str[i] = (char) (((str[i] - 'a') + KEY) % 26 + 'a');
        } else if (isdigit(str[i])) {
            /* Encrypt digits */
            str[i] = (char) (((str[i] - '0') + KEY) % 10 + '0');
        }
    }
}
int main(int argc, char** argv)
{
    char input[100];

    /* Prompt user for input */
    printf("Enter text to encrypt: ");
    fgets(input, sizeof(input), stdin);
    input[strcspn(input, "\n")] = '\0';

    /* Encrypt input */
    encrypt(input);
    
    /* Print encrypted output */
    printf("Encrypted text: %s\n", input);
    return 0;
}