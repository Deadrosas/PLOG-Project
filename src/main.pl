% includes
:- include('startGame.pl').

:- include('menu.pl').

:- include('move.pl').

:- include('display.pl').


play:-
    display_game_name,
    select_mode(GameMode,CPU1,CPU2,Size),
    createBoard(Board, Size, Size, 0),
    createBlackHand(BlackHand, Size),
    createWhiteHand(WhiteHand, Size),
    Turn is 0,
    CPUS = [CPU1, CPU2],
    mainLoop(Board, Turn, CPUS, 0),
    print('Finished execution correctly.').

game_over(Board, 0):-
    value(Board, 0, Score0),
    value(Board, 1, Score1),
    Score0>Score1, !,
    write(Score0),nl,
    write(Score1),nl.

game_over(Board, 1):-
    value(Board, 0, Score0),
    value(Board, 1, Score1),
    Score0<Score1, !,
    write(Score0),nl,
    write(Score1),nl.

mainLoop(Board, Turn, CPUS, 2):-
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

checkBoardDif(Board, NewBoard, N, 0):-
    dif(Board,NewBoard).