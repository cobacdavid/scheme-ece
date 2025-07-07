; david cobac
; juillet 2025
(define (nombre-suivant s)
  (let ((lg (string-length s)))
    (let boucle ((resultat "")
		 (i 0)
		 (occ 1))
      (let ((occurence (number->string occ))
	    (nombre (string (string-ref s i))))
	(if (= (+ i occ) lg) (string-append resultat occurence nombre)
	  (if (char=? (string-ref s i) (string-ref s (+ i occ)))
	      (boucle resultat i (+ occ 1))
	      (boucle (string-append resultat occurence nombre) (+ i occ) 1)))))))

; tests
(let boucle ((s "1") (n 0))
  (newline)
  (write s)
  (unless (= n 4)
      (boucle (nombre-suivant s) (+ n 1))))

(newline)
(write (nombre-suivant "311"))
