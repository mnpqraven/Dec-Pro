;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname auf72) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Aufgabe 7.2

;[X,Y,Z] (X Y -> Z) X -> (Y -> Z)
; replaces the first parameter of a binary function with a fixed parameter and returns a new function which takes only one parameter
(check-expect ((partial (lambda (x y) (+ x y)) 1) 2) 3)
(check-expect ((partial (lambda (x y) (+ x y)) 3) 3) 6)

(define (partial f x)(lambda (k) (f x k)))

;[X] Number (X -> X) -> (X -> X)
; applies the function f on its argument x for a total of n-times
(check-expect ((repeated 1 (lambda (x) (add1 x))) 1) 2)
(check-expect ((repeated 2 (lambda (x) (add1 x))) 1) 3)
(check-expect ((repeated 0 (lambda (x) (add1 x))) 1) 0)

(define (repeated n f) (lambda (x)
                         (cond
                           [(< n 1) 0]
                           [(= n 1) (f x)]
                           [else (f ((repeated (- n 1) f) x))])))

; [X,Y,Z] (X -> Y) (Y -> Z) -> (X -> Z)
; chains 2 functions f(x) and g(x) and returns g(f(x))
(check-expect ((combine (lambda (x) (add1 x)) (lambda (x) (+ 2 x))) 1) 4)

(define (combine f g)
  (lambda (x) (g (f x))))