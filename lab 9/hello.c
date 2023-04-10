#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Define a maximum input length to prevent buffer overflow
#define MAX_INPUT_LENGTH 100

// Define the production rules of the grammar
#define RULE_1 'A'
#define RULE_2 'B'
#define RULE_3 'C'

// Function prototypes
int parseS(char *input);
int parseA(char *input, int *pos);
int parseB(char *input, int *pos);
int parseC(char *input, int *pos);

// Entry point of the program
int main()
{
    char input[MAX_INPUT_LENGTH];

    // Read the input string
    printf("Enter a string: ");
    fgets(input, MAX_INPUT_LENGTH, stdin);

    // Remove the newline character at the end of the input
    input[strcspn(input, "\n")] = '\0';

    // Parse the input string
    if (parseS(input))
        printf("Valid string.\n");
    else
        printf("Invalid string.\n");

    return 0;
}

// Parse the S production rule
int parseS(char *input)
{
    int pos = 0;

    // Try to parse each production rule in order
    if (parseA(input, &pos) && input[pos] == 'c' && parseB(input, &pos) && input[pos] == '\0')
        return 1;
    pos = 0;
    if (parseB(input, &pos) && input[pos] == 'c' && parseA(input, &pos) && input[pos] == '\0')
        return 1;
    pos = 0;
    if (parseC(input, &pos) && input[pos] == '\0')
        return 1;

    // If none of the rules matched, the string is invalid
    return 0;
}

// Parse the A production rule
int parseA(char *input, int *pos)
{
    // Try to match the first character of the production rule
    if (input[*pos] == 'a')
    {
        (*pos)++;
        if (parseS(input) && input[*pos] == 'b')
        {
            (*pos)++;
            return 1;
        }
    }

    // If the matching failed, return 0
    return 0;
}

// Parse the B production rule
int parseB(char *input, int *pos)
{
    // Try to match the first character of the production rule
    if (input[*pos] == 'b')
    {
        (*pos)++;
        if (parseS(input) && input[*pos] == 'a')
        {
            (*pos)++;
            return 1;
        }
    }

    // If the matching failed, return 0
    return 0;
}

// Parse the C production rule
int parseC(char *input, int *pos)
{
    // Try to match the first character of the production rule
    if (input[*pos] == 'c')
    {
        (*pos)++;
        return 1;
    }

    // If the matching failed, return 0
    return 0;
}
