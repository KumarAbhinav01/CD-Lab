%{
#include<stdio.h>
int keywordCount=0, operatorCount=0, identifierCount=0, constantCount=0, symbolCount=0, commentCount=0, stringCount=0, charCount=0;
%}

%option noyywrap

%{
// Definitions for keywords
char keywords[32][10] = {"auto", "break", "case", "char", "const", "continue", "default",
                         "do", "double", "else", "enum", "extern", "float", "for", "goto",
                         "if", "int", "long", "register", "return", "short", "signed", "sizeof",
                         "static", "struct", "switch", "typedef", "union", "unsigned", "void", "volatile", "while"};
// Definition for operators
char operators[11][3] = {"+", "-", "*", "/", "%", "++", "--", "==", "!=", ">", "<"};
%}

%%

[ \t]                      /* ignore whitespaces */ ;

[0-9]+                     { constantCount++; printf("Constant: %s\n", yytext); }

[a-zA-Z_][a-zA-Z0-9_]*     {
                            int isKeyword = 0;
                            for(int i = 0; i < 32; ++i) {
                                if(!strcmp(yytext, keywords[i])) {
                                    keywordCount++;
                                    printf("Keyword: %s\n", yytext);
                                    isKeyword = 1;
                                    break;
                                }
                            }
                            if(!isKeyword) {
                                identifierCount++;
                                printf("Identifier: %s\n", yytext);
                            }
                        }

\"(\\.|[^\"])*\"          { stringCount++; printf("String: %s\n", yytext); }

\'(\\.|[^\'])*\'          { charCount++; printf("Char: %s\n", yytext); }

[\(\)\{\}\[\];,]          { symbolCount++; printf("Symbol: %s\n", yytext); }

\+\+ | --                 { operatorCount++; printf("Operator: %s\n", yytext); }

\+ | - | \* | / | %       { operatorCount++; printf("Operator: %s\n", yytext); }

== | != | > | < | >= | <=  { operatorCount++; printf("Operator: %s\n", yytext); }

\/\/[^\n]*                { commentCount++; printf("Comment: %s\n", yytext); }

\/\*([^*]|\*+[^*/])*\*+\/ { commentCount++; printf("Comment: %s\n", yytext); }

.                         { printf("Invalid Token: %s\n", yytext); }

%%

int main() {
    yyin = fopen("input.txt", "r");
    yylex();
    printf("\n\nTotal Tokens:\n");
    printf("Keywords: %d\n", keywordCount);
    printf("Operators: %d\n", operatorCount);
    printf("Identifiers: %d\n", identifierCount);
    printf("Constants: %d\n", constantCount);
    printf("Symbols: %d\n", symbolCount);
    printf("Comments: %d\n", commentCount);
    printf("Strings: %d\n", stringCount);
    printf("Characters: %d\n", charCount);
    fclose(yyin);
    return 0;
}
