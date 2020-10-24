displayGame([Head|Tail]) :- 
        printRow(Head),
        displayGame(Tail).
displayGame([]).

printRow([Head|Tail]) :-
        write(Head),
        write('  '),
        printRow(Tail).
printRow([]) :- nl, nl.
        
printLineDivision :-  put_code(9552), put_code(9552), put_code(9552), put_code(9552), put_code(9552), put_code(9552).