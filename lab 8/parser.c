// Build Parser using yacc for L(G) where rule set of G is { S ->aSb, S->bSa, S->c} over {a,b,c}. 

#include <stdio.h>
#include <string.h>

#define MAX_LEN 100

int main() {
    char s[MAX_LEN];
    printf("Enter String: ");
    scanf("%s", s);
    int c = -1;
    for (int i = 0; s[i] != '\0'; i++) {
        if (s[i] == 'c') {
            c = i;
            break;
        }
    }
    printf("For CFG:\n S->aSb\n S->bSa \n S->c\n");
    if (c != -1) {
        char a[MAX_LEN], b[MAX_LEN];
        strncpy(a, s, c);
        a[c] = '\0';
        strncpy(b, s+c+1, MAX_LEN-c-1);
        b[MAX_LEN-c-1] = '\0';
        for (int i = 0; i < c; i++) {
            a[i] = (a[i] == 'a') ? 'b' : 'a';
        }
        if (strcmp(a, b) == 0) {
            printf("String %s could be successfully parsed.\n", s);
        } else {
            printf("String %s could not be parsed.\n", s);
        }
    } else {
        printf("String %s could not be parsed.\n", s);
    }
    return 0;
}
