got(josh, car).
got(steve, boat).
got(jimmy, book).
got(edd, bag).

gives(1, josh, car, steve).
gives(5, steve, car, josh).
gives(7, jimmy, book, edd).
gives(12, edd, bag, jimmy).


notgave(Start, End, Who, What) :-
	\+ (
		between(Start, End, N),
		gives(N, Who, What, _)
	), !.

got(When, Who, What) :-
	%mial od Startatku i nie oddal	
  got(Who, What), 
  gives(End,_,_,_), 
  notgave(0, End, Who, What), 
  between(0, End, When).

got(When, Who, What) :-
  gives(Start,_,What, Who), 
  gives(End,_,What,_), 
  X is End - 1,
  notgave(Start, X, Who, What), 
  between(Start, X, When).

got(When, Who, What) :-
  gives(When,_, What, Who), 
  \+ (
    gives(Y, Who, What, _), 
    Y > When
    ).