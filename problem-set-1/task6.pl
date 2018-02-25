prime(LO, HI, N) :- between(LO, HI, N), is_prime(N).

is_prime(A) :-  not((
                      MAX is floor(sqrt(A)), 
                      between(2, MAX, N), 
                      0 is mod(A, N)
                    )),
                A >= 2.
