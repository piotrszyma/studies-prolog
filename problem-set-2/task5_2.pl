lista_2(N, X) :-
  %         size   max   P  NP  Acc, R
  lista_n_2(N,  [1], [], [], [], X).

lista_n_2(N, _, _, _, Acc, Acc) :-
  NN is 2 * N,
  length(Acc, NN).

lista_n_2(N, MaxList, P, NP, Acc, R) :-
  [Max|_] = MaxList,   % get current max
  member(X, MaxList),  % range X
  \+ member(X, NP),    % cannot be on negative twice
  \+ member(X, P),     % first occurence
  X =< N,
  NewMax is Max + 1,   % increment max if first occ
  lista_p_2(N, [NewMax|MaxList], P, [X|NP], [X|Acc], R).

lista_n_2(N, MaxList, P, NP, Acc, R) :-
  member(X, MaxList),  % range X
  \+ member(X, NP),    % cannot be on negative twice
  member(X, P),        % second occurence if is on P
  lista_p_2(N, MaxList, P, [X|NP], [X|Acc], R).

lista_p_2(N, MaxList, P, NP, Acc, R) :-
  [Max|_] = MaxList,   % get current max
  member(X, MaxList),  % range X
  \+ member(X, P),     % cannot be on positive twice
  \+ member(X, NP),    % first occurence
  X =< N,
  NewMax is Max + 1,   % increment max if first occ
  lista_n_2(N, [NewMax|MaxList], [X|P], NP, [X|Acc], R).
  
lista_p_2(N, MaxList, P, NP, Acc, R) :-
  member(X, MaxList),  % range X
  \+ member(X, P),     % cannot be on positive twice
  member(X, NP),       % second occur
  lista_n_2(N, MaxList, [X|P], NP, [X|Acc], R).
