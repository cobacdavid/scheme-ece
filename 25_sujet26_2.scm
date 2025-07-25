;; david cobac
;; juillet 2025
(define (nombre-coups . message)
  (let* ((debug (and (not (null? message)) (eq? (car message) 'debug)))
	 (nombre-cases 12)
	 (cases-vues (make-vector nombre-cases #f)))
    (vector-set! cases-vues 0 #t)
    (let boucle ((case-en-cours 0)
		 (nombre-cases-vues 1)
		 (n 0))
      (if (>= nombre-cases-vues nombre-cases) n
	  (let* ((alea (+ 1 (random 6)))
		 (case-en-cours (modulo (+ case-en-cours alea) nombre-cases)))
	    (when debug (newline) (write case-en-cours))
	    (if (vector-ref cases-vues case-en-cours)
		(boucle case-en-cours nombre-cases-vues (+ 1 n))
		(begin	
		  (vector-set! cases-vues case-en-cours #t)
		  (when debug (newline) (write cases-vues) (newline))
		  (boucle case-en-cours (+ 1 nombre-cases-vues) (+ 1 n)))))))))
	      
;; tests
(newline)(write (nombre-coups 'debug))
