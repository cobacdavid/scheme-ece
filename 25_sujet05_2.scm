; david cobac
; juillet 2025

;; premier jet correct mais pas esprit scheme
;; (define (bascule-false lst i)
;;   (let boucle ((liste lst)
;; 	       (indice 0))
;;     (cond ((null? liste) '())
;; 	  ((and (= 0 (modulo indice i)) (> indice i))
;; 	   (cons #f  (boucle (cdr liste) (+ 1 indice))))
;; 	  (else (cons (car liste) (boucle (cdr liste) (+ 1 indice)))))))

(define (premiers-entiers n)
  (let ((prec (- n 1)))
    (if (= 1 n) '(0)
	(append (premiers-entiers prec) (list prec)))))

(define (bascule-false lst i)
  (map (lambda (n)
	 (if (or (not n) (and (= 0 (modulo n i)) (> n i))) #f n)) lst))

(define (crible n)
  (filter (lambda (n) n)
	  (let ((tab (premiers-entiers n)))
	    (let boucle ((i 0)
			 (t tab))
	      (cond ((< i 2) (boucle (+ 1 i) (append '(#f #f) (cddr t))))
		    ((= i n) t)
		    (else (boucle (+ 1 i) (bascule-false t i))))))))

;tests
(let ((liste '(40 5)))
  (newline)(write (map crible liste)))
