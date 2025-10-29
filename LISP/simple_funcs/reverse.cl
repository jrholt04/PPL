(defun st-reverse (list)
  (cond ((null list) nil)
        ((null (cdr list)) (list (car list)))   
        (t (cons (car (st-reverse (cdr list)))  
                 (st-reverse                   
                   (cons (car list)
                         (cdr (st-reverse (cdr list))))))
        )
    )
)

(print (st-reverse '(1 2 3)))
(print (st-reverse '(1 2)))