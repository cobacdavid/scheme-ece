; david cobac
; juillet 2025
(define (moyenne lst)
  (exact->inexact (/ (apply + lst) (length lst))))

;tests
(let ((listes '((1) (1 2 3 4 5 6 7) (1 2))))
  (map moyenne listes))
    
