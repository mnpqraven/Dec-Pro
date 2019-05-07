% Aufgabe 10-1
% a

kante(a,b).
kante(a,c).
kante(b,d).
kante(c,d).
kante(d,e).
kante(f,g).

% b
connected(N1,N2):-kante(N1,N2). 
connected(N1,N2):-kante(N1,X), connected(X,N2).

% c
path(N1,N2,[]):-kante(N1,N2).
path(N1,N2,[Z|RZ]):-kante(N1,Z), path(Z,N2,RZ).
