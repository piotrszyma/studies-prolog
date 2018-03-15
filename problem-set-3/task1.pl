average(List, Average) :-
  average(List, 0, 0, Average).

average([Head|Tail], Sum, Counter, Average) :-
  Sum1 is Sum + Head,
  Counter1 is Counter + 1,
  average(Tail, Sum1, Counter1, Average).

average([], Sum, Counter, Average) :-
  Average is Sum / Counter.
