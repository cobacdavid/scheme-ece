;; david cobac
;; juillet 2025
;; avec guile-scheme
(load "25_sujet28_2.scm")
;; cairo
(use-modules (cairo))
;; alist->hash-table
(use-modules (srfi srfi-69))
;;
(define *img* (cairo-image-surface-create 'argb32 50 50))
(define *ctx* (cairo-create *img*))
;;
(define (rgb . listecoul)
  (let ((couleur (if (null? listecoul) '(0 0 0) (car listecoul))))
    (apply cairo-set-source-rgb *ctx* couleur)))

(define *dico-nombre-couleur* (alist->hash-table '((-1 . (1 0 0)) (0 . (1 1 1)))))
(define (nombre-couleur n)
  (hash-table-ref *dico-nombre-couleur* n (lambda () '(0 1 1))))

(define *decalages* '(1 . -1))
			  
(define (carre x y dim nombre)
  (rgb (nombre-couleur nombre))
  (cairo-rectangle *ctx* x y dim dim)
  (cairo-fill-preserve *ctx*)
  (cairo-set-line-width *ctx* 1)
  (rgb '(1 1 1))
  (cairo-stroke *ctx*)
  (rgb)
  (cairo-move-to *ctx* (+ (car *decalages*) x)  (+ (cdr *decalages*) (+ y dim)))
  (cairo-show-text *ctx* (number->string nombre)))

(define (image la-grille)
  (let ((dim (vector-length la-grille)))
    (let boucle1 ((nl 0))
      (unless (= nl dim)
	(let ((ligne (vector-ref la-grille nl)))
	  (let boucle2 ((nc 0))
	    (unless (= nc dim)
	      (let ((element (vector-ref ligne nc)))
		(carre (* 10 nc) (* 10 nl) 10 (vector-ref (vector-ref la-grille nl) nc)))
	      (boucle2 (+ 1 nc)))))
	(boucle1 (+ 1 nl))))))

(let ((grille (genere-grille #((1 . 1) (2 . 4) (3 . 1) (3 . 3) (4 . 4)))))
  (image grille)
  (cairo-surface-write-to-png *img* "25_sujet28_2_cplt_grille.png"))
