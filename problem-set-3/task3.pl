permutation(List, Permutation) :-
  permutation(List, [], Permutation).

permutation(List, Used, Permutation) :-
  member(X, List),
  \+ member(X, Used),
  permutation(List, [X|Used], Permutation).

permutation(List, Permutation, Permutation) :-
  length(Permutation, X),
  length(List, X).


% 1 2 3

%   1   2   3
%   1   3   2
%   2   1   3
%   2   3   1
%   3   1   2
%   3   2   1
