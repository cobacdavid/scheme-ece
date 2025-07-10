; david cobac
; juillet 2025
(define (position-alphabet lettre)
  (- (char->integer lettre) (char->integer #\A)))

(define (cesar message decalage)
  (let ((L (string-length message)))
    (let boucle ((resultat "")
		 (n 0))
      (if (= n L) resultat
	  (let* ((c (string-ref message n))
		 (pos (position-alphabet c)))
	    (if (or (> 0 pos) (< 26 pos))
		(boucle
		 (string-append resultat (string c))
		 (+ 1 n))
		(boucle
		 (string-append resultat
			 (string (integer->char
				  (+ (char->integer #\A) (modulo (+ pos decalage) 26)))))
		 (+ 1 n))))))))

; tests
(let ((phrdec '(("BONJOUR A TOUS. VIVE LA MATIERE NSI !" "GTSOTZW F YTZX. ANAJ QF RFYNJWJ SXN !")
		 (4 -5))))
  (newline)(display (apply map cesar phrdec)))
