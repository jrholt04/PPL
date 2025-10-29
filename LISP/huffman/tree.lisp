;;;; File: tree.lisp
;;;; Author: Jackson Holt, Transy U
;;;; Course: CS 3234 Principles of Programming Languages
;;;;
;;;;   Implementation of a simple tree structure used for Huffman encoding.
;;;;   Each node is represented as a list of the form:
;;;;   (name freq left-child right-child)

;;; Creates a new tree node from its components.
(defun make-new-tree(name freq lchild rchild)
    (list name freq lchild rchild)
)

;;; Combines the names of two child nodes into a composite name.
;;; Used when creating an internal node in the Huffman tree.
(defun tree-get-name(lchild rchild)
    (list (car lchild) (car rchild))
)

;;; Computes the combined frequency of two child nodes.
(defun tree-get-freq(lchild rchild)
    (+ (second lchild) (second rchild))
)

;;; Retrieves the right child node from the priority queue.
(defun get-right-child (pq)
    (get-min (extract-min (get-pq (extract-min pq))))
)

;;; Retrieves the left child node from the priority queue.
(defun get-left-child (pq)
    (get-min (extract-min pq))
)