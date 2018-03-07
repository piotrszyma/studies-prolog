lista(N, XL) :-
  %       N    C   P   NP   X  
  lista_n(N, [1], [0], [0],  XL, [0]).

lista_n(N, [C|_], _, _, [], _) :-
  C is 2 * N + 1, !.

lista_n(N, CL, P, NP, [X|XT], ADDED) :-
  [C|_] = CL,
  member(X, CL),
  X =< N,
  \+ member(X, NP),
  C1 is C + 1,
  (
    % if X < I => it's not its first occurrence
    (
      \+ member(X, P), % first occurrence 
      [BIGGEST|_] = ADDED,
      X is BIGGEST + 1,
      ADDED1 = [X|ADDED]
    );
    (
      member(X, P), % second occurrence
      ADDED1 = ADDED
    )
  ),
  lista_p(N, [C1|CL], P, [X|NP], XT, ADDED1).

lista_p(N, CL, P, NP, [X|XT], ADDED) :-
  [C|_] = CL,
  member(X, CL),
  X =< N,
  \+ member(X, P),
  C1 is C + 1,
  (
    (
      \+ member(X, NP), % first occurrence 
      [BIGGEST|_] = ADDED,
      X is BIGGEST + 1,
      ADDED1 = [X|ADDED]
    );
    (
      member(X, NP), % second occurrence
      ADDED1 = ADDED      
    )
  ),
  lista_n(N, [C1|CL], [X|P], NP, XT, ADDED1).

% jeśli coś się pojawia pierwszy raz
% to nie ma w tailu 

% i jest już chociaż jeden o jeden mniejszy