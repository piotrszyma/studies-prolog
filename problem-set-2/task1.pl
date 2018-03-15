% last of one element list is the element
% last of list is last of tail of list

last([E], E) :- true.
last([_|T], E) :- last(T, E).

% E - middle element
% T - list[1:]
% X - list[1:-1]
% L - list[-1]

middle([E], E) :- true.
middle([_|T], E) :- 
  append(X, [L], T),
  middle(X, E).
