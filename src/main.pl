% includes
:- include('computer.pl').

:- include('startGame.pl').

:- include('move.pl').

:- include('display.pl').

:- include('utils.pl').


play:-
    print('Insira o Tamanho do Board: '), % números > 10 desformatam o board é preciso dar fix
    read(Size),
    createBoard(Board, Size, Size, 0),
    createBlackHand(BlackHand, Size),
    createWhiteHand(WhiteHand, Size),
    Turn is 0,
    mainLoop(Board, Turn, 5),
    print('Finished execution correctly.').

mainLoop(Board, _, 0):-displayGame(Board).

mainLoop(Board, Turn, N):-
    N1 is N - 1,
    Temp is Turn + 1,
    NextTurn is Temp mod 2,
    
    displayGame(Board), !,
    readPlay(Board, Turn, NewBoard),
    mainLoop(NewBoard, NextTurn, N1).