arc(a, b).
arc(b, a).
arc(b, c).
arc(c, d).

% S - source
% T - target
% H - history
% X - next

access_mem(S, T, H) :- arc(S, T), \+ member(T, H).
access_mem(S, T, H) :- arc(S, X), \+ member(X, H), access_mem(X, T, [X|H]).

access(S, S) :- true.
access(S, T) :- access_mem(S, T, [S]).
