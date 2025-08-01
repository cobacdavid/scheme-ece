;; aout 2025
;; david cobac

;; (define (occurrences caractere chaine)
;;   (apply + (map (lambda (c) (if (char=? c caractere) 1 0)) (string->list chaine))))
;; ou
(define (occurrences caractere chaine)
  (length (filter (lambda (c) (char=? c caractere)) (string->list chaine))))

;; tests
(let ((listes '((#\e #\i #\a)
		("sciences" "mississipi" "mississipi"))))
  (newline)(write (apply map occurrences listes)))
