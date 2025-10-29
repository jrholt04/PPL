(defun st-nth (index list)
    (cond ((eq index 0) (car list))
        (t (st-nth (- index 1) (cdr list))))
)

(print (st-nth 2 '(1 2 3)))
(print (st-nth 17 '(1 2 3)))
(print (st-nth 4 '(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20)))

