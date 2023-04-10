# CD-Lab

## Syllabus
List of Programs as Assignments: 

1. Lab Assignment No: 1 
Objective: To Understand the concept of tokens.
Q1. C program to count white spaces, numbers, words in a file.

2. Lab Assignment No: 2 
Objective: To Understand the process of identification of tokens.
Q1. C program to design Finite automata to identify different tokens(identifiers, constants, operators, etc.). 

3. Lab Assignment No: 3 
Objective: To have a brief Understanding to lex programming.
Q1. Lex Program to Count number in given string.
Q2. Identify different patterns like aa, ab, not containing a, etc. in given string . 

4. Lab Assignment No: 4 
Objective: To Understand lex programming tool.
Q1. Lex program to Identify all tokens of C programs. 

5. Lab Assignment No: 5 
Objective: To Understand and Implement structure of any programming language. 
Q1.Design and Code individual programming code with all possible tokens in programming language. 

6. Lab Assignment No: 6 
Objective: To Understand lex programming tool in depth. 
Q1. Starting and ending with
Q2. # divisible by 2 or divisble by 3.
Q3. RHS. 
Q4. Output code after removing white spaces and comment. 

7. Lab Assignment No: 7 
Objective: To Understand and Implement Parser using yacc.
Q1. Build parsers using yacc for L(G)={ | >= 1} over {a,b} 

8. Lab Assignment No: 8 
Objective: To Understand and Implement parser for different grammars.
Q1.Build Parser using yacc for L(G) where rule set of G is { S ->aSb, S->bSa, S->c} over {a,b,c}. 

9. Lab Assignment No: 9 
Objective: To Understand and Implement parser coding.
Q1. Build parser using yacc to convert the infix expression to postfix expression. 

10. Lab Assignment No: 10 
Objective: To Understand and Implement parser coding.
Q1. Build a calculator in yacc which takes expression in postfix notation.
Q2. Build parsers using yacc to convert the prefix expression into the postfix expression. 

11. Lab Assignment No: 11 
Objective: To Understand and Implement parser for validation and operations. 
Q1. Build parsers using yacc to validate the C statements. E.g int a,b,c;(valid) 
Q2. Build calculator in yacc.




Important

To run any lex File
~   flex prog.l    
~   gcc lex.yy.c   
~   ./a.out


To run any yacc File
~   lex prog.l
~   yacc -d prog.y
~   gcc -o prog y.tab.c lex.yy.c
~   ./prog