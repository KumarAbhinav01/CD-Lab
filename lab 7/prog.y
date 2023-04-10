%union {
    int count;
}
%token <count> COUNT

%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
%}

%%
program:
    count_statement
    ;
count_statement:
    COUNT { printf("The length of the string is %d\n", $1); }
    ;
%%

int main() {
    yyparse();
    return 0;
}

int yyerror(char *msg) {
    return 0;
}
