start_browse(Current) :-
  write(Current),
  nl,
  write("Command: "),
  nl,
  read(Command),
  nl,
  command(Command, [], Current, [], []).

% ================================
% ==========  Next  ==============
% ================================

command(n, Left, Current, [RightHead|RightTail], Parents) :-
  write(RightHead),
  nl,  
  browse([Current|Left], RightHead, RightTail, Parents), 
  !.

command(n, Left, Current, [], Parents) :-
  write(Current),
  nl,  
  browse(Left, Current, [], Parents), 
  !.

% ================================
% ========== Previous ============
% ================================

command(p, [LeftHead|LeftTail], Current, Right, Parents) :-
  write(LeftHead),
  nl,
  browse(LeftTail, LeftTail, [Current|Right], Parents), 
  !.

command(p, [], Current, Right, Parents) :-
  write(Current),
  nl,  
  browse([], Current, Right, Parents),
  !.

% ================================
% ==========  Insert  ============
% ================================

% Parents <- tuple of (Left, Current, Right)
command(i, Left, Current, Right, Parents) :-
  Current =.. CurrentUnpacked,
  length(CurrentUnpacked, Length),
  Length > 1,
  [_|[NewCurrent|Rest]] = CurrentUnpacked,
  [Left, Current, Right] = ThisParent,
  write(NewCurrent),
  nl,
  browse([], NewCurrent, Rest, [ThisParent|Parents]), 
  !.

command(i, Left, Current, Right, Parents) :-
  Current =.. CurrentUnpacked,
  length(CurrentUnpacked, Length),
  Length =:= 1,
  write(Current),
  nl,  
  browse(Left, Current, Right, Parents), 
  !.

% ================================
% ===========  Out   =============
% ================================

command(o, _, _, _, [Parent|RestParents]) :-
  [NewLeft|[NewCurrent|[NewRight]]] = Parent,
  write(NewCurrent),
  nl,    
  browse(NewLeft, NewCurrent, NewRight, RestParents), 
  !.

command(o, _, _, _, []) :-
  true, 
  !.

command(_, Left, Current, Right, Parents) :-
  write("Unknown command"),
  nl,
  browse(Left, Current, Right, Parents),
  !.

% ================================
% =========== Browse =============
% ================================

browse(Left, Current, Right, Parents) :-
    write("Command: "),
    nl,
    read(Command),
    nl,
    command(Command, Left, Current, Right, Parents).

% ================ ~ ================

test :-
  start_browse(f1(f2(a2, a3), a1, f3(a4))).


% f1(f2(a2, a3), a1, f3(a4))  ->    [f2(a2, a3), a1, f3(a4)]
%    f2(a2, a3)               ->    [a2, a3]
%       a2                    ->    [a2]