% 6.3.1

doubled(L) :-
  doubled(L, []).

doubled([H|T], Acc) :-
  [H|T] = Acc;
  doubled(T, [H|Acc]).
