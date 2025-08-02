;; david cobac
;; aout 2025
(define (make-noeud etiquette gauche droit)
  (cons etiquette (list gauche droit)))

(define (insere arbre cle)
  (cond ((null? arbre) (make-noeud cle '() '()))
	((< cle (car arbre)) (make-noeud (car arbre)
					 (insere (cadr arbre) cle)
					 (caddr arbre)))
	((> cle (car arbre)) (make-noeud (car arbre)
					 (cadr arbre)
					 (insere (caddr arbre) cle)))
	(else arbre)))

;;; tests
(define (arbre->chaine arbre)
  (if (null? arbre) " None "
      (string-append " (" (arbre->chaine (cadr arbre))
		     (number->string (car arbre))
		     (arbre->chaine (caddr arbre)) ") ")))
(define abr1 (make-noeud 1
			  (make-noeud 0
				      '()
				      '())
			  (make-noeud 2
				      '()
				      (make-noeud 3
						  '()
						  ()))))

;; tests
(let ((liste '(4 -5 2)))
  (newline)(write
 	(map (lambda (c) (arbre->chaine (insere abr1 c))) liste)))
