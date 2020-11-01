:- include('computer.pl').

:- include('startGame.pl').

:- include('move.pl').
:- include('claimPiece.pl').

:- include('display.pl').

:- include('utils.pl').


play:-
    mid(Board),
    displayGame(Board).