;;; david cobac
;;; juillet 2025
(define (parcours-largeur arbre)
  (let boucle ((resultat '())
	       (file (list arbre)))
    (cond ((null? file) resultat)
	  ((null? (car file)) (set! file (cdr file)) (boucle resultat file))
	  (else (let ((elt (car file)))
		  (set! file (append (cdr file) (list (car elt)) (cddr elt)))
		  (boucle (append resultat (list (cadr elt))) file))))))
  
;;; tests
(define arbre-vide '())
(define (arbre g val d)
  (list g val d))
(define arbre-enonce
  (let ((gauche (arbre
		(arbre arbre-vide 1 arbre-vide)
		2
		(arbre arbre-vide 3 arbre-vide)))
	(droite (arbre
		(arbre arbre-vide 5 arbre-vide)
		6
		(arbre arbre-vide 7 arbre-vide))))
    (arbre gauche 4 droite)))

(newline) (write (parcours-largeur arbre-enonce))
