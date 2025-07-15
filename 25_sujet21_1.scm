;;; david cobac
;;; juillet 2025
(define (indices-maxi vct)
  (let ((L (vector-length vct)))
    (let boucle ((n 1)
		 (lemax (vector-ref vct 0))
		 (lesindices '(0)))
      (if (= n L) (cons lemax (list lesindices))
	  (let ((elt (vector-ref vct n))
		(n+1 (+ 1 n)))
	    (cond ((= elt lemax) (boucle n+1
					 lemax
					 (append lesindices (list n))))
		  ((> elt lemax) (boucle n+1
					 elt
					 (list n)))
		  (else (boucle n+1 lemax lesindices))))))))

;;; tests
(let ((vecteurs '(#(1 5 6 9 1 2 3 7 9 8) #(7))))
  (newline)(write (map indices-maxi vecteurs)))
