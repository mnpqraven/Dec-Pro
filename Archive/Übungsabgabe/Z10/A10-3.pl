% Aufgabe 10-3
% a
without([], X, []).
without([X], X, []).
without([Z|RZ], X, RZ):- Z==X, without(RZ, X, Result).
without([Z|RZ], X, [Z|Result]):- Z=\=X, without(RZ, X, Result).

% b
double([],[]).
double([X],[X,X]).
double([Z|RZ], [Z|[Z|Result]]):-double(RZ, Result). 

% c
sum([],0).
sum([X],X).
sum([Z|RZ], N):-sum(RZ, Result), N is Result+Z.