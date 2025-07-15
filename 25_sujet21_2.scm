;;; david cobac
;;; juillet 2025
(define (renverse pile)
  (if (null? pile) '()
      (append (renverse (cdr pile)) (list (car pile)))))

(define (positifs pile)
  (let boucle ((p pile)
	       (pile-positifs '()))
    (if (null? p) (renverse pile-positifs)
	(let ((elt (car p)))
	  (boucle (cdr p)
		  (append (if (< elt 0) '() (list elt)) pile-positifs))))))

;;; tests
(newline) (write (renverse '(1 2 3 4 5)))
(let ((listes '((-1 0 5 -3 4 -6 10 9 -8) (-2))))
  (newline)(write (map positifs listes)))
