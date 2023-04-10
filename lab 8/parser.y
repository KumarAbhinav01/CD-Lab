%{
#include <stdio.h>
#include <stdlib.h>
#include "parser.tab.h"

int yylex();
void yyerror(char *);
%}

%token A B C

%%

S : A S B
  | B S A
  | C
  ;

%%

int main() {
  yyparse();
  return 0;
}

void yyerror(char *s) {
  fprintf(stderr, "%s\n", s);
}
