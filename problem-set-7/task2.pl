
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

merge_sort(Out, Out_) :-
  freeze(Out, (
    Out = [],
    Out_ = []
  )). 

merge_sort(Out, Out_) :- 
  freeze(Out, (
    length(Out, 1),
    Out_ = Out
  )).

merge_sort(List, Sorted) :-
  freeze(List, 
    (
    List = [First|[Second|[]]],
    freeze(Second, (
      First > Second ->
      ( 
        List = [First|[Second|[]]],
        Sorted = [Second, First]
      )
      ; 
      (
        List = [First|[Second|[]]],
        Sorted = [First, Second] 
      )
    ))
  )).

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

 ones(L) :-
  freeze(L, (L=[1|T],ones(T)) ).

