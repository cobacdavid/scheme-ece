;;; david cobac
;;; juillet 2025
(define (inverse-chaine chaine)
  (let ((L (string-length chaine)))
    (let boucle ((n 0)
		 (rev ""))
      (if (= n L) rev
	  (boucle (+ 1 n)
		  (string-append (string (string-ref chaine n) rev)))))))

(define (est-palindrome chaine)
  (string=? chaine (inverse-chaine chaine)))

(define (est-nombre-palindrome nbre)
  (est-palindrome (number->string nbre)))

;;; tests
(newline)(write (inverse-chaine "bac"))
(let ((chaines '("NSI" "ISN-NSI")))
  (newline)(write (map est-palindrome chaines)))
(let ((nombres '(214312 213312)))
  (newline)(write (map est-nombre-palindrome nombres)))
