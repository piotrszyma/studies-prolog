% ===============================
%     6.4 Practical Session
% ===============================

% 6.4.1

member(X, L) :-
  append(_, [X|_], L).

% 6.4.2

set(InList, OutList) :-
  set(InList, OutList, []).

set([], OutputList, CachedList) :-
  reverse(CachedList, OutputList).

set([H|T], OutList, CachedList) :-
    member(H, CachedList),
    set(T, OutList, CachedList).

set([H|T], OutList, CachedList) :-
    \+ member(H, CachedList),
    set(T, OutList, [H|CachedList]).

% 6.4.3

flatten([[X]|Y], F, R) :-
  flatten([X|Y], F, R).

flatten([X|Y], F, R) :-
  flatten(Y, [X|F], R).

flatten([], F, F).
