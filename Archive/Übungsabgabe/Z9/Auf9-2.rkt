#lang racket
(require 2htdp/abstraction)
;Aufgabe 9-2
;a
;Eine Reference ist einer davon:
;Bücher: (Autor. Titel. Verlag, Ort Jahr)
;Artikel aus Zeitschriften: (Autor. Titel. Name der Zeitschrift, Jahr)
;Konferenzbeiträge: (Autor. Titel. In Name der Konferenz. Verlag, Ort Jahr)
(define-type Reference
  (buch (autor string?) (titel string?) (verlag string?) (ortJahr string?))
  (artikeln (autor string?) (titel string?) (zeitschrift string?) (jahr string?))
  (beitrag (autor string?) (titel string?) (konferenz string?) (verlag string?) (ortJahr string?)))

;(make-buch "Sheldon Cooper" "The BIG BANG Theory" "StarWorld" "Bochum 2010")
;(make-artikeln "Lois Lane" "Superman: Who?" "MorningSun" "1988")
;(make-beitrag "Nobody" "Who" "Idiots" "OMG" "Bochum 1899")

;b
;Reference -> String
;zitiert die übergebene Referenz nach den Richtlinien
(define (cite reference)
  (type-case Reference reference
    [buch (autor titel verlag ortJahr) (string-append autor ". " titel ". " verlag ", " ortJahr)]
    [artikeln (autor titel zeitschrift jahr) (string-append autor ". " titel ". " zeitschrift "," jahr)]
    [beitrag (autor titel konferenz verlag ortJahr) (string-append autor ". " titel ". " konferenz ". " verlag ", " ortJahr)]))

(cite (make-buch "Sheldon Cooper" "The BIG BANG Theory" "StarWorld Verlag" "Bochum 2010"))
(cite (make-artikeln "Lois Lane" "Superman: Who?" "MorningSun Magazine" "1988"))
(cite (make-beitrag "Captain Jack Sparrow" "Parley?" "The Council of Eight Meeting" "CarrebeanNews" "Boston 1850"))