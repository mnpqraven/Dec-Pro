animal_gives(sheep,wool).
animal_gives(alpaca,wool).
animal_gives(sheep,meat).

animal_gives(cow,meat).
plant_gives(cotton,wool).
plant_gives(wheat,flour).

% a
resource(X):-animal_gives(Y,X).
resource(X):-plant_gives(Y,X).
% b
farm_animal(X):-animal_gives(X,Y).
% c
crop_plant(X):-plant_gives(X,Y).
% d (sowohl .. als auch)
herbal_animal(X):-animal_gives(Z,X),plant_gives(Y,X).
% e
farmable(X,Y):-animal_gives(X,Y).
farmable(X,Y):-plant_gives(X,Y).