:- include('utils.pl').
:- include('declarations.pl').

% Point = [Elem, X, Y], X = Row Y = Collumn
% Path = List of Points [[Elem1, X1,Y1],[Elem2, X2,Y2]]
% List of Paths is a List of Lists that contain points (which are lists too) ([[[Elem1, X1,Y1],[Elem2, X2,Y2]], [[Elem3, X3,Y3], [Elem4, X3, Y4]]])

%All Points Exist

createPath(Board, Elem, RowNumber, CollumnNumber, Path, BoardSize, 0, Path):-color(Elem, white).
createPath(Board, Elem, RowNumber, CollumnNumber, Path, BoardSize, 0, Path):-
    color(Elem, black),

    Point = [Elem, RowNumber, CollumnNumber],
    member(Point, Path).

createPath(Board, Elem, RowNumber, CollumnNumber, Path, BoardSize, 0, NewPath):-
    color(Elem, black),

    Point = [Elem, RowNumber, CollumnNumber],
    \+member(Point, Path),
    append(Path, [Point], Path0),
    UpY is RowNumber - 1,
    RightX is CollumnNumber + 1,
    LeftX is CollumnNumber - 1,
    DownY is RowNumber + 1,

    getUpPath(Board, UpY, CollumnNumber, Path0, BoardSize, 0, Path1),
    getLeftPath(Board, RowNumber, LeftX, Path1, BoardSize, 0, Path2),
    getRightPath(Board, RowNumber, RightX, Path2, BoardSize, 0, Path3),
    getDownPath(Board, DownY, CollumnNumber, Path3, BoardSize, 0, NewPath).

% Case of White Player
createPath(Board, Elem, RowNumber, CollumnNumber, Path, BoardSize, 1, Path):- color(Elem, black).
createPath(Board, Elem, RowNumber, CollumnNumber, Path, BoardSize, 1, Path):-
    color(Elem, white),

    Point = [Elem, RowNumber, CollumnNumber],
    member(Point, Path).

createPath(Board, Elem, RowNumber, CollumnNumber, Path, BoardSize, 1, NewPath):-
    color(Elem, white),

    Point = [Elem, RowNumber, CollumnNumber],
    \+member(Point, Path),
    append(Path, [Point], Path0),
    UpY is RowNumber - 1,
    RightX is CollumnNumber + 1,
    LeftX is CollumnNumber - 1,
    DownY is RowNumber + 1,

    getUpPath(Board, UpY, CollumnNumber, Path0, BoardSize, 1, Path1),
    getLeftPath(Board, RowNumber, LeftX, Path1, BoardSize, 1, Path2),
    getRightPath(Board, RowNumber, RightX, Path2, BoardSize, 1, Path3),
    getDownPath(Board, DownY, CollumnNumber, Path3, BoardSize, 1, NewPath).


getUpPath(Board, RowNumber, CollumnNumber, Path, BoardSize, Player, Path):-RowNumber < 0, !.
getUpPath(Board, RowNumber, CollumnNumber, Path, BoardSize, Player, NewPath):-
    RowNumber >= 0,
    getElementFromBoard(Board, RowNumber, CollumnNumber, Elem),
    createPath(Board, Elem, RowNumber, CollumnNumber, Path, BoardSize, Player, NewPath).

getLeftPath(Board, RowNumber, CollumnNumber, Path, BoardSize, Player, Path):-CollumnNumber < 0, !.
getLeftPath(Board, RowNumber, CollumnNumber, Path, BoardSize, Player, NewPath):-
    CollumnNumber >= 0,
    getElementFromBoard(Board, RowNumber, CollumnNumber, Elem),
    createPath(Board, Elem, RowNumber, CollumnNumber, Path, BoardSize, Player, NewPath).

getRightPath(Board, RowNumber, CollumnNumber, Path, BoardSize, Player, Path):-CollumnNumber > BoardSize, !.
getRightPath(Board, RowNumber, CollumnNumber, Path, BoardSize, Player, NewPath):-
    CollumnNumber =< BoardSize,
    getElementFromBoard(Board, RowNumber, CollumnNumber, Elem), 
    createPath(Board, Elem, RowNumber, CollumnNumber, Path, BoardSize, Player, NewPath).

getDownPath(Board, RowNumber, CollumnNumber, Path, BoardSize, Player, Path):-RowNumber > BoardSize, !.
getDownPath(Board, RowNumber, CollumnNumber, Path, BoardSize, Player, NewPath):-
    RowNumber =< BoardSize,
    getElementFromBoard(Board, RowNumber, CollumnNumber, Elem),
    createPath(Board, Elem, RowNumber, CollumnNumber, Path, BoardSize, Player, NewPath).


append_list([], Paths, Paths).
append_list(Path, Paths, NewPaths):-
    append(Path,Paths,NewPaths).

iterateRow([], _, _, NewPaths, RowNumber, CollumnNumber, BoardSize, FixedBoard).
iterateRow([Elem| T ], Player, Paths, NewPaths, RowNumber, CollumnNumber, BoardSize, FixedBoard):-
    %check if in already part of a path list
    %skip if it is if its not start a new path

    createPath(FixedBoard, Elem, RowNumber, CollumnNumber, [], BoardSize, Player, Path),
    append_list(Path, Paths, NewPaths),
    NextCollumnNumber is CollumnNumber + 1,
    iterateRow(T, Player, Paths, NewPaths, RowNumber, CollumnNumber).


iterateBoard([], _, _, Paths, _, Paths).
iterateBoard([Row|T], Player, RowNumber, Paths, BoardSize, FixedBoard, CompletePaths):-
    iterateRow(Row, Player, Paths, NewPaths, RowNumber, 0, BoardSize, FixedBoard),
    NewRowNumber is RowNumber + 1,
    iterateBoard(T, Player, NewRowNumber, NewPaths, BoardSize, FixedBoard).


calcScore(Board, Player):-
    length(Board, Size),
    S is Size - 1,
    iterateBoard(Board ,Player, 0, [], S, Board, Paths),
    write(Paths).