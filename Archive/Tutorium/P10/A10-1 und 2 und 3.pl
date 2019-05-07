% Aufgabe 10-1
% a
contains(X,[X|_]).
contains(X,[_|R]):-contains(X,R).

% b
append([],L2,L2).
append([X|L1],L2,[X|L3]):-append(L1,L2,L3).

% c
% L=[2] produziert contains(2,L).
% L1=[1,2] produziert append(L1,[2,3],[1,2,3,4]).
% 4 verschiedene Möglickeiten für (L1,L2), um append(L1,L2,[1,2,3,4]) zu produzieren.

% Aufgabe 10-2
% a
is_leaf(X,tree(X,void,void)).
is_leaf(X,tree(_,L,R)):-is_leaf(X,L).
is_leaf(X,tree(_,L,R)):-is_leaf(X,R).

% b
subtree(S,S).
subtree(S,tree(_,L,R)):-subtree(S,L).
subtree(S,tree(_,L,R)):-subtree(S,R).

% Aufgabe 10-3
% a
fak1(0,1).
fak1(N,R):-N>0,N1 is N+1, fak1(N1,R1), R1 is R*N.
% Note: Die letzten beiden Terme dürfen nicht umgetauscht werden.

% b
fak2(N,R):-fak_akk(N,Akk,R).
fak_akk(0,Akk,Akk).
fak_akk(N,Akk,R):-N>0, N1 is N-1, Akk1 is N*Akk, fak_akk(N1,Akk1,R). 
