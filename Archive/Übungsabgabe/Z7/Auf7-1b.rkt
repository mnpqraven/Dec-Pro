;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Auf7-1b) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Aufgabe 7-1
;b


; A Const is a structure: (make-const Symbol Number)
;interps. einen Variablenname und seine zugeordnete natürliche Zahl
; Bsp: (make-const 'k 5)
(define-struct const (symbol number))

; S-Expression List-of-Const -> Number
; konvertiert ein S-Expression mithilfe einer Liste von Konstanten, die durch Symbole repräsentiert werden, in eine natürliche Zahl
; gibt einen Fehler aus wenn keine Zuordnung gefunden werden kann
(check-expect (convert 3 '()) 3)

(check-expect (convert 'a (list (make-const 'a 5) (make-const 'b 6))) 5)
(check-expect (convert 'b (list (make-const 'a 5) (make-const 'b 6))) 6)
(check-expect (convert 3 (list (make-const 'a 5) (make-const 'b 6))) 3)

(check-error (convert 'a '()) "ERROR")

(define (convert x l)
  (cond [(empty? l) (cond[(number? x) x]
                         [else (error "ERROR")])]
        [else (cond [(number? x) x]
                    [(symbol=? x (const-symbol (first l))) (const-number (first l))]
                    [else (convert x (rest l))])]))

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


;S-Expression List-of-Const -> Number
;gegeben sind eine Liste von Konstanten, die durch Symbole repräsentiert werden und ein Baum
;wertet den übergebenen Baum (in Form einer S-Expression) zu einer Zahl aus

(check-expect (evalTree '(((a * b) - (3 / 2)) + (6 * 7)) (list (make-const 'a 4) (make-const 'b 5))) 60.5)
(check-error (evalTree '(((k * b) - (3 / 2)) + (6 * 7)) (list (make-const 'a 4) (make-const 'b 5))) "ERROR")

(define (evalTree t l)
  (match t
    [(list x s y)((symbol-to-op s)(evalTree x l)(evalTree y l))]
    [x (convert x l)]
    ))





