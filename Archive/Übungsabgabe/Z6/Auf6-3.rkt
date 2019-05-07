;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname Auf6-3) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Aufgabe 6-3
; a)
; [X,Y] (X -> Y) (list-of X) -> (list-of Y)
; applies the function f on each element of the list l and returns a new list as result
(check-expect (my-map (lambda (x) (add1 x)) (list 1 2 3)) (list 2 3 4))
(check-expect (my-map (lambda (x) (add1 x)) empty) empty)

(define (my-map f l)
  (foldr (lambda (a b) (cons (f a) b)) empty l))


; b)
; [X] (X -> Boolean) (list-of X) -> (list-of X)
; creates a new list of all elements from the original list l which fulfill the condition p
(check-expect (my-filter (lambda (x) (number? x)) (list 1 2 3)) (list 1 2 3))
(check-expect (my-filter (lambda (x) (number? x)) (list 1 "a" 2 3)) (list 1 2 3))
(check-expect (my-filter (lambda (x) (number? x)) (list "a" "b")) empty)

(define (my-filter p l)
  (foldr (lambda (x l) (append (if (p x) (list x) empty) l)) empty l))


; c)
; ; [X] (X -> Boolean) (list-of X) -> Boolean
; checks if all elements from the list l fulfill the condition p
(check-expect (forall (lambda (x) (> x 1)) (list 1 2 3)) #false)
(check-expect (forall (lambda (x) (>= x 1)) (list 1 2 3)) #true)
(check-expect (forall (lambda (x) (> x 1)) empty) #false)

(define (forall p l)
  (foldr (lambda (x l) (p x)) #false l))


; d)
; Using the (my-filter p l) function written at part b) of the excersise
; [X] (X -> Boolean) (list-of X) -> (list-of X)
; creates a new list of all elements from the original list l which fulfill the condition p

; [X] (X -> Boolean) (list-of X) -> Boolean
; checks if at least one element from the list l fullfills the condition p
(check-expect (exists (lambda (x) (> x 1)) (list 1 2 3)) #true)
(check-expect (exists (lambda (x) (> x 1)) (list 1)) #false)
(check-expect (exists (lambda (x) (> x 1)) empty) #false)

(define (exists p l)
  (if (empty? (my-filter p l)) #false #true))


