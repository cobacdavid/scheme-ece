;;; david cobac
;;; juillet 2025
(define (make-adresse-ip adresse)
  (let ((adresse-init adresse))
    (lambda message
      (let ((lo (lambda (s) (map string->number (string-split s)))))
	(case (car message)
	  ((liste-octets) (lo adresse))
	  ((est-reservee?)
	   (or (string=? adresse "192.168.0.0") (string=? adresse "192.168.0.255")))
	  ((adresse-suivante)
	   (let ((machine (vector-ref (list->vector (lo adresse)) 3)))
	     (if (= machine 254) #f
		   (make-adresse-ip (string-append "192.168.0." (number->string (+ 1 machine)))))))
	  ((voir-adresse) adresse))))))

;;; tests
(define (string-split s)
  (let ((L (string-length s)))
    (let boucle ((n 0)
		 (acc "")
		 (contenu '()))
      (if (= n L) (if (string=? acc "") contenu (append contenu (list acc)))
	  (let ((carac (string-ref s n)))
	    (if (char=? carac #\.)
		(boucle (+ 1 n)
			""
			(append contenu (list acc)))
		(boucle (+ 1 n)
			(string-append acc (string carac))
			contenu)))))))

(define adresse1 (make-adresse-ip "192.168.0.1"))
(define adresse2 (make-adresse-ip "192.168.0.2"))
(define adresse3 (make-adresse-ip "192.168.0.0"))
(newline) (display (adresse1 'liste-octets))
(newline) (display (adresse1 'est-reservee?))
(newline) (display (adresse3 'est-reservee?))
(newline) (write ((adresse2 'adresse-suivante) 'voir-adresse))
