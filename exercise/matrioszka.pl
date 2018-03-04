directlyIn(olga, katarina).
directlyIn(natasha, olga).
directlyIn(irina, natasha).

in(A, B) :- 
  directlyIn(A, B).
in(A, B) :- 
  directlyIn(A, C),
  in(C, B).
