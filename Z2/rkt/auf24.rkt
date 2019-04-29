;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname aufgabe24real) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Aufgabe 2.3
(define (MakeCircle color)(circle 20 "solid" color))
(define WIDTH 100)
(define HEIGHT 100)
(define CenterWidth (/ WIDTH 2))
(define CenterHeight (/ HEIGHT 2))
(define SCENE-EMPTY (empty-scene WIDTH HEIGHT))


(define (draw color)
(place-image (MakeCircle color) 0 0
(place-image (MakeCircle color) WIDTH 0
(place-image (MakeCircle color) WIDTH HEIGHT
(place-image (MakeCircle color) 0 HEIGHT
(place-image (MakeCircle color) CenterWidth CenterHeight
SCENE-EMPTY)))))
)
(draw "red")



