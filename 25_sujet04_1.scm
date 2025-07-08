; david cobac
; juillet 2025
(define (ecriture-binaire-entier-positif N)
  (let boucle ((n N)
	       (s ""))
    (cond ((= 0 N) "0")
	  ((= 0 n) s)
	  (else (boucle (arithmetic-shift n -1)
			(string-append (number->string (modulo n 2)) s))))))

; tests
(let ((liste '(0 2 105)))
  (newline)(write (map ecriture-binaire-entier-positif liste)))
   
