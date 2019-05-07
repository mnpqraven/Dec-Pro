;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Aufgabe 1.5 Definition|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Aufgabe 1.5
;a

(define (sqsum a b) (+ (* a a) (* b b)))
(sqsum 3 4)

;b
(define width 100)
(define height 100)
(define (center img) (place-image img (/ width 2) (/ height 2) (empty-scene width height)))
(center (circle 20 "solid" "red"))