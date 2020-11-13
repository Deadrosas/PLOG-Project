% includes
:- include('utils.pl').
:- include('declarations.pl').

move(Board, Play, Turn, NewBoard):-

    % For now all moves are valid.
    % For now Move is placing a piece on a stack
    processMove(Play, RowNumber, CollumnNumber),
    % Getting an Element from the Board
    getElementFromBoard(Board, RowNumber, CollumnNumber, ElementToBeReplaced),
    color(ElementToBeReplaced, PieceColor),
    stack(ElementToBeReplaced, PieceNumber),
    replaceElement(Board, NewBoard, Turn, PieceColor, PieceNumber, ElementToBeReplaced, CollumnNumber, RowNumber).


processMove(Play, RowNumber, CollumnNumber):-
    %play(Play, RowNumber, CollumnNumber).
    RowNumber is 1,
    CollumnNumber is 1.

replaceElement(Board, NewBoard, 1, white, PieceNumber, ElementToBeReplaced, CollumnNumber, RowNumber):-
    NewPieceNumber is PieceNumber + 1,
    color(NewPiece, black),
    stack(NewPiece, NewPieceNumber),

    nth1(RowNumber, Board, Row),

    replaceOne(ElementToBeReplaced, NewPiece, CollumnNumber, Row, NewRow),
    replaceOne(Row, NewRow, RowNumber, Board, NewBoard).


replaceElement(Board, NewBoard, 2, black, PieceNumber, ElementToBeReplaced, CollumnNumber, RowNumber):-
    NewPieceNumber is PieceNumber + 1,
    color(NewPiece, white),
    stack(NewPiece, NewPieceNumber),

    nth1(RowNumber, Board, Row),

    replaceOne(ElementToBeReplaced, NewPiece, CollumnNumber, Row, NewRow),
    replaceOne(Row, NewRow, RowNumber, Board, NewBoard).





