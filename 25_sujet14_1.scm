; david cobac
; juillet 2025
(define (lancer n)
  (if (= 0 n) '()
      (append (lancer (- n 1)) (list (randint 1 6)))))

(define (paire-6 lst)
  (>= (length (filter (lambda (n) (= 6 n)) lst)) 2))

; tests
(define (randint bi bs)
  (floor (+ bi (* (+ 1 (- bs bi)) (random 1.0)))))

(let ((liste-n '(5 3 0 4)))
  (let boucle ((liste liste-n))
    (unless (null? liste)
      (let* ((n (car liste))
	     (lancers (lancer n)))
	(newline)(write lancers)
	(newline)(write (paire-6 lancers))
	(boucle (cdr liste))))))
