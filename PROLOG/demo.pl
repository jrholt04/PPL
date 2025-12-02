sub (_,_,[],[]).
sub(Old, New, [Old | Tail], [New | SubTail]) :-
  !, sub(Old,New, Tail, SubTail).
sub(Old, New, [New | Tail], [New | SubTail]) :-
  sub(Old, New, Tail, SubTial).

symbols([],[]).
symbols([[Symbol , _] | Rest], [Symbol | NewResult]) :- 
  symbols(Rest, NewResult).