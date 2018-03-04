greater_than(succ(X), succ(Y)) :- 
  greater_than(X, Y).

greater_than(succ(_), 0) :- 
  true.
