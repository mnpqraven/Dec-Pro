;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Auf-2.2-2.3) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Aufgabe 2.2
; a)
; Number Number Number -> Number
; determines the largest of the three given numbers

(check-expect (max3 1 2 3) 3)
(check-expect (max3 118 21 16) 118)
(check-expect (max3 3 2 1) 3)
(check-expect (max3 4 2 3) 4)
(check-expect (max3 3 2 4) 4)
(check-expect (max3 1 2 3) 3)
(check-expect (max3 1 3 2) 3)
(define (max3 a b c)
  (if (>= a b) (if (>= a c) a c)
      (if (>= b c) b c)))

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

; Aufgabe 2.3
(define (MakeCircle color)(circle 20 "solid" color))
(define WIDTH 100)
(define HEIGHT 100)
(define CenterWidth (/ WIDTH 2))
(define CenterHeight (/ HEIGHT 2))
(define MTSCN (empty-scene WIDTH HEIGHT))


(define (draw color)
(place-image (MakeCircle color) 0 0
(place-image (MakeCircle color) WIDTH 0
(place-image (MakeCircle color) WIDTH HEIGHT
(place-image (MakeCircle color) 0 HEIGHT
(place-image (MakeCircle color) CenterWidth CenterHeight
MTSCN)))))
)
(draw "red")

        
                   