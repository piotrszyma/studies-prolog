%
%   a^n b^n
%

g1 --> [].
g1 --> [a], g1, [b].

%
%   a^n b^n c^n
%


g2 --> a(Count), b(Count), c(Count).
 
a(0) --> [].
a(succ(Count)) --> [a], a(Count).
 
b(0) --> [].
b(succ(Count)) --> [b], b(Count).
 
c(0) --> [].
c(succ(Count)) --> [c], c(Count).

%
%   a^n b^fib(n)
%

g3 --> a(Count), bFib(Count).

bFib(0) --> [].
bFib(succ(0)) --> [b].
bFib(succ(succ(Count))) --> bFib(succ(Count)), bFib(Count).

%
% Relation between L1, L2 & L3, when phrase(p(L1), L2, L3)
%

p([]) --> [].
p([X|Xs]) --> [X], p(Xs).

%
% L1 + L3 === L2
% append(L1, L3, L2).
%
