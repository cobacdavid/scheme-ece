; david cobac
; juillet 2025
(define (traduire-romain nombre)
  (let ((val0 (hash-table-ref romains (string-ref nombre 0))))
    (cond ((= (string-length nombre) 1) val0)
	  ((>= val0 (hash-table-ref romains (string-ref nombre 1)))
	   (+ val0 (traduire-romain (substring nombre 1))))
	  (else (- (traduire-romain (substring nombre 1)) val0)))))

; tests
(define romains
  (let ((dico (make-hash-table)))
    (hash-table-set! dico #\I 1)
    (hash-table-set! dico #\V 5)
    (hash-table-set! dico #\X 10)
    (hash-table-set! dico #\L 50)
    (hash-table-set! dico #\C 100)
    (hash-table-set! dico #\D 500)
    (hash-table-set! dico #\M 1000)
  dico))

(let ((nombres '("XIV" "CXLII" "MMXXIV")))
  (newline)(write (map traduire-romain nombres)))
