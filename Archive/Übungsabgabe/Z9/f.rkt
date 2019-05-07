#lang racket
(require "Auf9-3.rkt")

(f = '(1 2))
(f < '(1 2))
(f < '(1 0))

(f + '(1 2))

;Hier ist Auf9-3.rkt verantwortlich für den Fehler
;In Auf9-3.rkt steht boolean? im Kontrakt, d.h. das Ergebnis soll statt einer Numbmer ein Boolean Wert sein.
;f: broke its own contract
;  promised: boolean?
;  produced: 3