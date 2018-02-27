above(bicycle, pencil).
above(car, bicycle).
above(camera, butterfly).

left_of(pencil, sandglass).
left_of(sandglass, butterfly).
left_of(butterfly, fish).

below(X, Y) :- above(Y, X).

right_of(X, Y) :- left_of(Y, X).

left_of_rec(X, Y) :- left_of(X, Y).
left_of_rec(X, Y) :- left_of(C, Y), left_of_rec(X, C).

above_of(X, Y) :- above(X, Y).
above_of(X, Y) :- above(C, Y), above_of(X, C).

higher(X, Y) :- 
  above_of(X, Y); 
  (
    (
      above(X, A), 
      above(Y, B), 
      higher(A, B)
    ); 
    above(X, _), \+ above(Y, _)
  ).


