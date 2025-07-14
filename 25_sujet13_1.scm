;;; david cobac
;;; juillet 2025
(define (recherche elt lst)
  (let boucle ((n 0)
	       (liste lst))
    (cond ((null? liste) #f)
	  ((= elt (car liste)) n)
	  (else (boucle (+ 1 n) (cdr liste))))))

;;; tests
(let ((listes '((1 1 50 15)
		((2 3 4) (10 12 1 56) (1 50 1) (8 9 10 15)))))
  (newline)(write (apply map recherche listes)))
