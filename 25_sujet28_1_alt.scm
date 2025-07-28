;; david cobac
;; juillet 2025
(define (a-doublon? liste)
  (if (null? liste) #f
      (cdr (fold (lambda (el acc)
	        (cons el (or (cdr acc) (= el (car acc)))))
	     (cons (car liste) #f)
	     (cdr liste)))))

;; tests
(let ((listes '(() (1) (1 2 4 6 6) (2 5 7 7 7 9) (0 2 3))))
  (newline)(write (map a-doublon? listes)))
