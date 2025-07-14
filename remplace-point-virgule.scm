;;; david cobac
;;; juillet 2025
(define (liste-nom-fichiers limite)
  (let ((prefixe-fichier "25_sujet")
	(suffixe-fichier ".scm"))
    (let boucle ((n 1)
		 (noms '()))
      (if (= n (+ 1 limite)) noms
	  (begin
	    (boucle (+ n 1)
		    (let ((part-fixe (string-append
				      prefixe-fichier
				      (if (< n 10) "0" "")
				      (number->string n)
				      )))
		      (append (append noms
				      (list (string-append part-fixe "_1" suffixe-fichier)))
			      (list (string-append part-fixe "_2" suffixe-fichier)))
		    )))))))

(define (lecture-modif port)
  (let ((ligne (read-line port)))
    (if (eof-object? ligne) #f
	(let ((ligne_n (string-append ligne "\n")))
	(cond ((string=? ligne "") ligne_n)
	      ((string=? (string-head ligne 2) ";;") ligne_n)
	      ((string=? (string-head ligne 1) ";") (string-append ";;" ligne_n))
	      (else ligne_n))))))

(define (change-commentaires liste-fichiers)
  (unless (null? liste-fichiers)
    (let ((fichier (car liste-fichiers)))
      (call-with-port (open-input-file fichier)
	(lambda (inport)
	  (call-with-port (open-output-file "temp.scm")
	    (lambda (outport)
	      (let boucle ()
		(let ((ligne (lecture-modif inport)))
		  (when ligne
		    (display ligne outport)
		    (boucle))))))))
      (delete-file fichier)
      (rename-file "temp.scm" fichier)
      (change-commentaires (cdr liste-fichiers)))))

(change-commentaires (liste-nom-fichiers 19))
