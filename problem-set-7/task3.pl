merge_sort([First, Second], Sorted) :-
  First > Second ->
    Sorted = [Second, First];
    Sorted = [First, Second].

merge_sort([Single], [Single]).

merge_sort(NotSorted, Sorted) :-
  length(NotSorted, X),
  X > 2,
  split(NotSorted, Left, Right),
  merge_sort(Left, SortedLeft),
  merge_sort(Right, SortedRight),
  merge(SortedLeft, SortedRight, Sorted).

