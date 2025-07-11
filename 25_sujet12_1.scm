; david cobac
; juillet 2025
(load "25_sujet07_2")

(let ((listes '(((3 5) (-2 4) (4) () (1 2 3))
		((2 5) (-3 5 10) (2 6) () ()))))
  (newline)(write (apply map fusion listes)))
