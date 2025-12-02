%File: pq.PL
%Author: Jackson Holt, Transy U
%Course: CS 3234 Principles of Programing Languages 
%
%   Implementation of a simple priority queue of trees(nodes),
%   built from an association list. Each element of the 
%   structured like (name frequency), where the queue is ordered
%   by ascending frequency (smallest first).   

% create a priority queue from an association list
pq_create(List, PQ) :- pq_create_h(List, [], PQ).

% helper function for create pq 
% pq_create_helper(AssocList, CurrentPQ, PQ)
pq_create_h([], PQ, PQ).

pq_create_h([ [Name,Freq] | Rest], Current, PQ) :-
    make_new_tree(Name, Freq, nil, nil, Leaf),
    pq_insert(Leaf, Current, NewPQ),
    pq_create_h(Rest, NewPQ, PQ).

% inset an item into the priority queue while maintain order
%pq_insert(item, pq, result)
pq_insert(Item, [], [Item]).

%if we have found the spot add it to the list
pq_insert(Item, [Head|Tail], [Item, Head|Tail]) :-
    Item = [_, Freq1, _, _],
    Head = [_, Freq2, _, _],
    Freq1 < Freq2.

%if we have not find it we recurse
pq_insert(Item, [Head|Tail], [Head|NewTail]) :-
    Item = [_, Freq1, _, _],
    Head = [_, Freq2, _, _],
    Freq1 >= Freq2,
    pq_insert(Item, Tail, NewTail).


% extracts min value of the list and returns min and newPQ
% pq_extract_min(PQ, MinVal, NewPQ)
pq_extract_min([Head | Tail], Head, Tail).

% checks if pq it empty
pq_null([]).

% returns the number ofelements in the priority queue.
pq_length([], 0).

pq_length([_ | Rest], Length) :- pq_length(Rest, L1), Length is L1 + 1.