% 5.6.2
scalar_mult(_, [], []).
scalar_mult(A, [H|T], [HM|TM]) :-
  HM is H * A,
  scalar_mult(A, T, TM).

% 5.6.3
dot([], [], 0).
dot([V1H|V1T], [V2H|V2T], S) :-
  dot(V1T, V2T, R),
  S is R + V1H * V2H.
