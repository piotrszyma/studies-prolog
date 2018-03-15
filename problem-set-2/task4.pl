got(josh, car).
got(steve, boat).

gives(2, josh, car, steve).

notGive(Start, End, Who, What) :-
  \+ (
    between(Start, End, N),
    gives(N, Who, What, _)
  ), !.

% Got since beginning and till the end
got(When, Who, What) :-
  got(Who, What),
  gives(End, _, _, _),
  notGive(0, End, Who, What),
  between(0, End, When).

% or
% Received at some moment (Start) and gave to sb at (End) 
got(When, Who, What) :- 
  gives(Start, _, What, Who),
  gives(End, _, What, _),
  X is End - 1,
  notGive(Start, X, Who, What),
  between(Start, X, When).

% got if gets and never gives back
got(Moment, Who, What) :-
  gives(Moment, _, What, Who),
  \+ (
    gives(AnotherMoment, Who, What, _),
    AnotherMoment > Moment  
  ).