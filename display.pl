printBoard([Head|Tail]) :- 
        printRow(Head),
        printBoard(Tail).
printBoard([]).

printRow([Head|Tail]) :-
        write(Head),
        write('  '),
        printRow(Tail).
printRow([]) :- nl.

f :- 
    emptyBoard(Board),
    printBoard(Board).