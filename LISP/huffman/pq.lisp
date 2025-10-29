;;;;File: pq.lisp
;;;;Author: Jackson Holt, Transy U
;;;;Course: CS 3234 Principles of Programming Languages
;;;;
;;;;   Implementation of a simple priority queue,
;;;;   built from an association list. Each element of the 
;;;;   structured like (name frequency), where the queue is ordered
;;;;   by ascending frequency (smallest first).

;;; Creates a priority queue from an association list.
(defun pq-create (assoc_list)
  (cond ((null assoc_list) nil)
      (t (pq-insert (car assoc_list) (pq-create (cdr assoc_list))))
  )
)

;;; Inserts an item into the priority queue while maintaining order.
(defun pq-insert (item pq)
    (cond ((null pq) (list item))
        ((< (cadr item) (cadr (car pq))) (cons item pq))
        (t (cons (car pq) (pq-insert item (cdr pq))))
    )
)

;;; extracts the min value of the list and returns (min newlist)
(defun extract-min (pq)
    (list (car pq) (cdr pq))
)

;;; extracts the minimum element from the queue.
(defun get-min (pq)
    (car pq)
)

;;; Retrieves the queue with the minimum element removed.
(defun get-pq (pq)
    (cadr pq)
)

;;; Checks if the priority queue is empty.
(defun pq-null (pq)
    (null pq)
)

;;; Returns the number of elements in the priority queue.
(defun pq-length (pq)
    (cond ((null pq) 0)
        (t (+ 1 (pq-length(cdr pq)))))
)

