:- include('computer.pl').

:- include('startGame.pl').

:- include('move.pl').
:- include('claimPiece.pl').

:- include('display.pl').

:- include('utils.pl').


init:-
    read(Size),
    % createBoard(Board, Size, Size),
    initial(Board),
    displayGame(Board),
    read(Size),
    mid(Board1),
    displayGame(Board1),
    read(Size),
    final(Board2),
    displayGame(Board2).