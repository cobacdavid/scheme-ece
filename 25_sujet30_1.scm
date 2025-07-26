;; david cobac
;; juillet 2025
(define (delta liste)
  (let boucle ((lst (cdr liste))
	       (dernier (car liste))
	       (resultat (list (car liste))))
	       (if (null? lst) resultat
		   (boucle (cdr lst)
			   (car lst)
			   (append resultat (list (- dernier (car lst))))))))

;; tests
(newline)(write (map delta '((1000 800 802 1000 1003) (42))))
