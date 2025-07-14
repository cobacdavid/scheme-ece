;;; david cobac
;;; juillet 2025
(define (dico lettre) (+ 1 (- (char->integer lettre) (char->integer #\A))))

(define (codes-parfait s)
  (let ((L (string-length s)))
    (let boucle ((somme 0)
		 (concat "")
		 (indice 0))
      (if (= indice L)
	  (list somme
		(string->number concat)
		(= 0 (modulo (string->number concat) somme)))
	  (let ((codelettre (dico (string-ref s indice))))
	    (boucle (+ somme codelettre)
		  (string-append concat (string codelettre))
		  (+ indice 1)))))))

;;; tests
(let ((liste '("PAUL" "ALAIN")))
  (newline)(write (map codes-parfait liste)))
