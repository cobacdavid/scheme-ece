;; david cobac
;; juillet 2025
(define (depouille urne)
  (let ((dico (make-hash-table)))
    (let boucle ((u urne))
      (if (null? u) dico
	  (let* ((vote (car u))
		 (v (hash-table-intern! dico vote (lambda () '()))))	    
	    (hash-table-set! dico vote (if (null? v) 1
					   (+ 1 v)))
	    (boucle (cdr u)))))))

(define (vainqueurs election)
  (let ((nmax 0)
	(elus '()))
    (hash-table-walk election (lambda (k v) (when (> v nmax)
					 (set! nmax v))))
    (hash-table-walk election (lambda (k v) (when (= v nmax)
					 (set! elus (append elus (list k))))))
    elus))

;; tests
(let ((listes '((A B A) ())))
  (newline)(write (map (lambda (l) (hash-table->alist (depouille l))) listes)))
;
(define election (depouille '(A A A B C B C B C B)))
(newline)(write (hash-table->alist election))
(newline)(write (vainqueurs election))
;
(newline)(write (vainqueurs (alist->hash-table '((A . 2) (B . 2) (C . 1)))))
