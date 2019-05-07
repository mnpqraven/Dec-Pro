#lang racket
(require 2htdp/abstraction)
;a)
;Number -> Number
;berechnet das n-te Element der Fibonaccifolge nach der gegebenen Vorschrift.
;(check-expect (fib 1) 1)
;(check-expect (fib 2) 1)
;(check-expect (fib 3) 2)
(define (fib n)
  (if (<= 1 n 2)
      1
      (+ (fib (- n 1)) (fib (- n 2)))))

;b
;Number -> Number
;berechnet das n-te Element der Fibonaccifolge nach der gegebenen Vorschrift mithilfe einer lokalen (akkumulatorgestützten) Funktion.
;(check-expect (fib/fast 1) 1)
;(check-expect (fib/fast 2) 1)
;(check-expect (fib/fast 3) 2)
(define (fib/fast n)
  (local [(define (fibWithAkku n a1 a2)(if (= 0 n)
                                           (+ a1 a2)
                                           (fibWithAkku (- n 1) a2 (+ a1 a2))))]
    (fibWithAkku n -1 1)))

;c
(time (fib 20))
(time (fib/fast 20))
(time (fib 30))
(time (fib/fast 30))
(time (fib 35))
(time (fib/fast 35))
;Bei der ersten Funktion ist die Laufzeit O(2^n), denn jede Implementierung der Funktion ruft sich selbst (mit kleineren Werten von n als Eingaben) zwei mal auf.
;Man kann sich wie folgenden vorstellen: Die Anzahl des Aufrufs in diesem Fall ist gleich der Anzahl der Knoten in einem Min-HEAP (binären Baum).

;Bei der zweiten Funktion ist die Laufzeit O(n), denn es gibt nur einen rekursiven Aufruf für jeden n
;, wobei n immer um 1 reduziert wird.

;Daraus folgt die erheblichen Unterschiede in der Laufzeit.