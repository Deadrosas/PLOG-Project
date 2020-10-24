:- include('computer.pl').

:- include('startGame.pl').

:- include('move.pl').
:- include('claimPiece.pl').

:- include('display.pl').

:- include('utils.pl').


play:-
    emptyBoard(Board),
    displayGame(Board),
    put_code(9556), printLineDivision, put_code(9574), printLineDivision, put_code(9574), printLineDivision, put_code(9574), printLineDivision, put_code(9559), nl,
    put_code(9553), write('      '), put_code(9553), write('      '), put_code(9553), write('      '), put_code(9553), write('      '), put_code(9553), nl,
    put_code(9553), write('      '), put_code(9553), write('      '), put_code(9553), write('      '), put_code(9553), write('      '), put_code(9553), nl,
    put_code(9562), printLineDivision, put_code(9577), printLineDivision, put_code(9577), printLineDivision, put_code(9577), printLineDivision, put_code(9565).