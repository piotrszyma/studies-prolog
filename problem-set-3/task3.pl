permutation(Available, [PermHead|PermTail]) :-
    append(Left, [PermHead|RightTail], Available),
    append(Left, RightTail, Remaining),
    permutation(Remaining, PermTail).

permutation([], []).


% 1 2 3

%   1   2   3
%   1   3   2
%   2   1   3
%   2   3   1
%   3   1   2
%   3   2   1
