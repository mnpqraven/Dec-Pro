;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Aufgabe5-2) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Aufgabe 5-2
;a

; A List-of-Numbers is either:
; - (make-lst Number List-Of-Numbers)
; - empty
; interp. the head and rest of a list, or the empty list
(define-struct lst (first rest))
(define l (list 1 2 3 4))

; Number List-of-Numbers -> List-of-Numbers
; removes all numbers in front of a given Number in a List
;Vorbedigung; Alle Elemente der Liste sind unterschiedlich
(check-expect (list-remove 1 (list 1 2 3 4)) (list 1 2 3 4))
(check-expect (list-remove 3 empty) empty)
(check-expect (list-remove 5 (list 1 2 3 4 6 5 8 9)) (list 5 8 9))

(define (list-remove x l)(cond [(empty? l) l]
                               [(= (first l) x) l]
                               [else (list-remove x (rest l))]))

;b
; List-of-Numbers -> List-of-Numbers
; return the given List in a reverse order
(check-expect (list-reverse (list 1 2 3 4))(list 4 3 2 1))
(check-expect (list-reverse empty) empty)

(define (list-reverse l)(cond [(empty? l) l]
                              [else (append (list-reverse (rest l)) (list (first l)))]))

;c
;  List-of-Numbers -> List-of-Numbers
; flatten a give List

(check-expect (list-flat '(1 2 ((3 4) 5) ((())) (((6))) )) '(1 2 3 4 5 6))
(check-expect (list-flat '(())) '())
(check-expect (list-flat '()) '())
(check-expect (list-flat '((3 4) (5 6))) '(3 4 5 6))
(check-expect (list-flat '(1 2 3)) '(1 2 3))
(check-expect (list-flat '(1 (2 3))) '(1 2 3))

(define (list-flat l)(cond [(empty? l) l]
                           [(cons? (first l))(append (list-flat (first l)) (list-flat (rest l)))]
                           [(empty? (first l))(list-flat (rest l))]
                           [else (append (list (first l)) (list-flat (rest l)))]))