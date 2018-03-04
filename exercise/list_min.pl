list_max([], A, A).
list_max([H|T], Acc, Result) :-
  H < Acc,
  list_max(T, H, Result).

list_max([H|T], Acc, Result) :-
  H >= Acc,
  list_max(T, Acc, Result).

min([H|T], Result) :-
  list_max(T, H, Result).
