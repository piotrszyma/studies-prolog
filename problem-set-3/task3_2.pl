even_permutation( [], [] ).
even_permutation( [X|T], Perm ) :-
    even_permutation( T, Perm1 ),
    insert_odd( X, Perm1, Perm ).

even_permutation( [X|T], Perm ) :-
    odd_permutation( T, Perm1 ),
    insert_even( X, Perm1, Perm ).

odd_permutation( [X|T], Perm ) :-
    odd_permutation( T, Perm1 ),
    insert_odd( X, Perm1, Perm ).

odd_permutation( [X|T], Perm ) :-
    even_permutation( T, Perm1 ),
    insert_even( X, Perm1, Perm ).

% odd   -> n = 2k + 1

insert_odd( X, InList, [X|InList] ).
insert_odd( X, [Y,Z|InList], [Y,Z|OutList] ) :-
    insert_odd( X, InList, OutList ).

% even  -> n = 2k

insert_even( X, [Y|InList], [Y,X|InList] ).
insert_even( X, [Y,Z|InList], [Y,Z|OutList] ) :-
    insert_even( X, InList, OutList ).
