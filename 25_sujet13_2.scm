;;; david cobac
;;; juillet 2025
(define (insere lst a)
  (let boucle ((liste lst))
    (if (null? liste) (list a)
	(let ((premier (car liste)))
	  (if (> a (car liste)) (cons (car liste) (boucle (cdr liste)))
	      (cons a liste))))))

;;; tests
(let ((listes '(((1 2 4 5) (1 2 7 12 14 25) (2 3 4) ())
		(3 30 1 1))))
  (newline)(write (apply map insere listes)))
