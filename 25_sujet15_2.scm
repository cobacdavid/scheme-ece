;;; david cobac
;;; juillet 2025
(define (chercher vct x i j)
  (if (> i j) #f
      (let* ((m (floor (/ (+ i j) 2)))
	     (elt (vector-ref vct m)))
	(cond ((< elt x) (chercher vct x (+ 1 m) j))
	      ((> elt x) (chercher vct x i (- m 1)))
	      (else m)))))

;;; tests
(let* ((vecteur1 #(1 5 6 6 9 12))
       (vecteur2 #(1))
       (listes (list (list vecteur1 vecteur1 vecteur1 vecteur2 vecteur2)
		     '(7 9 6 0 1)
		     '(0 0 0 0 0)
		     '(5 5 5 0 0))))
  (newline)(write (apply map chercher listes)))
