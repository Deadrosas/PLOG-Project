:- include('computer.pl').

:- include('startGame.pl').

:- include('move.pl').
:- include('claimPiece.pl').

:- include('display.pl').

:- include('utils.pl').


init:-
    print('Insira o Tamanho do Board: '), % números > 10 desformatam o board é preciso dar fix
    read(Size),
    createBoard(Board, Size, Size),
    displayGame(Board).