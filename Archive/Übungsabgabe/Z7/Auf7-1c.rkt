;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Auf7-1c) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Aufgabe 7-1
;c

;Aufgabe 7-1
;a
;Symbol -> (Number Number -> Number)
;ordnet einem Symbol den passenden Operator zu
;geeigneter check fehlt - check expect kann keine fkt. vergleichen.
(define (symbol-to-op s)
  (match s
    ['+ +]
    ['- -]
    ['* *]
    ['/ /]
    ))

;S-Expression -> S-Expression
;vereinfacht den uebergebenen Baum so weit wie moeglich
(check-expect (simplify '(((4 * 5) - (3 / 2)) + (6 * 7))) 60.5)
(check-expect (simplify '(((4 * k) - (3 / 3)) + (a * 7)))  '(((4 * k) - 1) + (a * 7)))
(check-expect (simplify '(4 * 5)) 20)
(check-expect (simplify '((4 - 2) + a)) '(2 + a))
(check-expect (simplify '(b - (4 - 2))) '(b - 2))
(check-expect (simplify '(b - a)) '(b - a))


(define (simplify t)
  (match t
    [(list x s y)(cond [(and (number? (simplify x)) (number? (simplify y))) ((symbol-to-op s)(simplify x)(simplify y))]
                       [else (list (simplify x) s (simplify y))])]
    [X X]
    ))


