% includes
:- include('startGame.pl').

:- include('menu.pl').

:- include('move.pl').

:- include('display.pl').


play:-
    display_game_name,
    select_mode(_,CPU1,CPU2,Size),
    createBoard(Board, Size, Size, 0),
    Turn is 0,
    CPUS = [CPU1, CPU2],
    mainLoop(Board, Turn, CPUS, 0), nl,
    print('Finished execution correctly.').

game_over(Board, 0):-
    value(Board, 0, Score0),
    value(Board, 1, Score1),
    Score0>Score1, !,
    format('Player 0 score: ~w.', Score0),nl,
    format('Player 1 score: ~w.', Score1),nl.

game_over(Board, 1):-
    value(Board, 0, Score0),
    value(Board, 1, Score1),
    Score0<Score1, !,
    format('Player 0 score: ~w.', Score0),nl,
    format('Player 1 score: ~w.', Score1),nl.

mainLoop(Board, _, _, 2):-
    game_over(Board, Winner),
    format('Player ~w is the winner! Congratulations.', Winner).

mainLoop(Board, Turn, CPUS, N):-
    dif(N,2),
    Temp is Turn + 1,
    NextTurn is Temp mod 2,
    
    displayGame(Board), !,
    nextMove(Board, Turn, CPUS, NewBoard),
    checkBoardDif(Board, NewBoard, N, NewN),
    mainLoop(NewBoard, NextTurn, CPUS, NewN).


checkBoardDif(Board, NewBoard, N, NewN):-
    \+dif(Board,NewBoard),
    NewN is N + 1.

checkBoardDif(Board, NewBoard, _, 0):-
    dif(Board,NewBoard).