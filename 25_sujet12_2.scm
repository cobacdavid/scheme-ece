; david cobac
; juillet 2025
(define (traduire-romain nombre)
  (let ((val0 (hash-table-ref romains (string-ref nombre 0))))
    (cond ((= (string-length nombre) 1) val0)
	  ((>= val0 (hash-table-ref romains (string-ref nombre 1)))
	   (+ val0 (traduire-romain (substring nombre 1))))
	  (else (- (traduire-romain (substring nombre 1)) val0)))))

; tests
(define romains (alist->hash-table '((#\I . 1) (#\V . 5) (#\X . 10) (#\L . 50)
				    (#\C . 100) (#\D . 500) (#\M . 1000))))

(let ((nombres '("XIV" "CXLII" "MMXXIV")))
  (newline)(write (map traduire-romain nombres)))
