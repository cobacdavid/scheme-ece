;; david cobac
;; aout 2025
(define (make-pile)
  (let ((contenu '()))
    (lambda message
      (case (car message)
	((voir) contenu)
	((est-vide?) (null? contenu))
	((empiler) (set! contenu (cons (cadr message) contenu)))
	((depiler) (let ((valeur (car contenu)))
		    (set! contenu (cdr contenu))
		    valeur))))))

(define (eval-expression lst)
  (let ((p (make-pile)))
    (let boucle ((liste lst))
      (if (null? liste) (p 'voir)
	  (let ((symb (car liste)))
	    (if (not (symbol? symb)) (p 'empiler symb)
		(p 'empiler ((eval symb (interaction-environment)) (p 'depiler) (p 'depiler))))
	    (boucle (cdr liste)))))
    (car (p 'voir))))

;; tests
(let ((exps '((2 3 + 5 *) (1 2 + 3 *) (1 2 3 + *))))
  (newline) (write (map eval-expression exps)))
