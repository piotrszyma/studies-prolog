% le(X, Y) => X <= Y

% najmniejszy:  wszyscy nade mną (jednoznacznie)
% minimalny:    nikogo pode mną

le(1, 2).
le(2, 3).
le(3, 4).
le(4, 5).
le(5, 6).

le_rec(X, X) :- true.
le_rec(X, Y) :- le(X, Y).
le_rec(X, Y) :- \+ le_rec(Y, X).
le_rec(X, Y) :- le(X, Z), le_rec(Z, Y).

max(X) :- \+ (le_rec(X, Y), X =\= Y).
min(X) :- \+ (le_rec(Y, X), X =\= Y).

biggest(X) :- max(X).
smallest(X) :- min(X).
