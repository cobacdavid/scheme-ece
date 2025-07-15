;;; david cobac
;;; juillet 2025
(define (min-et-max vct)
  (let ((elt (vector-ref vct 0))
	(L (vector-length vct)))
    (let boucle ((n 0)
		 (lemin elt)
		 (lemax elt))
      (if (= n L) (list (cons "min" lemin) (cons "max" lemax))
	  (let ((elt (vector-ref vct n)))
	    (boucle (+ 1 n)
		    (if (< elt lemin) elt lemin)
		    (if (> elt lemax) elt lemax)))))))

;;; tests
(let ((listes '(#(0 1 4 2 -2 9 3 1 7 1)
		#(0 1 2 3)
		#(3)
		#(1 3 2 1 3)
		#(-1 -1 -1 -1 -1))))
  (newline) (write (map min-et-max listes)))
      
