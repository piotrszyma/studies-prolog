on(b14, b15).
on(b13, b14).
on(b12, b13).
on(b11, b12).

on(b23, b22).
on(b22, b21).

on(b34, b33).
on(b33, b32).
on(b32, b31).

/*
15
14          34
13    23    33
12    22    32  
11    21    31
*/
above(A, B) :- on(A, B).
above(A, B) :- on(C, B), above(A, C).
