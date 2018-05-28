
split(In, FirstList, SecondList) :-
  split_first(In, FirstList, SecondList).

split_first([], [], []) :- true, !.

split_first(In, FirstList, SecondList) :-
  freeze(In,
    (
      head(In, InHead, InTail),
      attach(InHead, FirstList_, FirstList),
      split_second(InTail, FirstList_, SecondList)
    )
  ), !.


split_second(In, FirstList, SecondList) :-
  freeze(In,
    (
      head(In, InHead, InTail),
      attach(InHead, SecondList_, SecondList),
      split_first(InTail, FirstList, SecondList_)
    )
  ), !.

split_second([], [], []).


% Merge sort

merge_sort([], []). 

merge_sort(List, Sorted) :-
  freeze(List, 
    (
      List = [First|[Second|[]]],
      First > Second ->
            ( 
              Sorted = [Second, First] 
            )
            ;
            (
              Sorted = [First, Second] 
            )
    )
  ).

merge_sort(List, Sorted) :- 
  freeze(List,
    (
      length(List, X),
      X > 2,
      split(List, Left, Right),
      merge_sort(Left, SortedLeft),
      merge_sort(Right, SortedRight),
      merge_(SortedLeft, SortedRight, Sorted)
    )
  ).
