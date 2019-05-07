;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Auf7-3) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Aufgabe 7-3
;a

;(List-of Number) -> (List-of (List-of Number))
; liefert die übergebene Liste in zwei (etwa) gleich
;lange Listen zerlegt und diese als Liste von Listen zurück
(check-expect (split '(1 2 3 4)) '((1 2) (3 4)))
(check-expect (split '(1 2 8 4 7)) '((1 2 8) (4 7)))
(check-expect (split '(1)) '((1) ()))
(check-expect (split '()) '(() ()))
(define (split l)
 (local
  [(define HALF (round (/ (length l) 2))) ;Mittelpunkt der Liste
   ;(List-of Number) (List-of Number) -> (List-of (List-of Number))
   ; liefert die übergebene Liste l mithilfe einer Pufferliste acc (einem Akkumulator) in zwei (etwa) gleich
   ;lange Listen zerlegt und diese als Liste von Listen zurück
   (define (splitEasier acc l)
     (cond
       ;Wenn die Laenge der Pufferliste acc etwa gleich der der Liste l
       ;liefert eine Liste von beiden Listen acc und l zurueck
       [(equal? (length l) HALF)(list acc l)]
       ;Wenn die Laenge der Pufferliste acc immer noch kleiner als die der Liste l
       ;Nimm das erste Element der Liste l und fueg es an der ersten Position in der Pufferliste ein
       [else (splitEasier (cons (first l) acc)(rest l))]
       ))
   ]
  (list (reverse (first (splitEasier '() l )))(second (splitEasier '() l )))
  )
)

;b
; A (sorted-list-of Number) is a (list-of Number) which is
; sorted by "<"


;(List-of Number) (List-of Number) -> (List-of Number)
;fuehrt zwei sortierte Teillisten zu einer sortierten Gesamtliste zusammen
(check-expect (mergeHelp '() '()) '())
(check-expect (mergeHelp '() '(1 2 3)) '(1 2 3))
(check-expect (mergeHelp '(4 5 6) '()) '(4 5 6))
(check-expect (mergeHelp '(1) '(2)) '(1 2))
(check-expect (mergeHelp '(4) '(3)) '(3 4))
(check-expect (mergeHelp '(2) '(1 3 6)) '(1 2 3 6))
(check-expect (mergeHelp '(6 7 8) '(9)) '(6 7 8 9))
(check-expect (mergeHelp '(1 2 8) '(4 7)) '(1 2 4 7 8))
(check-expect (mergeHelp '(2 4 6) '(1 2 3)) '(1 2 2 3 4 6))


(define (mergeHelp l1 l2)
  (cond [(and (empty? l1) (empty? l2)) empty]
        [(or (empty? l1) (empty? l2)) (if (empty? l1) l2 l1)]
        [else (if (<= (first l1) (first l2))(cons (first l1) (mergeHelp (rest l1) l2))(cons (first l2) (mergeHelp l1 (rest l2))))]))

;c
;(list-of Number) -> (sorted-list-of Number)
;sortiert die übergebene Liste wie beschrieben
(check-expect (mergesort '()) '())
(check-expect (mergesort '(1)) '(1))
(check-expect (mergesort '(1 8 9 6 3 2 4 7 5)) '(1 2 3 4 5 6 7 8 9))

(define (mergesort l)
  (cond [(<= 0 (length l) 1) l]
        [else (mergeHelp (mergesort (first (split l))) (mergesort (second (split l))))])) 
  
        
        