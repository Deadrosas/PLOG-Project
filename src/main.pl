% includes
:- include('computer.pl').

:- include('startGame.pl').

:- include('move.pl').
:- include('claimPiece.pl').

:- include('display.pl').

:- include('utils.pl').


init:-
    print('Insira o Tamanho do Board: '), % números > 10 desformatam o board é preciso dar fix
    read(Size),
    createBoard(Board, Size, Size, 0),
    createBlackHand(BlackHand, Size),
    createWhiteHand(WhiteHand, Size),
    Turn is 1,
    mainLoop(Board, Turn, 3, BlackHand, WhiteHand),
    print('Finished execution correctly.').
    

mainLoop(_, _, 0, _, _).

mainLoop(Board, 1, N, BlackHand, WhiteHand):-
    N1 is N - 1,
    Turn is 1,
    NextTurn is 2,

    displayGame(Board),
    print('Jogador 1:\n'),
    print('Pecas disponiveis: '),
    displayHand(BlackHand),
    print('\nFaca a sua jogada: '),
    read(Play),
    move(Board, Play, Turn, NewBoard),
    mainLoop(NewBoard, NextTurn, N1, BlackHand, WhiteHand).

mainLoop(Board, 2, N, BlackHand, WhiteHand):-
    N1 is N - 1,
    Turn is 2,
    NextTurn is 1,

    displayGame(Board),
    print('Jogador 2:\n'),
    print('Pecas disponiveis: '),
    displayHand(WhiteHand),
    print('\nFaca a sua jogada: '),
    read(Play),
    move(Board, Play, Turn, NewBoard),
    mainLoop(NewBoard, NextTurn, N1, BlackHand, WhiteHand).