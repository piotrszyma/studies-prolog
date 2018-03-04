got(josh, car).

gives([[0]], josh, car, steve).

got([0], WHO, WHAT) :- 
    got(WHO, WHAT).

got([EARLIER], WHO, WHAT) :-
  gives(EARLIER, GIVER, WHAT, WHO),
  got(EARLIER, GIVER, WHAT).

got([EARLIER], WHO, WHAT) :-
  got(EARLIER, WHO, WHAT),
  \+ gives(EARLIER, WHO, WHAT, _).
