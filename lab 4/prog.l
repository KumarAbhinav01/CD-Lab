/* Lex program to Identify all tokens of C programs */

%{
#include <stdio.h>
%}

digit       [0-9]
letter      [a-zA-Z]
id          {letter}({letter}|{digit})*
float_lit   {digit}+\.{digit}+
int_lit     {digit}+
str_lit     \"([^\\\n]|(\\.))*\"
op          [\+\-\*\/\%\=\!\&\|\^\~\>\<\?]
punct       [\.\,\:\;\(\)\{\}\[\]]

%%
{float_lit}     { printf("FLOAT LITERAL: %s\n", yytext); }
{int_lit}       { printf("INTEGER LITERAL: %s\n", yytext); }
{id}            { printf("IDENTIFIER: %s\n", yytext); }
{str_lit}       { printf("STRING LITERAL: %s\n", yytext); }
{op}            { printf("OPERATOR: %s\n", yytext); }
{punct}         { printf("PUNCTUATION: %s\n", yytext); }
[ \t\n]+       
.               { /* Unrecognized character */ }
%%

int main()
{
    FILE *fp = fopen("input.txt", "r");
    if (fp == NULL)
    {
        printf("Error opening file");
        return 1;
    }
    yyin = fp;
    yylex();
    fclose(fp);
    return 0;
}

int yywrap()
{
    return 1;
}