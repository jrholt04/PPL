;;;; File: huffman.lisp
;;;; Author: Jackson Holt, Transy U
;;;; Course: CS 3234 Principles of Programming Languages
;;;;
;;;;   This program builds a Huffman encoding tree from a given association list.
;;;;   The Huffman algorithm constructs an optimal binary tree for encoding symbols

;;; Main function: builds a Huffman encoding tree from the association list C.
(defun huffman (C)
    (HUFFMAN-h (pq-create C))
)

;;; Helper function: recursively builds the Huffman tree from a priority queue (pq).
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
