len([], 0).
len([_|T], N) :- len(T, X), N is X+1.

% with accumulator

acc_len([_|T], A, L) :- Anew is A + 1, acc_len(T, Anew, L).
acc_len([], A, A).

acc2(List, Length) :- acc_len(List, 0, Length).
