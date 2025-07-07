; david cobac
; juillet 2025
(define (est-un-ordre? lst)
  (let ((L (length lst)))
    (let boucle ((liste lst) (coll '()))
      (if (null? liste) #t
	  (let ((elt (car liste)))
	    (if (or (> elt L) (< elt 1) (member elt coll)) #f
		(boucle (cdr liste) (append (list elt) coll))))))))

(define (nombre_points_rupture lst)
  (if (not (est-un-ordre? lst)) #f
      (begin
	(let ((nb 0))
	  (+ nb (if (= (- (car lst) 1) 0) 0 1)
	     (let boucle ((liste (cdr lst))
			  (prec (car lst)))
	       (if (null? liste) (if (= prec (length lst)) 0 1)
		   (+ (if (= (- (abs (- (car liste) prec)) 1) 0) 0 1)
	     	      (boucle (cdr liste) (car liste))))))))))

; tests
(define listes '((1 6 2 8 3 7) (5 4 3 6 7 2 1 8 9) (1 2) (2 1 3 4)))
(newline)(write (map est-un-ordre? listes))
(newline)(write (map nombre_points_rupture listes))
