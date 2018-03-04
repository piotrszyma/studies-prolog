got(josh, car).

gives([[0]], josh, car, steve).
% gives([[[0]]], steve, car, john).

got([0], WHO, WHAT) :- 
    got(WHO, WHAT).

got([EARLIER], WHO, WHAT) :-
  gives(EARLIER, GIVER, WHAT, WHO),
  got(EARLIER, GIVER, WHAT).

got([EARLIER], WHO, WHAT) :-
  (
    \+ gives(EARLIER, WHO, WHAT, _),
    got(EARLIER, WHO, WHAT)
  ).
% got(MOMENT, WHO, WHAT) :-
%   gives(MOMENT, WHO, WHAT, _).
