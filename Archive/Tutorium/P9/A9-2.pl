% a
mother(Alibaba,Belibubu).
% mother ist ein Funktor.
% Funktor ist charakterisiert durch Name und Anzahl der Argumente
% BSp: FUnktor-mother/2

% b
mother(X,Culicoco).
% X ist ein logischer Variable.

% Note:
% Konstanten und Variablen sind logische Terme.
% Zusammengesetzte Terme (aka Strukturen oder Funktor+Sequenz von mindestens einem Argument) sind Terme.
% Bsp: mother(X,Culicoco). ist auch ein Term.

% c
mother(Desudesu,Culicoco).
% mother(Desudesu,Culicoco). ist eine Instanz von Term mit Substitution {X/Desudesu}.

% d
?-person(X).
% Gibt es X, so dass X einer Person ist? - Existenz-Abfrage.
% Note: Abfrage-ist der gegebene Fakt richtig oder falsch?
% Bsp: ?-person(tony).

% e 
plus(0,X,X).
% Bsp oben ist ein universeller Fakt.

% f
?-avengers(X),freedomfighter(X).
% Bsp oben ist eine konjunktive Abfrage.

% g Siehe A9-4.

