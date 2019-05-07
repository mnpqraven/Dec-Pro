#lang racket
(require racket/contract)
;Aufgabe 9-3

; Fügt die Liste l2 hinter die List l1 an
;(check-expect (lst-append '(1 2) '(4 3)) '(1 2 4 3))
;(check-expect (lst-append '(1 2) '()) '(1 2))
(define (lst-append l1 l2)
  (match l1
    ['() (first l2)]
    [(cons x '()) (cons x l2)]
    [(cons x xs) (cons x (lst-append xs l2))]))

(provide
 (contract-out
  [lst-append (-> list? list? list?)]))


; Gibt das Resultat zurück, dass sich aus dem Vergleich der beiden
; Elemente in pair mittels dem Operator comparator ergibt.
;(check-expect (f = '(1 2)) false)
(define (f comparator pair)
(comparator (first pair) (second pair)))

(provide
 (contract-out
  [f (-> procedure? pair? boolean?)]))
