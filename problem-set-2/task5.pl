lista(N, XL) :-
  %       N    C   P   NP   X  
  lista_n(N, [1], [0], [0],  XL).

lista_n(N, [C|_], _, _, []) :-
  C is 2 * N + 1, !.

lista_n(N, CL, P, NP, [X|XT]) :-
  [PH|_] = P,
  [C|_] = CL,
  C =< N,
  member(X, CL),
  X =< N,
  X =< PH + 1,
  \+ member(X, NP),
  C1 is C + 1,
  lista_p(N, [C1|CL], P, [X|NP], XT).

lista_n(N, CL, P, NP, [X|XT]) :-
  [C|_] = CL,
  C > N,
  member(X, CL),
  X =< N,
  \+ member(X, NP),
  C1 is C + 1,
  lista_p(N, [C1|CL], P, [X|NP], XT).


lista_p(N, CL, P, NP, [X|XT]) :-
  [PH|_] = NP,
  [C|_] = CL,
  C =< N,
  member(X, CL),
  X =< PH + 1,
  X =< N,
  \+ member(X, P),
  C1 is C + 1,
  lista_n(N, [C1|CL], [X|P], NP, XT).

lista_p(N, CL, P, NP, [X|XT]) :-
  [C|_] = CL,
  C > N,
  member(X, CL),
  X =< N,
  \+ member(X, P),
  C1 is C + 1,
  lista_n(N, [C1|CL], [X|P], NP, XT).
