;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Nhapbai4) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Aufgabe 5-4 (basierend auf rocket-game.rkt)


; a)

; A Shape is either:
; - a GCircle
; - a GSquare
; interp. a geometrical shape representing a circle or a rectangle


(define-struct gcircle (center radius reward))
; A GCircle is a structure (make-gcircle Posn Number Number)
; interp. the geometrical representation of a circle along with the score, which the player gets when he collects it

(define-struct gsquare (corner-ul side reward))
; A GSquare is a structure (make-gsquare Posn Number Number)
; interp. the geometrical representation of a square along with the score, which the player gets when he collects it
; where corner-ul is the upper left corner
; and side is the length of the square's side

; b)

(define-struct level (stage goal))
; A Level is a structure (make-level String Number)
; interp. a level of the game
; where stage is the name of the current level
; and goal is the score required to pass the current level


(define goal 100)

; Number-of-Levels -> Stage
; interp. which stage the player is currently playing

(define (stage ws goal)
  (cond [(>= (game-score ws) goal) (number->string (add1 (stage ws (+ goal 100))))]
        [else (number->string 1)]))

(define-struct lst (first rest))
; A (List-of-Levels) is one of:
; - (cons X (List-of-Levels))
; - empty
;interp. the head and rest of a list, or the empty list

; GAME


; A game is a structure: make-game( Posn Posn Number Number List-of-Levels)
; interp. the current state of the game, where:
; - loc is the current position of the rocket
; - vel is the moving-direction of the rocket
; - score is the player's current score
; - speed is the rocket's current speed
; - levels is the list of levels the player needs to play
(define-struct game (loc vel score speed levels))

;c
; Posn Posn -> Number
; Determines the distance betwwen two Points
(define (distance p1 p2)(sqrt (+
               (sqr (- (posn-x p1) (posn-x p2)))
               (sqr (- (posn-y p1) (posn-y p2))))))


; GCircle Posn Image-> Boolean
; Determines whether an image overlaps with a circle,
; where point is the center point of the image 
(define (point-inside-circle circle point)(<= (distance point (gcircle-center circle)) (gcircle-radius circle)))

; GSquare Posn -> Boolean
; Determines whether a point is inside a square
(define (point-inside-square square point)
(and
(<= 0 (- (posn-x point) (posn-x (gsquare-corner-ul square))) (gsquare-side square))
(<= 0 (- (posn-y (gsquare-corner-ul square)) (posn-y point)) (gsquare-side square))))




; Shape WorldState -> Boolean
; check if the rocket hit an object of the currentlevel
(define (hit? shape ws image)(cond [(gcircle? shape) (point-inside-circle shape (game-loc ws))]
                                [(gsquare? shape) (point-insied-square shape (game-loc ws))]))

