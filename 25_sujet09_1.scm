; david cobac
; juillet 2025
(define (multiplication n1 n2)
  (cond ((or (= 0 n1) (= 0 n2)) 0)
	((< n1 0) (- 0 (multiplication (- 0 n1) n2)))
	(else (let boucle ((res 0) (n 0))
		(if (= n n1) res
		    (boucle (+ res n2) (+ 1 n)))))))

; tests
(let ((arguments '((3 -4 -2 -2) (5 -8 6 0))))
  (newline)(write (apply map multiplication arguments)))
