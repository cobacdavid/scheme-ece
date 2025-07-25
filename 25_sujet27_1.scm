;; david cobac
;; juillet 2025
(define (verifie liste)
  (cond ((or (null? liste) (null? (cdr liste))) #t)
	((> (car liste) (cadr liste)) #f)
	(else (verifie (cdr liste)))))

;; tests
(let ((listes '((0 5 8 9) (8 12 4) (-1 4) () (5))))
  (newline) (write (map verifie listes)))
