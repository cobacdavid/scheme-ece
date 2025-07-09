; david cobac
; juillet 2025
(define (nbr-occurrences chaine)
  (let ((dico (make-hash-table))
	(L (string-length chaine)))
    (let boucle ((n 0))
      (if (= n L) dico
	  (let ((car (string-ref chaine n)))
	    (if (= 0 (hash-table-ref dico car (lambda () 0)))
		(hash-table-set! dico car 1)
		(hash-table-set! dico car (+ 1 (hash-table-ref dico car))))
	    (boucle (+ 1 n)))))))

; tests
(newline)(display (hash-table->alist (nbr-occurrences "Hello world !")))
