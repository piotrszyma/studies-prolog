% 6.3.2

palindrome(L) :-
  reverse(L, R),
  L = R.
