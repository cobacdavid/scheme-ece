; david cobac
; juillet 2025
(define (liste-puissances a n)
  (let boucle ((nb n)
	       (lst (list a))
	       (prec a))
    (if (= 1 nb) lst
	(let ((aprec (* a prec)))
	  (boucle (- nb 1) (append lst (list aprec)) aprec)))))

(define (liste-puissances-borne a n)
  (let boucle ((lst '())
	       (prec 1))
    (let ((aprec (* a prec)))
      (if (>= aprec n) lst
	  (boucle (append lst (list aprec)) aprec)))))

; tests
(let ((liste '((3 -2) (5 4))))
  (newline)(write (apply map liste-puissances liste)))
(let ((liste '((2 2 5) (16 17 5))))
  (newline)(write (apply map liste-puissances-borne liste)))
