;;; david cobac
;;; juillet 2025
(define (dec-to-bin nb-dec)
  (let ((q (floor (/ nb-dec 2)))
	 (r (remainder nb-dec 2)))
     (if (= 0 q) (number->string r)
	 (string-append (dec-to-bin q) (number->string r)))))

(define (bin-to-dec nb-bin)
  (let* ((L (string-length nb-bin))
	 (L-1 (- L 1)))
    (if (= 1 L) (string->number nb-bin)
	(+ (* 2 (bin-to-dec (string-head nb-bin L-1)))
	   (string->number (string (string-ref nb-bin L-1)))))))

;;; tests
(newline)(write (dec-to-bin 25))
(newline)(write (bin-to-dec "101010"))
