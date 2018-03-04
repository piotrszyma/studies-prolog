combine2([A], [B], [A, B]).
combine2([H1|T1], [H2|T2], [[H1, H2], T]) :-
  combine2(T1, T2, T).
