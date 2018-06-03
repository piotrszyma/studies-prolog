
split(In, FirstList, SecondList) :-
  split_first(In, FirstList, SecondList).

split_first(In, FirstList, SecondList) :-
  freeze(In,
    (
      length(In, 0) -> (
      FirstList = [],
      SecondList = []
      );
      (
        head(In, InHead, InTail),
        attach(InHead, FirstList_, FirstList),
        split_second(InTail, FirstList_, SecondList)
      )
    )
  ), !.


split_second(In, FirstList, SecondList) :-
  freeze(In,
    (
      length(In, 0) -> (
        FirstList = [],
        SecondList = []
      ); 
      (
        head(In, InHead, InTail),
        attach(InHead, SecondList_, SecondList),
        split_first(InTail, FirstList, SecondList_)
      )
    )
  ), !.

% Merge sort


merge_sort(List, Sorted) :-
  freeze(List, 
    (
      List = [_|T] ->
      (
        freeze(T,
          (
            T = [_|_] ->
            (
              split(List, Left, Right),
              merge_sort(Left, SortedLeft),
              merge_sort(Right, SortedRight),
              merge_(SortedLeft, SortedRight, Sorted)
            );
            Sorted = List
          )
        )
      );
      (
        Sorted = List
      )
    )
  ).

