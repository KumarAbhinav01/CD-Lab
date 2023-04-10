%{
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

void process_op(char op);
int precedence(char op);

static char stack[100];
static int top = 0;

%}

%%

[ \t]               ; /* skip whitespace */
[a-zA-Z0-9]+        { printf("%s ", yytext); } /* output operand */
[+\-*/()]          { process_op(yytext[0]); } /* process operator */

%%

void process_op(char op) {
    switch (op) {
        case '+':
        case '-':
        case '*':
        case '/':
            while (top > 0 && stack[top - 1] != '(' && precedence(stack[top - 1]) >= precedence(op)) {
                printf("%c ", stack[--top]);
            }
            stack[top++] = op;
            break;
        case '(':
            stack[top++] = op;
            break;
        case ')':
            while (top > 0 && stack[top - 1] != '(') {
                printf("%c ", stack[--top]);
            }
            if (top == 0) {
                fprintf(stderr, "Unbalanced parentheses\n");
                exit(1);
            }
            top--;
            break;
    }
}

int precedence(char op) {
    switch (op) {
        case '+':
        case '-':
            return 1;
        case '*':
        case '/':
            return 2;
        default:
            return 0;
    }
}

int main(void) {
    yylex();
    while (top > 0) {
        if (stack[top - 1] == '(') {
            fprintf(stderr, "Unbalanced parentheses\n");
            exit(1);
        }
        printf("%c ", stack[--top]);
    }
    printf("\n");
    return 0;
}

int yywrap(void) {
    return 1;
}