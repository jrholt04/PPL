%string_concat: https://www.swi-prolog.org/pldoc/man?predicate=string_concat/3 accessed 12/2/25
huffman(AssocList, HuffmanTree) :-
    pq_create(AssocList, PQ),
    huffman_h(PQ, HuffmanTree).

huffman_h([], nil).

% If PQ has exactly one element return that element.
huffman_h([Only], Only).

% Recursive Huffman merge:
huffman_h(PQ, ResultTree) :-
    pq_extract_min(PQ, Min1, PQ1),

    pq_extract_min(PQ1, Min2, PQ2),

    tree_get_name(Min1, Name1),
    tree_get_name(Min2, Name2),
    string_concat(Name1, Name2, NewName),

    tree_get_freq(Min1, F1),
    tree_get_freq(Min2, F2),
    NewFreq is F1 + F2,

    make_new_tree(NewName, NewFreq, Min1, Min2, NewTree),

    pq_insert(NewTree, PQ2, PQ3),

    huffman_h(PQ3, ResultTree).
