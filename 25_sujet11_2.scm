;;; david cobac
;;; juillet 2025
(define (somme-max lst)
  (let* ((L (length lst))
	 (sommes-max (make-vector L)))
    (vector-set! sommes-max 0 (car lst))
    (let boucle ((liste (cdr lst))
		 (n 1))
      (if (null? liste) sommes-max
	  (begin 
	    (let ((elt (car liste))
		  (maxprec (vector-ref sommes-max (- n 1))))
	      (vector-set! sommes-max n
			   (if (> (+ elt maxprec) elt) (+ elt maxprec)
			       elt)))
	    (boucle (cdr liste) (+ 1 n)))))
    (let boucle ((n 1)
		 (maximum 0))
      (if (= n L) (vector-ref sommes-max maximum)
	  (boucle (+ 1 n)
		  (if (> (vector-ref sommes-max n)
			 (vector-ref sommes-max maximum)) n maximum))))))

;;; tests
(let ((listes '((1 2 3 4 5) (1 2 -3 4 5) (1 2 -2 4 5) (1 -2 3 10 -4 7 2 -5))))
  (newline) (write (map somme-max listes)))
