;; david cobac
;; juillet 2025
(define (delta liste)
  (cdr (reverse
	(fold (lambda (el acc) (cons (- el (apply + acc)) acc)) '(0) liste))))

;; tests
(newline)(write (map delta '((1000 800 802 1000 1003) (42))))
