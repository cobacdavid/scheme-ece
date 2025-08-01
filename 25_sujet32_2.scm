;; aout 2025
;; david cobac
(define *valeurs* #(100 50 20 10 5 2 1))
(define (rendu-glouton a-rendre rang)
  (if (zero? a-rendre) '()
      (let ((v (vector-ref *valeurs* rang)))
	(if (<= v a-rendre)
	    (cons v (rendu-glouton (- a-rendre v) rang))
	    (rendu-glouton a-rendre (+ 1 rang))))))

;; tests
(let ((listes '((67 291 291) (0 0 1))))
  (newline)(write (apply map rendu-glouton listes)))
