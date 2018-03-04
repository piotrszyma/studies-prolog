got(josh, car).

gives([[]], josh, car, steve).
gives([[[[]]]], steve, car, josh).

got([], WHO, WHAT) :- 
  got(WHO, WHAT).

got([EARLIER], WHO, WHAT) :-
  \+ gives(EARLIER, WHO, WHAT, _),
  got(EARLIER, WHO, WHAT), !.

got([EARLIER], WHO, WHAT) :-
  gives(EARLIER, _, WHAT, WHO),
  \+ got(EARLIER, WHO, WHAT).
