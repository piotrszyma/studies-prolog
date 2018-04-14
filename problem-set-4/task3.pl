kwadrat(duze(1), [1, 2, 3, 4, 7, 11, 14, 18, 21, 22, 23, 24]).

kwadrat(male(1), [N1, N2, N3, N4]) :- 
  (
      between(1, 3, N1);
      between(8, 10, N1);
      between(15, 17, N1)
  ),
  N2 is N1 + 3,
  N3 is N1 + 4,
  N4 is N1 + 7.

kwadrat(male(N),L) :- 
  between(2,8,N), 
  N1 is N-1,
  kwadrat(male(N1),L1), 
  kwadrat(male(1),L2),
  [L1H|_] = L1,
  [L2H|_] = L2,
  L1H > L2H,
  intersection(L1,L2,L3), 
  L3 \= L2,
  union(L1,L2,L4),
  sort(L4,L).

kwadrat(male(9), L) :- numlist(1, 24, L).

kwadrat(srednie(1), [N1, N2, N3, N4, N5, N6, N7, N8]) :-
  (
    between(1, 2, N1);
    between(8, 9, N1)  
  ),
  N2 is N1 + 1,
  N3 is N1 + 3,
  N4 is N1 + 5,
  N5 is N1 + 10,
  N6 is N1 + 12,
  N7 is N1 + 14,
  N8 is N1 + 15.

kwadrat(srednie(2), L) :- 
  kwadrat(srednie(1), L1),
  kwadrat(srednie(1), L2),
  L1 \= L2,
  [L1H|_] = L1,
  [L2H|_] = L2,
  L1H < L2H,
  union(L1, L2, L12),
  sort(L12, L).

kwadrat(srednie(3), L) :- 
  kwadrat(srednie(1), L1),
  kwadrat(srednie(1), L2),
  L1 \= L2,
  kwadrat(srednie(1), L3),
  L3 \= L2,
  L3 \= L1,
  [L1H|_] = L1,
  [L2H|_] = L2,
  [L3H|_] = L3,
  L1H < L2H,
  L2H < L3H,
  union(L1, L2, L12),
  union(L12, L3, L123),
  sort(L123, L).

kwadrat(srednie(4), L) :- numlist(1, 24, L).


% --  01 -- 02 -- 03 --
% 04     05    06    07
% --  08 -- 09 -- 10 --
% 11     12    13    14
% --  15 -- 16 -- 17 --
% 18     19    20    24
% --  10 -- 11 -- 12 --

print_matches(L):-
  between(1,24,R),
  (
    (
      between(1,3,R);
      between(8,10,R);
      between(15,17,R);
      between(22,24,R)
    ),
    (
        member(R,L),
        write("+---")
      ;
        \+ member(R,L),
        write("+   ")
    );
    (
      between(4,7,R);
      between(11,14,R);
      between(18,21,R)
    ),
    (
        member(R,L),
        write("|   ")
      ;
        \+ member(R,L),
        write("    ")
    )
),
(
  (
    (
      R=3 ;
      R=10;
      R=17;
      R=24
    ),
    write("+\n")
  );
  (
    ( 
      R=7;
      R=14;
      R=21
    ),
    write("\n")
  )
),
fail;
true.

zapalki(N, L):-
    zapalki_unpacked(L1, L),
    length(L1, N1),
    N is 24-N1,
    print_matches(L1).

zapalki_unpacked([],[]).
zapalki_unpacked(L,[H|T]):-
    zapalki_unpacked(L1,T),
    kwadrat(H,L2),
    union(L1,L2,L12),
    sort(L12, L).

