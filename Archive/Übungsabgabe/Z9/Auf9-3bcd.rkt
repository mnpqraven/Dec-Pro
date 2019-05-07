#lang typed/racket

;Aufgabe 9-3
;b und c und d
(: lst-append (-> (Listof Integer) (Listof Integer)(Listof Integer)))
; Fügt die Liste l2 hinter die List l1 an
;(check-expect (lst-append '(1 2) '(4 3)) '(1 2 4 3))
;(check-expect (lst-append '(1 2) '()) '(1 2))
(define (lst-append l1 l2)
  (match l1
    ['() l2]
    [(cons x '()) (cons x l2)]
    [(cons x xs) (cons x (lst-append xs l2))]))


(: f (-> (-> Integer Integer Boolean) (Listof Integer) Boolean))
; Gibt das Resultat zurück, dass sich aus dem Vergleich der beiden
; Elemente in pair mittels dem Operator comparator ergibt.
;(check-expect (f = '(1 2)) false)
(define (f comparator pair)
  (comparator (first pair) (second pair)))

(lst-append '(1 2) 1)
;Das zweite Argument soll eine Liste von Integer sein. Hier wurde eine Integer gegeben.

(f = '("k" 2))
;Das zweite Argument soll eine Liste von Integer sein. Hier wurde eine Liste gegeben, die aus einem String und einer Integer besteht.


