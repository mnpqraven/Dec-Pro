#lang racket
(require "Auf9-3.rkt")

(lst-append '(1 2) '(4 3))
(lst-append '(1 2) '("4"))

(lst-append 1 '(4 3))

;Hier ist lstappend.rkt verantwortlich für den Fehler.
;Das erste Argument soll statt einer Nummber eine Liste sein.
;lst-append: contract violation
;  expected: list?
;  given: 1