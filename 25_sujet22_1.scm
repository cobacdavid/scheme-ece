;;; david cobac
;;; juillet 2025
(define (recherche elt vct)
  (let ((L (vector-length vct)))
    (let boucle ((n 0)
		 (pos #f))
      (if (= n L) pos
	  (boucle (+ 1 n) (if (= elt (vector-ref vct n)) n pos))))))

;;; tests
(let ((vecteurs '(#(2 3 4)
		  #(10 12 1 56)
		  #(1 0 42 7)
		  #(1 50 1)
		  #(8 1 10 1 7 1 8))))
  (newline) (write (map ((lambda (element)
			   (lambda (v) (recherche element v))) 1) vecteurs)))
