(defun st-append (list element)
      (cond ((null list) element)  
                  (t (cons (car list) (st-append (cdr list) element)))
      )
)
    
(print(st-append '(1 2 3) 4))
(print(st-append '(1 2 3) '(4 5 6)))

