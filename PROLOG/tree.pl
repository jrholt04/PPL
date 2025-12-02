%make tree
%Name, Freq, Lchild, Rchild, Result
make_new_tree(Name, Freq, Lchild, Rchild, Result) :-
  Result = [Name, Freq, Lchild, Rchild].

%get name
tree_get_name([Name, _, _ , _], Name).

tree_get_name([Name, _ , _], Name).

tree_get_name([Name, _], Name).

%get freq
tree_get_freq([_, Freq, _, _], Freq).

tree_get_freq([_, Freq, _], Freq).

tree_get_freq([_, Freq], Freq).
