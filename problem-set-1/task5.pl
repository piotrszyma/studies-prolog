le(1, 1).
le(1, 2).
le(1, 3).

le(2, 2).
le(2, 3).

le(3, 3).

partially_ordered :- transitive(), reflexive(), antisymmetric().

transitive() :- % przechodnia
  not(( 
      le(A, B),
      le(B, C),
      not(le(A, C))
  )). 

reflexive() :- % zwrotna
    not(
        (
          (
            le(A, _); 
            le(_, A)
          ), 
          not(
            le(A, A)
          )
        )
      ).

antisymmetric() :- 
    not(
      (
        le(A, B),
        le(B, A),
        not(A is B)
      )
    ).
