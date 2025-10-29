(defun st-substitute (old new list)
    (cond ((null list) nil )
        ((eql (car list) old) (cons new (st-substitute old new (cdr list))))
        (t (cons (car list) (st-substitute old new (cdr list))))))

(print(st-substitute 'a 'b '(a c d a e f a)))