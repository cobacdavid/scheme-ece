; david cobac
; juillet 2025
(define (lemax lst)
  (let boucle ((liste (cdr lst)) (max (car lst)) (ind 0) (indiceactu 1))
    (if (null? liste) (cons max ind)
	(let ((premier (car liste))
	      (reste (cdr liste))
	      (suivant (+ 1 indiceactu)))
	  (if (> premier max)
	      (boucle reste premier indiceactu suivant)
	      (boucle reste max ind suivant))))))

; tests
(let boucle ((listes '((1 5 6 9 1 2 3 7 9 8) (-2) (-1 -1 3 3 3) (1 1 1 1))))
  (unless (null? listes) 
    (newline)
    (write (lemax (car listes)))
    (boucle (cdr listes))))
