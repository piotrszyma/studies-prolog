finish([]) :- true.

head([Head|Tail], Head, Tail).

attach(Element, List, [Element|List]).

split(In, FirstList, SecondList) :-
  split_first(In, FirstList, SecondList).

split_first([], [], []).

split_first(In, FirstList, SecondList) :-
  head(In, InHead, InTail),
  attach(InHead, FirstList_, FirstList),
  split_second(InTail, FirstList_, SecondList).

split_second(In, FirstList, SecondList) :-
  head(In, InHead, InTail),
  attach(InHead, SecondList_, SecondList),
  split_first(InTail, FirstList, SecondList_).

split_second([], [], []).


% Merge sort


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
  merge_(SortedLeft, SortedRight, Sorted).

