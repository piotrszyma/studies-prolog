above(bicycle, pencil).
above(camera, butterfly).

left_of(pencil, sandglass).
left_of(sandglass, butterfly).
left_of(butterfly, fish).

below(X, Y) :- above(Y, X).

right_of(X, Y) :- left_of(Y, X).

left_of_rec(X, Y) :- left_of(X, Y).
left_of_rec(X, Y) :- left_of(C, Y), left_of_rec(X, C).

% X wyżej niż Y
% ponizej X coś jest
% ponizej Y niczego nie ma
higher(X, Y) :- (\+ below(_, Y)), below(_, X).

