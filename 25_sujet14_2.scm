;david cobac
; juillet 2025
(define (nombre-lignes image)
  (length image))

(define (nombre-colonnes image)
  (length (car image)))

(define (traitement image fct)
  (let boucle ((im image))
    (if (null? im) '()
	(cons (let boucle2 ((lst (car im)))
		(if (null? lst) '()
		    (cons (fct (car lst)) (boucle2 (cdr lst)))))
	      (boucle (cdr im))))))

(define (negatif image)
  (traitement image (lambda (n) (- 255 n))))

(define (binaire image seuil)
  (traitement image (lambda (n) (if (> n seuil) 255 0))))

; tests
(let ((img '((20 34 254 145 6)
	     (23 124 237 225 69)
	     (197 174 207 25 87)
	     (255 0 24 197 189))))
  (newline) (write (nombre-lignes img))
  (newline) (write (nombre-colonnes img))
  (newline)(write (negatif img))
  (newline)(write (binaire img 120)))
	   
