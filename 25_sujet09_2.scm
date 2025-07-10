; david cobac
; juillet 25

;; procédure builtin pour faire cette recherche
;; (define (dichotomie v x)
;;   (= x (vector-binary-search v < (lambda (n) n) x)))

(define (dichotomie v x)
  (let ((L (- (vector-length v) 1)))
    (let boucle ((debut 0)
		 (fin L))
      (let* ((m (floor (/ (+ debut fin) 2)))
	     (elt (vector-ref v m)))
	(cond ((= elt x) #t)
	      ((= debut fin) #f)
	      ((< elt x) (boucle (+ 1 m) fin))
	      (else (boucle debut (- m 1))))))))

; tests
(define vect #(15 16 18 19 23 24 28 29 31 33))
(let ((liste '(28 27)))
 (newline)(write (map (lambda (n) (dichotomie vect n)) liste)))
