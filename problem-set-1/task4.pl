% le(X, Y) => X <= Y

le(1, 2).
le(2, 3).
le(3, 4).
le(4, 5).
le(5, 6).

valid(X) :- le(_, X); le(X, _).

le_rec(X, Y) :- 
  le(X, Z), 
  le_rec(Z, Y).

le_rec(X, X) :- 
  true, 
  valid(X).

max(X) :- 
  le_rec(X, _), 
  \+ (le_rec(X, Y), X \= Y).

min(X) :- 
  le_rec(_, X), 
  \+ (le_rec(Y, X), X \= Y).

biggest(X) :- 
  max(X), 
  \+ (max(Y), X \= Y).

smallest(X) :- 
  min(X), 
  \+ (min(Y), X \= Y).
