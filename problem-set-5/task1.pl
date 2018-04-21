% read_from_stream(Stream, Output) :-

read_from_stream(InputStream, []) :- 
  at_end_of_stream(InputStream).

read_from_stream(InputStream, [CharsHead|CharsTail]) :-
  \+ at_end_of_stream(InputStream),
  get_code(InputStream, CharsCode),
  atom_codes(CharsHead, [CharsCode]),
  read_from_stream(InputStream, CharsTail).

ignore(Symbol) :-
  member(Symbol, [' ', '\n']).

token(Token, key(Token)) :-
  member(Token, [read, write, if, then, else, fi, while, do, od, and, or, mod]).

token(Token, sep(Token)) :-
  member(Token, [';', '+', '-', '*', '/', '(', ')', '<', '>', '=<', '>=',':=', '=' ,'/=']).

token(Token, int(Token)) :-
  integer(Token).

tokenize([], '', []).

tokenize([Symbol|RestOfSymbols], Temporary, [Token|RestOfTokens]) :-
  atom_concat(Temporary, Symbol, SymbolWithTemporary),
  token(SymbolWithTemporary, Token),
  tokenize(RestOfSymbols, '', RestOfTokens).

tokenize([Symbol|RestOfSymbols], Temporary, [Token|RestOfTokens]) :-
  atom_concat(Temporary, Symbol, SymbolWithTemporary),
  tokenize(RestOfSymbols, SymbolWithTemporary, [Token|RestOfTokens]).

tokenize([Symbol|RestOfSymbols], Temporary, AllTokens) :-
  ignore(Symbol),
  tokenize(RestOfSymbols, Temporary, AllTokens).


% int(LICZBA_NATURALNA) liczbą naturalną;

% id(ID) nazwą zmiennej będącą słowem złożonym z wielkich liter;