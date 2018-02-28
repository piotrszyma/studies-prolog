once(X, X) :- true.

once(X, [H|T]) :- once(X, H), \+ once(X, T), !.
once(X, [H|T]) :- \+ once(X, H), once(X, T).

twice(X, X) :- false.
twice(X, [X, X]) :- true.

twice(X, [H|T]) :- once(X, H), once(X, T), !.
twice(X, [H|T]) :- \+ once(X, H), twice(X, T).