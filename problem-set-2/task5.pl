lista(N, XL) :-
  %       N    C   P   NP   X  
  lista_n(N, [1], [0], [0],  XL).

lista_n(N, [C|_], _, _, []) :-
  C is 2 * N + 1, !.

lista_n(N, CL, P, NP, [X|XT]) :-
  [C|_] = CL,
  [F|_] = P,
  member(X, CL),
  X =< N,
  \+ member(X, NP),
  C1 is C + 1,
  (
    (
      C =< N,
      (
          X is F + 1;
          X is F
        )
    );
    (
      C > N
    )
  ),
  lista_p(N, [C1|CL], P, [X|NP], XT).

lista_p(N, CL, P, NP, [X|XT]) :-
  [C|_] = CL,
  [F|_] = NP,
  member(X, CL),
  X =< N,
  \+ member(X, P),
  C1 is C + 1,
  (
    (
      C =< N,
      (
        X is F + 1;
        X is F
      )
    );
    (
      C > N
    )
  ),
  lista_n(N, [C1|CL], [X|P], NP, XT).

% jeśli coś się pojawia pierwszy raz
% to nie ma w tailu 

% i jest już chociaż jeden o jeden mniejszy