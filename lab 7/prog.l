/* Build parsers using yacc for L(G)={ | >= 1} over {a,b} */

%{
#include "y.tab.h"
%}

%%
[a-b]+ {
    yylval.count = strlen(yytext);
    return COUNT;
}
.|\n
%%

int yywrap() {
    return 1;
}
