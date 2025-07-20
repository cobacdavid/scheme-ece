;;; david cobac
;;; juillet 2025
(define (annee-temperature-minimale t_moy annees)
  (let boucle ((t t_moy)
	       (a annees)
	       (lemin  (car t_moy))
	       (annee (car annees)))
      (if (null? t) (cons lemin annee)
	  (let ((temp (car t))
		(an (car a)))
	    (if (< temp lemin) (boucle (cdr t) (cdr a) temp an)
		(boucle (cdr t) (cdr a) lemin annee))))))

;;; tests
(newline)(write (annee-temperature-minimale
		 '(14.9 13.3 13.1 12.5 13. 13.6 13.7)
		 '(2013 2014 2015 2016 2017 2018 2019)))
