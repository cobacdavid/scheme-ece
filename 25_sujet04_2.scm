; david cobac
; juillet 2025
(define (une-etape lst)
  (let ((N (- (length lst) 1)))
    (let boucle ((liste lst)
		 (N n))
      (if (= n 0) liste
	  (if (< (car liste) (cadr liste))
	      (cons (car liste)
		    (boucle (cdr liste) (- n 1)))
	      (cons (cadr liste)
		    (boucle (cons (car liste) (cddr liste)) (- n 1))))))))

(define (tri-bulles lst)
  (let boucle1 ((liste lst)
		(n (- (length lst) 1)))
    (if (= n 0) liste
	(boucle1  (une-etape liste) (- n 1)))))

; tests
(let ((listes '((9 3 7 2 3 1 6) (9 7 4 3))))
      (newline)(write (map tri-bulles listes)))
      
    
