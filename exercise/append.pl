append([], L, L).
append([H|T], L, [H|R]) :-
  append(T, L, R).

prefix(P, L) :- append(P, _, L).
suffix(S, L) :- append(_, S, L).

sublist(Sub, L) :- suffix(S, L), prefix(Sub, S).

% sublist( [], _ ).
% sublist( [X|XS], [X|XSS] ) :- sublist( XS, XSS ).
% sublist( [X|XS], [_|XSS] ) :- sublist( [X|XS], XSS ).
