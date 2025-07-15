;;; david cobac
;;; juillet 2025
(define (make-carte couleur valeur)
  (lambda message
    (case (car message)
      ((recuperer-valeur)
       (vector-ref #("As" "2" "3" "4" "5" "6" "7" "8"
		     "9" "10" "Valet" "Dame" "Roi") (- valeur 1)))
      ((recuperer-couleur)
       (vector-ref #("pique" "coeur" "carreau" "trèfle") (- couleur 1))))))

(define (make-paquet-de-cartes)
  (let ((contenu (make-vector 52)))
    (let boucle ((c 0))
      (if (= c 4) #f
	  (begin
	    (let boucle2 ((v 0))
	      (if (= v 13) #f
		  (begin
		    (vector-set! contenu (+ v (* 13 c)) (make-carte (+ 1 c) (+ 1 v)))
		    (boucle2 (+ 1 v)))))
	    (boucle (+ 1 c)))))
    (lambda message
      (case (car message)
	((recuperer-carte)
	 (let ((numero (cadr message)))
	   (if (or (> numero 51) (< numero 0))
	       (error "recuperer-carte" "Position erronnée :" numero)
	       (vector-ref contenu numero))))))))

;;; tests
(define (sortie n)
  (let* ((jeu (make-paquet-de-cartes))
	 (carte (jeu 'recuperer-carte n)))
    (newline) (display (carte 'recuperer-valeur))
    (display " de ") (display (carte 'recuperer-couleur))))

(sortie 20)
(sortie 0)
(sortie 52)  
