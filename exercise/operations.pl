increment(X, Y) :-
  Y is X + 1.

sum(A, B, AB) :-
  AB is A + B.

addone([], []).
addone([H|T], [H1|T1]) :-
  H1 is H + 1,
  addone(T, T1).
