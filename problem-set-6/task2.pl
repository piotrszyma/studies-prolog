wykonaj(File) :- 
    open(File, read, Input),
    scanner(Input, Tokens),
    close(Input),
    phrase(program(AST), Tokens),
    interpreter(AST).

