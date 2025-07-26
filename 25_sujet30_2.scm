;; david cobac
;; juillet 2025
(define (make-expr g v d)
  (lambda message
    (case (car message)
      ((est-une-feuille?) (and (not g) (not d)))
      ((infixe) (let ((s ""))
		  (when g (set! s (string-append s "(" (g 'infixe))))
		  (set! s (string-append s (string v)))
		  (when d (set! s (string-append s (d 'infixe) ")")))
		  s)))))
		      

;; tests
(define a (make-expr (make-expr #f 1 #f) "+" (make-expr #f 2 #f)))
(define b (make-expr a
		     "*"
		     (make-expr (make-expr #f 3 #f) "+" (make-expr #f 4 #f))))
(define e (make-expr
	   (make-expr
	    (make-expr #f 3 #f)
	    "*"
	    (make-expr
	     (make-expr #f 8 #f)
	     "+"
	     (make-expr #f 7 #f)))
	   "-"
	   (make-expr
	    (make-expr #f 2 #f)
	    "+"
	    (make-expr #f 1 #f))))
(newline) (write (map (lambda (objet) (objet 'infixe)) (list a b e)))
