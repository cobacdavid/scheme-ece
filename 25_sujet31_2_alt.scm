;; david cobac
;; juillet 2025
(define (accessibles vadj x)
  (define (walk x acc)
    (if (member x acc) acc
	(fold walk (cons x acc) (vector-ref vadj x))))
  (reverse! (walk x '())))

;; tests
(let ((adj #((1 2) (0 3) (0) (1) (5) (4))))
  (newline)(display (map (lambda (noeud) (accessibles adj noeud)) '(0 4))))
