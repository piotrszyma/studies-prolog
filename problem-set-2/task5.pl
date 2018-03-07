lista(N, XL) :-
  %       N   C    P    NP   X  MAX
  lista_n(N, [1], [0], [0],  XL, 0).

lista_n(N, [C|_], _, _, [], _) :-
  
  C is 2 * N + 1, !.

lista_n(N, CL, P, NP, [X|XT], MAX) :-
  [C|_] = CL,       % extract counter
  member(X, CL),    % range of X
  X =< N,           % limit X
  \+ member(X, NP), % cannot occur on neg pos twice
  C1 is C + 1,      % increase counter
  \+ member(X, P),  % CASE: first occurrence 
  X is MAX + 1,     % if first, increment MAX
  lista_p(N, [C1|CL], P, [X|NP], XT, X).


lista_n(N, CL, P, NP, [X|XT], MAX) :-
  [C|_] = CL,       % extract counter
  member(X, CL),    % range of X
  X =< N,           % limit X
  \+ member(X, NP), % cannot occur on posit pos twice
  C1 is C + 1,      % increment counter
  member(X, P),     % second occurrence, MAX still same
  lista_p(N, [C1|CL], P, [X|NP], XT, MAX).
  

lista_p(N, CL, P, NP, [X|XT], MAX) :-
  [C|_] = CL,
  member(X, CL),
  X =< N,
  \+ member(X, P),
  C1 is C + 1,
  \+ member(X, NP), % first occurrence 
  X is MAX + 1,
  lista_n(N, [C1|CL], [X|P], NP, XT, X).    


lista_p(N, CL, P, NP, [X|XT], MAX) :-
  [C|_] = CL,
  member(X, CL),
  X =< N,
  \+ member(X, P),
  C1 is C + 1,
  member(X, NP), % second occurrence
  lista_n(N, [C1|CL], [X|P], NP, XT, MAX).
  