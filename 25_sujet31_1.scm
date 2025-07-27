;; david cobac
;; juillet 2025
(define (pre-traitement-mc motif)
  (let ((m-1 (string-length motif))
	(dico (make-hash-table)))
    (let boucle ((i 0))
      (if (= i m-1) dico
	  (begin
	    (hash-table-set! dico (string-ref motif i) (- m-1 i))
	    (boucle (+ 1 i)))))))

(define (recherche-motif motif texte)
  (let ((t (string-length texte))
	(m (string-length motif))
	(decal (pre-traitement-mc motif)))
    (let boucle1 ((i 0)
		 (indices '()))
      (if (> i (- t m)) indices
	  (begin
	    (let boucle2 ((j (- m 1)))
	      (let ((calcul-con (lambda (k)
				  (+ i (max 1 (- j (hash-table-intern! decal (string-ref texte (+ i k)) (lambda () m))))))))
		(cond ((= j -1)
		       (begin
			 (set! indices (append indices (list i)))
			 (boucle1 (calcul-con (- m 1)) indices)))
		       ((char=? (string-ref texte (+ i j)) (string-ref motif j)) (boucle2 (- j 1)))
		       (else (boucle1 (calcul-con j) indices))))))))))

;; tests
(let ((liste '("" "cdcdcdcd" "abracadabra" "abracadabraab")))
  (newline)(write (map (lambda (t) (recherche-motif "ab" t)) liste)))
