/*O tabuleiro 9*9*/
initial([
  [p1, p1, p1, p1, p1, p1, p1, p1, p1],
  [p1, p1, p1, p1, p1, p1, p1, p1, p1],
  [p1, p1, p1, p1, p1, p1, p1, p1, p1],
  [p1, p1, p1, p1, p1, p1, p1, p1, p1],
  [p1, p1, p1, p1, p1, p1, p1, p1, p1],
  [p1, p1, p1, p1, p1, p1, p1, p1, p1],
  [p1, p1, p1, p1, p1, p1, p1, p1, p1],
  [p1, p1, p1, p1, p1, p1, p1, p1, p1],
  [p1, p1, p1, p1, p1, p1, p1, p1, p1]
  ]).

mid([
  [b2, p1, p3, p1, p1, p1, b4, p1, p1],
  [p1, p1, b4, b2, b4, p1, b2, p3, p1],
  [p1, p1, b2, b4, p1, p3, p1, p1, p1],
  [p1, p3, p1, p1, p3, p1, b2, p1, p1],
  [p3, p1, p1, b4, p1, p3, p1, p1, p1],
  [p1, b4, b2, b2, p1, p1, b2, b2, p1],
  [p1, p3, p1, p3, p3, p1, b2, p1, p1],
  [b4, p1, b2, p1, b2, p1, p3, p1, p1],
  [p1, p1, p3, p1, p1, p3, p1, p1, b4]
  ]).

final([
  [b2, p1, p3, p1, b2, p1, b4, p1, p1],
  [p1, p1, b4, b2, b4, p1, b2, p3, p1],
  [b2, b2, b2, b4, p1, p3, p1, b2, b2],
  [p1, p3, p1, p1, p3, p1, b2, p1, p1],
  [p3, p1, p1, b4, p1, p3, p1, b2, b2],
  [p1, b4, b2, b2, p1, p1, b2, p3, p1],
  [p1, p3, p1, p3, p3, p1, b2, p1, p1],
  [b4, b2, b2, p1, b2, p1, p3, p1, p1],
  [p1, p1, p3, b2, p1, p3, p1, b2, b4]
  ]).


createBoard([], 0, Total).
createBoard([H|T], N, Total):-
  N > 0,
  N1 is N-1,
  NT is Total,
  createRow(H, NT),
  createBoard(T, N1, Total).

createRow([],0).
createRow([p1|Row],N):-
  N > 0,
  N1 is N-1,
  createRow(Row,N1).
