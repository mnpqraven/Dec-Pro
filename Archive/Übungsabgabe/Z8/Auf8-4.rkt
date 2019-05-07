;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Auf8-4) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp")) #f)))
;Aufgabe 8-4
;a

;Annahme: Der Gegner versucht immer das Spiel zu gewinnen
;Number Number -> Boolean
;Checks if one can win the game if the two rows contain n and m matches
;true if possible, false if impossible
(check-expect (win? 1 4) #true)
(check-expect (win? 4 5) #true)
(check-expect (win? 3 5) #true)
(check-expect (win? 5 5) #false)
(check-expect (win? 6 5) #false)

(define (win? n m)
  (if (>= n m)
      (cond [(and (or (= m 0) (= m 1)) (<= 2 n 4)) #true]
            [(and (or (= m 0) (= m 1)) (<= 5 n 6)) #false]
            [(and (or (= m 2) (= m 3)) (<= 2 n 3)) #false]
            [else (if (or (or (eq? (win? (- n 2) m) #false) (eq? (win? n (- m 2)) #false))
                          (or (eq? (win? (- n 3) m) #false) (eq? (win? n (- m 3)) #false))) #true #false)])
      (win? m n)))

;b
; Nach jedem Aufruf von win? wird die Summe der beiden Parameter immer um 2 oder 3 kleiner.
; Die Summe ist daher mit jedem rekursiven Aufruf von win? streng monoton fallend.
; Wenn die Summe 6 oder kleiner ist, wird die Basisfälle immer erreicht.
; Also terminiert die Funktion win? (QED)

;c
;Annahme: Der Gegner versucht immer das Spiel zu gewinnen
; Number Number -> String
; Suggests a move for the pick-a-match game
; n is the number of matches in the first row
; m is the number of matches in the second row
(check-expect (suggest 3 4) "Take 2 from the second row")

(check-expect (suggest 4 2) "Take 2 from the first row")

(check-expect (suggest 4 5) "Take 2 from the second row")
(check-expect (suggest 4 3) "Take 2 from the first row")
(check-expect (suggest 2 3) "Good luck!")

(check-expect (suggest 5 5) "Good luck!")

(check-expect (suggest 6 4) "Take 2 from the first row")
(check-expect (suggest 4 4) "Good luck!")

(check-expect (suggest 3 6) "Take 2 from the first row")

(define (suggest n m)
  (if (false? (win? n m)) "Good luck!"
      (cond [(or (eq? (win? (- n 2) m) #true) (eq? (win? n (- m 2)) #false)) "Take 2 from the second row"]
              [(or (eq? (win? (- n 2) m) #false) (eq? (win? n (- m 2)) #true)) "Take 2 from the first row"]
              [(or (eq? (win? (- n 3) m) #true) (eq? (win? n (- m 3)) #false)) "Take 3 from the second row"]
              [(or (eq? (win? (- n 3) m) #false) (eq? (win? n (- m 3)) #true)) "Take 3 from the first row"])))