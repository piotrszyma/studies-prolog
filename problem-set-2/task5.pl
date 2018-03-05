lista(N, X) :-
  %       N  C  P   NP  X   A
  lista_n(N, 1, [0], [0], X, [1]),
  valid(X).

lista_n(N, C, _, _, [], _) :-
  C > 2 * N, !.

lista_n(N, C, P, NP, [X|T], A) :-
  member(X, A),
  X =< C,
  X =< N,
  \+ member(X, NP),
  C1 is C + 1,
  lista_p(N, C1, P, [X|NP], T, [C1|A]).

lista_p(N, C, P, NP, [X|T], A) :-
  member(X, A),
  X =< C,
  X =< N,
  \+ member(X, P),
  C1 is C + 1,
  lista_n(N, C1, [X|P], NP, T, [C1|A]).

valid(L) :-
  append([H|T], B, L),
  length([H|T], N),
  length(B, N),
  increasing(T, 1).

increasing([X], Y) :-
  X is Y + 1, !.

increasing([X], Y) :-
  X is Y, !.

increasing([H|T], N) :-
  H is N + 1,
  increasing(T, H).

increasing([H|T], N) :-
  H is N,
  increasing(T, N).
