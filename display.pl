colour(empty, none).

level(empty, 0).

displayGame(_):-
        put_code(10122), put_code(10112), put_code(10102), put_code(9461), put_code(9312), nl,
        write('            '), put_code(9556), printLineDivision, put_code(9574), printLineDivision, put_code(9574), printLineDivision, put_code(9574), printLineDivision, put_code(9574), printLineDivision, put_code(9574), printLineDivision, put_code(9574), printLineDivision, put_code(9574), printLineDivision, put_code(9574), printLineDivision, put_code(9559), nl,
        write('     y/x    '), put_code(9553), write('     A     '), put_code(9553), write('     B     '), put_code(9553), write('     C     '), put_code(9553), write('     D     '), put_code(9553), write('     E     '), put_code(9553), write('     F     '), put_code(9553), write('     G     '), put_code(9553), write('     H     '), put_code(9553), write('     I     '), put_code(9553), nl,
        put_code(9556), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9571), nl,
        getListElemAt(0, Board, Array0),
        printLine(0, Array0, 0), nl,
        put_code(9568), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9571), nl,
        getListElemAt(1, Board, Array1),
        printLine(0, Array1, 1), nl,
        put_code(9568), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9571), nl,
        getListElemAt(2, Board, Array2),
        printLine(0, Array2, 2), nl,
        put_code(9568), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9571), nl,
        getListElemAt(3, Board, Array3),
        printLine(0, Array3, 3), nl,
        put_code(9568), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9571), nl,
        getListElemAt(4, Board, Array4),
        printLine(0, Array4, 4), nl,
        put_code(9568), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9571), nl,
        getListElemAt(5, Board, Array5),
        printLine(0, Array5, 5), nl,
        put_code(9568), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9571), nl,
        getListElemAt(6, Board, Array6),
        printLine(0, Array6, 6), nl,
        put_code(9568), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9571), nl,
        getListElemAt(7, Board, Array7),
        printLine(0, Array7, 7), nl,
        put_code(9568), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9580), printLineDivision, put_code(9571), nl,
        getListElemAt(8, Board, Array8),
        printLine(0, Array8, 8), nl,
        put_code(9562), printLineDivision, put_code(9577), printLineDivision, put_code(9577), printLineDivision, put_code(9577), printLineDivision, put_code(9577), printLineDivision, put_code(9577), printLineDivision, put_code(9577), printLineDivision, put_code(9577), printLineDivision, put_code(9577), printLineDivision, put_code(9577), printLineDivision, put_code(9565).

printLine(Line, Array, Value) :-
  Line == 0,
  put_code(9553), write('           '), put_code(9553), write('           '), put_code(9553), write('           '), put_code(9553), write('           '), put_code(9553), write('           '),  put_code(9553), write('           '),  put_code(9553), write('           '),  put_code(9553), write('           '),  put_code(9553), write('           '),  put_code(9553), write('           '), put_code(9553), nl,
  printLine(1,Array, Value).

printLine(Line, Array, Value) :-
  Line == 1,
  getListElemAt(0, Array, Elem1),
  getListElemAt(1, Array, Elem2),
  getListElemAt(2, Array, Elem3),
  getListElemAt(3, Array, Elem4),
  getListElemAt(4, Array, Elem5),
  getListElemAt(5, Array, Elem6),
  getListElemAt(6, Array, Elem7),
  getListElemAt(7, Array, Elem8),
  getListElemAt(8, Array, Elem9),
  put_code(9553), write('     '), write(Value), write('     '), put_code(9553), printCel(Elem1), put_code(9553), printCel(Elem2), put_code(9553), printCel(Elem3), put_code(9553), printCel(Elem4), put_code(9553), printCel(Elem5), put_code(9553), printCel(Elem6), put_code(9553), printCel(Elem7), put_code(9553), printCel(Elem8), put_code(9553), printCel(Elem9), put_code(9553), nl,
  printLine(2,Array).

printLine(Line, Array) :-
  Line == 2,
  getListElemAt(0, Array, Elem1),
  getListElemAt(1, Array, Elem2),
  getListElemAt(2, Array, Elem3),
  getListElemAt(3, Array, Elem4),
  getListElemAt(4, Array, Elem5),
  getListElemAt(5, Array, Elem6),
  getListElemAt(6, Array, Elem7),
  getListElemAt(7, Array, Elem8),
  getListElemAt(8, Array, Elem9),
  put_code(9553), write('           '), put_code(9553), write(' '), level(Elem1, Elem1Lv), write(Elem1Lv), write('         '), put_code(9553), write(' '), level(Elem2, Elem2Lv), write(Elem2Lv), write('         '), put_code(9553), write(' '), level(Elem3, Elem3Lv), write(Elem3Lv), write('         '), put_code(9553), write(' '), level(Elem4, Elem4Lv), write(Elem4Lv),  write('         '), put_code(9553), write(' '), level(Elem5, Elem5Lv), write(Elem5Lv),  write('         '), put_code(9553), write(' '), level(Elem6, Elem6Lv), write(Elem6Lv),  write('         '), put_code(9553), write(' '), level(Elem7, Elem7Lv), write(Elem7Lv),  write('         '), put_code(9553), write(' '), level(Elem8, Elem8Lv), write(Elem8Lv),  write('         '), put_code(9553), write(' '), level(Elem9, Elem9Lv), write(Elem9Lv), write('         '), put_code(9553).

printCel(empty) :-
  write('    '), put_code(10122), write('     ').

/*printCel(Elem) :- Elem \== empty,
  colour(Elem, ElemColour),
  ElemColour == black.

printCel(Elem) :- Elem \== empty,
  colour(Elem, ElemColour),
  ElemColour == white.*/

printLineDivision :-  put_code(9552), put_code(9552), put_code(9552), put_code(9552), put_code(9552), put_code(9552), put_code(9552), put_code(9552), put_code(9552), put_code(9552), put_code(9552).