permutation(List, [PermHead|PermTail]) :-
    append(Left, [PermHead|RightTail], List),
    append(Left, RightTail, Rest),
    permutation(Rest, PermTail).

permutation([], []).
