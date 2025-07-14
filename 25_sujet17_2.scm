;;; david cobac
;;; juillet 2025
(define (ajoute indice element lst)
  (let boucle ((liste lst)
	       (n 0))
    (if (= indice n) (cons element liste)
	(cons (car liste) (boucle (cdr liste) (+ 1 n))))))

;;; tests
(let ((liste '(1 3 0)))
  (map (lambda (n) (ajoute n 4 '(7 8 9))) liste))
