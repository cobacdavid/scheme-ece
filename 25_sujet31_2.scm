;; david cobac
;; juillet 2025
(define (walk vadj x acc)
  (unless (member x acc)
    (set! acc (append acc (list x)))
    (let loop ((lst (vector-ref vadj x)))
      (unless (null? lst)
	(set! acc (walk vadj (car lst) acc))
	(loop (cdr lst)))))
  acc)

(define (accessibles vadj x)
  (let* ((init '())
	 (res (walk vadj x init)))
    res))

;; tests
(let ((adj #((1 2) (0 3) (0) (1) (5) (4))))
  (newline)(display (map (lambda (noeud) (accessibles adj noeud)) '(0 4))))
