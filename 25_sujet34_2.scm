;; david cobac
;; aout 2025
(define (plus-ou-moins)
  (let ((nb-mystere (+ 1 (random 99)))
	(nb-test (begin
		   (newline)
		   (display "Proposez un nombre entre 1 et 99 : ")
		   (read)))
	(compteur 1))
    (let boucle ((b (= nb-mystere nb-test)))
      (if b nb-test
	  (begin
	    (set! compteur (+ 1 compteur))
	    (display (string-append "Trop "
				    (if (> nb-mystere nb-test) "petit" "grand")
				    " ! Testez encore : "))
	    (set! nb-test (read))
	    (boucle (or (= nb-mystere nb-test) (>= compteur 10))))))
    (if (= nb-mystere nb-test)
	(begin
	  (display (string-append "Bravo ! Le nombre était " (string nb-mystere)))
	  (newline)
	  (display (string-append "Nombre d'essais : " (string compteur))))
	(display (string-append "Perdu ! Le nombre était " (string nb-mystere))))))
	  
;; tests
(plus-ou-moins)
