;; david cobac
;; aout 2025
(define (empaqueter liste-masses c)
  (let* ((n (length liste-masses))
	 (nb-boites 0)
	 (boites (make-vector n 0)))
    (map (lambda (masse)
	   (let ((i 0))
	     ;; très moche
	     (let boucle ()
	       (when (and (< i nb-boites) (> (+ masse (vector-ref boites i)) c))
		 (set! i (+ 1 i))
		 (boucle)))
	     (when (= i nb-boites) (set! nb-boites (+ 1 nb-boites)))
	     (vector-set! boites i (+ (vector-ref boites i) masse))))
	 liste-masses)
    nb-boites))

;; tests
(let ((listes '(((1 2 3 4 5) (1 2 3 4 5) (7 6 3 4 8 5 9 2))
		(10 5 11))))
  (newline) (write (apply map empaqueter listes)))
      
