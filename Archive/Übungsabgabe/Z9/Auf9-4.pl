play(anja,tennis,montag).
play(anja,tennis,dienstag).
play(bernd,golf,dienstag).
play(bernd,tennis,dienstag).
play(claudia,billard,donnerstag).
play(claudia,tennis,donnerstag).
play(daniel,billard,mittwoch).
play(elke,golf,freitag).
play(elke,golf,samstag).
play(frank,tennis,donnerstag).
play(frank,billard,donnerstag).

% a) ?-play(frank,X,donnerstag).
% Frank beherrscht Tennis

% b) ?-play(anja,X,Y), play(claudia,X,Z).
% Sowohl Anja als auch Claudia spielen Tennis.

% c) ?-play(X,billard,Y).
% Claudia, Daniel und Frank spielen Billiard.

% d)
spiel(X,Y,Z,W):-play(X,Z,W), play(Y,Z,W), X\==Y.
% ?-spiel(X,Y,Z,W).
% tennis und billard kommen zustande.