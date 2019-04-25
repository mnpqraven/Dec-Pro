;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname auf2) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp")) #f)))
; a)
;(+ (* 4 (- 15 5)) (/ 12 6))
;= (+ (* 4 10) (/ 12 6))
;= (+ (* 4 10) 2)
;= (+ 40 2)
;= 42

; b)
;(* (string->number "4") (- 33 (string-length "Spoilers")))
;= (* (string->number "4") (- 33 8)) =
;= (* (string->number "4") 25)
;= (* 25 4)
;= 100

; c)
;(* (* 4 5) (string->number "5")) ≡ (* (+ 3 7) (+ (string->number "5") 5))
;(* (* 4 5) (string->number "5"))
;= (* 20 5)
;= 100
;
;(* (+ 3 7) (+ (string->number "5") 5))
;= (* 10 (+ 5 5))
;= (* 10 10)
;= 100
;
;=>Ausdrücke sind äquivalent

; d)
;(+ (string-length "Programmiersprachen") 5) ≡ (+ 12 (string-length (replicate 5 "hi")))
;(+ (string-length "Programmiersprachen") 5)
;= (+ 19 5)
;= 24
;
;(+ 12 (string-length (replicate 5 "hi")))
;= (+ 12 (string-length "hihihihihi"))
;= (+ 12 10)
;= 22
;
;=>Ausdrücke sind nicht äquivalent
