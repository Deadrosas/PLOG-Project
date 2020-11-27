% includes
:- include('utils.pl').
:- include('calculateScore.pl').
:- include('declarations.pl').
:- use_module(library(between)).

readPlay(Board, Turn, NewBoard):-
    %verify if move list is not empty and ask to play
    write('\nInsira "pass" para passar a jogada ou "play" para fazer uma jogada.'),
    read(_), !,
    readMove(Board, Turn, NewBoard).


readMove(Board, Turn, NewBoard):-

    write('\nInsira a linha de onde mover: '),
    read(FromRow),
    write('\nInsira a Coluna de onde mover: '),
    read(FromCollumn),
    write('\nInsira a linha para onde vai mover: '),
    read(ToRow),
    write('\nInsira a Coluna para onde vai mover: '),
    read(ToCollumn),

    %Process both collumns 
    processCollumn(FromCollumn, FromCollumnNumber),
    processCollumn(ToCollumn, ToCollumnNumber),

    Coords = [FromRow, FromCollumnNumber, ToRow, ToCollumnNumber],
    Move = [Turn, FromRow, FromCollumnNumber, ToRow, ToCollumnNumber],
    valid_move(Board, Turn, Coords),
    valid_moves(Board, Turn, ListOfValidMoves),
    print(ListOfValidMoves), print('\n'),
    
    move(Board, Move, NewBoard).


move(Board, Move, NewBoard):-
    [Player, X1, Y1, X2, Y2] = Move,
    executeMove(Board, [X1, Y1, X2, Y2], NewBoard),
    calcScore(NewBoard, Player).


executeMove(Board, [FromRow, FromCollumn, ToRow, ToCollumn], NewBoard):-

    getElementFromBoard(Board, FromRow, FromCollumn, Elem1),

    color(Elem1, FromPieceColor),
    stack(Elem1, FromPieceNumber),
    
    replaceElement(Board, TempBoard, FromPieceColor, FromPieceNumber, Elem1, FromCollumn, FromRow),
    
    getElementFromBoard(TempBoard, ToRow, ToCollumn, Elem2),

    color(Elem2, ToPieceColor),
    stack(Elem2, PieceNumber),

    ToPieceNumber is PieceNumber + 1,
    replaceElement(TempBoard, NewBoard, ToPieceColor, ToPieceNumber, Elem2, ToCollumn, ToRow).




replaceElement(Board, NewBoard, white, PieceNumber, ElementToBeReplaced, CollumnNumber, RowNumber):-
    
    color(ToPiece, black),
    stack(ToPiece, PieceNumber),

    X is RowNumber + 1,
    nth1(X, Board, Row),

    replaceOne(ElementToBeReplaced, ToPiece, CollumnNumber, Row, ToRow),
    replaceOne(Row, ToRow, RowNumber, Board, NewBoard).


replaceElement(Board, NewBoard, black, PieceNumber, ElementToBeReplaced, CollumnNumber, RowNumber):-
    color(ToPiece, white),
    stack(ToPiece, PieceNumber),

    X is RowNumber + 1,
    nth1(X, Board, Row),

    replaceOne(ElementToBeReplaced, ToPiece, CollumnNumber, Row, ToRow),
    replaceOne(Row, ToRow, RowNumber, Board, NewBoard).


valid_move(Board, Player, [X1,Y1,X2,Y2]):-
    length(Board, L),
    RealL is L - 1,
    X1>=0, Y1>=0, X2>=0,  Y2>=0,
    X1=< RealL, Y1=< RealL, X2=< RealL,  Y2=< RealL,
    getElementFromBoard(Board, X1, Y1, Elem1),
    getElementFromBoard(Board, X2, Y2, Elem2), !,
    checkPlayer(Player, Elem1, Elem2),
    checkDistance([X1,Y1,X2,Y2]).


checkDistance([X,Y1,X,Y2]):-
    abs(Y1 - Y2) =:= 1,
    !.

checkDistance([X1,Y,X2,Y]):-
    abs(X1 - X2) =:= 1,
    !.


checkPlayer(0, Elem1, Elem2):-
    color(Elem1, Color1),
    color(Elem2, Color2),

    Color1 == black,
    dif(Color1, Color2),
    
    stack(Elem1, Num1),
    stack(Elem2, Num2),
    Num1 == Num2,
    !.

checkPlayer(1, Elem1, Elem2):-
    color(Elem1, Color1),
    color(Elem2, Color2),

    Color1 == white,
    dif(Color1, Color2),
    
    stack(Elem1, Num1),
    stack(Elem2, Num2),
    Num1 == Num2,
    !.

valid_moves(Board, Player, ListOfValidMoves):-
    length(Board, LT),
    L is LT - 1,
    
    findall([X1,Y1,X2,Y2], 
    (between(0, L, X1), between(0, L, Y1), between(0, L, X2), between(0, L, Y2),
    valid_move(Board, Player, [X1,Y1,X2,Y2])), 
    ListOfValidMoves).



d_path_aux(From, To, L, LAux):-
	\+member(From, LAux),
	ligado(From,X),
	append(LAux, [From], LNewAux),
	d_path_aux(X, To, L, LNewAux).

d_path_aux(To, To, L, LAux):-
	append(LAux, [To], L).
	
d_path(Start, End, L):-
	d_path_aux(Start, End, L, []).

calc_score_aux(Board, Player).




processCollumn('A', CollumnNumber):- CollumnNumber is 0.

processCollumn('B', CollumnNumber):- CollumnNumber is 1.

processCollumn('C', CollumnNumber):- CollumnNumber is 2.

processCollumn('D', CollumnNumber):- CollumnNumber is 3.

processCollumn('E', CollumnNumber):- CollumnNumber is 4.

processCollumn('F', CollumnNumber):- CollumnNumber is 5.

processCollumn('G', CollumnNumber):- CollumnNumber is 6.

processCollumn('H', CollumnNumber):- CollumnNumber is 7.

processCollumn('I', CollumnNumber):- CollumnNumber is 8.

processCollumn('a', CollumnNumber):- CollumnNumber is 0.

processCollumn('b', CollumnNumber):- CollumnNumber is 1.

processCollumn('c', CollumnNumber):- CollumnNumber is 2.

processCollumn('d', CollumnNumber):- CollumnNumber is 3.

processCollumn('e', CollumnNumber):- CollumnNumber is 4.

processCollumn('f', CollumnNumber):- CollumnNumber is 5.

processCollumn('g', CollumnNumber):- CollumnNumber is 6.

processCollumn('h', CollumnNumber):- CollumnNumber is 7.

processCollumn('i', CollumnNumber):- CollumnNumber is 8.

processCollumn(0, CollumnNumber):- CollumnNumber is 0.

processCollumn(1, CollumnNumber):- CollumnNumber is 1.

processCollumn(2, CollumnNumber):- CollumnNumber is 2.

processCollumn(3, CollumnNumber):- CollumnNumber is 3.

processCollumn(4, CollumnNumber):- CollumnNumber is 4.

processCollumn(5, CollumnNumber):- CollumnNumber is 5.

processCollumn(6, CollumnNumber):- CollumnNumber is 6.

processCollumn(7, CollumnNumber):- CollumnNumber is 7.

processCollumn(8, CollumnNumber):- CollumnNumber is 8.
