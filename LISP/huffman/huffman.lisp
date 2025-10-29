;;;;File: huffman.lisp
;;;;Author: Jackson Holt, Transy U
;;;;Course: CS 3234 PPL

(load "pq")
(load "tree")

;;;creates a huffman encoding tree
(defun huffman (C)
    (HUFFMAN-h (pq-create C))
)

;;;helper function for hufman that takes in the pqueue and returns the tree
(defun huffman-h (pq)
    (cond ((or (pq-null pq)(= (pq-length pq) 1 )) (get-min (extract-min pq)))
        (t(HUFFMAN-h (pq-insert (make-new-tree 
                                (tree-get-name (get-min (extract-min pq)) (get-min (extract-min (get-pq (extract-min pq))))) 
                                (tree-get-freq (get-min (extract-min pq)) (get-min (extract-min (get-pq (extract-min pq))))) 
                                (get-left-child pq) 
                                (get-right-child pq))
                                (get-pq (extract-min (get-pq (extract-min pq)))))))
    )
)
