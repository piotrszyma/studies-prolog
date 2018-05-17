%
% Tokenizer
%

ignore(' ').
ignore('\n').

token(read,  key(read)).
token(write, key(write)).
token(if,    key(if)).
token(then,  key(then)).
token(else,  key(else)).
token(fi,    key(fi)).
token(while, key(while)).
token(do,    key(do)).
token(od,    key(od)).
token(and,   key(and)).
token(or,    key(or)).
token(mod,   key(mod)).

token(';',  sep(';')).
token('+',  sep('+')).
token('-',  sep('-')).
token('*',  sep('*')).
token('/',  sep('/')).
token('(',  sep('(')).
token(')',  sep(')')).
token('<',  sep('<')).
token('>',  sep('>')).
token('=<', sep('=<')).
token('>=', sep('>=')).
token(':=', sep(':=')).
token('=',  sep('=')).
token('/=', sep('/=')).

token(TokenString, int(Token)) :-
  atom_number(TokenString, Token),
  integer(Token), !.

is_uppercase(Symbol) :-
    char_code(Symbol, Code),
    Code >= 65,
    Code =< 90, 
    !.

id_token(Token, id(Token)).

tokenize([], '', []).

tokenize([Symbol|RestOfSymbols], Temporary, [Token|RestOfTokens]) :-
  \+ is_uppercase(Symbol),
  \+ ignore(Temporary),
  atom_concat(Temporary, Symbol, SymbolWithTemporary),
  token(SymbolWithTemporary, Token),
  tokenize(RestOfSymbols, '', RestOfTokens), !.

tokenize([Symbol|RestOfSymbols], Temporary, AllTokens) :-
  \+ is_uppercase(Symbol),
  \+ ignore(Temporary),  
  atom_concat(Temporary, Symbol, SymbolWithTemporary),
  tokenize(RestOfSymbols, SymbolWithTemporary, AllTokens), !.

tokenize([Symbol|RestOfSymbols], Temporary, AllTokens) :-
  ignore(Symbol),
  tokenize(RestOfSymbols, Temporary, AllTokens), !.

tokenize([Symbol|RestOfSymbols], '', AllTokens) :-
  is_uppercase(Symbol),
  atom_concat('', Symbol, SymbolWithTemporary),
  tokenize_id(RestOfSymbols, SymbolWithTemporary, AllTokens), !.

tokenize_id([Symbol|RestOfSymbols], Temporary, AllTokens) :-
  is_uppercase(Symbol),
  atom_concat(Temporary, Symbol, SymbolWithTemporary),
  tokenize_id(RestOfSymbols, SymbolWithTemporary, AllTokens), !.

tokenize_id([Symbol|RestOfSymbols], Temporary, [Token|RestOfTokens]) :-
  \+ is_uppercase(Symbol),
  id_token(Temporary, Token),
  tokenize([Symbol|RestOfSymbols], '', RestOfTokens), !.

scanner(X, Z) :-
  read_from_stream(X, Y),
  tokenize(Y, '', Z), !.

read_from_stream(InputStream, []) :- 
    at_end_of_stream(InputStream).
  
read_from_stream(InputStream, [CharsHead|CharsTail]) :-
  \+ at_end_of_stream(InputStream),
  get_code(InputStream, CharsCode),
  atom_codes(CharsHead, [CharsCode]),
  read_from_stream(InputStream, CharsTail).

%
% Gramma
%

program([])    --> [].
program([A|B]) --> instruction(A), [sep(;)], program(B).

instruction(assign(A,B)) --> [id(A)], [sep(':=')], expr(B).
instruction(read(A))     --> [key('read')], [id(A)].
instruction(write(A))    --> [key('write')], expr(A).
instruction(if(A,B))     --> [key('if')],
                             cond(A), [key('then')],
                             program(B), [key('fi')].
instruction(if(A,B,C))   --> [key('if')],
                             cond(A), [key('then')],
                             program(B), [key('else')],
                             program(C), [key('fi')].
instruction(while(A,B))  --> [key('while')],
                             cond(A), [key('do')],
                             program(B), [key('od')].

expr(A+B)      --> operand(A), [sep(+)], expr(B).
expr(A-B)      --> operand(A), [sep(-)], expr(B).
expr(A)        --> operand(A).

operand(A*B)       --> higher_operand(A), [sep(*)], operand(B).
operand(A/B)       --> higher_operand(A), [sep(/)], operand(B).
operand(A mod B)   --> higher_operand(A), [key('mod')], operand(B).
operand(A)         --> higher_operand(A).

higher_operand(id(A))      --> [id(A)].
higher_operand(int(A))     --> [int(A)].
higher_operand(A)          --> [sep('(')], expr(A), [sep(')')].

cond(A;B)        --> higher_cond(A), [key('or')], cond(B).
cond(A)          --> higher_cond(A).

higher_cond(A ',' B) --> simple_cond(A), [key('and')], higher_cond(B).
higher_cond(A)       --> simple_cond(A).

simple_cond(A=:=B) --> expr(A), [sep(=)], expr(B).
simple_cond(A=\=B) --> expr(A), [sep('/=')], expr(B).
simple_cond(A<B)   --> expr(A), [sep(<)], expr(B).
simple_cond(A>B)   --> expr(A), [sep(>)], expr(B).
simple_cond(A>=B)  --> expr(A), [sep(>=)], expr(B).
simple_cond(A=<B)  --> expr(A), [sep(=<)], expr(B).
simple_cond(A)     --> [sep('(')], cond(A), [sep(')')].


%
% Test
%

test(P) :-
    open('read.prog', read, X), 
    scanner(X, Y),
    close(X),
    phrase(program(P), Y).

