% Aufgabe 10-2
nat(0).
nat(s(X)) :- nat(X).
add(0,X,X) :- nat(X).
add(s(X),Y,s(Z)) :- add(X,Y,Z).

% a
even(X) :- O is X mod 2.
odd(X) :- 1 is X mod 2.

% b
mult(1,X,X).
mult(M,Y,K):-mult(X,Y,Z), K is Z+Y, M is X+1.

pow(X,0,1).
pow(X,M,K):-pow(X,N,Z), K is Z*X, M is N+1.

% c
fib(0,0).
fib(1,1).
fib(N,F):-N>1, N1 is N-1, N2 is N-2, fib(N1, F1), fib(N2, F2), F is F1+F2.