; david cobac
; juillet 2025
(define (une-etape lst nb-etapes)
  (let boucle ((liste lst))
    (if (= (length liste) (- (length lst) nb-etapes)) liste
	(if (< (car liste) (cadr liste))
	    (cons (car liste) (boucle (cdr liste)))
	    (cons (cadr liste) (boucle (cons (car liste) (cddr liste))))))))

(define (tri-bulles lst)
  (let boucle1 ((liste lst)
		(n (- (length lst) 1)))
    (if (= n 0) liste
	(boucle1 (une-etape liste n) (- n 1)))))

; tests
(let ((listes '((9 3 7 2 3 1 6) (9 7 4 3))))
      (newline)(write (map tri-bulles listes)))
