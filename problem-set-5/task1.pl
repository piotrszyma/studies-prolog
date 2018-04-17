% read_from_stream(Stream, Output) :-

read_from_stream(InputStream, []) :- 
  at_end_of_stream(InputStream).

read_from_stream(InputStream, [CharsHead|CharsTail]) :-
  \+ at_end_of_stream(InputStream),
  get_code(InputStream, CharInt),
  tokenizer(InputStream, CharsTail).


% key(SŁOWO_KLUCZOWE) read, write, if, then, else, fi, while, do, od, and, or, mod;

% int(LICZBA_NATURALNA) liczbą naturalną;

% id(ID) nazwą zmiennej będącą słowem złożonym z wielkich liter;

% sep(SEPARATOR) ’;’, ’+’, ’-’, ’*’, ’/’ ’(’, ’)’, ’<’, ’>’, ’=<’, ’>=’, ’:=’, ’=’, ’/=’
