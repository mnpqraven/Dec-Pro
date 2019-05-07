person(tony).
person(steve).
person(clint).
like(tony,SA).
like(tony,freedom).
hate(steve,SA).
avengers(X):-person(X), like(X,freedom).
freedomfighter(X):-person(X),hate(X,SA).
% Fakt: Wer Freiheit liebt (1), hasst die Sokovia-Accord(2).
% (2) ist sicherer als (1).
% A implies B, which means B takes A as a sub-definition.
hate(X,SA):-like(X,freedom).

% ?-avengers(X), freedomfighter(X). <tony>