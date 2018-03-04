member(_, []) :- false.
member(X, [H|T]) :-
  X is H;
  member(X, T).
