max_sum(List, Sum) :-
  max_sum(List, 0, 0, Sum).

max_sum([Head|Tail], Current, Best, Sum) :-
  Current1 is max(Current + Head, 0),
  Best1 is max(Current1, Best),
  max_sum(Tail, Current1, Best1, Sum).

max_sum([], _, Best1, Best1).
