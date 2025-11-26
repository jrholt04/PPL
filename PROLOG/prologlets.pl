%st_append
st_append([], Ys, Ys).
st_append([X | Xs], Ys, [X | Zs]) :- st_append(Xs, Ys, Zs).

%st_member 
st_member(X, [X | _]).
st_member(X, [_ | Ys]) :- st_member(X, Ys).

%st_reverse 
st_reverse([],[]).
st_reverse([F | R], K) :- st_reverse(R, RR),st_append(RR, [F], K).

%st_length
st_length([], 0).
st_length([_ | T], L) :- st_length(T, L1), L is L1 + 1.