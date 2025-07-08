; david cobac
; juillet 2025
(define (eleves-du-mois eleves notes)
  (let boucle ((el eleves)
	       (no notes)
	       (n 0)
	       (e '()))
    (if (null? el) (cons n e)
	(let ((rel (cdr el))
	      (rno (cdr no))
	      (lcel (list (car el))))
	(cond ((= (car no) n) (boucle rel rno n (append e lcel)))
	      ((> (car no) n) (boucle rel rno (car no) lcel))
	      (else (boucle rel rno n e)))))))

; tests
(define eleves-nsi '(#\a #\b #\c #\d #\e #\f #\g #\h #\i #\j))
(define notes-nsi '(30 40 80 60 58 80 75 80 60 24))
(newline)(display (eleves-du-mois eleves-nsi notes-nsi))
