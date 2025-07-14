;;; david cobac
;;; juillet 2025
(define (moyenne lst)
  (let boucle ((liste lst)
	       (sprod 0)
	       (somme-cdr 0))
    (if (null? liste) (/ sprod somme-cdr)
	(let* ((p (car liste))
	       (note (car p))
	       (coef (cdr p)))
	  (boucle (cdr liste) (+ sprod (* note coef)) (+ somme-cdr coef))))))

;;; tests
(moyenne '((15. . 2) (9. . 1) (12. . 3)))
