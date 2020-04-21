# Groebner_bases

G is a cell array where each element is a matrix, representing a single equation.
Every matrix has this format:

Each row is a polynomial, column is used for numbers, the following columns are the variables (a,b,c,…).

Entry (i,j) in the matrix is the power to give to that variable in polynomial i.
For example:
           a     b     c     d
           
     1     2     0     0     0     ##1a^2+
     
     1     0     0     1     0     ##1c+
     
     1     0     0     0     1     ##1d+
     
    -5     0     0     0     0    ## I think this means -5    
   

