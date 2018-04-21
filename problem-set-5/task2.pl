hetmany(N, P) :-
  numlist(1, N, L),
  permutation(L, P),
  dobra(P).

dobra(P) :-
  \+ zla(P).

zla(P) :-
  append(_, [Wi | L1], P),
  append(L2, [Wj | _], L1),
  length(L2, K),
  abs(Wi - Wj) =:= K + 1.

% ===================================
% ============= Border ==============
% ===================================

printBorderAll(Length) :-
  write("+"),
  printBorder(Length),
  write("\n"),
  true.

printBorder(Length) :-
  Length > 0,
  write("-----+"),
  NewLength is Length - 1,
  printBorder(NewLength),
  true.

printBorder(0).

% ===================================
% ============ Fields ===============
% ===================================

printFieldsBlackAll(CurrentIndex, PositionsList) :-
  write("|"),
  printFieldBlack(CurrentIndex, PositionsList),
  write("\n").

printFieldsWhiteAll(CurrentIndex, PositionsList) :-
  write("|"),
  printFieldWhite(CurrentIndex, PositionsList),
  write("\n").

printFieldBlack(CurrentIndex, [Head|Tail]) :-
  CurrentIndex =\= Head,
  write(":::::|"),
  printFieldWhite(CurrentIndex, Tail).

printFieldBlack(CurrentIndex, [Head|Tail]) :-
  CurrentIndex =:= Head,
  write(":###:|"),
  printFieldWhite(CurrentIndex, Tail).

printFieldBlack(_, []).

printFieldWhite(CurrentIndex, [Head|Tail]) :-
  CurrentIndex =\= Head,
  write("     |"),
  printFieldBlack(CurrentIndex, Tail).

printFieldWhite(CurrentIndex, [Head|Tail]) :-
  CurrentIndex =:= Head,
  write(" ### |"),
  printFieldBlack(CurrentIndex, Tail).

printFieldWhite(_, []).

% ===================================
% ============= Level ===============
% ===================================

printLevel(Level, Width, PositionsList) :-
    Level > 0,
    Level mod 2 =:= 0,
    printBorderAll(Width),
    printFieldsWhiteAll(Level, PositionsList),
    printFieldsWhiteAll(Level, PositionsList),
    LessLevel is Level - 1,
    printLevel(LessLevel, Width, PositionsList).
  
  printLevel(Level, Width, PositionsList) :-
    Level > 0,
    Level mod 2 =:= 1,
    printBorderAll(Width),
    printFieldsBlackAll(Level, PositionsList),
    printFieldsBlackAll(Level, PositionsList),
    LessLevel is Level - 1,
    printLevel(LessLevel, Width, PositionsList).
  
  printLevel(0, _, _).

% ================ ~ ================

board(PositionsList) :-
  length(PositionsList, Length),
  printLevel(Length, Length, PositionsList),
  printBorderAll(Length).  

test :-
  X = [1, 3, 5, 8, 10, 12, 6, 11, 2, 7, 9, 4],
  board(X).