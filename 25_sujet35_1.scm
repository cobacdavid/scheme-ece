;; david cobac
;; aout 2025
(define (max-dico dico)
  (let ((lemax '("" . 0))
    (hash-table-walk dico (lambda (cle val)
			    (when (> val (cdr lemax))
			      (set! lemax (cons cle val)))))
    lemax))

;; tests
(let ((ldicos '((("Bob" . 102) ("Ada" . 201) ("Alice" . 103) ("Tim" . 50))
		(("Alan" . 222) ("Ada" . 201) ("Eve" . 222) ("Tim" . 50)))))
  (newline) (write (map (lambda (d) (max-dico (alist->hash-table d))) ldicos)))
				
