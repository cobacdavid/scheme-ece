; david cobac
; juillet 2025
(define (renverse s)
  (if (string=? s "") ""
      (let* ((L (string-length s))
	     (mi (floor (/ L 2))))
	(let boucle ((n 0))
	  (if (= n mi) (string (string-ref s n))
	      (string-append
	       (string (string-ref s (- (- L 1) n)))
	       (boucle (+ n 1))
	       (string (string-ref s n))))))))

; tests
(let ((chaines '("" "abc" "informatique")))
  (newline)(write (map renverse chaines)))
