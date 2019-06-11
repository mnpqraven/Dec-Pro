;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname A5-3a) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Aufgabe 5-3a

(check-expect (evalQuote '(1 2)) '(1 2))
(check-expect (evalQuote '((+ 1 2) 2)) '(3 2))
(check-expect (evalQuote '(1 (+ 2 2) 2)) '(1 4 2))
(check-expect (evalQuote '((1 2) (/ 2 2))) '((1 2) 1))

(define (evalQuote l)
  (cond [(empty? l) empty]
        [(number? (first l))(cons (first l) (evalQuote (rest l)))]
        [(symbol? (first l))((symbol->func (first l)) (second l)(third l))]
        [(cons? (first l))(cons (evalQuote (first l))(evalQuote (rest l)))]))

(define (symbol->func op)
  (cond [(symbol=? op '+) +]
        [(symbol=? op '-) -]
        [(symbol=? op '*) *]
        [(symbol=? op '/) /]))