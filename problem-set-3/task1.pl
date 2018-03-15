average(List, Average) :-
  average(List, 0, 0, Average).

average([Head|Tail], Sum, NewCounter, Average) :-
  NewSum is Sum + Head,
  NewCounter1 is NewCounter + 1,
  average(Tail, NewSum, NewCounter, Average).

average([], Sum, NewCounter, Average) :-
  Average is Sum / NewCounter.

variance(List, Variance) :-
  average(List, Average),
  variance(List, 0, 0, Average, Variance).
  
variance([Head|Tail], Sum, NewCounter, Average, Variance) :-
  NewSum is Sum + (((Head - Average) * (Head - Average))),
  NewCounter1 is NewCounter + 1,
  variance(Tail, NewSum, NewCounter, Average, Variance).

variance([], Sum, NewCounter, _, Variance) :-
  Variance is Sum / NewCounter.
