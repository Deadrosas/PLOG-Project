piece(N, white, Code):-
  Code is 10111 + N.

piece(N, black, Code):-
  Code is 10121 + N.

colour(empty, none).

colour(1, black).
colour(p2, black).
colour(p3, black).
colour(4, black).
colour(p5, black).
colour(p6, black).
colour(b1, white).
colour(2, white).
colour(b3, white).
colour(b4, white).
colour(3, white).
colour(b6, white).


stack(empty, 0).

stack(p1, 1).
stack(p2, 2).
stack(p3, 3).
stack(p4, 4).
stack(p5, 5).
stack(p6, 6).
stack(b1, 1).
stack(b2, 2).
stack(b3, 3).
stack(b4, 4).
stack(b5, 5).
stack(b6, 6).

/*displayGame2(Board):-
  lenght(Board, Nmax),
  write('      '), put_code(9556),
  printHeader(0, Nmax).

  


printHeader(N, N).
printHeader(N,Nmax):-
  printLineDivision, put_code(9574),
  NewN is N+1,
  printHeader(NewN, Nmax).


printRow(N,N).
printRow(N):-
  getListElemAt(N, Board, Array),
  newPrintLine(Array, 0),
  put_code(9568), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9571), nl.
  NewN is N+1,
  printRowAux(0, N).

printRowAux(N, Nmax).


printFooter(N, N).
printFooter(N,Nmax):-
  printLineDivision, put_code(9574),
  NewN is N+1,
  printHeader(NewN, Nmax).

  
displayGameAux(_, 0).*/


displayGame(Board):-
        %put_code(10122), put_code(10112), put_code(10102), put_code(9461), put_code(9312), nl,
        write('      '), put_code(9556), printLineDivision, put_code(9574), printLineDivision, put_code(9574), printLineDivision, put_code(9574), printLineDivision, put_code(9574), printLineDivision, put_code(9574), printLineDivision, put_code(9574), printLineDivision, put_code(9574), printLineDivision, put_code(9574), printLineDivision, put_code(9559), nl,
        write(' y/x  '), put_code(9553), write('  A  '), put_code(9553), write('  B  '), put_code(9553), write('  C  '), put_code(9553), write('  D  '), put_code(9553), write('  E  '), put_code(9553), write('  F  '), put_code(9553), write('  G  '), put_code(9553), write('  H  '), put_code(9553), write('  I  '), put_code(9553), nl,
        put_code(9556), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9571), nl,
        getListElemAt(0, Board, Array0),
        printLine(Array0, 0, white),
        put_code(9568), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9571), nl,
        getListElemAt(1, Board, Array1),
        printLine(Array1, 1, white),
        put_code(9568), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9571), nl,
        getListElemAt(2, Board, Array2),
        printLine(Array2, 2, black),
        put_code(9568), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9571), nl,
        getListElemAt(3, Board, Array3),
        printLine(Array3, 3, black),
        put_code(9568), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9571), nl,
        getListElemAt(4, Board, Array4),
        printLine(Array4, 4, white),
        put_code(9568), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9571), nl,
        getListElemAt(5, Board, Array5),
        printLine(Array5, 5, black),
        put_code(9568), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9571), nl,
        getListElemAt(6, Board, Array6),
        printLine(Array6, 6, black),
        put_code(9568), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9571), nl,
        getListElemAt(7, Board, Array7),
        printLine(Array7, 7, black),
        put_code(9568), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9571), nl,
        getListElemAt(8, Board, Array8),
        printLine(Array8, 8, white),
        put_code(9562), printLineDivision, put_code(9577), printLineDivision, put_code(9577), printLineDivision, put_code(9577), printLineDivision, put_code(9577), printLineDivision, put_code(9577), printLineDivision, put_code(9577), printLineDivision, put_code(9577), printLineDivision, put_code(9577), printLineDivision, put_code(9577), printLineDivision, put_code(9565).

printLine(Array, Value, Colour) :-
  Colour == white,
  getListElemAt(0, Array, Elem1),
  getListElemAt(1, Array, Elem2),
  getListElemAt(2, Array, Elem3),
  getListElemAt(3, Array, Elem4),
  getListElemAt(4, Array, Elem5),
  getListElemAt(5, Array, Elem6),
  getListElemAt(6, Array, Elem7),
  getListElemAt(7, Array, Elem8),
  getListElemAt(8, Array, Elem9),
  put_code(9553), write('  '), write(Value), write('  '), put_code(9553), printCel(Elem1, black), put_code(9553), printCel(Elem2, black), put_code(9553), printCel(Elem3, black), put_code(9553), printCel(Elem4, black), put_code(9553), printCel(Elem5, white), put_code(9553), printCel(Elem6, black), put_code(9553), printCel(Elem7, white), put_code(9553), printCel(Elem8, white), put_code(9553), printCel(Elem9, white), put_code(9553), nl.

printLine(Array, Value, Colour) :-
  Colour == black,
  getListElemAt(0, Array, Elem1),
  getListElemAt(1, Array, Elem2),
  getListElemAt(2, Array, Elem3),
  getListElemAt(3, Array, Elem4),
  getListElemAt(4, Array, Elem5),
  getListElemAt(5, Array, Elem6),
  getListElemAt(6, Array, Elem7),
  getListElemAt(7, Array, Elem8),
  getListElemAt(8, Array, Elem9),
  put_code(9553), write('  '), write(Value), write('  '), put_code(9553), printCel(Elem1, white), put_code(9553), printCel(Elem2, white), put_code(9553), printCel(Elem3, white), put_code(9553), printCel(Elem4, white), put_code(9553), printCel(Elem5, black), put_code(9553), printCel(Elem6, white), put_code(9553), printCel(Elem7, white), put_code(9553), printCel(Elem8, black), put_code(9553), printCel(Elem9, black), put_code(9553), nl.

/*newPrintLine(Array, Value) :-
  colour(Value,X),
  X == black,
  put_code(9553), printCel(Elem1, black).

newPrintLine(Array, Value) :-
  colour(value,X),
  X == white,
  put_code(9553), printCel(Elem1, white).*/


printCel(empty) :- 
  write('  '), /*put_code(10122),*/ write('   ').

printCel(Elem, ElemColour) :-
  %colour(Elem, ElemColour),
  %ElemColour == black,
  %write('HIEIIE'),
  %write(Elem),
  piece(Elem, ElemColour, Code), 
  write('  '), put_code(Code), write(' ').

/*printCel(Elem) :- Elem \== empty,
  %colour(Elem, ElemColour),
  %ElemColour == white,
  piece(Elem, ElemColour, Code), 
  write('  '), put_code(Code), write(' ').*/

printLineDivision :-  put_code(9552), put_code(9552), put_code(9552), put_code(9552), put_code(9552).