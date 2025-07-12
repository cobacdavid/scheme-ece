; david cobac
; juillet 2025
(define (make-arbre)
  (lambda (etiquette gauche droit)
    (list etiquette gauche droit)))

(define (hauteur a)
  (if (not a) -1
      (+ 1 (max (hauteur (cadr a)) (hauteur (caddr a))))))

(define (taille a)
  (if (not a) 0
      (+ 1 (taille (cadr a)) (taille (caddr a)))))

; tests
(let ((a ((make-arbre) 1
	  ((make-arbre) 4 #f #f)
	  ((make-arbre) 0 #f ((make-arbre) 7 #f #f)))))
  (newline)(write (hauteur a))
  (newline)(write (taille a)))

(newline) (write (hauteur #f))
(newline) (write (taille #f))

(newline) (write (hauteur ((make-arbre) 1 #f #f)))
(newline) (write (taille ((make-arbre) 1 #f #f)))
