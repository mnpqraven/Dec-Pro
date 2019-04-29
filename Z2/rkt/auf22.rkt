;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Auf-2.2-2.3) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Aufgabe 2.2
; a)
; Number Number Number -> Number
; determines the largest of the three given numbers

(check-expect (max3 1 2 3) 3)
(check-expect (max3 15 21 16) 21)
(define (max3 a b c)
  (if (>= a b) a
      (if (>= b c) b
		  (if (>= c a) c a))))

; b)
; Number -> String
; gives the Roman Number of the given Number

(check-expect (rome 5) "V")
(check-expect (rome 95) "Nicht implementiert")

(define (rome num)
  (cond [(= num 1) "I"]
        [(= num 2) "II"]
        [(= num 3) "III"]
        [(= num 4) "IV"]
        [(= num 5) "V"]
        [(= num 6) "VI"]
        [(= num 7) "VII"]
        [(= num 8) "VIII"]
        [(= num 9) "IX"]
        [else "Nicht implementiert"]))
