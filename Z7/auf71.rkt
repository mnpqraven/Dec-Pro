;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname auf71) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Aufgabe 7.1
; a)
; (Number -> Number) Number -> Number
; calculates the sum of the sequence of functions f(k) from f(1) to f(n)
(check-expect (sumTo (lambda (k) (add1 k)) 0) 0)
(check-expect (sumTo (lambda (k) (add1 k)) 1) 2)
(check-expect (sumTo (lambda (k) (add1 k)) 2) 5)

(define (sumTo f n)
  (cond [(= n 1) (f 1)]
        [(> n 1) (+ (f n) (sumTo f (sub1 n)))]
        [else 0]))


;b)
; Number Number Number -> Number
; calculates dx = (/ (- b a) n)
(define (dx a b n) (/ (- b a) n))

; (Number -> Number) Number Number Number -> Number
; approximates the intergral from a to b of the function f(x) through the sum from 0 to (n-1)

(check-expect (intergral (lambda (x) (add1 x)) 2 1 0) "Invalid Input. n cannot be smaller than 1")
(check-expect (intergral (lambda (x) (add1 x)) 2 1 1) -3)
(check-expect (intergral (lambda (x) (add1 x)) 2 1 2) 0.25)

(define (intergral f a b n)
  (cond [(< n 1) "Invalid Input. n cannot be smaller than 1"]
        [(= n 1) (* (f a) (dx a b n))]
        [(> n 1) (* (+ (f (+ a (* (- n 1) (dx a b n)))) (intergral f a b (sub1 n))) (dx a b n))]))