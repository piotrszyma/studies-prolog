operation(X, OP1, OP2) :- X = OP1 + OP2.
operation(X, OP1, OP2) :- X = OP1 - OP2.
operation(X, OP1, OP2) :- X = OP1 * OP2.
operation(X, OP1, OP2) :- 
  \+ (0 =:= OP2), 
  X = OP1 / OP2.

build([X], X).
build(L, X) :-
	append(L1, L2, L),
	\+ length(L1, 0),
	\+ length(L2, 0),
	build(L1, OP1),
	build(L2, OP2),
	operation(X, OP1, OP2).

wyrazenie(Numbers, Value, Equation) :-
  build(Numbers, X),
	Value is X,
	Equation = X.
