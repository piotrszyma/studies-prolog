command(i, X) :-
  nl,
  X =.. Unpacked,
  write(Unpacked).

start_browse(Parent) :-
    write(Parent),
    write("Command: "),
    read(Command),
    nl,
    Parent =.. Unpacked,
    [_|[Current|Rest]] = Unpacked,
    command(Command, [], Current, Rest, [Parent]).

command(i, Left, Current, Right, ParentsList) :-
  browse(Left, Current, Right, ParentsList).

browse(Left, Current, Right, Parents) :-
    write(Current),
    write("Command: "),
    read(Command),
    nl,
    command(Command, Left, Current, Right, Parents).


test :-
  start_browse(f1(f2(a2, a3), a1, f3(a4))).

