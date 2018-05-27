
split(In, FirstList, SecondList) :-
  split_first(In, FirstList, SecondList).


split_first(In, FirstList, SecondList) :-
  In \== [],
  freeze(In,
    (
      head(In, InHead, InTail),
      attach(InHead, FirstList_, FirstList),
      split_second(InTail, FirstList_, SecondList)
    )
  ), !.

split_first([], [], []).

split_second(In, FirstList, SecondList) :-
  In \== [],
  freeze(In,
    (
      head(In, InHead, InTail),
      attach(InHead, SecondList_, SecondList),
      split_first(InTail, FirstList, SecondList_)
    )
  ), !.

split_second([], [], []).


% Merge sort


merge_sort([], []) :- 
  true, !. 

merge_sort([Output|[]], [Output|[]]) :- 
  true, !. 

merge_sort([First |[Second|[]]], Sorted) :-
  First > Second ->
    ( 
      Sorted = [Second, First], ! 
    )
    ;
    (
      Sorted = [First, Second], !
    ).

merge_sort([F|[S|[T|R]]], Sorted) :-
  split([F|[S|[T|R]]], Left, Right),
  merge_sort(Left, SortedLeft),
  merge_sort(Right, SortedRight),
  merge_(SortedLeft, SortedRight, Sorted), !. 
