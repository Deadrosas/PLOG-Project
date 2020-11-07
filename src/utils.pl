% modules
:- use_module(library(lists)).

% Declaration of what each piece represents
color(empty, none).
color(p1, black).
color(p2, black).
color(p3, black).
color(p4, black).
color(p5, black).
color(p6, black).
color(b1, white).
color(b2, white).
color(b3, white).
color(b4, white).
color(b5, white).
color(b6, white).

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

% Returns the element at Row RowNumber and Collumn CollumnNumber.
getElementFromBoard(Board, RowNumber, CollumnNumber, Elem):-
  nth1(RowNumber, Board, Row),
  nth1(CollumnNumber, Row, Elem).

% Replace an element on a list for another
replace(_, _, [], []).
replace(O, R, [O|T], [R|T2]) :- replace(O, R, T, T2).
replace(O, R, [H|T], [H|T2]) :- dif(H,O), replace(O, R, T, T2).