stappend([], Ys, Ys).
stappend([X | Xs], Ys, [X | Zs]) :- stappend(Xs, Ys, Zs).