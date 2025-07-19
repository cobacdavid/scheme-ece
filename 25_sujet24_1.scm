;;; david cobac
;;; juillet 2025
(define (enumere vct)
  (let ((L (vector-length vct))
	(dico (make-hash-table)))
    (let boucle ((n 0))
      (if (= n L) dico
	  (let* ((elt (vector-ref vct n))
		 (rep (hash-table-ref dico elt (lambda () '()))))
	    (if (null? rep) (hash-table-set! dico elt (list n))
		(hash-table-set! dico elt (append rep (list n))))
	    (boucle (+ 1 n)))))))

;;; tests
(let ((vecteurs '(#() #(1 2 3) #(1 1 2 3 2 1))))
 (newline)(write (map (lambda (v) (hash-table->alist (enumere v))) vecteurs)))
