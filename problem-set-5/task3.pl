start_browse(Current) :-
  write(Current),
  nl,
  write("Command: "),
  nl,
  read(Command),
  nl,
  command(Command, [], Current, [], [], []).

% ================================
% ==========  Next  ==============
% ================================

command(n, Left, Current, [RightHead|RightTail], CurrentLevel, Parents) :-
  write(RightHead),
  nl,  
  browse([Current|Left], RightHead, RightTail, CurrentLevel, Parents).

command(n, Left, Current, [], CurrentLevel, Parents) :-
  write(Current),
  nl,  
  browse(Left, Current, [], CurrentLevel, Parents).

% ================================
% ========== Previous ============
% ================================

command(p, [LeftHead|LeftTail], Current, Right, CurrentLevel, Parents) :-
  write(LeftHead),
  nl,
  browse(LeftTail, LeftTail, [Current|Right], CurrentLevel, Parents).

command(p, [], Current, Right, CurrentLevel, Parents) :-
  write(Current),
  nl,  
  browse([], Current, Right, CurrentLevel, Parents).  

% ================================
% ==========  Insert  ============
% ================================

% Parents <- tuple of (Left, Current, Right)
command(i, Left, Current, Right, CurrentLevel, Parents) :-
  Current =.. CurrentUnpacked,
  length(CurrentUnpacked, Length),
  Length > 1,
  [_|[NewCurrent|Rest]] = CurrentUnpacked,
  [Left, Current, Right] = ThisParent,
  write(NewCurrent),
  nl,
  browse([], NewCurrent, Rest, CurrentLevel, [ThisParent|Parents]).

command(i, Left, Current, Right, CurrentLevel, Parents) :-
  Current =.. CurrentUnpacked,
  length(CurrentUnpacked, Length),
  Length =:= 1,
  write(Current),
  nl,  
  browse(Left, Current, Right, CurrentLevel, Parents).

% ================================
% ===========  Out   =============
% ================================

command(o, Left, Current, Right, CurrentLevel, [Parent|RestParents]) :-
    [NewLeft|[NewCurrent|[NewRight]]] = Parent,
    write(NewCurrent),
    nl,    
    browse(NewLeft, NewCurrent, NewRight, CurrentLevel, RestParents).

command(o, _, _, _, _, []) :-
  true.

% ================================
% =========== Browse =============
% ================================

browse(Left, Current, Right, CurrentLevel, Parents) :-
    write("Command: "),
    nl,
    read(Command),
    nl,
    command(Command, Left, Current, Right, CurrentLevel, Parents).

test :-
  start_browse(f1(f2(a2, a3), a1, f3(a4))).


% f1(f2(a2, a3), a1, f3(a4))  ->    [f2(a2, a3), a1, f3(a4)]
%    f2(a2, a3)               ->    [a2, a3]
%       a2                    ->    [a2]