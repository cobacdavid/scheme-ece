;;; david cobac
;;; juillet 2025
(define (make-noeud etiquette gauche droit)
  (cons etiquette (list gauche droit)))

(define (parcours arbre liste)
  (if (null? arbre) liste
      (begin
        (set! liste (append (parcours (cadr arbre) liste) (list (car arbre))))
        (parcours (caddr arbre) liste))))

(define (insere arbre cle)
  (cond ((null? arbre) (make-noeud cle '() '()))
	((< cle (car arbre)) (make-noeud (car arbre)
					 (insere (cadr arbre) cle)
					 (caddr arbre)))
	(else (make-noeud (car arbre)
			  (cadr arbre)
			  (insere (caddr arbre) cle)))))

;;; tests
(define arbre (make-noeud 5
			  (make-noeud 2
				      '()
				      (make-noeud 3 '() '()))
			  (make-noeud 7 '() '())))
(let boucle ((a arbre)
	     (liste '(1 4 6 8)))
  (if (null? liste) (begin (newline)(write (parcours a '())))
	(boucle (insere a (car liste)) (cdr liste))))
