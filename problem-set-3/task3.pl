permutation(List, [PermHead|PermTail]) :-
    append(Left, [PermHead|RightTail], List),
    append(Left, RightTail, Remaining),
    permutation(Remaining, PermTail).

permutation([], []).