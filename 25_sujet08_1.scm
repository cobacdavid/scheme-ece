;;; david cobac
;;; juillet 2025
(define (maximum-tableau lst)
  (let boucle ((liste lst)
	       (max (car lst)))
    (if (null? liste) max
	(boucle (cdr liste) (if (> (car liste) max) (car liste) max)))))

;;; tests
(let ((listes '((98 12 104 23 131 9) (-27 24 -3 15))))
  (newline)(write (map maximum-tableau listes)))
