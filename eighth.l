/* 8. Implementing a spell checker: A Lex program can be used to implement a spell */
/* checker by defining regular expressions for correct spellings and generating */
/* suggestions for misspelled words */

%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #define MAX_WORD_LENGTH 50
    #define MAX_SUGGESTIONS 10
%}

%option noyywrap
/* Regular expressions */
letter [a-zA-Z]
word {letter}+
newline \n

/* Dictionary */
%{
#include "dictionary.txt"
char dictionary[MAX_WORD_LENGTH][MAX_WORD_LENGTH];
int dictionary_size = 0;
void load_dictionary() {
FILE *fp = fopen("dictionary.txt", "r");
if (!fp) {
perror("dictionary.txt");
exit(1);
}

char word[MAX_WORD_LENGTH];

while (fgets(word, MAX_WORD_LENGTH, fp)) {
    word[strcspn(word, "\r\n")] = '\0'; /* Remove trailing newline */
    strcpy(dictionary[dictionary_size], word);
    dictionary_size++;
}
fclose(fp);
}
%}
%%
    /* Rules for misspelled words */

{word} {
int found = 0;
for (int i = 0; i < dictionary_size; i++) {
    if (strcmp(dictionary[i], yytext) == 0) {
        found = 1;
        break;
    }
}
if (!found) {
    printf("Possible suggestions for misspelled word '%s':\n", yytext);
    char suggestions[MAX_SUGGESTIONS][MAX_WORD_LENGTH];
    int num_suggestions = 0;
    for (int i = 0; i < dictionary_size; i++) {
        if (strncmp(dictionary[i], yytext, strlen(yytext)) == 0) {
            strcpy(suggestions[num_suggestions], dictionary[i]);
            num_suggestions++;
            if (num_suggestions == MAX_SUGGESTIONS) {
                break;
            }
        }
    }
    for (int i = 0; i < num_suggestions; i++) {
    printf("- %s\n", suggestions[i]);
    }
}
}
/* Rules for newlines */
{newline} { printf("\n"); }
/* Ignore everything else */
. { }

%%
int main(int argc, char** argv)
{
    /* Initialize lexer */
    FILE *fp = fopen("pal.txt","r");
    yyin = fp;
    yylex();
    fclose(fp);
    return 0;
}