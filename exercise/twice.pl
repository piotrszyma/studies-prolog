twice([], []).
twice([H|X], [H, H|Y]) :- twice(X, Y).
