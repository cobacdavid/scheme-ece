;;; david cobac
;;; juillet 25
(define (dichotomie v x)
  (let ((L (- (vector-length v) 1)))
    (let boucle ((debut 0)
		 (fin L))
      (let* ((m (floor (/ (+ debut fin) 2)))
	     (elt (vector-ref v m)))
	(cond ((= elt x) m)
	      ((>= debut fin) #f)
	      ((< elt x) (boucle (+ 1 m) fin))
	      (else (boucle debut (- m 1))))))))

;;; tests
(let ((vecteurs '(#(2 3 4 5 6) #(2 3 4 6 7))))
  (newline)(write (map (lambda (v) (dichotomie v 5)) vecteurs)))
