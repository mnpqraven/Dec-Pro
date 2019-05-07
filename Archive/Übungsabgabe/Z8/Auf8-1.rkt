;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Auf8-1) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Aufgabe 8-1
;a

;(List of Number) (List of Number) -> (List of (List of Number))
;führt zwei Listen zu einer Liste von Paaren zusammen
;Die Länge der Ergebnisliste entspricht der Länge der kürzeren Listen.
(check-expect (zip '() '()) '())
(check-expect (zip '() '(1 2 3)) '())
(check-expect (zip '(1 2) '(1 2 3)) '((1 1) (2 2)))
(check-expect (zip '(1 2 3) '(4 5 6)) '((1 4) (2 5) (3 6)))
(define (zip l1 l2)
  (if (or (empty? l1) (empty? l2)) empty (cons (list (first l1) (first l2)) (zip (rest l1) (rest l2)))))

;b
;(Number Number -> Number) (List of Number) (List of Number) -> (List of Number)
; kombiniert 2 Listen paarweise mithilfe der Funktion f
(check-expect (zip/with - '() '()) '())
(check-expect (zip/with + '() '(1 2 3)) '(1 2 3))
(check-expect (zip/with * '(1 2 3) '()) '(1 2 3))
(check-expect (zip/with + '(1 2 3) '(4 5 6)) '(5 7 9))
(check-expect (zip/with * '(1 2 3) '(4 5 6)) '(4 10 18))
(check-expect (zip/with - '(1 2 3) '(4 5 6)) '(-3 -3 -3))
(check-expect (zip/with / '(1 2 3) '(1 2 3)) '(1 1 1))
(define (zip/with f l1 l2)
  (cond
    [(or (eq? f +)(eq? f -))
     (cond
       [(and (empty? l1) (empty? l2)) empty]
       [(empty? l1) l2]
       [(empty? l2) l1]
       [else (cons (foldr f 0 (first(zip l1 l2)))(zip/with f (rest l1)(rest l2)))])]
    [else
     (cond
       [(or (eq? f *)(eq? f /))
        (cond
          [(and (empty? l1) (empty? l2)) empty] 
          [(empty? l1) l2]
          [(empty? l2) l1]
          [else (cons (foldr f 1 (first(zip l1 l2)))(zip/with f (rest l1)(rest l2)))])])]
    ))

;c
;(List of Number) -> (List of (List of Number))
;gruppiert aufeinanderfolgende gleiche Elemente innerhalb der Liste l
(check-expect (group '()) '())
(check-expect (group '(1)) '(1))
(check-expect (group '(1 2)) '(1 2))
(check-expect (group '(1 1 2)) '((1 1) 2))
(check-expect (group '(1 2 2 3 4 5 5 6)) '(1 (2 2) 3 4 (5 5) 6))
(check-expect (group '(1 1 2 3 4 5 5 6)) '((1 1) 2 3 4 (5 5) 6))
(check-expect (group '(1 1 1 3 5 5 5 6)) '((1 1 1) 3 (5 5 5) 6))
(define (group l)
  (cond [(empty? l) empty]
        [(or (= (length l) 1) (= (length l) 2)) l]
        [(number? (first l)) (if (= (first l) (second l))       (group (cons (foldr cons (list (second l)) (list (first l))) (rest (rest l)))) (cons (first l) (group (rest l))))]
        [(list? (first l)) (if (= (first (first l)) (second l)) (group (cons (foldr cons (list (second l)) (first l)) (rest (rest l)))) (cons (first l) (group (rest l))))]))
        
        