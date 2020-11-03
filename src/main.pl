:- include('computer.pl').

:- include('startGame.pl').

:- include('move.pl').
:- include('claimPiece.pl').

:- include('display.pl').

:- include('utils.pl').


init:-
    read(Size),
    createBoard(Board, Size, Size),
    displayGame(Board).