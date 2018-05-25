finish([]) :- true.

head([Head|Tail], Head, Tail).

attach(Element, List, [Element|List]).

merge_(FirstList, SecondList, Output) :-
  (
    head(FirstList, FirstListHead, FirstListTail),
    head(SecondList, SecondListHead, SecondListTail),
    (
      FirstListHead =< SecondListHead ->
      (
        attach(FirstListHead, Output_, Output),
        merge_(FirstListTail, SecondList, Output_)
      )
      ;
      (
        attach(SecondListHead, Output_, Output),
        merge_(FirstList, SecondListTail, Output_)
      )
    )
  );
  (
    FirstList = [] ->
      Output = SecondList;
      SecondList = [] ->
        Output = FirstList;
        false
  ).


