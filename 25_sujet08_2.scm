;;; david cobac
;;; juillet 2025
(define (make-pile lst)
  (lambda message
    (case (car message)
      ((voir) (newline) (write lst))
      ((est-vide?) (null? lst))
      ((empiler) (set! lst (cons (cadr message) lst)))
      ((depiler) (let ((elt (car lst)))
		   (set! lst (cdr lst))
		   elt)))))

(define (bon-parenthesage ch)
  (let ((pile (make-pile '()))
	(L (string-length ch)))
    (let boucle ((n 0))
      (if (= n L) (pile 'est-vide?)
	  (let ((par (string-ref ch n)))
	    (if (char=? par #\()
		(begin
		  (pile 'empiler #\()
		  (boucle (+ 1 n)))
		(begin
		  (if (pile 'est-vide?) #f
		      (begin
			(pile 'depiler)
			(boucle (+ 1 n)))))))))))

;;;tests
(let ((chaines '("((()())(()))" "())(()" "(())(()")))
  (newline) (display (map bon-parenthesage chaines)))
      
