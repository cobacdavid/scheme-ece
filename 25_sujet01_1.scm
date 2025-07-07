; david cobac
; juillet 2025
(define (voisins_entrant grph elt)
  (let ((v (vector-map (lambda (lst) (member elt lst)) grph))
	(L (vector-length grph)))
    (let boucle ((lst '())
		 (n (- L 1)))
      (if (< n 0) lst
	  (if (vector-ref v n) (boucle (cons n lst) (- n 1))
	      (boucle lst (- n 1)))))))

; tests
(define vgraphe #((1 2) (2) (0) (0)))
(let boucle ((lst '(0 1 2)))
  (unless (null? lst)
    (newline)
    (display (voisins_entrant vgraphe (car lst)))
    (boucle (cdr lst))))
