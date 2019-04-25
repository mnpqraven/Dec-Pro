;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname vl3) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(+ 17 25)
(define (g y z) (+ (f y) y (f z)))
;define g as operation from y and z variables, explained in the following bracket
;do not call the function asap here (g 2 3) as it will deliver a runtime error as f is still undefined
(define (f x) (* x 2))
(g (* 2 3) 4)
;
;CONDITIONAL EXPRESSION
;boolean checker, returns either true or false
(define (note punkte)
	(cond ;keyword
	  [(>= punkte 90) 1]
		;[(condition1 target1) returnIfTrue1]
		;REDUCTION
	  	;[(>= 83 90) 1]
	  	;[false 1] >>>>>> continue
	  [(>= punkte 80) 2]
	  [(>= punkte 70) 3]
	  [(>= punkte 60) 4]
	  [(>= punkte 50) 5]
	  [(< punkte 50) 6]
	  ;[else 6]
	  ;can only use eles in the last case of the condition expression
	  )
)
;must return either true or false
(note 83)
;racket does NOT use continue, but rather fall through instantly if a condition is met
;-> the order of conditions matters
(define (rate amount total)
	(cond	[(= total 0) 100]
			[true (* (/ amount total) 100)]
			;always execute if the first condition is false
			;this replicates a simple if-else condition
	)
)
(rate 3 9)

;IF TRANSFORMATION
(define (frost? temp)
  	(if (< temp 0) true false)
	;if *condition* then *result1*
	;else *result2*
)
(frost? -5)
;putting a question mark after the definition is recommended as to indicate a condition expression

;DEFINING CONSTANTS
(define B 42)
;can't redefine a constant
B

(define A (+ B 1))
;you can define a constant based on another defined constant
;has to be after all the other constants in the definition are defined
A
;all caps

;MAGIC NUMBERS
(place-image (triangle 16 "solid" "red") 50 20 (empty-scene 100 100)) ;empty-scene width height
;can be improved with constants
(define WIDTH 150)
(define HEIGHT 150)
(define CENTER (/ WIDTH 2))
(place-image (triangle 16 "solid" "red") CENTER 20 (empty-scene WIDTH HEIGHT))
