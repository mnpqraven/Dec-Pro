;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Auf4-1) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Aufgabe 4.1
(define-struct vec (deltax deltay))
;A Vector is a Structure: (make-vec Number Number)
;interp. the components of a vector

;vec vec -> vec
;compute the sum of two vectors
(check-expect (vec-add (make-vec 1 1)(make-vec 2 2))(make-vec 3 3))
(define (vec-add v1 v2)(make-vec (+ (vec-deltax v1) (vec-deltax v2))(+ (vec-deltay v1) (vec-deltay v2))))

;vec vec -> vec
;compute the difference of two vectors
(check-expect (vec-sub (make-vec 1 1)(make-vec 2 2))(make-vec -1 -1))
(define (vec-sub v1 v2)(make-vec (- (vec-deltax v1) (vec-deltax v2))(- (vec-deltay v1) (vec-deltay v2))))

;Number vec-> vec
;compute the product of a number with a vector
(check-expect (vec-skal-mult 5 (make-vec 2 2))(make-vec 10 10))
(define (vec-skal-mult s v)(make-vec (* s (vec-deltax v))(* s (vec-deltay v))))

;vec -> Number
;compute the length of a vector
(check-expect (lengthOfVector (make-vec 3 4))5)
(define (lengthOfVector v) (sqrt (+ (sqr (vec-deltax v)) (sqr (vec-deltay v)))))

;vel -> vel
;compute the unit vector of a vector
(define (vec-norm v)(make-vec (/ (vec-deltax v) (lengthOfVector v))(/ (vec-deltay v) (lengthOfVector v))))