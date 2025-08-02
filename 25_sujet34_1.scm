;; david cobac
;; aout 2025
(define (vechange v i j)
  (let ((tmpi (vector-ref v i)))
    (vector-set! v i (vector-ref v j))
    (vector-set! v j tmpi)))

(define (indice-max v i)
  ;; à partir de i
  (let ((L (vector-length v)))
    (let boucle ((j i)
		 (imax i))
      (if (= j L) imax
	  (boucle (+ 1 j) (if (< (vector-ref v j) (vector-ref v imax)) j imax))))))

(define (tri-selection v)
  (let ((L (vector-length v)))
    (let boucle ((i 0))
      (unless (= i L)
	(vechange v i (indice-max v i))
	(boucle (+ 1 i))))))

;; tests
(let ((vct #(1 52 6 -9 12)))
  (tri-selection vct)
  (newline) (write vct))
