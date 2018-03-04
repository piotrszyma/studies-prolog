toptail([_, _], []).

toptail([_, B|C], T) :-
  append(T, [_], [B|C]).
