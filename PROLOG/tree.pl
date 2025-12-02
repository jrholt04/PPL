%make tree
%Name, Freq, Lchild, Rchild, Result
make_new_tree(Name, Freq, Lchild, Rchild, Result) :-
  Result = [Name, Freq, Lchild, Rchild].

make_new_tree([Name, Freq, Lchild, nil], Result)
  Result = [Name, Freq, Lchild, nil].

make_new_tree([Name, Freq, nil, Rchild], Result)
  Result = [Name, Freq, nil, Rchild].

make_new_tree(Name, Freq, Result) :-
  Result = [Name, Freq, nil, nil].

%get name
tree_get_name([Name, _, _ , _], Name).

tree_get_name([Name, _ , _], Name).

tree_get_name([Name, _], Name).

%get freq
tree_get_freq([_, Freq, _, _], Freq).

tree_get_freq([_, Freq, _], Freq).

tree_get_freq([_, Freq], Freq).

%get Rchild
tree_get_rigth_child([_, _, _, Rchild], Rchild).

%get Lchild
tree_get_left_child([_, _, Lchild, _], Lchild).