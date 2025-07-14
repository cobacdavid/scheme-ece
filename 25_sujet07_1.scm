;;; david cobac
;;; juillet 2025
(define (nbr-occurrences chaine)
  (let ((dico (make-hash-table))
	(L (string-length chaine)))
    (let boucle ((n 0))
      (if (= n L) dico
	  (let ((char (string-ref chaine n)))
	    (if (= 0 (hash-table-ref dico char (lambda () 0)))
		(hash-table-set! dico char 1)
		(hash-table-set! dico char (+ 1 (hash-table-ref dico char))))
	    (boucle (+ 1 n)))))))

;;; tests
(newline)(display (hash-table->alist (nbr-occurrences "Hello world !")))
