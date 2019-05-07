;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Auf8-2) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp")) #f)))
;Aufgabe 8-2
;a

; [X] (list-of X) -> Boolean
; Checks whether a list has an even amount of elements
(check-expect (list/even? '(1 2 3 4)) #true)
(check-expect (list/even? '(3)) #false)
(check-expect (list/even? '()) #true)
(check-expect (list/even? '(1 2)) #true)

(define (list/even? l)
  (match l
    ((list a b)#true)
    ((list a)#false)
    ((list)#true)
    ((list a b ...) (list/even? (rest(rest l))))))

;b
;(list-of Number) -> (list-of Posn)
; Converts a list with an even amount of numbers
; (x1 y1 x2 y2 ... xn yn) into a list of posn instances
; pairs of the form (0 0) are omitted.
(check-expect (flat->posn '(1 2 3 4)) (list (make-posn 1 2)(make-posn 3 4)))
(check-expect (flat->posn '(1 2 3 4 0 0)) (list (make-posn 1 2)(make-posn 3 4)))
(check-expect (flat->posn '(1 2 0 0 3 4)) (list (make-posn 1 2)(make-posn 3 4)))
(check-expect (flat->posn '(0 0 1 2 3 4)) (list (make-posn 1 2)(make-posn 3 4)))
(check-expect (flat->posn '()) '())
(check-error (flat->posn '(1 2 3 4 8)) "The list must have an even amount of numbers.")

(define (flat->posn l)
  (if (list/even? l) (match l
                       ((list-rest 0 0 r) (flat->posn (rest (rest l))))
                       ((list) '())
                       ((list-rest a b r) (cons (make-posn a b) (flat->posn (rest (rest l))))))
      (error "The list must have an even amount of numbers.")))

;c
; A Tree is either:
; - (make-tree value Tree Tree)
; - false
(define-struct tree (value left right))
; Tree -> Number
; Computes the height of a tree
(check-expect (tree/height (make-tree 1 (make-tree 5 false false) (make-tree 9 false false))) 2)
(check-expect (tree/height #false) 0)
(define (tree/height t)
  (match t
    (#false 0)
    ((tree val left right) (+ 1(max
                                  (tree/height left)
                                  (tree/height right))))))


                              