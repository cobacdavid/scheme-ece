;; david cobac
;; juillet 2025
(define (selection-enclos animaux num-enclos)
  (let boucle ((a animaux)
	       (resultat '()))
    (if (null? a) resultat
	(let ((dico (car a)))
	  (boucle (cdr a)
		  (if (= (hash-table-ref dico "enclos") num-enclos)
		      (append resultat (list dico))
		      resultat))))))

;; tests
(define (make-dictionnaire nom espece age enclos)
  (let ((dico (make-hash-table)))
    (hash-table-set! dico "nom" nom)
    (hash-table-set! dico "espece" espece)
    (hash-table-set! dico "age" age)
    (hash-table-set! dico "enclos" enclos)
    dico))

(define animaux (list (make-dictionnaire "Medor" "chien" 5 2)
		      (make-dictionnaire "Titine" "chat" 2 5)
		      (make-dictionnaire "Tom" "chat" 7 4)
		      (make-dictionnaire "Belle" "chien" 6 3)
		      (make-dictionnaire "Mirza" "chat" 6 5)))

(let ((enc '(5 2 7)))
  (map (lambda (e) (newline) (write (map hash-table->alist
					 (selection-enclos animaux e)))) enc))
