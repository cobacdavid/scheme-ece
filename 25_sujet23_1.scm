;;; david cobac
;;; juillet 2025
(define (effectif-notes lst)
  (let ((vecteur (make-vector 11 0)))
    (let boucle ((liste lst))
      (if (null? liste) vecteur
	  (let ((note (car liste)))
	    (vector-set! vecteur note (+ 1 (vector-ref vecteur note)))
	    (boucle (cdr liste)))))))

(define (notes-triees vct)
  (let ((L (vector-length vct)))
    (let boucle ((n 0)
		 (liste '()))
      (if (= n L) liste
	  (let ((eff (vector-ref vct n)))
	    (boucle (+ n 1)
		    (let boucle2 ((p 0)
				  (liste2 liste))
		      (if (= p eff) liste2
			  (boucle2 (+ 1 p) (append liste2 (list n)))))))))))

;;; tests
(let* ((notes-eval '(2 0 5 9 6 9 10 5 7 9 9 5 0 9 6 5 4))
       (eff (effectif-notes notes-eval)))
  (newline)(write eff)
  (newline)(write (notes-triees eff)))
