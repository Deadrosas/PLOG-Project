:- include('move.pl').



randomBot(Board, ValidMoves, BotNumber):-
    executeRandomMove(ValidMoves, RandomMove),
    executeMove(RandomMove).



/*
smartBot():-
    tryAllPossibleMoves(ValidMoves, BestMove),
    executeMove(BestMove).
*/