reverse(X, R) :-
  reverse(X, [], R). 

reverse([], Acc, Acc).
reverse([H|T], Acc, R) :-
  reverse(T, [H|Acc], R).
