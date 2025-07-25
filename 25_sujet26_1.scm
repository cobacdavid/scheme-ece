;; david cobac
;; juillet 2025
(define (ajoute-dictionnaires d1 d2)
  (let ((dico (make-hash-table)))
    (hash-table-walk d1 (lambda (k v) (hash-table-set! dico k v)))
    (hash-table-walk d2 (lambda (k v)
			  (let ((valeur (hash-table-intern! dico k (lambda () '()))))
			    (if (null? valeur)
				(hash-table-set! dico k v)
				(hash-table-set! dico k (+ valeur v))))))
    dico))

;; tests
(let* ((liste1 '((1 . 5) (2 . 7)))
       (liste2 '())
       (liste3 '((2 . 9) (3 . 11)))
       (listeg (list (list liste1 liste2 liste1) (list liste3 liste3 liste2)))
       (func (lambda (l1 l2)
	       (newline) (write (hash-table->alist
				 (ajoute-dictionnaires
				  (alist->hash-table l1)
				  (alist->hash-table l2)))))))
  (apply map func listeg))
