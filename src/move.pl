% includes
:- include('utils.pl').
:- include('declarations.pl').
:- use_module(library(between)).




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

    Move = [FromRow, FromCollumnNumber, ToRow, ToCollumnNumber],
    print(Move), print('\n'),
    valid_move(Board, Turn, Move),
    valid_moves(Board, Turn, ListOfValidMoves),
    print(ListOfValidMoves), print('\n'),

    move(Board, Move, NewBoard).




move(Board, Move, NewBoard):-
    executeMove(Board, Move, NewBoard).

    

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
    print('Valid\n'),
    getElementFromBoard(Board, X2, Y2, Elem2),
    print('Valid\n'),
    checkPlayer(Player, Elem1, Elem2),
    checkDistance([X1,Y1,X2,Y2]),
    print('Valid\n').


checkDistance([X,Y1,X,Y2]):-
    print([X,Y1,X,Y2]),
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
    between(0, L, X1), between(0, L, Y1), between(0, L, X2), between(0, L, Y2),
    bagof([X1,Y1,X2,Y2], valid_move(Board, Player, [X1,Y1,X2,Y2]), ListOfValidMoves).

































getValidMoves([], Player, ListOfValidMoves).
getvalidMoves([H|T], Player, ListOfValidMoves):-
    % Para cada peça do 'Player' verificar os moves validos e adicionar a lista
    % adicionar um tipo de valor a cada jogada para o computador decidir que jogada fazer pode ser com outra lista ou no inicio da lista que representa um move valido.
    % calcular caso uma jogada aconteça o valor total da board do jogador
    getValidHorizontalValidMoves(H, Player, ListOfValidMoves),
    getValidVerticalMoves(H, T, Player, ListOfValidMoves),
    getValidMoves(T, Player, ListOfValidMoves).

getValidHorizontalValidMoves[H|[]], Player, ListOfValidMoves).

getValidHorizontalValidMoves([H,H1|T], Player, ListOfValidMoves):-
    color(H, HColor),
    stack(H, HNumber),
    color(H1, H1Color),
    stack(H1, H1Number),
    dif(HColor, H1Color),
    HNumber == H1Number,
    getValidHorizontalValidMoves([H1,T], Player, [Move| ListOfValidMoves]).




calcScore(Board, Player).
    % A função de valor vai ser dada pela soma de peças adjacentes (ortogonalmente)
    /* p1 p2 b3
       p2 b2 b4
       p2 p1 p1 

    p1 + p2 + p2 + p2 + p1 = 8
    b3 + b4 + b2 = 9
    */

    









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