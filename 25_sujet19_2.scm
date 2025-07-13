; david cobac
; juillet 2025
(define (separe vct)
  (let ((L (vector-length vct)))
    (let boucle ((gauche 0)
		 (droite (- L 1)))
      (unless (>= gauche droite)
	(let ((elt (vector-ref vct gauche)))
	  (if (= 0 elt) (boucle (+ 1 gauche) droite)
	      (begin
		(vector-set! vct gauche (vector-ref vct droite))
		(vector-set! vct droite elt)
		(boucle gauche (- droite 1))))))))
    vct)

; tests
(let ((vecteurs '(#(1 0 1 0 1 0 1 0)
		  #(1 0 0 0 1 1 0 1 1 0 1 0 1 1 1 0))))
  (newline)(write (map separe vecteurs)))
