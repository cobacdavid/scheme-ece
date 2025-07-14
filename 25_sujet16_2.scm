;;; david cobac
;;; juillet 2025
(define (ligne-suivante ligne)
  (let ((le-un '(1)))
    (let boucle ((lgn ligne)
		 (ligne-suivante le-un))
      (if (equal? lgn le-un) (append ligne-suivante le-un)
	  (boucle (cdr lgn)
		  (append ligne-suivante (list (+ (car lgn) (cadr lgn)))))))))

(define (pascal n)
  (let boucle ((triangle '((1)))
	       (dernier '(1))
	       (k 0))
    (if (= n k) triangle
	(let ((nv-ligne (ligne-suivante dernier)))
	  (boucle (append triangle (list nv-ligne)) nv-ligne (+ 1 k))))))

;;; tests
(newline)(write (ligne-suivante '(1 3 3 1)))
(let ((n '(2 3)))
  (newline)(write (map pascal n)))
