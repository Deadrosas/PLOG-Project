:- include('utils.pl').
:- include('declarations.pl').

% Point = [Elem, X, Y], X = Row Y = Collumn
% Path = List of Points [[Elem1, X1,Y1],[Elem2, X2,Y2]]
% List of Paths is a List of Lists that contain points (which are lists too) ([[[Elem1, X1,Y1],[Elem2, X2,Y2]], [[Elem3, X3,Y3], [Elem4, X3, Y4]]])

%All Points Exist

CreatePath(Elem, RowNumber, CollumnNumber, Path, BoardSize, 0, Path):-color(Elem, white).
CreatePath(Board, Elem, RowNumber, CollumnNumber, Path, BoardSize, 0, Path):-
    color(Elem, black),

    Point is [Elem, RowNumber, CollumnNumber],
    member(Point, Path).

CreatePath(Board, Elem, RowNumber, CollumnNumber, Path, BoardSize, 0, NewPath):-
    color(Elem, black),

    Point is [Elem, RowNumber, CollumnNumber],
    \+member(Point, Path),
    append(Point, Path, Path0),
    UpY is RowNumber - 1,
    RightX is CollumnNumber + 1,
    LeftX is CollumnNumber - 1,
    DownY is RowNumber + 1,

    getUpPath(Board, UpY, CollumnNumber, Path0, BoardSize, Player, Path1),
    getLeftPath(Board, RowNumber, LeftX, Path1, BoardSize, Player, Path2),
    getRightPath(Board, RowNumber, RightX, Path2, BoardSize, Player, Path3),
    getDownPath(Board, DownY, CollumnNumber, Path3, BoardSize, Player, NewPath).

% Case of White Player
CreatePath(Board, Elem, RowNumber, CollumnNumber, Path, BoardSize, 1, Path):-color(Elem, black).
CreatePath(Board, Elem, RowNumber, CollumnNumber, Path, BoardSize, 1, Path):-
    color(Elem, white),

    Point is [Elem, RowNumber, CollumnNumber],
    member(Point, Path).

CreatePath(Board, Elem, RowNumber, CollumnNumber, Path, BoardSize, 1, NewPath):-
    color(Elem, white),

    Point is [Elem, RowNumber, CollumnNumber],
    \+member(Point, Path),
    append(Point, Path, Path0),
    UpY is RowNumber - 1,
    RightX is CollumnNumber + 1,
    LeftX is CollumnNumber - 1,
    DownY is RowNumber + 1,

    getUpPath(Board, UpY, CollumnNumber, Path0, BoardSize, Player, Path1),
    getLeftPath(Board, RowNumber, LeftX, Path1, BoardSize, Player, Path2),
    getRightPath(Board, RowNumber, RightX, Path2, BoardSize, Player, Path3),
    getDownPath(Board, DownY, CollumnNumber, Path3, BoardSize, Player, NewPath).


getUpPath(Board, RowNumber, CollumnNumber, Path, BoardSize, Player, Path):-RowNumber < 0, !.
getUpPath(Board, RowNumber, CollumnNumber, Path, BoardSize, Player, NewPath):-
    RowNumber >= 0,
    getElementFromBoard(Board, RowNumber, CollumnNumber, Elem),
    CreatePath(Board, Elem, RowNumber, CollumnNumber, Path, BoardSize, Player, NewPath).

getLeftPath(Board, RowNumber, CollumnNumber, Path, BoardSize, Player, NewPath):-CollumnNumber < 0, !.
getLeftPath(Board, RowNumber, CollumnNumber, Path, BoardSize, Player, NewPath):-
    CollumnNumber >= 0,
    getElementFromBoard(Board, RowNumber, CollumnNumber, Elem),
    CreatePath(Board, Elem, RowNumber, CollumnNumber, Path, BoardSize, Player, NewPath).

getRightPath(Board, RowNumber, CollumnNumber, Path, BoardSize, Player, NewPath):-CollumnNumber > BoardSize.
getRightPath(Board, RowNumber, CollumnNumber, Path, BoardSize, Player, NewPath):-
    CollumnNumber =< BoardSize,
    getElementFromBoard(Board, RowNumber, CollumnNumber, Elem), 
    CreatePath(Board, Elem, RowNumber, CollumnNumber, Path, BoardSize, Player, NewPath).

getDownPath(Board, RowNumber, CollumnNumber, Path, BoardSize, Player, NewPath):-RowNumber >= 0.
getDownPath(Board, RowNumber, CollumnNumber, Path, BoardSize, Player, NewPath):-
    RowNumber =< 0,
    getElementFromBoard(Board, RowNumber, CollumnNumber, Elem),
    CreatePath(Board, Elem, RowNumber, CollumnNumber, Path, BoardSize, Player, NewPath).


append_list([], Paths, Paths).
append_list(Path, Paths, NewPaths):-
    append(Path,Paths,NewPaths).

iterateRow([], _, L, L, _, _).
iterateRow([Elem| T ], Player, Paths, NewPaths, RowNumber, CollumnNumber, BoardSize, FixedBoard):-
    %check if in already part of a path list
    %skip if it is if its not start a new path

    CreatePath(FixedBoard, Elem, RowNumber, CollumnNumber, [], BoardSize, Player, Path),
    append_list(Path, Paths, NewPaths),
    NextCollumnNumber is CollumnNumber + 1,
    iterateRow(T, Player, Paths, NewPaths, RowNumber, CollumnNumber).


iterateBoard([], _, _, Paths, _).
iterateBoard([Row|T], Player, RowNumber, Paths, BoardSize, FixedBoard):-
    iterateRow(Row, Player, Paths, NewPaths, RowNumber, 0, BoardSize, FixedBoard),
    NewRowNumber is RowNumber + 1,
    iterateBoard(T, Player, NewRowNumber, NewPaths, BoardSize, FixedBoard).


calcScore(Board, Player):-
    length(Board, Size),
    S is Size - 1,
    iterateBoard(Board ,Player, 0, Paths, S, FixedBoard),
    writes(Paths).