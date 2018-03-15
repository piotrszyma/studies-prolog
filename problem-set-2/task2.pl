once(X, [X]).

once(X, [H|[T1|T]]) :- 
  member(X, [H|[T1|T]]),
  once(X, [H]), 
\+ once(X, [T1|T]).

once(X, [H|[T1|T]]) :- 
  member(X, [H|[T1|T]]),
  \+ once(X, [H]), 
  once(X, [T1|T]).

% TODO: fix twice

twice(X, [H|[T1|T]]) :- 
  once(X, [H]), 
  once(X, [T1|T]).

twice(X, [H|[T1|T]]) :- 
  \+ once(X, [H]), 
  twice(X, [T1|T]).
  