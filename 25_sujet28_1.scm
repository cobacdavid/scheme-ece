;; david cobac
;; juillet 2025
(define (a-doublon? liste)
  (cond ((or (null? liste) (and (car liste) (null? (cdr liste)))) #f)
	((= (car liste) (cadr liste)) #t)
	(else (a-doublon? (cdr liste)))))

;; tests
(let ((listes '(() (1) (1 2 4 6 6) (2 5 7 7 7 9) (0 2 3))))
  (newline)(write (map a-doublon? listes)))

