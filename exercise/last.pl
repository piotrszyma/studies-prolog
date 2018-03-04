last([X], X).
last([H|T], X) :-
  append(_, [X], [H|T]).

last2(L, X) :-
  reverse(L, [X|_]).

last3([L], L).
last3([_|T], X) :-
  last3(T, X).
