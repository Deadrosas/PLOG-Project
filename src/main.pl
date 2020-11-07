% includes
:- include('computer.pl').

:- include('startGame.pl').

:- include('move.pl').
:- include('claimPiece.pl').

:- include('display.pl').

:- include('utils.pl').


init:-
    % print('Insira o Tamanho do Board: '), % números > 10 desformatam o board é preciso dar fix
    % read(Size),
    % createBoard(Board, Size, Size),
    final(Board),
    Turn is 1,
    mainLoop(Board, Turn, 3),
    print('Finished execution correctly.').
    

mainLoop(_, _, 0).

mainLoop(Board, 1, N):-
    N1 is N - 1,
    Turn is 1,
    NextTurn is 2,

    displayGame(Board),

    print('Jogador 1 Insira o local onde quer inserir uma peca: '),
    read(Play),
    move(Board, Play, Turn, NewBoard),

    mainLoop(NewBoard, NextTurn, N1).

mainLoop(Board, 2, N):-
    N1 is N - 1,
    Turn is 2,
    NextTurn is 1,

    displayGame(Board),

    print('Jogador 2 Insira o local onde quer inserir uma peca: '),

    read(Play),
    move(Board, Play, Turn, NewBoard),
    
    mainLoop(NewBoard, NextTurn, N1).