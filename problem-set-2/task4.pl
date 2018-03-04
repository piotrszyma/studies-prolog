got(josh, car).

gives([[]], josh, car, steve).
gives([[[]]], steve, car, josh).

got([], WHO, WHAT) :- got(WHO, WHAT).
  
got([WHEN], WHO, WHAT) :-
  (
    gives(WHEN, _, WHAT, WHO),
    \+ got(WHEN, WHO, WHAT)
  ).

got([WHEN], WHO, WHAT) :-
  (
    got(WHEN, WHO, WHAT),
    \+ gives(WHEN, WHO, WHAT, _)
  ).
