; david cobac
; juillet 2025
(define (fibonacci n)
  (let fibo ((a 0)
	     (b 1)
	     (i 1))
    (if (= i n) b
	(fibo b (+ a b) (+ 1 i)))))

; tests
(let ((liste '(1 2 25)))
  (newline)(write (map fibonacci liste)))
