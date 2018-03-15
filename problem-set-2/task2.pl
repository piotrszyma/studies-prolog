once(X, [X]).

once(X, [H|T]) :- once(X, [H]), \+ once(X, T), !.
once(X, [H|T]) :- \+ once(X, [H]), once(X, T).

twice(X, [X, X]).

twice(X, [X|T]) :- once(X, T), !.
twice(X, [H|T]) :- \+ once(X, [H]), twice(X, T).
