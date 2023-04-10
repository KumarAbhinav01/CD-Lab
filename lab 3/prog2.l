/* Identify different patterns like aa, ab, not containing a, etc. in given string */

%{
#include <stdio.h>
%}

%%
[a][a]    { printf("Pattern aa found\n"); }
[a][^a]   { printf("Pattern ab found\n"); }
[^a]+     { printf("Pattern not containing a found\n"); }
%%

int yywrap()
{
    return 1;
}

int main()
{
    yylex();
    return 0;
}


