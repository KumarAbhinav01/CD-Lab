%{
#include <stdio.h>
#include <ctype.h>
#include <string.h>
int tokenno = 0;
%}

%option noyywrap

%%

[\+\-\*\/]      { printf("%7d\t %7d\t Operator\t %7s\n", yylineno, ++tokenno, yytext); }
[;{}()\?@!%]    { printf("%7d\t %7d\t Symbol\t %7s\n", yylineno, ++tokenno, yytext); }
[0-9]+          { printf("%7d\t %7d\t Digit\t\t %7s\n", yylineno, ++tokenno, yytext); }
[a-zA-Z_][a-zA-Z0-9_]* {
                    int flag = 0;
                    char keyword[6][10] = {"int", "main", "if", "else", "do", "while"};
                    for (int j = 0; j < 6; j++)
                    {
                        if (strcmp(yytext, keyword[j]) == 0)
                        {
                            flag = 1;
                            break;
                        }
                    }
                    if (flag == 1)
                        printf("%7d\t %7d\t Keyword\t %7s\n", yylineno, ++tokenno, yytext);
                    else
                        printf("%7d\t %7d\t Identifier\t %7s\n", yylineno, ++tokenno, yytext);
                }
\n              { yylineno++; }

%%

int main()
{
    FILE *input, *output;
    int tokenno = 0;
    input = fopen("input.txt", "r");
    output = fopen("lexoutput.txt", "w");
    char keyword[6][10] = {"int", "main", "if", "else", "do", "while"};
    fprintf(output, "Line no. \t\t Token no. \t\t Token \t\t Lexeme\n\n");
    yyin = input;
    yylex();
    fclose(input);
    fclose(output);
    return 0;
}
