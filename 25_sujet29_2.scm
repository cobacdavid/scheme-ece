;; david cobac
;; juillet 2025
(define (trouver-intrus vct g d)
  (if (= g d) (vector-ref vct g)
      (let* ((nombre-de-triplets (/ (- d g) 3))
	     (indice (+ g (* 3 (floor (/ nombre-de-triplets 2))))))
	(if (= (vector-ref vct indice) (vector-ref vct (+ 1 indice)))
	    (trouver-intrus vct (+ 3 indice)  d)
	    (trouver-intrus vct g indice)))))

;; tests
(let ((listes '((#(3 3 3 9 9 9 1 1 1 7 2 2 2 4 4 4 8 8 8)
		 #(8 5 5 5 9 9 9 18 18 18 3 3 3)
		 #(5 5 5 1 1 1 0 0 0 6 6 6 3 8 8 8))
		(0 0 0)
		(18 12 15))))
  (newline)(write (apply map trouver-intrus listes)))
