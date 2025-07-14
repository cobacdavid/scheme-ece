;;; david cobac
;;; juillet 2025
(define (fusion t1 t2)
  (cond ((null? t1) t2)
	((null? t2) t1)
	(#t (if (< (car t1) (car t2))
		(cons (car t1) (fusion (cdr t1) t2))
		(cons (car t2) (fusion t1 (cdr t2)))))))

;;; tests
(let ((listes (list '((1 2 3) () (1 6 10) )
		    '(() () (0 7 8 9)))))
  (newline)(write (apply map fusion listes)))
