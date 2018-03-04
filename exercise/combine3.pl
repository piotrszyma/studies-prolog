combine3([A], [B], [j(A, B)]).
combine3([H1|T1], [H2|T2], [j(H1, H2)|T]) :-
  combine3(T1, T2, T).
