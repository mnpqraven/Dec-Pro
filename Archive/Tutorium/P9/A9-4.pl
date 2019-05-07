% Horn-Klausel
% Regel R mit A :- B1, ..., Bn.
% Fakten, die erfüllt sind: B'1, ..., B'n.
% Dann gilt A', falls A':-B'1, ..., B'n. eine Instanz von R.

% Gesetz des universellen Modus Ponens:
% Wenn ein Prädikat P ein Prädikat Q impliziert und P ist wahr, dann ist auch Q wahr.
% Regel R mit A :- B1, ..., Bn.
% Fakten, die erfüllt sind: B'1, ..., B'n.
% Dann A' kann hergeleitet werden, wenn A':-B'1, ..., B'n. eine Instanz von R ist.

% Fakten: B'1, ..., B'n.
animal_gives(sheep,wool).
animal_gives(alpaca,wool).
animal_gives(sheep,meat).
animal_gives(cow,meat).
food(meat).
food(flour).

% Regel R mit A :- B1, ..., Bn.
animal_gives_food(X,Y) :- animal_gives(X,Y), food(Y).

% animal_gives_food(X,meat). kann hergeleitet werden, weil
% animal_gives_food(sheep,meat) :- animal_gives(sheep,meat), food(meat) eine Instanz von R ist.
% ODER/UND animal_gives_food(cow,meat) :- animal_gives(cow,meat), food(meat) eine Instanz von R ist.
