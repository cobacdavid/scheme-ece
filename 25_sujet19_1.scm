;;; david cobac
;;; juillet 2025
(define (recherche-min vct)
  (let ((L (vector-length vct)))
    (let boucle ((n 0)
		 (indice 0)
		 (lemin (vector-ref vct 0)))
      (if (= n L) indice
	  (apply boucle (append (list (+ 1 n))
			      (let ((elt (vector-ref vct n)))
				(if (< elt lemin) (list n elt)
				    (list indice lemin)))))))))

;;; tests
(let ((vecteurs '(#(5) #(2 4 1) #(5 3 2 2 4) #(-1 -2 -3 -3))))
  (newline)(write (map recherche-min vecteurs)))
