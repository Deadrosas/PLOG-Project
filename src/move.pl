% includes
:- include('utils.pl').

move(Board, Play, Turn, NewBoard):-
    % For now all moves are valid.
    % For now Move is placing a piece on a stack

    verifyMove(Play),
    processMove(Play, RowNumber, CollumnNumber),
    % Getting an Element from the Board
    getElementFromBoard(Board, RowNumber, CollumnNumber, ElementToBeReplaced),
    color(ElementToBeReplaced, PieceColor),
    stack(ElementToBeReplaced, PieceNumber),
    replaceElement(Board, NewBoard, Turn, PieceColor, PieceNumber, ElementToBeReplaced).


verifyMove(Play, 0):-
    atom_codes(Play, L),
    length(L, Size),
    verifyM(Play, Size).


verifyM(Play, 4):-
    print('Hello\n').

verifyM(Play, 2):-
    print('HB\n').

verifyM(Play, N):-
    print('HC\n'),
    dif(N,2),
    print('\n Por Favor insira uma jogada valida: '),
    read(Play),
    atom_codes(Play, L),
    length(L, Size),
    verifyM(Play, Size).

processMove(Play, RowNumber, CollumnNumber):-
    RowNumber is 1,
    CollumnNumber is 1.

replaceElement(Board, NewBoard, Turn, black, PieceNumber, ElementToBeReplaced):-
    Turn == 2,
    NewPieceNumber is PieceNumber + 1,
    color(NewPiece, white),
    stack(NewPiece, NewPieceNumber),
    nth1(RowNumber, Board, Row),
    replace(ElementToBeReplaced, NewPiece, Row, NewRow),
    replace(Row, NewRow, Board, NewBoard).


replaceElement(Board, NewBoard, Turn, white, PieceNumber, ElementToBeReplaced):-
    Turn == 1,
    NewPieceNumber is PieceNumber + 1,
    color(NewPiece, black),
    stack(NewPiece, NewPieceNumber),
    nth1(RowNumber, Board, Row),
    replace(ElementToBeReplaced, NewPiece, Row, NewRow),
    replace(Row, NewRow, Board, NewBoard).



