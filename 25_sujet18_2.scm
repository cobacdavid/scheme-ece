;;; david cobac
;;; juillet 2025
(load "25_sujet09_2")

;;; tests
(let ((listes '((#(15 16 18 19 23 24 28 29 31 33) #())
		(1 28))))
  (newline)(write (apply map dichotomie listes)))
